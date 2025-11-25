<?php

namespace App\Http\Controllers;

use App\Models\Faq;
use Inertia\Inertia;

class FaqController extends Controller
{
    public function index()
    {
        // Load all FAQs (you can paginate if desired)
        $faqs = Faq::orderBy('created_at', 'desc')->get();

        // Optionally get count directly
        $faqCount = $faqs->count();

        return Inertia::render('Website/More/FAQ', [
            'faqs' => $faqs,
            'faqCount' => $faqCount,
        ]);
    }
}
