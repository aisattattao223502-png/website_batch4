<?php

namespace App\Http\Controllers;

use App\Models\NewsEvent;
use Inertia\Inertia;

class NewsEventController extends Controller
{
    public function index()
    {
        $newsEvents = NewsEvent::with([
            'images', 
            'contentSections.images'
        ])
        ->orderBy('date', 'desc')
        ->get();

        return Inertia::render('Newsevents', [
            'newsEvents' => $newsEvents
        ]);
    }

    public function show($id)
    {
        $newsEvent = NewsEvent::with([
            'images', 
            'contentSections.images'
        ])->findOrFail($id);

        return Inertia::render('NewsEventDetail', [
            'newsEvent' => $newsEvent
        ]);
    }
}