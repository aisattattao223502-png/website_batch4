<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Inquiry;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class InquiryController extends Controller
{
    public function index(Request $request)
    {
        $query = Inquiry::query();

        // Status filter
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        // Date range filter
        if ($request->filled('date_range')) {
            switch ($request->date_range) {
                case 'today':
                    $query->whereDate('date_submitted', today());
                    break;
                case 'week':
                    $query->whereBetween('date_submitted', [
                        now()->startOfWeek(),
                        now()->endOfWeek()
                    ]);
                    break;
                case 'month':
                    $query->whereMonth('date_submitted', now()->month)
                          ->whereYear('date_submitted', now()->year);
                    break;
            }
        }

        // Search filter
        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('email', 'like', "%{$search}%")
                  ->orWhere('subject', 'like', "%{$search}%")
                  ->orWhere('company', 'like', "%{$search}%")
                  ->orWhere('message', 'like', "%{$search}%");
            });
        }

        // Get status counts
        $statusCounts = [
            'new' => Inquiry::where('status', 'new')->count(),
            'in_progress' => Inquiry::where('status', 'in-progress')->count(),
            'resolved' => Inquiry::where('status', 'resolved')->count(),
            'closed' => Inquiry::where('status', 'closed')->count(),
        ];

        // Pagination
        $inquiries = $query->orderBy('date_submitted', 'desc')
                          ->paginate(10)
                          ->withQueryString();

        return Inertia::render('Admin/AdminInquiries', [
            'inquiries' => $inquiries,
            'statusCounts' => $statusCounts,
            'filters' => $request->only(['status', 'date_range', 'search']),
        ]);
    }

    public function updateStatus(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|in:new,in-progress,resolved,closed'
        ]);

        $inquiry = Inquiry::findOrFail($id);
        $inquiry->update(['status' => $request->status]);

        return back()->with('success', 'Inquiry status updated successfully.');
    }

    public function reply(Request $request, $id)
    {
        $request->validate([
            'subject' => 'required|string|max:255',
            'message' => 'required|string',
        ]);

        $inquiry = Inquiry::findOrFail($id);

        try {
            // Send reply email
            Mail::send('emails.inquiry-reply', [
                'inquiry' => $inquiry,
                'replyMessage' => $request->message,
            ], function ($message) use ($inquiry, $request) {
                $message->to($inquiry->email, $inquiry->name)
                        ->subject($request->subject);
                $message->from(config('mail.from.address'), config('mail.from.name'));
            });

            // Update status if it's new
            if ($inquiry->status === 'new') {
                $inquiry->update(['status' => 'in-progress']);
            }

            return back()->with('success', 'Reply sent successfully.');
        } catch (\Exception $e) {
            Log::error('Failed to send reply: ' . $e->getMessage());
            return back()->with('error', 'Error sending email: ' . $e->getMessage());
        }
    }

    public function destroy($id)
    {
        $inquiry = Inquiry::findOrFail($id);
        $inquiry->delete();

        return back()->with('success', 'Inquiry deleted successfully.');
    }

    public function export(Request $request)
    {
        $query = Inquiry::query();

        // Apply same filters as index
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        if ($request->filled('date_range')) {
            switch ($request->date_range) {
                case 'today':
                    $query->whereDate('date_submitted', today());
                    break;
                case 'week':
                    $query->whereBetween('date_submitted', [
                        now()->startOfWeek(),
                        now()->endOfWeek()
                    ]);
                    break;
                case 'month':
                    $query->whereMonth('date_submitted', now()->month)
                          ->whereYear('date_submitted', now()->year);
                    break;
            }
        }

        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('email', 'like', "%{$search}%")
                  ->orWhere('subject', 'like', "%{$search}%")
                  ->orWhere('company', 'like', "%{$search}%")
                  ->orWhere('message', 'like', "%{$search}%");
            });
        }

        $inquiries = $query->orderBy('date_submitted', 'desc')->get();

        $filename = 'inquiries_' . now()->format('Y-m-d_His') . '.csv';
        
        $headers = [
            'Content-Type' => 'text/csv',
            'Content-Disposition' => "attachment; filename=\"{$filename}\"",
        ];

        $callback = function() use ($inquiries) {
            $file = fopen('php://output', 'w');
            
            // Add CSV headers
            fputcsv($file, [
                'ID', 'Name', 'Email', 'Phone', 'Company', 'Position', 
                'Company Address', 'Subject', 'Priority', 'Message', 
                'Status', 'Date Submitted'
            ]);
            
            // Add data
            foreach ($inquiries as $inquiry) {
                fputcsv($file, [
                    $inquiry->id,
                    $inquiry->name,
                    $inquiry->email,
                    $inquiry->phone,
                    $inquiry->company ?? 'N/A',
                    $inquiry->position ?? 'N/A',
                    $inquiry->company_address,
                    $inquiry->subject,
                    $inquiry->priority,
                    $inquiry->message,
                    $inquiry->status,
                    $inquiry->date_submitted->format('Y-m-d H:i:s'),
                ]);
            }
            
            fclose($file);
        };

        return response()->stream($callback, 200, $headers);
    }
}