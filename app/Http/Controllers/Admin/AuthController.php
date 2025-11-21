<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AdminUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        // Find admin user
        $admin = AdminUsers::where('email', $request->email)->first();

        // Check if user exists, is active, and password matches
        if ($admin && $admin->is_active && Hash::check($request->password, $admin->password)) {
            // Store admin info in session
            Session::put('admin_id', $admin->id);
            Session::put('admin_name', $admin->name);
            Session::put('admin_email', $admin->email);

            // Update last login
            $admin->update(['last_login' => now()]);

            return response()->json([
                'success' => true,
                'message' => 'Login successful',
                'redirect' => route('admin.dashboard')
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Invalid credentials or account is inactive'
        ], 401);
    }

    public function logout(Request $request)
    {
        Session::flush();
        
        if ($request->expectsJson()) {
            return response()->json(['success' => true]);
        }
        
        return redirect()->route('admin.login')->with('success', 'Logged out successfully');
    }

    public function check()
    {
        if (Session::has('admin_id')) {
            $admin = AdminUsers::find(Session::get('admin_id'));
            return response()->json([
                'authenticated' => true,
                'admin' => [
                    'name' => $admin->name,
                    'email' => $admin->email
                ]
            ]);
        }

        return response()->json(['authenticated' => false]);
    }
}