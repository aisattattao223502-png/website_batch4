<?php

use App\Http\Controllers\ContactController;
use App\Http\Controllers\AdminUsersController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;

use App\Http\Controllers\NewsEventController;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

use App\Http\Controllers\VisitorController;

use App\Http\Controllers\Admin\ServiceController;
use App\Http\Controllers\Admin\IndustryController;
use App\Http\Controllers\Admin\AwardController;
use App\Http\Controllers\Admin\TimelineController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Admin\ServiceController as AdminServiceController;
use App\Http\Controllers\Admin\DashboardController;

use App\Http\Controllers\Admin\AuthController;


// Visitor counter routes
Route::get('/visitors/count', function () {
    $count = DB::table('counter')->value('Counter_Visitor') ?? 0;
    return response()->json(['count' => $count]);
});

Route::post('/visitors/increment', function () {
    // Check if row exists
    $exists = DB::table('counter')->exists();
    
    if (!$exists) {
        DB::table('counter')->insert(['Counter_Visitor' => 1]);
        $count = 1;
    } else {
        DB::table('counter')->increment('Counter_Visitor');
        $count = DB::table('counter')->value('Counter_Visitor');
    }
    
    return response()->json(['count' => $count]);
});

/*
|--------------------------------------------------------------------------
| Public Website Routes
|--------------------------------------------------------------------------
*/

// Home page with products and services
Route::get('/', function () {
    $products = \App\Models\Product::with('features')->latest()->get();
    $services = \App\Models\Service::all();
    $customers = \App\Models\Customer::orderBy('display_order')->get();
    
    // Get customer section settings
    $customersHeading = DB::table('home_sections')
        ->where('section_name', 'customers')
        ->where('field_name', 'heading')
        ->value('value') ?? 'Our Valued Customers';
    
    $customersSubheading = DB::table('home_sections')
        ->where('section_name', 'customers')
        ->where('field_name', 'subheading')
        ->value('value') ?? "We're proud to partner with industry leaders.";
    
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
        'services' => $services->toArray(),
        'customers' => $customers->map(function($customer) {
            return [
                'id' => $customer->id,
                'name' => $customer->name,
                'logo_url' => $customer->logo_url,
                'display_order' => $customer->display_order
            ];
        })->toArray(),
        'customersHeading' => $customersHeading,
        'customersSubheading' => $customersSubheading
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
        'services' => $services->map(function($service) {
            return [
                'id' => $service->id,
                'name' => $service->name,
                'description' => $service->description,
                'image_url' => $service->image_url,
                'youtube_url' => $service->youtube_url ?? ''
            ];
        })->toArray()
    ]);
})->name('products');

// About page route
Route::get('/about', function () {
    return Inertia::render('Website/About');
})->name('about');

// Industries page route
Route::get('/industries', function () {
    $industries = \App\Models\Industry::with('solutions')->get();
    
    return Inertia::render('Website/Explore/Industries', [
        'industries' => $industries->map(function($industry) {
            return [
                'id' => $industry->id,
                'name' => $industry->name,
                'description' => $industry->description,
                'image_url' => $industry->image_url,
                'icon_class' => $industry->icon_class,
                'coming_soon' => $industry->coming_soon,
                'solutions' => $industry->solutions->pluck('solution')->toArray()
            ];
        })->toArray()
    ]);
})->name('industries');

// Awards & Recognition page route
Route::get('/awards-recognition', function () {
    $awards = \App\Models\Award::orderBy('year', 'desc')->get();
    $timelines = \App\Models\AwardTimeline::orderBy('date', 'desc')->get();
    
    return Inertia::render('Website/Explore/Awards', [
        'awards' => $awards->map(function($award) {
            return [
                'id' => $award->id,
                'title' => $award->title,
                'description' => $award->description,
                'year' => $award->year,
                'icon' => $award->icon,
                'event_title' => $award->event_title ?? '',
                'image' => $award->image
            ];
        })->toArray(),
        'timeline' => $timelines->map(function($item) {
            return [
                'id' => $item->id,
                'title' => $item->title,
                'description' => $item->description,
                'date' => $item->date->format('Y-m-d'),
                'icon' => $item->icon
            ];
        })->toArray()
    ]);
})->name('awards-recognition');

// Contact routes
Route::get('/contact', [ContactController::class, 'index'])->name('contact');
Route::post('/contact/submit', [ContactController::class, 'submit'])->name('contact.submit');

// Sustainability page route
Route::get('/sustainability', function () {
    return Inertia::render('Website/More/Sustainability');
})->name('sustainability');

// Overview Process page route
Route::get('/overview-process', function () {
    return Inertia::render('Website/More/OverviewProcess');
})->name('overview-process');

// News & Events page route
Route::get('/news-events', function () {
    return Inertia::render('Website/More/NewsEvents');
})->name('news-events');

// Careers page route
Route::get('/careers', function () {
    return Inertia::render('Website/More/Careers');
})->name('careers');

// FAQ page route
Route::get('/faq', function () {
    return Inertia::render('Website/More/FAQ');
})->name('faq');

// Privacy Policy
Route::get('/privacy-policy', function () {
    return Inertia::render('Website/More/PrivacyPolicy');
})->name('privacy-policy');

//---------------------------------ADMIN ROUTES---------------------------------//

// Admin Authentication Routes
// Authenticated user profile routes
/*
|--------------------------------------------------------------------------
| Profile Routes (Authenticated)
|--------------------------------------------------------------------------
*/
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

//---------------------------------ADMIN SECTION---------------------------------//

// Admin Authentication & Dashboard
/*
|--------------------------------------------------------------------------
| Admin Routes - NO AUTH REQUIRED (For Development)
|--------------------------------------------------------------------------
*/

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

    // Products CRUD
    Route::prefix('products')->name('products.')->group(function () {
        Route::get('/', [AdminProductController::class, 'index'])->name('index');
        Route::get('/create', [AdminProductController::class, 'create'])->name('create');
        Route::post('/', [AdminProductController::class, 'store'])->name('store');
        Route::get('/{id}/edit', [AdminProductController::class, 'edit'])->name('edit');
        Route::put('/{id}', [AdminProductController::class, 'update'])->name('update');
        Route::delete('/{id}', [AdminProductController::class, 'destroy'])->name('destroy');
    });
    
    // Admin Users Management
    Route::prefix('users')->name('users.')->group(function () {
        Route::get('/', [AdminUsersController::class, 'index'])->name('index');
        Route::post('/', [AdminUsersController::class, 'store'])->name('store');
        Route::put('/{user}', [AdminUsersController::class, 'update'])->name('update');
        Route::delete('/{user}', [AdminUsersController::class, 'destroy'])->name('destroy');
    });
    
    // Industries CRUD
    Route::prefix('industries')->name('industries.')->group(function () {
        Route::get('/', [IndustryController::class, 'index'])->name('index');
        Route::get('/create', [IndustryController::class, 'create'])->name('create');
        Route::post('/', [IndustryController::class, 'store'])->name('store');
        Route::get('/{industry}/edit', [IndustryController::class, 'edit'])->name('edit');
        Route::post('/{industry}', [IndustryController::class, 'update'])->name('update');
        Route::delete('/{industry}', [IndustryController::class, 'destroy'])->name('destroy');
    });
    
    // Services CRUD
    Route::prefix('services')->name('services.')->group(function () {
        Route::get('/', [ServiceController::class, 'index'])->name('index');
        Route::get('/create', [ServiceController::class, 'create'])->name('create');
        Route::post('/', [ServiceController::class, 'store'])->name('store');
        Route::get('/{service}/edit', [ServiceController::class, 'edit'])->name('edit');
        Route::post('/{service}', [ServiceController::class, 'update'])->name('update');
        Route::delete('/{service}', [ServiceController::class, 'destroy'])->name('destroy');
    });
    
    // Awards & Timeline Management
    Route::prefix('awards')->name('awards.')->group(function () {
        Route::get('/', [AwardController::class, 'index'])->name('index');
        Route::post('/', [AwardController::class, 'store'])->name('store');
        Route::post('/{award}', [AwardController::class, 'update'])->name('update');
        Route::delete('/{award}', [AwardController::class, 'destroy'])->name('destroy');
    });

    Route::prefix('timelines')->name('timelines.')->group(function () {
        Route::post('/', [TimelineController::class, 'store'])->name('store');
        Route::put('/{timeline}', [TimelineController::class, 'update'])->name('update');
        Route::delete('/{timeline}', [TimelineController::class, 'destroy'])->name('destroy');
    });
    
    Route::get('/users', [AdminUsersController::class, 'index'])->name('users.index');
    // Customers Management
    Route::prefix('customers')->name('customers.')->group(function () {
        Route::get('/', [\App\Http\Controllers\Admin\CustomerController::class, 'index'])->name('index');
        Route::post('/', [\App\Http\Controllers\Admin\CustomerController::class, 'store'])->name('store');
        Route::put('/{id}', [\App\Http\Controllers\Admin\CustomerController::class, 'update'])->name('update');
        Route::delete('/{id}', [\App\Http\Controllers\Admin\CustomerController::class, 'destroy'])->name('destroy');
        Route::post('/reorder', [\App\Http\Controllers\Admin\CustomerController::class, 'reorder'])->name('reorder');
        Route::post('/settings', [\App\Http\Controllers\Admin\CustomerController::class, 'updateSettings'])->name('settings');
    });
    
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
/*
|--------------------------------------------------------------------------
| Admin API Routes (Optional - for future use)
|--------------------------------------------------------------------------
*/
Route::prefix('admin/api')->name('admin.api.')->group(function () {
    Route::apiResource('products', AdminProductController::class);
    Route::post('products/bulk-destroy', [AdminProductController::class, 'bulkDestroy'])->name('products.bulk-destroy');
    Route::post('products/upload-image', [AdminProductController::class, 'uploadImage'])->name('products.upload-image');
    Route::apiResource('services', AdminServiceController::class);
});

require __DIR__.'/auth.php';