<?php

namespace App\Http\Controllers;

use App\Models\Inquiry;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class ContactController extends Controller
{
    public function index()
    {
        return Inertia::render('Website/Contact');
    }

    public function submit(Request $request)
    {
        $validated = $request->validate([
            'fullName' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'phone' => 'required|string|max:20',
            'companyName' => 'nullable|string|max:255',
            'position' => 'nullable|string|max:255',
            'companyAddress' => 'required|string|max:500',
            'subject' => 'required|string',
            'priority' => 'required|string|in:low,medium,high',
            'message' => 'required|string|max:5000',
        ]);

        try {
            // Store inquiry in database
            $inquiry = Inquiry::create([
                'name' => $validated['fullName'],
                'email' => $validated['email'],
                'phone' => $validated['phone'],
                'company' => $validated['companyName'],
                'position' => $validated['position'],
                'company_address' => $validated['companyAddress'],
                'subject' => $validated['subject'],
                'priority' => $validated['priority'],
                'message' => $validated['message'],
                'status' => 'new',
                'date_submitted' => now(),
            ]);

            // Send email notification to admin
            $this->sendAdminNotification($inquiry);

            // Send confirmation email to customer
            $this->sendCustomerConfirmation($inquiry);

            return redirect()->back()->with('success', 'Thank you for contacting us! We will get back to you soon.');
        } catch (\Exception $e) {
            Log::error('Contact form submission error: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Sorry, there was an error sending your message. Please try again or contact us directly.');
        }
    }

    private function sendAdminNotification($inquiry)
    {
        try {
            Mail::send('emails.admin-inquiry-notification', ['inquiry' => $inquiry], function ($message) use ($inquiry) {
                $message->to(config('mail.admin_email', 'aisat.castillo222436@gmail.com'))
                        ->subject('New Inquiry: ' . $inquiry->subject . ' [' . strtoupper($inquiry->priority) . ' Priority]');
                $message->from(config('mail.from.address'), config('mail.from.name'));
            });
        } catch (\Exception $e) {
            Log::error('Failed to send admin notification: ' . $e->getMessage());
        }
    }

    private function sendCustomerConfirmation($inquiry)
    {
        try {
            Mail::send('emails.customer-inquiry-confirmation', ['inquiry' => $inquiry], function ($message) use ($inquiry) {
                $message->to($inquiry->email, $inquiry->name)
                        ->subject('We received your inquiry - James Polymers');
                $message->from(config('mail.from.address'), config('mail.from.name'));
            });
        } catch (\Exception $e) {
            Log::error('Failed to send customer confirmation: ' . $e->getMessage());
        }
    }
}