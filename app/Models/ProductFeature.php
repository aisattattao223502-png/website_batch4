<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductFeature extends Model
{
    protected $table = 'product_features';
    
    public $timestamps = false;
    
    protected $fillable = ['product_id', 'feature'];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}