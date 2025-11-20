<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Service;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ServiceController extends Controller
{
    public function index()
    {
        $services = Service::orderBy('name')->get();
        
        return Inertia::render('Admin/AdminServices', [
            'services' => $services,
            'mode' => 'list'
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/AdminServices', [
            'services' => Service::orderBy('name')->get(),
            'mode' => 'create'
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:5120',
            'youtube_url' => 'nullable|url'
        ]);

        $data = [
            'name' => $validated['name'],
            'description' => $validated['description'] ?? '',
            'youtube_url' => $request->input('youtube_url', '')
        ];

        // Handle image upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $filename = time() . '_' . $image->getClientOriginalName();
            $image->move(public_path('storage/assets/img/services'), $filename);
            $data['image_url'] = 'assets/img/services/' . $filename;
        }

        Service::create($data);

        return redirect()->route('admin.services.index')
            ->with('success', 'Service added successfully!');
    }

    public function edit(Service $service)
    {
        return Inertia::render('Admin/AdminServices', [
            'services' => Service::orderBy('name')->get(),
            'service' => $service,
            'mode' => 'edit'
        ]);
    }

    public function update(Request $request, Service $service)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:5120',
            'youtube_url' => 'nullable|url'
        ]);

        $data = [
            'name' => $validated['name'],
            'description' => $validated['description'] ?? '',
            'youtube_url' => $request->input('youtube_url', '')
        ];

        // Handle new image upload
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($service->image_url) {
                $oldImagePath = public_path('storage/' . $service->image_url);
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath);
                }
            }

            $image = $request->file('image');
            $filename = time() . '_' . $image->getClientOriginalName();
            $image->move(public_path('storage/assets/img/services'), $filename);
            $data['image_url'] = 'assets/img/services/' . $filename;
        }

        $service->update($data);

        return redirect()->route('admin.services.index')
            ->with('success', 'Service updated successfully!');
    }

    public function destroy(Service $service)
    {
        // Delete image if exists
        if ($service->image_url) {
            $imagePath = public_path('storage/' . $service->image_url);
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }
        }

        $service->delete();

        return redirect()->route('admin.services.index')
            ->with('success', 'Service deleted successfully!');
    }
}