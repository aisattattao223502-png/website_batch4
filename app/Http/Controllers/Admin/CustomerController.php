<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;

class CustomerController extends Controller
{
    public function index()
    {
        $customers = Customer::orderBy('display_order')->get();

        // Get settings from home_sections table
        $heading = DB::table('home_sections')
            ->where('section_name', 'customers')
            ->where('field_name', 'heading')
            ->value('value') ?? 'Our Valued Customers';

        $subheading = DB::table('home_sections')
            ->where('section_name', 'customers')
            ->where('field_name', 'subheading')
            ->value('value') ?? "We're proud to partner with industry leaders across various sectors.";

        $settings = [
            'heading' => $heading,
            'subheading' => $subheading,
        ];

        return Inertia::render('Admin/AdminCustomers', [
            'customers' => $customers,
            'settings' => $settings,
            'success' => session('success'),
            'error' => session('error'),
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,webp|max:2048',
        ]);

        // Get next display order
        $maxOrder = Customer::max('display_order') ?? 0;

        // Handle logo upload
        $logoPath = null;
        if ($request->hasFile('logo')) {
            $image = $request->file('logo');
            $filename = time() . '_' . $image->getClientOriginalName();
            $image->move(public_path('storage/assets/customers'), $filename);
            $logoPath = 'assets/customers/' . $filename;
        }

        Customer::create([
            'name' => $request->name,
            'logo_url' => $logoPath,
            'display_order' => $maxOrder + 1
        ]);

        return redirect()->route('admin.customers.index')
            ->with('success', 'Customer added successfully to carousel!');
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,webp|max:2048',
        ]);

        $customer = Customer::findOrFail($id);

        // Delete old logo if exists
        if ($customer->logo_url) {
            $oldPath = public_path('storage/' . $customer->logo_url);
            if (file_exists($oldPath)) {
                unlink($oldPath);
            }
        }

        // Upload new logo
        if ($request->hasFile('logo')) {
            $image = $request->file('logo');
            $filename = time() . '_' . $image->getClientOriginalName();
            $image->move(public_path('storage/assets/customers'), $filename);
            $customer->logo_url = 'assets/customers/' . $filename;
            $customer->save();
        }

        return redirect()->route('admin.customers.index')
            ->with('success', 'Customer logo updated successfully!');
    }

    public function updateSettings(Request $request)
    {
        $request->validate([
            'heading' => 'required|string|max:255',
            'subheading' => 'required|string',
        ]);

        // Update or create heading
        DB::table('home_sections')->updateOrInsert(
            ['section_name' => 'customers', 'field_name' => 'heading'],
            ['value' => $request->heading, 'field_type' => 'text', 'label' => 'Customers Heading']
        );

        // Update or create subheading
        DB::table('home_sections')->updateOrInsert(
            ['section_name' => 'customers', 'field_name' => 'subheading'],
            ['value' => $request->subheading, 'field_type' => 'textarea', 'label' => 'Customers Subheading']
        );

        return redirect()->route('admin.customers.index')
            ->with('success', 'Settings updated successfully!');
    }

    public function destroy($id)
    {
        $customer = Customer::findOrFail($id);

        // Delete logo file
        if ($customer->logo_url) {
            $logoPath = public_path('storage/' . $customer->logo_url);
            if (file_exists($logoPath)) {
                unlink($logoPath);
            }
        }

        $customer->delete();

        return redirect()->route('admin.customers.index')
            ->with('success', 'Customer removed from carousel successfully!');
    }

    public function reorder(Request $request)
    {
        $request->validate([
            'order' => 'required|array',
            'order.*' => 'required|integer',
        ]);

        // Use transaction for data consistency
        DB::beginTransaction();
        try {
            foreach ($request->order as $index => $customerId) {
                Customer::where('id', $customerId)->update(['display_order' => $index]);
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('admin.customers.index')
                ->with('error', 'Failed to update order. Please try again.');
        }

        return redirect()->route('admin.customers.index')
            ->with('success', 'Customer order updated successfully!');
    }
}
