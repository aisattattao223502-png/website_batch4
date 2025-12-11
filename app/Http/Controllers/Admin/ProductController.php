<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;

class ProductController extends Controller
{
    /**
     * Display a listing of products
     */
    public function index()
    {
        $products = Product::orderBy('material_type')
            ->orderBy('name')
            ->get()
            ->map(function($product) {
                return [
                    'id' => $product->id,
                    'name' => $product->name,
                    'description' => $product->description,
                    'category' => $product->category,
                    'material_type' => $product->material_type,
                    'image_url' => $product->image_url,
                    'features' => $product->features ?? [],
                    'created_at' => $product->created_at->format('M d, Y'),
                    'category_badge' => $product->category_badge,
                ];
            });

        return Inertia::render('Admin/AdminProducts', [
            'products' => $products,
            'action' => 'list',
            'success' => session('success'),
            'error' => session('error'),
        ]);
    }

    /**
     * Show the form for creating a new product
     */
    public function create()
    {
        return Inertia::render('Admin/AdminProducts', [
            'action' => 'create',
            'product' => null,
            'success' => null,
            'error' => null,
        ]);
    }

    /**
     * Store a newly created product
     */
    public function store(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'description' => 'nullable|string',
                'category' => 'required|in:appliance,automotive,industrial',
                'material_type' => 'required|in:plastic,rubber,custom',
                'image' => 'nullable|image|mimes:jpeg,jpg,png,gif,webp|max:2048',
                'features' => 'nullable|array',
                'features.*' => 'string'
            ]);

            // In store() method
        if ($request->hasFile('image')) {
        $image = $request->file('image');
        $filename = time() . '_' . $image->getClientOriginalName();
        $path = $image->storeAs('assets/products', $filename, 'public');
        $validated['image_url'] = '/storage/' . $path;
        // This creates: /storage/products/1234567890_image.jpg
        }

            // Remove the 'image' key if it exists (we've already processed it)
            unset($validated['image']);

            Product::create($validated);

            return redirect()->route('admin.products.index')
                ->with('success', 'Product added successfully!');
        } catch (\Exception $e) {
            Log::error('Product creation failed: ' . $e->getMessage());
            return redirect()->back()
                ->with('error', 'Failed to create product: ' . $e->getMessage())
                ->withInput();
        }
    }

    /**
     * Show the form for editing a product
     */
    public function edit($id)
    {
        $product = Product::findOrFail($id);

        return Inertia::render('Admin/AdminProducts', [
            'action' => 'edit',
            'product' => [
                'id' => $product->id,
                'name' => $product->name,
                'description' => $product->description,
                'category' => $product->category,
                'material_type' => $product->material_type,
                'image_url' => $product->image_url,
                'features' => $product->features ?? [],
            ],
            'success' => null,
            'error' => null,
        ]);
    }

    /**
     * Update the specified product
     */
    public function update(Request $request, $id)
    {
        try {
            $product = Product::findOrFail($id);

            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'description' => 'nullable|string',
                'category' => 'required|in:appliance,automotive,industrial',
                'material_type' => 'required|in:plastic,rubber,custom',
                'image' => 'nullable|image|mimes:jpeg,jpg,png,gif,webp|max:2048',
                'features' => 'nullable|array',
                'features.*' => 'string'
            ]);

            // Handle image upload
            if ($request->hasFile('image')) {
                // Delete old image if exists
                if ($product->image_url && str_starts_with($product->image_url, '/storage/')) {
                    $oldPath = str_replace('/storage/', '', $product->image_url);
                    Storage::disk('public')->delete($oldPath);
                }
                
                $image = $request->file('image');
                $filename = time() . '_' . $image->getClientOriginalName();
                $path = $image->storeAs('assets/products', $filename, 'public');
                $validated['image_url'] = '/storage/' . $path;
            } else {
                // Keep existing image if no new image uploaded
                $validated['image_url'] = $request->input('image_url', $product->image_url);
            }

            // Remove the 'image' key if it exists
            unset($validated['image']);

            $product->update($validated);

            return redirect()->route('admin.products.index')
                ->with('success', 'Product updated successfully!');
        } catch (\Exception $e) {
            Log::error('Product update failed: ' . $e->getMessage());
            return redirect()->back()
                ->with('error', 'Failed to update product: ' . $e->getMessage())
                ->withInput();
        }
    }

    /**
     * Remove the specified product
     */
    public function destroy($id)
    {
        try {
            $product = Product::findOrFail($id);

            // Delete image if exists and is in storage folder
            if ($product->image_url && str_starts_with($product->image_url, '/storage/')) {
                $path = str_replace('/storage/', '', $product->image_url);
                Storage::disk('public')->delete($path);
            }

            $product->delete();

            return redirect()->route('admin.products.index')
                ->with('success', 'Product deleted successfully!');
        } catch (\Exception $e) {
            Log::error('Product deletion failed: ' . $e->getMessage());
            return redirect()->back()
                ->with('error', 'Failed to delete product: ' . $e->getMessage());
        }
    }
}