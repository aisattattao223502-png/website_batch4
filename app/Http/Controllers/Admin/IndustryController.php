<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Industry;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;

class IndustryController extends Controller
{
    public function index()
    {
        $industries = Industry::orderBy('name')->get();
        
        return Inertia::render('Admin/AdminIndustries', [
            'industries' => $industries,
            'mode' => 'list'
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/AdminIndustries', [
            'industries' => Industry::orderBy('name')->get(),
            'mode' => 'create'
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:100',
            'description' => 'required|string',
            'icon_class' => 'nullable|string|max:50',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:5120',
            'coming_soon' => 'boolean'
        ]);

        $data = [
            'name' => $validated['name'],
            'description' => $validated['description'],
            'icon_class' => $validated['icon_class'] ?? '',
            'coming_soon' => $request->boolean('coming_soon')
        ];

        // Handle image upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $filename = time() . '_' . $image->getClientOriginalName();
            $image->move(public_path('storage/assets/img/industries'), $filename);
            $data['image_url'] = 'assets/img/industries/' . $filename;
        }

        Industry::create($data);

        return redirect()->route('admin.industries.index')
            ->with('success', 'Industry added successfully!');
    }

    public function edit(Industry $industry)
    {
        return Inertia::render('Admin/AdminIndustries', [
            'industries' => Industry::orderBy('name')->get(),
            'industry' => $industry,
            'mode' => 'edit'
        ]);
    }

    public function update(Request $request, Industry $industry)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:100',
            'description' => 'required|string',
            'icon_class' => 'nullable|string|max:50',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:5120',
            'coming_soon' => 'boolean'
        ]);

        $data = [
            'name' => $validated['name'],
            'description' => $validated['description'],
            'icon_class' => $validated['icon_class'] ?? '',
            'coming_soon' => $request->boolean('coming_soon')
        ];

        // Handle new image upload
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($industry->image_url) {
                $oldImagePath = public_path('storage/' . $industry->image_url);
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath);
                }
            }

            $image = $request->file('image');
            $filename = time() . '_' . $image->getClientOriginalName();
            $image->move(public_path('storage/assets/img/industries'), $filename);
            $data['image_url'] = 'assets/img/industries/' . $filename;
        }

        $industry->update($data);

        return redirect()->route('admin.industries.index')
            ->with('success', 'Industry updated successfully!');
    }

    public function destroy(Industry $industry)
    {
        // Delete image if exists
        if ($industry->image_url) {
            $imagePath = public_path('storage/' . $industry->image_url);
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }
        }

        $industry->delete();

        return redirect()->route('admin.industries.index')
            ->with('success', 'Industry deleted successfully!');
    }
}
