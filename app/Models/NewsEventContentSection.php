<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NewsEventContentSection extends Model
{
    protected $table = 'news_events_content_sections';
    
    protected $fillable = [
        'news_event_id',
        'section_title',
        'section_content',
        'display_order'
    ];

    public function newsEvent()
    {
        return $this->belongsTo(NewsEvent::class);
    }

    public function images()
    {
        return $this->hasMany(ContentSectionImage::class, 'section_id')
                    ->orderBy('display_order');
    }
}