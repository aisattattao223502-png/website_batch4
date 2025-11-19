<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AwardTimeline;
use App\Http\Requests\StoreTimelineRequest;
use App\Http\Requests\UpdateTimelineRequest;
use Inertia\Inertia;

class TimelineController extends Controller
{
    public function store(StoreTimelineRequest $request)
    {
        $validated = $request->validated();
        
        AwardTimeline::create($validated);
        
        return redirect()->route('admin.awards.index')
            ->with('success', 'Timeline item added successfully!');
    }

    public function update(UpdateTimelineRequest $request, AwardTimeline $timeline)
    {
        $validated = $request->validated();
        
        $timeline->update($validated);
        
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
