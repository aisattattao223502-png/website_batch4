<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    public $timestamps = false; // ADD THIS LINE
    
    protected $fillable = [
        'name',
        'description',
        'image_url',
        'youtube_url'
    ];
}