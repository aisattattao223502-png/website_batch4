<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AwardTimeline extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'date',
        'icon',
    ];

    protected $casts = [
        'date' => 'date',
    ];
}
