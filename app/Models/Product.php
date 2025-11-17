<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';
    
    protected $fillable = [
        'name',
        'description',
        'category',
        'image_url',
        'features',
        'Cat'
    ];

    public function features()
    {
        return $this->hasMany(ProductFeature::class, 'product_id');
    }
}