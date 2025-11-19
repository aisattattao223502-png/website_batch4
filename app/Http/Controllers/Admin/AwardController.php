<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Award;
use App\Models\AwardTimeline;
use App\Http\Requests\StoreAwardRequest;
use App\Http\Requests\UpdateAwardRequest;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;

class AwardController extends Controller
{
    public function index()
    {
        $awards = Award::orderBy('year', 'desc')->get();
        $timelines = AwardTimeline::orderBy('date', 'desc')->get();
        
        return Inertia::render('Admin/AdminAwards', [
            'awards' => $awards,
            'timelines' => $timelines,
        ]);
    }

    public function store(StoreAwardRequest $request)
    {
        $validated = $request->validated();
        
        // Handle image upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $filename = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('assets/awards', $filename, 'public');
            $validated['image'] = $filename;
        }
        
        Award::create($validated);
        
        return redirect()->route('admin.awards.index')
            ->with('success', 'Award added successfully!');
    }

    public function update(UpdateAwardRequest $request, Award $award)
    {
        $validated = $request->validated();
        
        // Handle image upload
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($award->image) {
                Storage::disk('public')->delete('assets/awards/' . $award->image);
            }
            
            $image = $request->file('image');
            $filename = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('assets/awards', $filename, 'public');
            $validated['image'] = $filename;
        }
        
        $award->update($validated);
        
        return redirect()->route('admin.awards.index')
            ->with('success', 'Award updated successfully!');
    }

    public function destroy(Award $award)
    {
        // Delete image if exists
        if ($award->image) {
            Storage::disk('public')->delete('assets/awards/' . $award->image);
        }
        
        $award->delete();
        
        return redirect()->route('admin.awards.index')
            ->with('success', 'Award deleted successfully!');
    }
}
