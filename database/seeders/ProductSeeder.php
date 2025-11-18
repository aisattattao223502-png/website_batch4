<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\ProductFeature;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        $products = [
            [
                'name' => 'Test Plastic Product',
                'description' => 'High-quality plastic component',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => 'assets/products/test.jpg',
                'features' => [
                    'Durable construction',
                    'Weather resistant',
                    'Easy to install'
                ]
            ],
            [
                'name' => 'Test Rubber Product',
                'description' => 'Flexible rubber component',
                'category' => 'automotive',
                'material_type' => 'rubber',
                'image_url' => 'assets/products/test2.jpg',
                'features' => [
                    'High elasticity',
                    'Temperature resistant',
                    'Long-lasting'
                ]
            ]
        ];

        foreach ($products as $productData) {
            $features = $productData['features'];
            unset($productData['features']);
            
            $product = Product::create($productData);
            
            foreach ($features as $feature) {
                ProductFeature::create([
                    'product_id' => $product->id,
                    'feature' => $feature
                ]);
            }
        }
    }
}