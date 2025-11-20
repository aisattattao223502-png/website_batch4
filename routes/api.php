<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;

// Visitor counter routes (using text file)
Route::get('/visitors/count', function () {
    $file = storage_path('app/visitor_counter.txt');
    
    if (!file_exists($file)) {
        file_put_contents($file, '0');
    }
    
    $count = (int) file_get_contents($file);
    return response()->json(['count' => $count]);
});

Route::post('/visitors/increment', function () {
    $file = storage_path('app/visitor_counter.txt');
    
    if (!file_exists($file)) {
        $count = 1;
    } else {
        $count = (int) file_get_contents($file) + 1;
    }
    
    file_put_contents($file, $count);
    return response()->json(['count' => $count]);
});