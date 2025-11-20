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
}