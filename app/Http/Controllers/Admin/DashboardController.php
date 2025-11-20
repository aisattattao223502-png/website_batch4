<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Industry;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        // Get total counts
        $productsCount = Product::count();
        $industriesCount = Industry::count();
        $servicesCount = Service::count();
        
        // Get visitor count from text file
        $visitorFile = storage_path('app/visitor_counter.txt');
        $visitorCount = 0;

        if (file_exists($visitorFile)) {
            $visitorCount = (int) file_get_contents($visitorFile);
        }
        
        // Get recent products with images
        $recentProducts = Product::orderBy('created_at', 'desc')
            ->take(5)
            ->get(['id', 'name', 'category', 'image_url', 'created_at'])
            ->map(function($product) {
                return [
                    'id' => $product->id,
                    'name' => $product->name,
                    'category' => $product->category,
                    'image' => $product->image_url,
                    'created_at' => $product->created_at
                ];
            });
        
        // Get monthly visitor data (last 12 months)
        $monthlyVisitors = $this->getMonthlyVisitorData();
        
        return Inertia::render('Admin/Dashboard', [
            'stats' => [
                'products' => $productsCount,
                'industries' => $industriesCount,
                'services' => $servicesCount,
                'visitors' => $visitorCount,
            ],
            'recentProducts' => $recentProducts,
            'monthlyVisitors' => $monthlyVisitors,
        ]);
    }
    
    private function getMonthlyVisitorData()
    {
        // Since you're tracking visitors in a single counter,
        // we'll simulate monthly data based on the current count
        // You can modify this logic based on your actual tracking needs
        
        $visitorFile = storage_path('app/visitor_counter.txt');
        $currentCount = 0;

        if (file_exists($visitorFile)) {
            $currentCount = (int) file_get_contents($visitorFile);
        }
        
        // Simulate monthly distribution (you can adjust this logic)
        // This creates a realistic-looking chart
        $monthlyData = [];
        $baseCount = $currentCount / 12;
        
        for ($i = 0; $i < 12; $i++) {
            // Add some variation to make it look realistic
            $variation = rand(-20, 20) / 100;
            $monthlyData[] = (int)($baseCount * (1 + $variation));
        }
        
        return $monthlyData;
    }
}
