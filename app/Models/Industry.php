<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Industry extends Model
{
    // Disable timestamps since the table doesn't have created_at/updated_at columns
    public $timestamps = false;
    
    protected $fillable = [
        'name',
        'description',
        'icon_class',
        'image_url',
        'coming_soon'
    ];

    protected $casts = [
        'coming_soon' => 'boolean',
    ];

    public function solutions()
    {
        return $this->hasMany(IndustrySolution::class);
    }
}