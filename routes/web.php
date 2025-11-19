<?php

use App\Http\Controllers\ContactController;
use App\Http\Controllers\AdminUsersController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\IndustryController;
use App\Http\Controllers\NewsEventController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

use App\Http\Controllers\VisitorController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Admin\ServiceController as AdminServiceController;
use App\Http\Controllers\Admin\AuthController;
use App\Http\Controllers\Admin\DashboardController;

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
    return Inertia::render('Website/More/FAQ', [
        'faqs' => [
            [
                'id' => 1,
                'question' => 'What types of plastic injection molding do you offer?',
                'answer' => 'We offer a comprehensive range of plastic injection molding services including thermoplastic injection, insert molding, overmolding, and multi-shot molding. Our state-of-the-art facilities can handle projects from prototype to high-volume production.'
            ],
            [
                'id' => 2,
                'question' => 'What quality certifications does James Polymers hold?',
                'answer' => 'James Polymers is ISO 9001:2015 certified for quality management, ISO 14001:2015 for environmental management, and IATF 16949 certified for automotive quality management. We maintain rigorous quality control standards across all our manufacturing processes.'
            ],
            [
                'id' => 3,
                'question' => 'What is your typical lead time for production?',
                'answer' => 'Lead times vary depending on project complexity and volume. For standard orders, typical lead times range from 2-4 weeks. We also offer expedited services for urgent requirements. Contact our team for specific timeline estimates for your project.'
            ],
            [
                'id' => 4,
                'question' => 'Do you provide custom mold design services?',
                'answer' => 'Yes, we have an experienced in-house design team that specializes in custom mold design and development. We use advanced CAD/CAM software and work closely with clients to optimize designs for manufacturability and cost-effectiveness.'
            ],
        ],
        'headerTitle' => 'Frequently Asked Questions',
        'headerBg' => '/storage/assets/img/faq/hero-bg.jpg'
    ]);
})->name('faq');

// Privacy Policy page route
Route::get('/privacy-policy', function () {
    return Inertia::render('Website/More/PrivacyPolicy');
})->name('privacy-policy');

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
    
    Route::get('/inquiries', function () {
        return Inertia::render('Admin/Inquiries');
    })->name('inquiries');
});

// Admin API Routes
Route::prefix('admin/api')->name('admin.api.')->group(function () {
    Route::apiResource('products', AdminProductController::class);
    Route::post('products/bulk-destroy', [AdminProductController::class, 'bulkDestroy'])->name('products.bulk-destroy');
    Route::post('products/upload-image', [AdminProductController::class, 'uploadImage'])->name('products.upload-image');
    Route::apiResource('services', AdminServiceController::class);
});

require __DIR__.'/auth.php';