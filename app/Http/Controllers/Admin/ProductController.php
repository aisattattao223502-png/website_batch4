<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductFeature;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Http\Resources\ProductResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;

class ProductController extends Controller
{
    /**
     * Display the admin products page (Inertia)
     */
    public function indexPage(Request $request)
    {
        $query = Product::with('features');

        // Filtering
        if ($request->has('category')) {
            $query->where('category', $request->category);
        }

        if ($request->has('material_type')) {
            $query->where('material_type', $request->material_type);
        }

        // Search
        if ($request->has('search')) {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        // Sorting
        $sortBy = $request->get('sort_by', 'created_at');
        $sortOrder = $request->get('sort_order', 'desc');
        $query->orderBy($sortBy, $sortOrder);

        // Pagination
        $perPage = $request->get('per_page', 15);
        $products = $query->paginate($perPage);

        return Inertia::render('Admin/AdminProducts', [
            'products' => ProductResource::collection($products),
            'filters' => $request->only(['category', 'material_type', 'search'])
        ]);
    }

    /**
     * Display a listing of products (API)
     */
    public function index(Request $request)
    {
        $query = Product::with('features');

        // Filtering
        if ($request->has('category')) {
            $query->where('category', $request->category);
        }

        if ($request->has('material_type')) {
            $query->where('material_type', $request->material_type);
        }

        // Search
        if ($request->has('search')) {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        // Sorting
        $sortBy = $request->get('sort_by', 'created_at');
        $sortOrder = $request->get('sort_order', 'desc');
        $query->orderBy($sortBy, $sortOrder);

        // Pagination
        $perPage = $request->get('per_page', 15);
        $products = $query->paginate($perPage);

        return ProductResource::collection($products);
    }

    /**
     * Store a newly created product
     */
    public function store(StoreProductRequest $request)
    {
        try {
            DB::beginTransaction();

            // Create product
            $product = Product::create($request->only([
                'name',
                'description',
                'category',
                'material_type',
                'image_url'
            ]));

            // Add features if provided
            if ($request->has('features')) {
                foreach ($request->features as $feature) {
                    ProductFeature::create([
                        'product_id' => $product->id,
                        'feature' => $feature
                    ]);
                }
            }

            DB::commit();

            return response()->json([
                'message' => 'Product created successfully',
                'data' => new ProductResource($product->load('features'))
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            
            return response()->json([
                'message' => 'Failed to create product',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Display the specified product
     */
    public function show($id)
    {
        $product = Product::with('features')->findOrFail($id);
        
        return new ProductResource($product);
    }

    /**
     * Update the specified product
     */
    public function update(UpdateProductRequest $request, $id)
    {
        try {
            DB::beginTransaction();

            $product = Product::findOrFail($id);
            
            // Update product
            $product->update($request->only([
                'name',
                'description',
                'category',
                'material_type',
                'image_url'
            ]));

            // Update features if provided
            if ($request->has('features')) {
                // Delete old features
                ProductFeature::where('product_id', $product->id)->delete();
                
                // Add new features
                foreach ($request->features as $feature) {
                    ProductFeature::create([
                        'product_id' => $product->id,
                        'feature' => $feature
                    ]);
                }
            }

            DB::commit();

            return response()->json([
                'message' => 'Product updated successfully',
                'data' => new ProductResource($product->load('features'))
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            
            return response()->json([
                'message' => 'Failed to update product',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Remove the specified product
     */
    public function destroy($id)
    {
        try {
            $product = Product::findOrFail($id);
            
            // Delete associated features (will cascade if foreign key is set)
            ProductFeature::where('product_id', $product->id)->delete();
            
            // Delete product
            $product->delete();

            return response()->json([
                'message' => 'Product deleted successfully'
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to delete product',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Bulk delete products
     */
    public function bulkDestroy(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
            'ids.*' => 'exists:products,id'
        ]);

        try {
            DB::beginTransaction();

            ProductFeature::whereIn('product_id', $request->ids)->delete();
            Product::whereIn('id', $request->ids)->delete();

            DB::commit();

            return response()->json([
                'message' => count($request->ids) . ' products deleted successfully'
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            
            return response()->json([
                'message' => 'Failed to delete products',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Upload product image
     */
    public function uploadImage(Request $request)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048'
        ]);

        try {
            $image = $request->file('image');
            $filename = time() . '_' . $image->getClientOriginalName();
            $path = $image->storeAs('products', $filename, 'public');

            return response()->json([
                'message' => 'Image uploaded successfully',
                'url' => Storage::url($path),
                'path' => $path
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to upload image',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}