<?php

namespace Tests\Feature\Admin;

use Tests\TestCase;
use App\Models\Product;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ProductApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_list_products()
    {
        Product::factory()->count(3)->create();

        $response = $this->getJson('/admin/api/products');

        $response->assertStatus(200)
                 ->assertJsonStructure([
                     'data' => [
                         '*' => ['id', 'name', 'description', 'category', 'material_type']
                     ]
                 ]);
    }

    public function test_can_create_product()
    {
        $productData = [
            'name' => 'New Product',
            'description' => 'Test description',
            'category' => 'industrial',
            'material_type' => 'plastic',
            'features' => ['Feature 1', 'Feature 2']
        ];

        $response = $this->postJson('/admin/api/products', $productData);

        $response->assertStatus(201)
                 ->assertJson(['message' => 'Product created successfully']);
        
        $this->assertDatabaseHas('products', ['name' => 'New Product']);
    }
}