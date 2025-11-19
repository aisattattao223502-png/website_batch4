<script setup>
import { ref, computed } from 'vue';
import { Head, useForm, router } from '@inertiajs/vue3';
import AdminLayout from '@/layouts/Admin/AdminLayout.vue';

const props = defineProps({
    services: {
        type: Array,
        default: () => []
    },
    service: {
        type: Object,
        default: null
    },
    mode: {
        type: String,
        default: 'list' // 'list', 'create', 'edit'
    },
    success: String,
    error: String
});

// Form setup
const form = useForm({
    name: props.service?.name || '',
    description: props.service?.description || '',
    image: null,
    existing_image: props.service?.image_url || ''
});

const imagePreview = ref(props.service?.image_url ? `/storage/assets/${props.service.image_url}` : null);

// Handle image selection
const handleImageSelect = (event) => {
    const file = event.target.files[0];
    if (file) {
        form.image = file;
        imagePreview.value = URL.createObjectURL(file);
    }
};

// Submit form
const submitForm = () => {
    if (props.mode === 'create') {
        form.post(route('admin.services.store'), {
            preserveScroll: true,
            onSuccess: () => form.reset(),
        });
    } else if (props.mode === 'edit') {
        form.post(route('admin.services.update', props.service.id), {
            preserveScroll: true,
        });
    }
};

// Delete service
const deleteService = (id, name) => {
    if (confirm(`Are you sure you want to delete "${name}"? This action cannot be undone.`)) {
        router.delete(route('admin.services.destroy', id), {
            preserveScroll: true,
        });
    }
};

// Navigate functions
const goToList = () => {
    router.visit(route('admin.services.index'));
};

const goToCreate = () => {
    router.visit(route('admin.services.create'));
};

const goToEdit = (id) => {
    router.visit(route('admin.services.edit', id));
};

// Format date
const formatDate = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
};
</script>

<template>
    <Head title="Manage Services" />

    <AdminLayout>
        <!-- Page Header -->
        <div class="mb-8">
            <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                <div>
                    <h1 class="text-2xl lg:text-3xl font-bold text-gray-900">Manage Services</h1>
                    <p class="mt-1 text-sm lg:text-base text-gray-600">Add, edit or delete company services</p>
                </div>
                
                <div class="flex gap-3">
                    <button
                        v-if="mode === 'list'"
                        @click="goToCreate"
                        class="inline-flex items-center justify-center px-4 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200 shadow-sm hover:shadow-md"
                    >
                        <i class="fas fa-plus mr-2"></i>
                        <span>Add Service</span>
                    </button>
                    
                    <button
                        v-else
                        @click="goToList"
                        class="inline-flex items-center justify-center px-4 py-2.5 bg-gray-600 hover:bg-gray-700 text-white font-medium rounded-lg transition-colors duration-200 shadow-sm hover:shadow-md"
                    >
                        <i class="fas fa-arrow-left mr-2"></i>
                        <span>Back to List</span>
                    </button>
                </div>
            </div>
        </div>

        <!-- Success Message -->
        <div
            v-if="success"
            class="mb-6 bg-green-50 border-l-4 border-green-500 p-4 rounded-r-lg"
        >
            <div class="flex">
                <i class="fas fa-check-circle text-green-500 mt-0.5 mr-3"></i>
                <p class="text-green-800">{{ success }}</p>
            </div>
        </div>

        <!-- Error Message -->
        <div
            v-if="error"
            class="mb-6 bg-red-50 border-l-4 border-red-500 p-4 rounded-r-lg"
        >
            <div class="flex">
                <i class="fas fa-exclamation-circle text-red-500 mt-0.5 mr-3"></i>
                <p class="text-red-800">{{ error }}</p>
            </div>
        </div>

        <!-- Create/Edit Form -->
        <div v-if="mode === 'create' || mode === 'edit'" class="bg-white rounded-xl shadow-sm border border-gray-200">
            <div class="p-6 lg:p-8">
                <h2 class="text-xl font-semibold text-gray-900 mb-6">
                    {{ mode === 'create' ? 'Add New Service' : 'Edit Service' }}
                </h2>

                <form @submit.prevent="submitForm" class="space-y-6">
                    <!-- Service Name -->
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700 mb-2">
                            Service Name <span class="text-red-500">*</span>
                        </label>
                        <input
                            id="name"
                            v-model="form.name"
                            type="text"
                            required
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                            placeholder="e.g., Custom Injection Molding"
                        />
                        <p v-if="form.errors.name" class="mt-1 text-sm text-red-600">
                            {{ form.errors.name }}
                        </p>
                    </div>

                    <!-- Description -->
                    <div>
                        <label for="description" class="block text-sm font-medium text-gray-700 mb-2">
                            Service Description
                        </label>
                        <textarea
                            id="description"
                            v-model="form.description"
                            rows="5"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all resize-none"
                            placeholder="Detailed description of the service and what it offers..."
                        ></textarea>
                        <p class="mt-2 text-xs text-gray-500">
                            Provide a detailed description of the service and its benefits.
                        </p>
                        <p v-if="form.errors.description" class="mt-1 text-sm text-red-600">
                            {{ form.errors.description }}
                        </p>
                    </div>

                    <!-- Image Upload -->
                    <div>
                        <label for="image" class="block text-sm font-medium text-gray-700 mb-2">
                            Service Image
                        </label>
                        
                        <!-- Current Image Preview -->
                        <div v-if="imagePreview" class="mb-4">
                            <div class="relative inline-block group">
                                <img 
                                    :src="imagePreview" 
                                    alt="Preview" 
                                    class="h-40 w-auto rounded-lg border-2 border-gray-200 object-cover shadow-sm"
                                />
                                <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-10 rounded-lg transition-all"></div>
                                <span class="absolute -top-2 -right-2 bg-blue-600 text-white text-xs px-2 py-1 rounded-full shadow">
                                    {{ mode === 'edit' && !form.image ? 'Current' : 'Preview' }}
                                </span>
                            </div>
                        </div>

                        <!-- File Input -->
                        <div class="relative">
                            <input
                                id="image"
                                type="file"
                                accept="image/*"
                                @change="handleImageSelect"
                                class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0 file:text-sm file:font-medium file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 file:cursor-pointer"
                            />
                        </div>
                        
                        <p class="mt-2 text-xs text-gray-500">
                            {{ mode === 'edit' ? 'Upload a new image only if you want to change the current one.' : 'Please upload an image for the service.' }}
                            Recommended size: 800x600px. Max 5MB.
                        </p>
                        <p v-if="form.errors.image" class="mt-1 text-sm text-red-600">
                            {{ form.errors.image }}
                        </p>
                    </div>

                    <!-- Form Actions -->
                    <div class="flex items-center justify-end gap-3 pt-4 border-t border-gray-200">
                        <button
                            type="button"
                            @click="goToList"
                            class="px-6 py-2.5 bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium rounded-lg transition-colors duration-200"
                        >
                            Cancel
                        </button>
                        <button
                            type="submit"
                            :disabled="form.processing"
                            class="px-6 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200 shadow-sm hover:shadow-md disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2"
                        >
                            <i v-if="form.processing" class="fas fa-spinner fa-spin"></i>
                            <span>{{ mode === 'create' ? 'Add Service' : 'Update Service' }}</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Services Grid -->
        <div v-else>
            <!-- Empty State -->
            <div v-if="services.length === 0" class="bg-white rounded-xl shadow-sm border border-gray-200 p-12 text-center">
                <div class="inline-flex items-center justify-center w-20 h-20 bg-gray-100 rounded-full mb-4">
                    <i class="fas fa-cogs text-gray-400 text-3xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">No Services Found</h3>
                <p class="text-gray-600 mb-6">You haven't added any services yet. Start by creating your first service.</p>
                <button
                    @click="goToCreate"
                    class="inline-flex items-center px-4 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200"
                >
                    <i class="fas fa-plus mr-2"></i>
                    Add Your First Service
                </button>
            </div>

            <!-- Services Grid -->
            <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <div
                    v-for="service in services"
                    :key="service.id"
                    class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden hover:shadow-lg transition-all duration-300 group flex flex-col"
                >
                    <!-- Image Section -->
                    <div class="relative h-48 bg-gradient-to-br from-blue-50 to-blue-100 overflow-hidden flex-shrink-0">
                        <img
                            v-if="service.image_url"
                            :src="`/storage/assets/${service.image_url}`"
                            :alt="service.name"
                            class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                        />
                        <div v-else class="w-full h-full flex items-center justify-center">
                            <i class="fas fa-cogs text-gray-400 text-5xl"></i>
                        </div>
                        
                        <!-- Gradient Overlay -->
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent"></div>
                        
                        <!-- Action Buttons -->
                        <div class="absolute top-3 right-3 flex gap-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                            <button
                                @click="goToEdit(service.id)"
                                class="w-9 h-9 bg-white hover:bg-blue-50 text-blue-600 rounded-full shadow-lg hover:shadow-xl transition-all duration-200 flex items-center justify-center"
                                title="Edit"
                            >
                                <i class="fas fa-edit text-sm"></i>
                            </button>
                            <button
                                @click="deleteService(service.id, service.name)"
                                class="w-9 h-9 bg-white hover:bg-red-50 text-red-600 rounded-full shadow-lg hover:shadow-xl transition-all duration-200 flex items-center justify-center"
                                title="Delete"
                            >
                                <i class="fas fa-trash text-sm"></i>
                            </button>
                        </div>
                        
                        <!-- Service Name Overlay -->
                        <div class="absolute bottom-0 left-0 right-0 p-4">
                            <h3 class="text-white font-bold text-lg leading-tight line-clamp-2">
                                {{ service.name }}
                            </h3>
                        </div>
                    </div>
                    
                    <!-- Content Section -->
                    <div class="p-5 flex-grow flex flex-col">
                        <!-- Service Name (for mobile) -->
                        <h3 class="font-semibold text-gray-900 mb-3 text-lg">
                            {{ service.name }}
                        </h3>
                        
                        <!-- Description -->
                        <p v-if="service.description" class="text-gray-600 text-sm leading-relaxed line-clamp-4 flex-grow mb-4">
                            {{ service.description }}
                        </p>
                        <p v-else class="text-gray-400 text-sm italic flex-grow mb-4">
                            No description available
                        </p>

                        <!-- Footer -->
                        <div class="pt-3 border-t border-gray-100">
                            <div class="flex items-center text-xs text-gray-500">
                                <i class="fas fa-calendar-alt mr-2 text-gray-400"></i>
                                <span>Added: {{ formatDate(service.created_at) }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AdminLayout>
</template>

<style scoped>
.line-clamp-2 {
    display: -webkit-box;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.line-clamp-4 {
    display: -webkit-box;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
</style>