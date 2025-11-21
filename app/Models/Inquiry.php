<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inquiry extends Model
{
    use HasFactory;

    // Add this line to disable timestamps
    public $timestamps = false;

    protected $fillable = [
        'name',
        'email',
        'phone',
        'company',
        'position',
        'address',
        'subject',
        'priority',
        'message',
        'status',
        'date_submitted'
    ];

    protected $casts = [
        'date_submitted' => 'datetime',
    ];
}