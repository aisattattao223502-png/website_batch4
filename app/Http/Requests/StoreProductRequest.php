<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true; // Add your authorization logic later
    }

    public function rules(): array
    {
        return [
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'category' => 'required|in:appliance,automotive,industrial',
            'material_type' => 'required|in:plastic,rubber,custom',
            'image_url' => 'nullable|string|max:255',
            'features' => 'nullable|array',
            'features.*' => 'string|max:255'
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Product name is required.',
            'category.required' => 'Please select a category.',
            'category.in' => 'Invalid category selected.',
            'material_type.required' => 'Please select a material type.',
            'material_type.in' => 'Invalid material type selected.',
        ];
    }
}