<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class VisitorController extends Controller
{
    private $counterFile;

    public function __construct()
    {
        $this->counterFile = storage_path('app/visitor_counter.txt');
        
        // Ensure the file exists
        if (!file_exists($this->counterFile)) {
            file_put_contents($this->counterFile, '0');
        }
    }

    public function getCount()
    {
        try {
            $count = $this->readCounter();
            
            return response()->json([
                'count' => $count
            ]);
        } catch (\Exception $e) {
            Log::error('Visitor count get error: ' . $e->getMessage());
            return response()->json([
                'count' => 0,
                'error' => $e->getMessage()
            ], 200); // Return 200 instead of 500
        }
    }

    public function incrementCount(Request $request)
    {
        try {
            // Start session if not started
            if (!$request->session()->isStarted()) {
                $request->session()->start();
            }
            
            // Check if visitor has already been counted in this session
            if (!$request->session()->has('visitor_counted')) {
                $count = $this->readCounter();
                $count++;
                $this->writeCounter($count);
                
                $request->session()->put('visitor_counted', true);
            }
            
            $count = $this->readCounter();
            
            return response()->json([
                'count' => $count
            ]);
        } catch (\Exception $e) {
            Log::error('Visitor count increment error: ' . $e->getMessage());
            return response()->json([
                'count' => 0,
                'error' => $e->getMessage()
            ], 200); // Return 200 instead of 500
        }
    }

    private function readCounter()
    {
        if (!file_exists($this->counterFile)) {
            $this->writeCounter(0);
            return 0;
        }
        
        $count = file_get_contents($this->counterFile);
        return (int) trim($count);
    }

    private function writeCounter($count)
    {
        file_put_contents($this->counterFile, $count);
        chmod($this->counterFile, 0664); // Set proper permissions
    }
}