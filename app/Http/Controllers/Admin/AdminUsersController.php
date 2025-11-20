<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AdminUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Inertia\Inertia;

class AdminUsersController extends Controller
{
    public function index()
    {
        $users = AdminUsers::orderBy('created_at', 'desc')->paginate(10);
        
        return Inertia::render('Admin/AdminUsers', [
            'users' => $users
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:admin_users,email',
            'password' => 'required|string|min:8',
            'is_active' => 'required|boolean',
        ]);

        $validated['password'] = Hash::make($validated['password']);

        AdminUsers::create($validated);

        return redirect()->route('admin.users.index')
            ->with('success', 'Admin user created successfully');
    }

    public function update(Request $request, AdminUsers $user)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => ['required', 'email', Rule::unique('admin_users')->ignore($user->id)],
            'password' => 'nullable|string|min:8',
            'is_active' => 'required|boolean',
        ]);

        if (!empty($validated['password'])) {
            $validated['password'] = Hash::make($validated['password']);
        } else {
            unset($validated['password']);
        }

        $user->update($validated);

        return redirect()->route('admin.users.index')
            ->with('success', 'Admin user updated successfully');
    }

    public function destroy(AdminUsers $user)
    {
        $user->delete();

        return redirect()->route('admin.users.index')
            ->with('success', 'Admin user deleted successfully');
    }
}