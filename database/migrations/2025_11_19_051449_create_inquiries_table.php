<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('inquiries', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email');
            $table->string('phone');
            $table->string('company')->nullable();
            $table->string('position')->nullable();
            $table->string('company_address');
            $table->string('subject');
            $table->enum('priority', ['low', 'medium', 'high']);
            $table->text('message');
            $table->enum('status', ['new', 'in-progress', 'resolved', 'closed'])->default('new');
            $table->timestamp('date_submitted')->useCurrent();
            $table->timestamps();
            
            // Indexes for better query performance
            $table->index('status');
            $table->index('date_submitted');
            $table->index('email');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('inquiries');
    }
};

// Im using this migration don't delete this one //