<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class IndustrySolution extends Model
{
    protected $table = 'industry_solutions';
    
    public $timestamps = false;
    
    protected $fillable = ['industry_id', 'solution'];

    public function industry()
    {
        return $this->belongsTo(Industry::class);
    }
}