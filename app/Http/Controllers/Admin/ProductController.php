<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class ProductController extends Controller
{
    /**
     * Display a listing of products
     */
    public function index()
    {
        // Sample products data - replace with database queries later
        $products = [
            [
                'id' => 1,
                'name' => 'Polypropylene Compound',
                'description' => 'High-quality polypropylene compound suitable for various industrial applications. Excellent chemical resistance and durability.',
                'category' => 'thermoplastic',
                'image_url' => 'storage/products/sample1.jpg',
                'created_at' => '2024-11-15 10:30:00',
            ],
            [
                'id' => 2,
                'name' => 'ABS Automotive Grade',
                'description' => 'Premium ABS material specifically designed for automotive applications with superior impact resistance.',
                'category' => 'automotive',
                'image_url' => 'storage/products/sample2.jpg',
                'created_at' => '2024-11-14 14:20:00',
            ],
            [
                'id' => 3,
                'name' => 'Engineering Plastic Compound',
                'description' => 'Advanced engineering plastic for high-performance applications requiring excellent mechanical properties.',
                'category' => 'engineering',
                'image_url' => 'storage/products/sample3.jpg',
                'created_at' => '2024-11-13 09:15:00',
            ],
            [
                'id' => 4,
                'name' => 'Custom TPE Material',
                'description' => 'Customized thermoplastic elastomer with tailored properties for specific customer requirements.',
                'category' => 'custom',
                'image_url' => 'storage/products/sample4.jpg',
                'created_at' => '2024-11-12 16:45:00',
            ],
            [
                'id' => 5,
                'name' => 'Appliance Housing Material',
                'description' => 'Specialized material for appliance housings with excellent heat resistance and aesthetic finish.',
                'category' => 'appliance',
                'image_url' => 'storage/products/sample5.jpg',
                'created_at' => '2024-11-11 11:00:00',
            ],
            [
                'id' => 6,
                'name' => 'Industrial Grade Polymer',
                'description' => 'Heavy-duty industrial polymer designed for demanding manufacturing environments.',
                'category' => 'industrial',
                'image_url' => 'storage/products/sample6.jpg',
                'created_at' => '2024-11-10 13:30:00',
            ],
        ];

        return Inertia::render('Admin/AdminProducts', [
            'products' => $products,
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
        ]);
    }

    /**
     * Show the form for editing a product
     */
    public function edit($id)
    {
        // Sample product data for editing - replace with database query later
        $product = [
            'id' => $id,
            'name' => 'Sample Product',
            'description' => 'This is a sample product description.',
            'category' => 'thermoplastic',
            'image_url' => 'storage/products/sample.jpg',
        ];

        return Inertia::render('Admin/Products', [
            'action' => 'edit',
            'product' => $product,
        ]);
    }

    /**
     * Store a newly created product (placeholder for future)
     */
    public function store()
    {
        // This will be implemented when connecting to database
        return redirect()->route('admin.products.index')
            ->with('success', 'Product added successfully!');
    }

    /**
     * Update the specified product (placeholder for future)
     */
    public function update($id)
    {
        // This will be implemented when connecting to database
        return redirect()->route('admin.products.index')
            ->with('success', 'Product updated successfully!');
    }

    /**
     * Remove the specified product (placeholder for future)
     */
    public function destroy($id)
    {
        // This will be implemented when connecting to database
        return redirect()->route('admin.products.index')
            ->with('success', 'Product deleted successfully!');
    }
}