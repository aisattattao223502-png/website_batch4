<?php

use App\Http\Controllers\AdminUsersController;
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

// Industries page route
Route::get('/industries', function () {
    return Inertia::render('Website/Explore/Industries');
})->name('industries');

// Awards page route
Route::get('/awards', function () {
    return Inertia::render('Website/Explore/Awards');
})->name('awards');

// Contact page route
Route::get('/contact', function () {
    return Inertia::render('Website/Contact', [
        'content' => [
            'banner' => [
                'heading' => 'Contact Us',
                'breadcrumb' => 'Contact',
                'background_image' => asset('storage/assets/img/banners/contact_banner.jpg'),
                'overlay_image' => asset('storage/assets/img/banners/contact_banner.jpg')
            ],
            'contact_info' => [
                'heading' => 'Get In Touch',
                'subheading' => 'Our team is ready to assist you with any questions about our polymer solutions and services.',
                'phone_title' => 'Call Us',
                'phone_description' => 'Speak directly with our technical team',
                'phone_number' => '+(02) 8529 8978',
                'phone_display' => '+63 (2) 8529 8978',
                'email_title' => 'Email Us',
                'email_description' => 'Get detailed information about our products',
                'email_address' => 'jamespro.asia101@gmail.com',
                'email_display' => 'jamespro.asia101@gmail.com',
                'location_title' => 'Visit Us',
                'location_description' => 'Schedule a visit to our facilities',
                'location_link_text' => 'View Location'
            ],
            'map' => [
                'iframe_src' => 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d488.8849933426653!2d120.95594617157205!3d14.452064021803464!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397cd8f21555555%3A0xa3b07b32dcee1f3d!2sJames%20Polymers%20Manufacturing%20Corporation.!5e0!3m2!1sen!2sph!4v1746000140786!5m2!1sen!2sph'
            ],
            'cta' => [
                'heading' => 'Ready to Discuss Your Project?',
                'description' => 'Our technical sales team is available to help you select the right polymer solution for your application.',
                'button_text' => 'View Products',
                'background_image' => asset('storage/assets/img/banners/contact_cta.jpg')
            ],
            // ADD THIS LINE - Replace with your actual Google Form URL
            'google_form_url' => 'https://forms.gle/Hn4KY5cUWcA8HiP8A', '_blank'
        ]
    ]);
})->name('contact');

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

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
    return Inertia::render('Website/More/Careers', [
        'fullTimeFormUrl' => 'https://forms.gle/ddrfp3VqGMMk3knf9',
        'ojtFormUrl' => 'http://forms.gle/R4qkB7Aw6ViFXnVc9'
    ]);
})->name('careers');

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

//---------------------------------ADMIN---------------------------------//

// Admin routes
Route::prefix('admin')->name('admin.')->group(function () {
    Route::get('/users', [AdminUsersController::class, 'index'])->name('users.index');
    Route::post('/users', [AdminUsersController::class, 'store'])->name('users.store');
    Route::put('/users/{user}', [AdminUsersController::class, 'update'])->name('users.update');
    Route::delete('/users/{user}', [AdminUsersController::class, 'destroy'])->name('users.destroy');
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';