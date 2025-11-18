<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        // For now, we'll use static data
        // You'll integrate real data later
        
        return Inertia::render('Admin/Dashboard', [
            'stats' => [
                'products' => 0,
                'industries' => 0,
                'services' => 0,
                'visitors' => 0,
            ],
            'recentProducts' => [],
            'monthlyVisitors' => array_fill(0, 12, 0),
        ]);
    }
}
