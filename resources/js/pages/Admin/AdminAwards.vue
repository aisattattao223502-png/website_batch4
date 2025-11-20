<script setup>
import { ref, computed } from 'vue';
import { Head, useForm, router } from '@inertiajs/vue3';
import AdminLayout from '@/layouts/Admin/AdminLayout.vue';

const props = defineProps({
    awards: {
        type: Array,
        default: () => []
    },
    timelines: {
        type: Array,
        default: () => []
    },
    success: String,
    error: String
});

// Active tab management
const activeTab = ref('awards');

// Modal management
const showModal = ref(false);
const modalMode = ref('create'); // 'create' or 'edit'
const modalType = ref('award'); // 'award' or 'timeline'

// Forms
const awardForm = useForm({
    id: null,
    title: '',
    description: '',
    year: '',
    icon: 'fa-trophy',
    event_title: '', // ADD THIS LINE
    image: null,
    existing_image: ''
});

const timelineForm = useForm({
    id: null,
    title: '',
    description: '',
    date: '',
    icon: 'fa-calendar'
});

const imagePreview = ref(null);

// Open modal for adding
const openAddModal = (type) => {
    modalType.value = type;
    modalMode.value = 'create';

    if (type === 'award') {
        awardForm.reset();
        awardForm.id = null;
        awardForm.image = null;
        awardForm.existing_image = '';
        imagePreview.value = null;
    } else {
        timelineForm.reset();
        timelineForm.id = null;
    }

    showModal.value = true;
};


// Open modal for editing
const openEditModal = (type, item) => {
    modalType.value = type;
    modalMode.value = 'edit';
    
    if (type === 'award') {
        awardForm.id = item.id;
        awardForm.title = item.title;
        awardForm.description = item.description;
        awardForm.year = item.year;
        awardForm.icon = item.icon;
        awardForm.existing_image = item.image;
        imagePreview.value = item.image ? `/storage/assets/img/awards/${item.image}` : null;
    } else {
        timelineForm.id = item.id;
        timelineForm.title = item.title;
        timelineForm.description = item.description;
        timelineForm.date = item.date;
        timelineForm.icon = item.icon;
    }
    
    showModal.value = true;
};

// Close modal
const closeModal = () => {
    showModal.value = false;
    awardForm.reset();
    timelineForm.reset();
    imagePreview.value = null;
};

// Handle image selection
const handleImageSelect = (event) => {
    const file = event.target.files[0];
    if (file) {
        awardForm.image = file;
        imagePreview.value = URL.createObjectURL(file);
    }
};

// Submit form
const submitForm = () => {
    if (modalType.value === 'award') {
        if (modalMode.value === 'create') {
            awardForm.post(route('admin.awards.store'), {
                forceFormData: true, // ADD THIS
                preserveScroll: true,
                onSuccess: () => closeModal(),
            });
        } else {
            awardForm.post(route('admin.awards.update', awardForm.id), {
                forceFormData: true, // ADD THIS
                preserveScroll: true,
                onSuccess: () => closeModal(),
            });
        }
    } else {
        if (modalMode.value === 'create') {
            timelineForm.post(route('admin.timelines.store'), {
                preserveScroll: true,
                onSuccess: () => closeModal(),
            });
        } else {
            timelineForm.put(route('admin.timelines.update', timelineForm.id), {
                preserveScroll: true,
                onSuccess: () => closeModal(),
            });
        }
    }
};

// Delete functions
const deleteAward = (id, title) => {
    if (confirm(`Are you sure you want to delete "${title}"? This action cannot be undone.`)) {
        router.delete(route('admin.awards.destroy', id), {
            preserveScroll: true,
        });
    }
};

const deleteTimeline = (id, title) => {
    if (confirm(`Are you sure you want to delete "${title}"? This action cannot be undone.`)) {
        router.delete(route('admin.timelines.destroy', id), {
            preserveScroll: true,
        });
    }
};

// Format date
const formatDate = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { year: 'numeric', month: 'long' });
};

// Get current form based on modal type
const currentForm = computed(() => {
    return modalType.value === 'award' ? awardForm : timelineForm;
});

// Modal title
const modalTitle = computed(() => {
    const action = modalMode.value === 'create' ? 'Add New' : 'Edit';
    const type = modalType.value === 'award' ? 'Award' : 'Timeline Item';
    return `${action} ${type}`;
});
</script>

<template>
    <Head title="Manage Awards & Timeline" />

    <AdminLayout>
        <!-- Page Header -->
        <div class="mb-8">
            <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4">
                <div>
                    <h1 class="text-2xl lg:text-3xl font-bold text-gray-900">Manage Awards & Timeline</h1>
                    <p class="mt-1 text-sm lg:text-base text-gray-600">Add, edit, or remove awards and timeline items</p>
                </div>
                
                <div class="flex flex-col sm:flex-row gap-3">
                    <button
                        @click="openAddModal('award')"
                        class="inline-flex items-center justify-center px-4 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200 shadow-sm hover:shadow-md"
                    >
                        <i class="fas fa-plus mr-2"></i>
                        <span>Add Award</span>
                    </button>
                    <button
                        @click="openAddModal('timeline')"
                        class="inline-flex items-center justify-center px-4 py-2.5 bg-green-600 hover:bg-green-700 text-white font-medium rounded-lg transition-colors duration-200 shadow-sm hover:shadow-md"
                    >
                        <i class="fas fa-plus mr-2"></i>
                        <span>Add Timeline Item</span>
                    </button>
                </div>
            </div>
        </div>

        <!-- Success Message -->
        <div v-if="success" class="mb-6 bg-green-50 border-l-4 border-green-500 p-4 rounded-r-lg">
            <div class="flex">
                <i class="fas fa-check-circle text-green-500 mt-0.5 mr-3"></i>
                <p class="text-green-800">{{ success }}</p>
            </div>
        </div>

        <!-- Error Message -->
        <div v-if="error" class="mb-6 bg-red-50 border-l-4 border-red-500 p-4 rounded-r-lg">
            <div class="flex">
                <i class="fas fa-exclamation-circle text-red-500 mt-0.5 mr-3"></i>
                <p class="text-red-800">{{ error }}</p>
            </div>
        </div>

        <!-- Tabs -->
        <div class="mb-6">
            <div class="border-b border-gray-200">
                <nav class="-mb-px flex space-x-4 sm:space-x-8 overflow-x-auto">
                    <button
                        @click="activeTab = 'awards'"
                        :class="[
                            'whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm transition-colors',
                            activeTab === 'awards'
                                ? 'border-blue-600 text-blue-600'
                                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
                        ]"
                    >
                        <i class="fas fa-trophy mr-2"></i>
                        Awards ({{ awards.length }})
                    </button>
                    <button
                        @click="activeTab = 'timeline'"
                        :class="[
                            'whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm transition-colors',
                            activeTab === 'timeline'
                                ? 'border-blue-600 text-blue-600'
                                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
                        ]"
                    >
                        <i class="fas fa-clock mr-2"></i>
                        Timeline ({{ timelines.length }})
                    </button>
                </nav>
            </div>
        </div>

        <!-- Awards Section -->
        <div v-show="activeTab === 'awards'" class="bg-white rounded-xl shadow-sm border border-gray-200">
            <!-- Empty State -->
            <div v-if="awards.length === 0" class="p-12 text-center">
                <div class="inline-flex items-center justify-center w-20 h-20 bg-gray-100 rounded-full mb-4">
                    <i class="fas fa-trophy text-gray-400 text-3xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">No Awards Found</h3>
                <p class="text-gray-600 mb-6">You haven't added any awards yet. Start by creating your first award.</p>
                <button
                    @click="openAddModal('award')"
                    class="inline-flex items-center px-4 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200"
                >
                    <i class="fas fa-plus mr-2"></i>
                    Add Your First Award
                </button>
            </div>

            <!-- Awards Grid -->
            <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 p-6">
                <div
                    v-for="award in awards"
                    :key="award.id"
                    class="bg-white border border-gray-200 rounded-lg overflow-hidden hover:shadow-lg transition-all duration-300 group"
                >
                    <!-- Image Section -->
                    <div class="relative h-40 bg-gradient-to-br from-yellow-50 to-yellow-100 overflow-hidden">
                        <img
                            v-if="award.image"
                            :src="`/storage/assets/img/awards/${award.image}`"
                            :alt="award.title"
                            class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                        />
                        <div v-else class="w-full h-full flex items-center justify-center">
                            <i :class="award.icon" class="fas text-yellow-400 text-5xl"></i>
                        </div>
                        
                        <!-- Overlay -->
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent"></div>
                        
                        <!-- Action Buttons -->
                        <div class="absolute top-3 right-3 flex gap-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                            <button
                                @click="openEditModal('award', award)"
                                class="w-9 h-9 bg-white hover:bg-blue-50 text-blue-600 rounded-full shadow-lg hover:shadow-xl transition-all duration-200 flex items-center justify-center"
                                title="Edit"
                            >
                                <i class="fas fa-edit text-sm"></i>
                            </button>
                            <button
                                @click="deleteAward(award.id, award.title)"
                                class="w-9 h-9 bg-white hover:bg-red-50 text-red-600 rounded-full shadow-lg hover:shadow-xl transition-all duration-200 flex items-center justify-center"
                                title="Delete"
                            >
                                <i class="fas fa-trash text-sm"></i>
                            </button>
                        </div>
                        
                        <!-- Year Badge -->
                        <div class="absolute bottom-3 left-3">
                            <span class="inline-flex items-center px-3 py-1 bg-yellow-500 text-white text-sm font-semibold rounded-full shadow-lg">
                                {{ award.year }}
                            </span>
                        </div>

                        <!-- Event Title (Awards only) -->
                        <div v-if="modalType === 'award'">
                            <label for="modal-event-title" class="block text-sm font-medium text-gray-700 mb-2">
                                Event Title
                            </label>
                            <input
                                id="modal-event-title"
                                v-model="awardForm.event_title"
                                type="text"
                                class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                                placeholder="e.g., Golden Globe Awards"
                            />
                            <p class="mt-2 text-xs text-gray-500">
                                Optional: Name of the awarding organization or event.
                            </p>
                            <p v-if="awardForm.errors.event_title" class="mt-1 text-sm text-red-600">
                                {{ awardForm.errors.event_title }}
                            </p>
                        </div>
                    </div>
                    
                    <!-- Content Section -->
                    <div class="p-5">
                        <h3 class="font-bold text-gray-900 mb-2 line-clamp-2">
                            {{ award.title }}
                        </h3>
                        <p class="text-gray-600 text-sm line-clamp-3">
                            {{ award.description }}
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Timeline Section -->
        <div v-show="activeTab === 'timeline'" class="bg-white rounded-xl shadow-sm border border-gray-200">
            <!-- Empty State -->
            <div v-if="timelines.length === 0" class="p-12 text-center">
                <div class="inline-flex items-center justify-center w-20 h-20 bg-gray-100 rounded-full mb-4">
                    <i class="fas fa-clock text-gray-400 text-3xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">No Timeline Items Found</h3>
                <p class="text-gray-600 mb-6">You haven't added any timeline items yet. Start by creating your first timeline item.</p>
                <button
                    @click="openAddModal('timeline')"
                    class="inline-flex items-center px-4 py-2.5 bg-green-600 hover:bg-green-700 text-white font-medium rounded-lg transition-colors duration-200"
                >
                    <i class="fas fa-plus mr-2"></i>
                    Add Your First Timeline Item
                </button>
            </div>

            <!-- Timeline List -->
            <div v-else class="p-6">
                <div class="relative">
                    <!-- Timeline Line -->
                    <div class="absolute left-8 top-0 bottom-0 w-0.5 bg-gray-200 hidden md:block"></div>
                    
                    <!-- Timeline Items -->
                    <div class="space-y-6">
                        <div
                            v-for="(item, index) in timelines"
                            :key="item.id"
                            class="relative flex items-start gap-4 md:gap-6 group"
                        >
                            <!-- Icon Circle -->
                            <div class="relative flex-shrink-0 w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center border-4 border-white shadow-md group-hover:bg-blue-200 transition-colors z-10">
                                <i :class="item.icon" class="fas text-blue-600 text-xl"></i>
                            </div>
                            
                            <!-- Content Card -->
                            <div class="flex-1 bg-gray-50 rounded-lg p-5 border border-gray-200 hover:shadow-md transition-all duration-300">
                                <div class="flex items-start justify-between gap-4">
                                    <div class="flex-1 min-w-0">
                                        <div class="flex items-center gap-3 mb-2">
                                            <h3 class="font-bold text-gray-900 text-lg">{{ item.title }}</h3>
                                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                                {{ formatDate(item.date) }}
                                            </span>
                                        </div>
                                        <p class="text-gray-600 text-sm leading-relaxed">
                                            {{ item.description }}
                                        </p>
                                    </div>
                                    
                                    <!-- Action Buttons -->
                                    <div class="flex gap-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                                        <button
                                            @click="openEditModal('timeline', item)"
                                            class="w-8 h-8 bg-white hover:bg-blue-50 text-blue-600 rounded-lg shadow hover:shadow-md transition-all duration-200 flex items-center justify-center border border-gray-200"
                                            title="Edit"
                                        >
                                            <i class="fas fa-edit text-xs"></i>
                                        </button>
                                        <button
                                            @click="deleteTimeline(item.id, item.title)"
                                            class="w-8 h-8 bg-white hover:bg-red-50 text-red-600 rounded-lg shadow hover:shadow-md transition-all duration-200 flex items-center justify-center border border-gray-200"
                                            title="Delete"
                                        >
                                            <i class="fas fa-trash text-xs"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div
            v-if="showModal"
            class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4"
            @click.self="closeModal"
        >
            <div class="bg-white rounded-xl shadow-2xl w-full max-w-2xl max-h-[90vh] overflow-y-auto">
                <!-- Modal Header -->
                <div class="flex items-center justify-between p-6 border-b border-gray-200">
                    <h2 class="text-xl font-bold text-gray-900">{{ modalTitle }}</h2>
                    <button
                        @click="closeModal"
                        class="text-gray-400 hover:text-gray-600 transition-colors"
                    >
                        <i class="fas fa-times text-xl"></i>
                    </button>
                </div>

                <!-- Modal Body -->
                <form @submit.prevent="submitForm" class="p-6 space-y-6">
                    <!-- Title -->
                    <div>
                        <label for="modal-title" class="block text-sm font-medium text-gray-700 mb-2">
                            Title <span class="text-red-500">*</span>
                        </label>
                        <input
                            id="modal-title"
                            v-model="currentForm.title"
                            type="text"
                            required
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                            placeholder="Enter title"
                        />
                        <p v-if="currentForm.errors.title" class="mt-1 text-sm text-red-600">
                            {{ currentForm.errors.title }}
                        </p>
                    </div>

                    <!-- Description -->
                    <div>
                        <label for="modal-description" class="block text-sm font-medium text-gray-700 mb-2">
                            Description
                        </label>
                        <textarea
                            id="modal-description"
                            v-model="currentForm.description"
                            rows="4"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all resize-none"
                            placeholder="Enter description"
                        ></textarea>
                        <p v-if="currentForm.errors.description" class="mt-1 text-sm text-red-600">
                            {{ currentForm.errors.description }}
                        </p>
                    </div>

                    <!-- Year (Awards only) -->
                    <div v-if="modalType === 'award'">
                        <label for="modal-year" class="block text-sm font-medium text-gray-700 mb-2">
                            Year <span class="text-red-500">*</span>
                        </label>
                        <input
                            id="modal-year"
                            v-model="awardForm.year"
                            type="text"
                            required
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                            placeholder="e.g., 2024"
                        />
                        <p v-if="awardForm.errors.year" class="mt-1 text-sm text-red-600">
                            {{ awardForm.errors.year }}
                        </p>
                    </div>

                    <!-- Date (Timeline only) -->
                    <div v-if="modalType === 'timeline'">
                        <label for="modal-date" class="block text-sm font-medium text-gray-700 mb-2">
                            Date <span class="text-red-500">*</span>
                        </label>
                        <input
                            id="modal-date"
                            v-model="timelineForm.date"
                            type="date"
                            required
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                        />
                        <p v-if="timelineForm.errors.date" class="mt-1 text-sm text-red-600">
                            {{ timelineForm.errors.date }}
                        </p>
                    </div>

                    <!-- Icon -->
                    <div>
                        <label for="modal-icon" class="block text-sm font-medium text-gray-700 mb-2">
                            Icon (Font Awesome class)
                            <a href="https://fontawesome.com/icons" target="_blank" class="text-blue-600 hover:text-blue-700 ml-1">
                                <i class="fas fa-external-link-alt text-xs"></i> Browse Icons
                            </a>
                        </label>
                        <input
                            id="modal-icon"
                            v-model="currentForm.icon"
                            type="text"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                            placeholder="e.g., fa-trophy"
                        />
                        <div class="mt-3 flex items-center gap-3">
                            <div class="w-12 h-12 bg-blue-50 rounded-lg flex items-center justify-center">
                                <i :class="currentForm.icon || 'fa-question'" class="fas text-blue-600 text-xl"></i>
                            </div>
                            <span class="text-sm text-gray-600">Icon Preview</span>
                        </div>
                        <p v-if="currentForm.errors.icon" class="mt-1 text-sm text-red-600">
                            {{ currentForm.errors.icon }}
                        </p>
                    </div>

                    <!-- Image (Awards only) -->
                    <div v-if="modalType === 'award'">
                        <label for="modal-image" class="block text-sm font-medium text-gray-700 mb-2">
                            Award Image
                        </label>
                        
                        <div v-if="imagePreview" class="mb-4">
                            <div class="relative inline-block">
                                <img :src="imagePreview" alt="Preview" class="h-32 w-auto rounded-lg border-2 border-gray-200 object-cover" />
                                <span class="absolute -top-2 -right-2 bg-blue-600 text-white text-xs px-2 py-1 rounded-full">
                                    {{ modalMode === 'edit' && !awardForm.image ? 'Current' : 'Preview' }}
                                </span>
                            </div>
                        </div>

                        <input
                            id="modal-image"
                            type="file"
                            accept="image/*"
                            @change="handleImageSelect"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0 file:text-sm file:font-medium file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 file:cursor-pointer"
                        />
                        <p class="mt-2 text-xs text-gray-500">
                            {{ modalMode === 'edit' ? 'Upload a new image only if you want to change the current one.' : 'Upload an image for the award.' }}
                        </p>
                        <p v-if="awardForm.errors.image" class="mt-1 text-sm text-red-600">
                            {{ awardForm.errors.image }}
                        </p>
                    </div>

                    <!-- Form Actions -->
                    <div class="flex items-center justify-end gap-3 pt-4 border-t border-gray-200">
                        <button
                            type="button"
                            @click="closeModal"
                            class="px-6 py-2.5 bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium rounded-lg transition-colors duration-200"
                        >
                            Cancel
                        </button>
                        <button
                            type="submit"
                            :disabled="currentForm.processing"
                            class="px-6 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200 shadow-sm hover:shadow-md disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2"
                        >
                            <i v-if="currentForm.processing" class="fas fa-spinner fa-spin"></i>
                            <span>{{ modalMode === 'create' ? 'Add' : 'Update' }}</span>
                        </button>
                    </div>
                </form>
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

.line-clamp-3 {
    display: -webkit-box;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
</style>