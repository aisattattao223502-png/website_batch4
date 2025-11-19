<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CustomerController extends Controller
{
    /**
     * Display customer management page with sample data
     */
    public function index()
    {
        // Sample customers data - replace with database queries later
        $customers = [
            [
                'id' => 1,
                'name' => 'Customer 1',
                'logo_url' => 'storage/customers/customer1.jpg',
                'display_order' => 1,
            ],
            [
                'id' => 2,
                'name' => 'Customer 2',
                'logo_url' => 'storage/customers/customer2.jpg',
                'display_order' => 2,
            ],
            [
                'id' => 3,
                'name' => 'Customer 3',
                'logo_url' => 'storage/customers/customer3.jpg',
                'display_order' => 3,
            ],
            [
                'id' => 4,
                'name' => 'Customer 4',
                'logo_url' => 'storage/customers/customer4.jpg',
                'display_order' => 4,
            ],
            [
                'id' => 5,
                'name' => 'Customer 5',
                'logo_url' => 'storage/customers/customer5.jpg',
                'display_order' => 5,
            ],
        ];

        $settings = [
            'heading' => 'Our Valued Customers',
            'subheading' => "We're proud to partner with industry leaders across various sectors, providing them with high-performance polymer solutions.",
        ];

        return Inertia::render('Admin/AdminCustomers', [
            'customers' => $customers,
            'settings' => $settings,
            'success' => session('success'),
            'error' => session('error'),
        ]);
    }

    /**
     * Store a new customer
     */
    public function store(Request $request)
    {
        // Validate request
        $request->validate([
            'name' => 'required|string|max:255',
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // This will be implemented with database later
        // For now, just simulate success

        return redirect()->route('admin.customers.index')
            ->with('success', 'Customer added successfully to carousel!');
    }

    /**
     * Update customer logo
     */
    public function update(Request $request, $id)
    {
        // Validate request
        $request->validate([
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // This will be implemented with database later

        return redirect()->route('admin.customers.index')
            ->with('success', 'Customer logo updated successfully!');
    }

    /**
     * Update settings (heading/subheading)
     */
    public function updateSettings(Request $request)
    {
        $request->validate([
            'heading' => 'required|string|max:255',
            'subheading' => 'required|string',
        ]);

        // This will be implemented with database later

        return redirect()->route('admin.customers.index')
            ->with('success', 'Settings updated successfully!');
    }

    /**
     * Delete a customer
     */
    public function destroy($id)
    {
        // This will be implemented with database later

        return redirect()->route('admin.customers.index')
            ->with('success', 'Customer removed from carousel successfully!');
    }

    /**
     * Reorder customers
     */
    public function reorder(Request $request)
    {
        $request->validate([
            'order' => 'required|array',
            'order.*' => 'required|integer',
        ]);

        // This will be implemented with database later
        // Loop through order array and update display_order

        return redirect()->route('admin.customers.index')
            ->with('success', 'Customer order updated successfully!');
    }
}
