<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NewsEvent extends Model
{
    protected $table = 'news_events';
    
    protected $fillable = [
        'title',
        'content',
        'featured',
        'show_in_banner',
        'has_multimedia',
        'has_content_sections',
        'type',
        'date',
        'image',
        'Batch'
    ];

    protected $casts = [
        'date' => 'date',
        'featured' => 'boolean',
        'show_in_banner' => 'boolean',
        'has_multimedia' => 'boolean',
        'has_content_sections' => 'boolean',
    ];

    public function images()
    {
        return $this->hasMany(NewsEventImage::class, 'news_event_id')
                    ->orderBy('display_order');
    }

    public function contentSections()
    {
        return $this->hasMany(NewsEventContentSection::class, 'news_event_id')
                    ->orderBy('display_order');
    }
}