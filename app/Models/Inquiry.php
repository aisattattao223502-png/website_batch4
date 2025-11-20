<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inquiry extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'email',
        'phone',
        'company',
        'position',
        'company_address',
        'subject',
        'priority',
        'message',
        'status',
        'date_submitted',
    ];

    protected $casts = [
        'date_submitted' => 'datetime',
    ];

    public $timestamps = true;

    // Get priority badge color
    public function getPriorityColorAttribute()
    {
        return match($this->priority) {
            'high' => 'red',
            'medium' => 'yellow',
            'low' => 'green',
            default => 'gray'
        };
    }

    // Get status badge color
    public function getStatusColorAttribute()
    {
        return match($this->status) {
            'new' => 'blue',
            'in-progress' => 'yellow',
            'resolved' => 'green',
            'closed' => 'gray',
            default => 'gray'
        };
    }
}