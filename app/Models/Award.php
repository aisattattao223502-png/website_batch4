<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Award extends Model
{
    protected $table = 'awards';
    public $timestamps = false;
    
    protected $fillable = [
        'title',
        'description',
        'year',
        'icon',
        'event_title',
        'image'
    ];
}
