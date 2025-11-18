<?php

namespace App\Http\Controllers;

use App\Models\Industry;
use Inertia\Inertia;

class IndustryController extends Controller
{
    public function index()
    {
        $industries = Industry::with('solutions')->get();

        return Inertia::render('Industries', [
            'industries' => $industries
        ]);
    }

    public function show($id)
    {
        $industry = Industry::with('solutions')->findOrFail($id);

        return Inertia::render('IndustryDetail', [
            'industry' => $industry
        ]);
    }
}