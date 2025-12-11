<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'category',
        'material_type',
        'image_url',
        'features',
    ];

    protected $casts = [
        'features' => 'array',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get formatted date
     */
    public function getFormattedDateAttribute()
    {
        return $this->created_at->format('M d, Y');
    }

    /**
     * Get category badge class
     */
    public function getCategoryBadgeAttribute()
    {
        $badges = [
            'appliance' => 'bg-yellow-100 text-yellow-800',
            'automotive' => 'bg-red-100 text-red-800',
            'industrial' => 'bg-blue-100 text-blue-800',
        ];

        return $badges[$this->category] ?? 'bg-gray-100 text-gray-800';
    }

    /**
     * Automatically fix image URL format
     */
    public function getImageUrlAttribute($value)
    {
        // If empty, return as is
        if (!$value) {
            return $value;
        }

        // If starts with http:// or https://, return as is (external URL)
        if (str_starts_with($value, 'http://') || str_starts_with($value, 'https://')) {
            return $value;
        }

        // If already starts with /storage/, return as is
        if (str_starts_with($value, '/storage/')) {
            return $value;
        }

        // If starts with assets/, prepend /storage/
        if (str_starts_with($value, 'assets/')) {
            return '/storage/' . $value;
        }

        // Otherwise, return as is
        return $value;
    }
}