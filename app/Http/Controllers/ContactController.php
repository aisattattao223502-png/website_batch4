<?php

namespace App\Http\Controllers;

use App\Models\Inquiry;
use App\Services\BrevoMailService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;
use Carbon\Carbon;

class ContactController extends Controller
{
    protected $brevoMail;

    public function __construct(BrevoMailService $brevoMail)
    {
        $this->brevoMail = $brevoMail;
    }

    public function index()
    {
        return Inertia::render('Website/Contact');
    }

    public function submit(Request $request)
    {
        Log::info('=== CONTACT FORM SUBMITTED ===');
        Log::info('Request data:', $request->all());

        try {
            $validated = $request->validate([
                'fullName' => 'required|string|max:255',
                'email' => 'required|email|max:255',
                'phone' => 'required|string|max:50',
                'companyName' => 'nullable|string|max:255',
                'position' => 'nullable|string|max:255',
                'companyAddress' => 'required|string|max:500',
                'subject' => 'required|string|max:255',
                'priority' => 'required|in:low,medium,high',
                'message' => 'required|string|max:5000',
            ]);

            Log::info('Validation passed');

            $inquiry = Inquiry::create([
                'name' => $validated['fullName'],
                'email' => $validated['email'],
                'phone' => $validated['phone'],
                'company' => $validated['companyName'] ?? null,
                'position' => $validated['position'] ?? null,
                'address' => $validated['companyAddress'],
                'subject' => $validated['subject'],
                'priority' => $validated['priority'],
                'message' => $validated['message'],
                'status' => 'new',
                'date_submitted' => Carbon::now(),
            ]);

            Log::info('Inquiry created:', ['id' => $inquiry->id]);

            try {
                $this->sendAdminNotification($inquiry);
                Log::info('Admin notification email sent');

                $this->sendCustomerConfirmation($inquiry);
                Log::info('Customer confirmation email sent');

            } catch (\Exception $emailException) {
                Log::error('Email sending failed:', [
                    'message' => $emailException->getMessage(),
                    'inquiry_id' => $inquiry->id
                ]);
            }

            return redirect()->back()->with('success', 'Thank you! Your inquiry has been submitted successfully. We will contact you soon.');

        } catch (\Illuminate\Validation\ValidationException $e) {
            Log::error('Validation failed:', $e->errors());
            return redirect()->back()->withErrors($e->errors())->withInput();
            
        } catch (\Exception $e) {
            Log::error('Error creating inquiry:', [
                'message' => $e->getMessage(),
                'file' => $e->getFile(),
                'line' => $e->getLine()
            ]);
            
            return redirect()->back()->with('error', 'Something went wrong. Please try again.');
        }
    }

    private function sendAdminNotification($inquiry)
    {
        $adminEmail = config('mail.admin_email', env('ADMIN_EMAIL'));
        $htmlContent = view('emails.admin-inquiry-notification', ['inquiry' => $inquiry])->render();
        
        $this->brevoMail->sendEmail(
            $adminEmail,
            'Admin',
            'New Contact Inquiry: ' . $inquiry->subject . ' [' . strtoupper($inquiry->priority) . ' Priority]',
            $htmlContent,
            ['email' => $inquiry->email, 'name' => $inquiry->name]
        );
    }

    private function sendCustomerConfirmation($inquiry)
    {
        $htmlContent = view('emails.customer-inquiry-confirmation', ['inquiry' => $inquiry])->render();
        
        $this->brevoMail->sendEmail(
            $inquiry->email,
            $inquiry->name,
            'We received your inquiry - James Polymers Manufacturing Corporation',
            $htmlContent
        );
    }
}