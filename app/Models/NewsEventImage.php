<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NewsEventImage extends Model
{
    protected $table = 'news_events_images';
    
    protected $fillable = [
        'news_event_id',
        'image_path',
        'alt_text',
        'display_order',
        'is_featured'
    ];

    protected $casts = [
        'is_featured' => 'boolean'
    ];

    public function newsEvent()
    {
        return $this->belongsTo(NewsEvent::class);
    }
}