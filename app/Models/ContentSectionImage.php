<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContentSectionImage extends Model
{
    protected $table = 'content_section_images';
    
    protected $fillable = [
        'section_id',
        'image_path',
        'alt_text',
        'display_order'
    ];

    public function contentSection()
    {
        return $this->belongsTo(NewsEventContentSection::class, 'section_id');
    }
}