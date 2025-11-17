<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Industry extends Model
{
    protected $table = 'industries';
    
    public $timestamps = false;
    
    protected $fillable = [
        'name',
        'description',
        'image_url',
        'icon_class',
        'coming_soon'
    ];

    protected $casts = [
        'coming_soon' => 'boolean'
    ];

    public function solutions()
    {
        return $this->hasMany(IndustrySolution::class, 'industry_id');
    }
}