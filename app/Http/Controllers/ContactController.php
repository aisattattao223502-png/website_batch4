<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
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
            'priority' => 'required|string',
            'message' => 'required|string|max:5000',
        ]);

        // Send email (configure your mail settings in .env)
        try {
            Mail::send('emails.contact', ['data' => $validated], function ($message) use ($validated) {
                $message->to('jamespolymers.international@gmail.com')
                        ->subject('New Contact Form Submission: ' . $validated['subject']);
                $message->from($validated['email'], $validated['fullName']);
            });

            return redirect()->back()->with('success', 'Thank you for contacting us! We will get back to you soon.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Sorry, there was an error sending your message. Please try again or contact us directly.');
        }
    }
}