<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AwardTimeline extends Model
{
    protected $table = 'award_timelines';
    public $timestamps = true;
    
    protected $fillable = [
        'title',
        'description',
        'date',
        'icon'
    ];

    protected $casts = [
        'date' => 'date'
    ];
}
