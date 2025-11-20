<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AwardTimeline;
use Illuminate\Http\Request;

class TimelineController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'date' => 'required|date',
            'icon' => 'nullable|string|max:50'
        ]);

        AwardTimeline::create([
            'title' => $validated['title'],
            'description' => $validated['description'],
            'date' => $validated['date'],
            'icon' => $validated['icon'] ?? 'fa-calendar'
        ]);

        return redirect()->route('admin.awards.index')
            ->with('success', 'Timeline item added successfully!');
    }

    public function update(Request $request, AwardTimeline $timeline)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'date' => 'required|date',
            'icon' => 'nullable|string|max:50'
        ]);

        $timeline->update([
            'title' => $validated['title'],
            'description' => $validated['description'],
            'date' => $validated['date'],
            'icon' => $validated['icon'] ?? 'fa-calendar'
        ]);

        return redirect()->route('admin.awards.index')
            ->with('success', 'Timeline item updated successfully!');
    }

    public function destroy(AwardTimeline $timeline)
    {
        $timeline->delete();

        return redirect()->route('admin.awards.index')
            ->with('success', 'Timeline item deleted successfully!');
    }
}
