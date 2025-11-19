<?php

use App\Http\Controllers\ContactController;
use App\Http\Controllers\AdminUsersController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

use App\Http\Controllers\VisitorController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Admin\ServiceController as AdminServiceController;
use App\Http\Controllers\Admin\AuthController;
use App\Http\Controllers\Admin\DashboardController;

// Visitor tracking
// Visitor tracking routes
Route::get('/visitors/get', [VisitorController::class, 'getCount']);
Route::post('/visitors/increment', [VisitorController::class, 'incrementCount']);

// Home page with products and services
Route::get('/', function () {
    $products = \App\Models\Product::with('features')->latest()->get();
    $services = \App\Models\Service::all();
    
    return Inertia::render('Website/Home', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'products' => $products->map(function($product) {
            return [
                'id' => $product->id,
                'name' => $product->name,
                'description' => $product->description,
                'category' => $product->category,
                'material_type' => $product->material_type,
                'image_url' => $product->image_url,
                'features' => $product->features ?? []
            ];
        })->toArray(),
        'services' => $services->toArray()
    ]);
})->name('home');

// Products page with products and services
Route::get('/products', function () {
    $products = \App\Models\Product::with('features')->latest()->get();
    $services = \App\Models\Service::all();
    
    return Inertia::render('Website/Explore/Products', [
        'products' => $products->map(function($product) {
            return [
                'id' => $product->id,
                'name' => $product->name,
                'description' => $product->description,
                'category' => $product->category,
                'material_type' => $product->material_type,
                'image_url' => $product->image_url,
                'features' => $product->features ?? []
            ];
        })->toArray(),
        'services' => $services->toArray()
    ]);
})->name('products');

// About page route
Route::get('/about', function () {
    return Inertia::render('Website/About');
})->name('about');

// Industries page route
Route::get('/industries', function () {
    return Inertia::render('Website/Explore/Industries');
})->name('industries');

// Awards & Recognition page route
Route::get('/awards-recognition', function () {
    return Inertia::render('Website/Explore/Awards');
})->name('awards-recognition');

// Contact routes
Route::get('/contact', [ContactController::class, 'index'])->name('contact');
Route::post('/contact/submit', [ContactController::class, 'submit'])->name('contact.submit');

// Sustainability page route
Route::get('/sustainability', function () {
    return Inertia::render('Website/More/Sustainability');
})->name('sustainability');

// FAQ page route
Route::get('/faq', function () {
    return Inertia::render('Website/More/FAQ');
})->name('faq');

// Privacy Policy
// Privacy Policy page route
Route::get('/privacy-policy', function () {
    return Inertia::render('Website/More/PrivacyPolicy');
})->name('privacy-policy');

//---------------------------------ADMIN ROUTES---------------------------------//

// Admin Authentication Routes
// Authenticated user profile routes
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

//---------------------------------ADMIN SECTION---------------------------------//

// Admin Authentication & Dashboard
Route::prefix('admin')->name('admin.')->group(function () {
    // Login page
    Route::get('/login', function () {
        return Inertia::render('Admin/AdminLogin');
    })->name('login');
    
    // Dashboard
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    
    // Products Management (Inertia Page)
    Route::get('/products', [AdminProductController::class, 'indexPage'])->name('products.index');
    
    // Other admin pages (placeholders)
    // Admin Users Management
    Route::get('/users', [AdminUsersController::class, 'index'])->name('users.index');
    Route::post('/users', [AdminUsersController::class, 'store'])->name('users.store');
    Route::put('/users/{user}', [AdminUsersController::class, 'update'])->name('users.update');
    Route::delete('/users/{user}', [AdminUsersController::class, 'destroy'])->name('users.destroy');
    
    // Admin Products Page
    Route::get('/products', [AdminProductController::class, 'indexPage'])->name('products.index');
    
    // Placeholder routes for other admin pages
    Route::get('/industries', function () {
        return Inertia::render('Admin/Industries');
    })->name('industries');
    
    Route::get('/services', function () {
        return Inertia::render('Admin/Services');
    })->name('services');
    
    Route::get('/awards', function () {
        return Inertia::render('Admin/Awards');
    })->name('awards');
    
    Route::get('/customers', function () {
        return Inertia::render('Admin/Customers');
    })->name('customers');
    
    Route::get('/users', [AdminUsersController::class, 'index'])->name('users.index');
    
    Route::get('/inquiries', function () {
        return Inertia::render('Admin/Inquiries');
    })->name('inquiries');
});

// Admin API Routes (for AJAX operations)
Route::prefix('admin/api')->name('admin.api.')->group(function () {
    // Product API endpoints
    Route::get('/products', [AdminProductController::class, 'index'])->name('products.index');
    Route::post('/products', [AdminProductController::class, 'store'])->name('products.store');
    Route::get('/products/{id}', [AdminProductController::class, 'show'])->name('products.show');
    Route::put('/products/{id}', [AdminProductController::class, 'update'])->name('products.update');
    Route::delete('/products/{id}', [AdminProductController::class, 'destroy'])->name('products.destroy');
    Route::post('/products/bulk-destroy', [AdminProductController::class, 'bulkDestroy'])->name('products.bulk-destroy');
    Route::post('/products/upload-image', [AdminProductController::class, 'uploadImage'])->name('products.upload-image');
    
    // Service API endpoints
    Route::apiResource('services', AdminServiceController::class);
});

// Admin User Management
Route::prefix('admin')->name('admin.')->group(function () {
    Route::post('/users', [AdminUsersController::class, 'store'])->name('users.store');
    Route::put('/users/{user}', [AdminUsersController::class, 'update'])->name('users.update');
    Route::delete('/users/{user}', [AdminUsersController::class, 'destroy'])->name('users.destroy');
});

// Profile routes (if needed)
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// Admin API Routes
Route::prefix('admin/api')->name('admin.api.')->group(function () {
    Route::apiResource('products', AdminProductController::class);
    Route::post('products/bulk-destroy', [AdminProductController::class, 'bulkDestroy'])->name('products.bulk-destroy');
    Route::post('products/upload-image', [AdminProductController::class, 'uploadImage'])->name('products.upload-image');
    Route::apiResource('services', AdminServiceController::class);
});

require __DIR__.'/auth.php';