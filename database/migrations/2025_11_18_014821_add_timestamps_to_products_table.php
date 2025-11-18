<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('products', function (Blueprint $table) {
            // Check if columns don't exist before adding
            if (!Schema::hasColumn('products', 'updated_at')) {
                $table->timestamp('updated_at')->nullable();
            }
            if (!Schema::hasColumn('products', 'created_at')) {
                $table->timestamp('created_at')->nullable()->useCurrent();
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn(['updated_at', 'created_at']);
        });
    }
};