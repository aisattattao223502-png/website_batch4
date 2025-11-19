<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Service;
use App\Http\Requests\StoreServiceRequest;
use App\Http\Requests\UpdateServiceRequest;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Inertia\Inertia;


class ServiceController extends Controller
{
    public function index()
    {
        $services = Service::orderBy('name', 'asc')->get();
        
        return Inertia::render('Admin/AdminServices', [
            'services' => $services,
            'mode' => 'list',
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/AdminServices', [
            'services' => [],
            'mode' => 'create',
        ]);
    }

    public function store(StoreServiceRequest $request)
    {
        $validated = $request->validated();
        
        // Handle image upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $filename = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('assets', $filename, 'public');
            $validated['image_url'] = $filename;
        }
        
        Service::create($validated);
        
        return redirect()->route('admin.services.index')
            ->with('success', 'Service added successfully!');
    }

    public function edit(Service $service)
    {
        return Inertia::render('Admin/AdminServices', [
            'services' => [],
            'service' => $service,
            'mode' => 'edit',
        ]);
    }

    public function update(UpdateServiceRequest $request, Service $service)
    {
        $validated = $request->validated();
        
        // Handle image upload
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($service->image_url) {
                Storage::disk('public')->delete('assets/' . $service->image_url);
            }
            
            $image = $request->file('image');
            $filename = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('assets', $filename, 'public');
            $validated['image_url'] = $filename;
        }
        
        $service->update($validated);
        
        return redirect()->route('admin.services.index')
            ->with('success', 'Service updated successfully!');
    }

    public function destroy(Service $service)
    {
        // Delete image if exists
        if ($service->image_url) {
            Storage::disk('public')->delete('assets/' . $service->image_url);
        }
        
        $service->delete();
        
        return redirect()->route('admin.services.index')
            ->with('success', 'Service deleted successfully!');
    }
}