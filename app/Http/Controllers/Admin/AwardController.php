<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Award;
use App\Models\AwardTimeline;
use Illuminate\Http\Request;
use Inertia\Inertia;

class AwardController extends Controller
{
    public function index()
    {
        $awards = Award::orderBy('year', 'desc')->get();
        $timelines = AwardTimeline::orderBy('date', 'desc')->get();
        
        return Inertia::render('Admin/AdminAwards', [
            'awards' => $awards,
            'timelines' => $timelines
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:300',
            'description' => 'required|string|max:300',
            'year' => 'required|string|max:300',
            'icon' => 'nullable|string|max:300',
            'event_title' => 'nullable|string|max:300',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:5120'
        ]);

        $data = [
            'title' => $validated['title'],
            'description' => $validated['description'],
            'year' => $validated['year'],
            'icon' => $validated['icon'] ?? 'fa-trophy',
            'event_title' => $validated['event_title'] ?? ''
        ];

        // Handle image upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $filename = time() . '_' . $image->getClientOriginalName();
            $image->move(public_path('storage/assets/img/awards'), $filename);
            $data['image'] = $filename;
        }

        Award::create($data);

        return redirect()->route('admin.awards.index')
            ->with('success', 'Award added successfully!');
    }

    public function update(Request $request, Award $award)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:300',
            'description' => 'required|string|max:300',
            'year' => 'required|string|max:300',
            'icon' => 'nullable|string|max:300',
            'event_title' => 'nullable|string|max:300',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:5120'
        ]);

        $data = [
            'title' => $validated['title'],
            'description' => $validated['description'],
            'year' => $validated['year'],
            'icon' => $validated['icon'] ?? 'fa-trophy',
            'event_title' => $validated['event_title'] ?? ''
        ];

        // Handle new image upload
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($award->image) {
                $oldImagePath = public_path('storage/assets/img/awards/' . $award->image);
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath);
                }
            }

            $image = $request->file('image');
            $filename = time() . '_' . $image->getClientOriginalName();
            $image->move(public_path('storage/assets/img/awards'), $filename);
            $data['image'] = $filename;
        }

        $award->update($data);

        return redirect()->route('admin.awards.index')
            ->with('success', 'Award updated successfully!');
    }

    public function destroy(Award $award)
    {
        // Delete image if exists
        if ($award->image) {
            $imagePath = public_path('storage/assets/img/awards/' . $award->image);
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }
        }

        $award->delete();

        return redirect()->route('admin.awards.index')
            ->with('success', 'Award deleted successfully!');
    }
}
