<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::with('features')->get();

        return Inertia::render('Products', [
            'products' => $products
        ]);
    }

    public function show($id)
    {
        $product = Product::with('features')->findOrFail($id);

        return Inertia::render('ProductDetail', [
            'product' => $product
        ]);
    }
}