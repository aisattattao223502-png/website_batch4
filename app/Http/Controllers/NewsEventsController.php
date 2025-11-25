<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Inertia\Inertia;

class NewsEventsController extends Controller
{
    /**
     * Display the news and events page
     */
    public function index()
    {
        // Fetch headline article
        $headlineArticle = DB::table('headline_articles')
            ->where('is_active', 1)
            ->orderBy('date', 'desc')
            ->first();

        // If headline article exists, add the specific image from media gallery
        if ($headlineArticle) {
            // Get the specific image "3 (11).jpg" from ojt_media_gallery (ID 34)
            $mediaGalleryImage = DB::table('ojt_media_gallery')
                ->where('id', 34)
                ->where('is_active', 1)
                ->first();
            
            if ($mediaGalleryImage) {
                // Clean the image path (remove any whitespace/newlines)
                $imagePath = trim(str_replace(["\r", "\n"], '', $mediaGalleryImage->image));
                
                // Set the image path properly
                if (Str::startsWith($imagePath, ['http://', 'https://'])) {
                    $headlineArticle->image_path = $imagePath;
                } elseif (Str::startsWith($imagePath, '/storage/')) {
                    $headlineArticle->image_path = $imagePath;
                } elseif (Str::startsWith($imagePath, 'assets/')) {
                    // Direct path from database: assets/img/media_gallery/3 (11).jpg
                    $headlineArticle->image_path = '/storage/' . $imagePath;
                } else {
                    $headlineArticle->image_path = '/storage/' . ltrim($imagePath, '/');
                }
                
                Log::info('Headline Article Image Set', [
                    'original_path' => $mediaGalleryImage->image,
                    'resolved_path' => $headlineArticle->image_path,
                    'media_id' => $mediaGalleryImage->id
                ]);
            } else {
                // Fallback to placeholder if media gallery image not found
                $headlineArticle->image_path = '/storage/assets/img/placeholder.png';
                Log::warning('Media gallery image not found for headline', ['media_id' => 34]);
            }
        }

        // Fetch all news with batch information
        $newsData = DB::table('news_events')
            ->where('type', 'news')
            ->orderBy(DB::raw('COALESCE(batch, 1)'), 'asc')
            ->orderBy('date', 'desc')
            ->get()
            ->map(function ($item) {
                // Get featured image for list view
                $featuredImage = DB::table('news_events_images')
                    ->where('news_event_id', $item->id)
                    ->orderBy('display_order', 'asc')
                    ->first();
                
                // Fix: Ensure proper URL format for images
                if ($featuredImage && $featuredImage->image_path) {
                    if (!Str::startsWith($featuredImage->image_path, ['/storage', 'http'])) {
                        $item->image = '/storage/' . ltrim($featuredImage->image_path, '/');
                    } else {
                        $item->image = $featuredImage->image_path;
                    }
                } else {
                    $item->image = '/storage/assets/img/placeholder.png';
                }
                
                $item->batch = $item->batch ?? 1;
                
                return $item;
            });

        // Fetch all events
        $events = DB::table('news_events')
            ->where('type', 'event')
            ->orderBy('date', 'desc')
            ->get()
            ->map(function ($item) {
                $featuredImage = DB::table('news_events_images')
                    ->where('news_event_id', $item->id)
                    ->orderBy('display_order', 'asc')
                    ->first();
                
                if ($featuredImage && $featuredImage->image_path) {
                    if (!Str::startsWith($featuredImage->image_path, ['/storage', 'http'])) {
                        $item->image = '/storage/' . ltrim($featuredImage->image_path, '/');
                    } else {
                        $item->image = $featuredImage->image_path;
                    }
                } else {
                    $item->image = '/storage/assets/img/placeholder.png';
                }
                
                $item->batch = $item->batch ?? 1;
                
                return $item;
            });

        // Fetch videos & promotions with their images
        $videosPromotions = DB::table('videos_promotions')
            ->orderBy('created_at', 'desc')
            ->get()
            ->map(function ($item) {
                // Get all images for this video/promotion
                $images = DB::table('videos_promotion_images')
                    ->where('videos_promotion_id', $item->id)
                    ->orderBy('display_order', 'asc')
                    ->get()
                    ->map(function ($img) {
                        if ($img->image_url && !Str::startsWith($img->image_url, ['/storage', 'http'])) {
                            $img->image_url = '/storage/' . ltrim($img->image_url, '/');
                        }
                        return $img;
                    });
                
                // Set first image as thumbnail
                $firstImage = $images->first();
                $item->image = $firstImage ? $firstImage->image_url : '/storage/assets/img/placeholder.png';
                $item->images = $images;
                
                return $item;
            });

        // Fetch plant visits
        $plantVisits = DB::table('plant_visits')
            ->orderBy('created_at', 'desc')
            ->get()
            ->map(function ($item) {
                // Get all images for this plant visit
                $images = DB::table('plant_visit_images')
                    ->where('plant_visit_id', $item->id)
                    ->where('media_type', 'image')
                    ->orderBy('display_order', 'asc')
                    ->get()
                    ->map(function ($img) {
                        if (Str::startsWith($img->image, ['/storage', 'http'])) {
                            $img->image_url = $img->image;
                        } else {
                            $img->image_url = '/storage/assets/img/plant_visit/' . $img->image;
                        }
                        return $img;
                    });
                
                // Get all videos for this plant visit
                $videos = DB::table('plant_visit_images')
                    ->where('plant_visit_id', $item->id)
                    ->where('media_type', 'video')
                    ->orderBy('display_order', 'asc')
                    ->get();
                
                // Set first image as thumbnail
                $firstImage = $images->first();
                $item->image = $firstImage ? $firstImage->image_url : '/storage/assets/img/placeholder.png';
                $item->images = $images;
                $item->videos = $videos;
                
                return $item;
            });

        return Inertia::render('Website/More/NewsEvents', [
            'headlineArticle' => $headlineArticle,
            'newsData' => $newsData,
            'events' => $events,
            'videosPromotions' => $videosPromotions,
            'plantVisits' => $plantVisits,
        ]);
    }

    /**
     * Show article detail page
     */
    public function show($id)
    {
        // Fetch article
        $article = DB::table('news_events')
            ->where('id', $id)
            ->first();

        if (!$article) {
            abort(404, 'Article not found');
        }

        // Check if tables exist
        $contentSectionsExist = DB::getSchemaBuilder()->hasTable('news_events_content_sections');
        $contentSectionVideosExist = DB::getSchemaBuilder()->hasTable('content_section_videos');

        // Initialize collections
        $contentSections = collect();
        $allVideos = collect();

        // Fetch content sections if table exists
        if ($contentSectionsExist) {
            $contentSections = DB::table('news_events_content_sections')
                ->where('news_event_id', $id)
                ->orderBy('display_order', 'asc')
                ->get()
                ->map(function ($section) use ($contentSectionVideosExist) {
                    // Fetch videos for this section if table exists
                    if ($contentSectionVideosExist) {
                        $videos = DB::table('content_section_videos')
                            ->where('section_id', $section->id)
                            ->orderBy('display_order', 'asc')
                            ->get()
                            ->map(function ($video) {
                                // For local videos, ensure proper path
                                if ($video->video_type === 'local' && $video->video_path && 
                                    !Str::startsWith($video->video_path, ['/storage', 'http'])) {
                                    $video->video_path = '/storage/' . ltrim($video->video_path, '/');
                                }
                                return $video;
                            });
                        
                        $section->videos = $videos;
                    } else {
                        $section->videos = collect();
                    }
                    
                    // Map section_content to description
                    $section->description = $section->section_content ?? '';
                    
                    return $section;
                });

            // Build media array prioritizing videos from sections
            foreach ($contentSections as $section) {
                if (isset($section->videos) && $section->videos->isNotEmpty()) {
                    $allVideos = $allVideos->merge($section->videos);
                }
            }
        }

        // Fetch images (only as fallback if sections have no videos)
        $images = DB::table('news_events_images')
            ->where('news_event_id', $id)
            ->orderBy('display_order', 'asc')
            ->get()
            ->map(function ($image) {
                if (isset($image->image_path) && $image->image_path && 
                    !Str::startsWith($image->image_path, ['/storage', 'http'])) {
                    $image->image_path = '/storage/' . ltrim($image->image_path, '/');
                }
                return $image;
            });

        return Inertia::render('Website/More/NewsEvents', [
            'headlineArticle' => null,
            'newsData' => [],
            'events' => [],
            'videosPromotions' => [],
            'plantVisits' => [],
            'selectedArticle' => $article,
            'articleImages' => $images,
            'articleVideos' => $allVideos,
            'articleSections' => $contentSections,
        ]);
    }
}