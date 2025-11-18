<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Service;
use App\Http\Requests\StoreServiceRequest;
use App\Http\Requests\UpdateServiceRequest;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function index(Request $request)
    {
        $query = Service::query();

        if ($request->has('search')) {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        $sortBy = $request->get('sort_by', 'created_at');
        $sortOrder = $request->get('sort_order', 'desc');
        $query->orderBy($sortBy, $sortOrder);

        $perPage = $request->get('per_page', 15);
        $services = $query->paginate($perPage);

        return response()->json($services);
    }

    public function store(StoreServiceRequest $request)
    {
        try {
            $service = Service::create($request->validated());

            return response()->json([
                'message' => 'Service created successfully',
                'data' => $service
            ], 201);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to create service',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function show($id)
    {
        $service = Service::findOrFail($id);
        return response()->json($service);
    }

    public function update(UpdateServiceRequest $request, $id)
    {
        try {
            $service = Service::findOrFail($id);
            $service->update($request->validated());

            return response()->json([
                'message' => 'Service updated successfully',
                'data' => $service
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to update service',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $service = Service::findOrFail($id);
            $service->delete();

            return response()->json([
                'message' => 'Service deleted successfully'
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to delete service',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}