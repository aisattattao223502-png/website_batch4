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
            // Add material_type if it doesn't exist
            if (!Schema::hasColumn('products', 'material_type')) {
                $table->enum('material_type', ['plastic', 'rubber', 'custom'])
                      ->after('category')
                      ->default('plastic');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            if (Schema::hasColumn('products', 'material_type')) {
                $table->dropColumn('material_type');
            }
        });
    }
};