<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'name' => 'sometimes|required|string|max:255',
            'description' => 'nullable|string',
            'category' => 'sometimes|required|in:appliance,automotive,industrial',
            'material_type' => 'sometimes|required|in:plastic,rubber,custom',
            'image_url' => 'nullable|string|max:255',
            'features' => 'nullable|array',
            'features.*' => 'string|max:255'
        ];
    }
}