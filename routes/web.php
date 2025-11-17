<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\IndustryController;
use App\Http\Controllers\NewsEventController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

use App\Http\Controllers\VisitorController;

Route::get('/visitors/get', [VisitorController::class, 'getCount']);
Route::post('/visitors/increment', [VisitorController::class, 'incrementCount']);

// Home page
Route::get('/', function () {
    return Inertia::render('Website/Home', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
    ]);
})->name('home');

// About page route
Route::get('/about', function () {
    return Inertia::render('Website/About');
})->name('about');

// Products Routes
Route::get('/products', [ProductController::class, 'index'])->name('products.index');
Route::get('/products/{id}', [ProductController::class, 'show'])->name('products.show');
Route::get('/products/category/{category}', [ProductController::class, 'byCategory'])
    ->name('products.category');

// Industries Routes
Route::get('/industries', [IndustryController::class, 'index'])->name('industries.index');
Route::get('/industries/{id}', [IndustryController::class, 'show'])->name('industries.show');

// News & Events Routes
Route::get('/news-events', [NewsEventController::class, 'index'])->name('news-events.index');
Route::get('/news-events/{id}', [NewsEventController::class, 'show'])->name('news-events.show');
Route::get('/news-events/type/{type}', [NewsEventController::class, 'byType'])
    ->name('news-events.type');

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

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

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';