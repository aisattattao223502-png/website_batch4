<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $fillable = [
        'name',
        'logo_url',
        'display_order'
    ];

    protected $casts = [
        'display_order' => 'integer'
    ];
}
