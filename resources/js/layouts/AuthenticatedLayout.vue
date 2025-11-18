<script setup>
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <div class="min-h-screen bg-gray-100">
        <nav class="bg-white shadow">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    <div class="flex">
                        <Link href="/" class="flex items-center">
                            <span class="text-xl font-bold">James Polymers</span>
                        </Link>
                    </div>
                    <div class="flex items-center space-x-4">
                        <Link href="/admin/products" class="text-gray-700 hover:text-gray-900">
                            Products
                        </Link>
                        <Link href="/logout" method="post" as="button" class="text-gray-700 hover:text-gray-900">
                            Logout
                        </Link>
                    </div>
                </div>
            </div>
        </nav>
        
        <main class="max-w-7xl mx-auto">
            <slot />
        </main>
    </div>
</template>