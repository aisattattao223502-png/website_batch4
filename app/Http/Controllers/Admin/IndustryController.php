<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Industry;
use App\Http\Requests\StoreIndustryRequest;
use App\Http\Requests\UpdateIndustryRequest;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;

class IndustryController extends Controller
{
    public function index()
    {
        $industries = Industry::orderBy('name', 'asc')->get();
        
        return Inertia::render('Admin/AdminIndustries', [
            'industries' => $industries,
            'mode' => 'list',
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/AdminIndustries', [
            'industries' => [],
            'mode' => 'create',
        ]);
    }

    public function store(StoreIndustryRequest $request)
    {
        $validated = $request->validated();
        
        // Handle image upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $filename = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('assets', $filename, 'public');
            $validated['image_url'] = $filename;
        }
        
        $validated['coming_soon'] = $request->boolean('coming_soon');
        
        Industry::create($validated);
        
        return redirect()->route('admin.industries.index')
            ->with('success', 'Industry added successfully!');
    }

    public function edit(Industry $industry)
    {
        return Inertia::render('Admin/Industries', [
            'industries' => [],
            'industry' => $industry,
            'mode' => 'edit',
        ]);
    }

    public function update(UpdateIndustryRequest $request, Industry $industry)
    {
        $validated = $request->validated();
        
        // Handle image upload
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($industry->image_url) {
                Storage::disk('public')->delete('assets/' . $industry->image_url);
            }
            
            $image = $request->file('image');
            $filename = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('assets', $filename, 'public');
            $validated['image_url'] = $filename;
        }
        
        $validated['coming_soon'] = $request->boolean('coming_soon');
        
        $industry->update($validated);
        
        return redirect()->route('admin.industries.index')
            ->with('success', 'Industry updated successfully!');
    }

    public function destroy(Industry $industry)
    {
        // Delete image if exists
        if ($industry->image_url) {
            Storage::disk('public')->delete('assets/' . $industry->image_url);
        }
        
        $industry->delete();
        
        return redirect()->route('admin.industries.index')
            ->with('success', 'Industry deleted successfully!');
    }
}
