<script setup>
import { ref, computed, onMounted } from 'vue';
import { Head, router } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/layouts/AuthenticatedLayout.vue';

// Props
const props = defineProps({
    products: Object,
    filters: Object,
});

// State
const showForm = ref(false);
const editMode = ref(false);
const form = ref({
    id: null,
    name: '',
    description: '',
    category: '',
    material_type: '',
    image_url: '',
    features: ['']
});

const categories = [
    { value: 'appliance', label: 'Appliance' },
    { value: 'automotive', label: 'Automotive' },
    { value: 'industrial', label: 'Industrial' }
];

const materialTypes = [
    { value: 'plastic', label: 'Plastic' },
    { value: 'rubber', label: 'Rubber' },
    { value: 'custom', label: 'Custom' }
];

const successMessage = ref('');
const errorMessage = ref('');

// Methods
const openAddForm = () => {
    resetForm();
    editMode.value = false;
    showForm.value = true;
};

const openEditForm = (product) => {
    form.value = {
        id: product.id,
        name: product.name,
        description: product.description,
        category: product.category,
        material_type: product.material_type,
        image_url: product.image_url,
        features: product.features.length > 0 ? product.features : ['']
    };
    editMode.value = true;
    showForm.value = true;
};

const resetForm = () => {
    form.value = {
        id: null,
        name: '',
        description: '',
        category: '',
        material_type: '',
        image_url: '',
        features: ['']
    };
};

const addFeature = () => {
    form.value.features.push('');
};

const removeFeature = (index) => {
    if (form.value.features.length > 1) {
        form.value.features.splice(index, 1);
    }
};

const handleSubmit = async () => {
    try {
        const url = editMode.value 
            ? `/admin/api/products/${form.value.id}`
            : '/admin/api/products';
        
        const method = editMode.value ? 'put' : 'post';
        
        const response = await fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            },
            body: JSON.stringify({
                ...form.value,
                features: form.value.features.filter(f => f.trim() !== '')
            })
        });

        const data = await response.json();

        if (response.ok) {
            successMessage.value = data.message;
            showForm.value = false;
            resetForm();
            router.reload({ only: ['products'] });
        } else {
            errorMessage.value = data.message || 'An error occurred';
        }
    } catch (error) {
        errorMessage.value = 'Network error occurred';
    }
};

const deleteProduct = async (id, name) => {
    if (!confirm(`Are you sure you want to delete "${name}"?`)) {
        return;
    }

    try {
        const response = await fetch(`/admin/api/products/${id}`, {
            method: 'DELETE',
            headers: {
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            }
        });

        const data = await response.json();

        if (response.ok) {
            successMessage.value = data.message;
            router.reload({ only: ['products'] });
        } else {
            errorMessage.value = data.message || 'Delete failed';
        }
    } catch (error) {
        errorMessage.value = 'Network error occurred';
    }
};

const getCategoryBadgeClass = (category) => {
    const classes = {
        appliance: 'bg-yellow-100 text-yellow-800',
        automotive: 'bg-red-100 text-red-800',
        industrial: 'bg-indigo-100 text-indigo-800'
    };
    return classes[category] || 'bg-gray-100 text-gray-800';
};

onMounted(() => {
    // Clear messages after 5 seconds
    setTimeout(() => {
        successMessage.value = '';
        errorMessage.value = '';
    }, 5000);
});
</script>

<template>
    <Head title="Manage Products" />

    <AuthenticatedLayout>
        <div class="py-6 px-4 sm:px-6 lg:px-8">
            <!-- Header -->
            <div class="flex flex-col sm:flex-row sm:justify-between sm:items-center gap-4 mb-6">
                <div>
                    <h1 class="text-2xl font-bold text-gray-800">Manage Products</h1>
                    <p class="text-gray-600">Add, edit or delete products</p>
                </div>
                <button
                    v-if="!showForm"
                    @click="openAddForm"
                    class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-lg transition-all flex items-center justify-center"
                >
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                    </svg>
                    Add New Product
                </button>
                <button
                    v-else
                    @click="showForm = false; resetForm()"
                    class="bg-gray-600 hover:bg-gray-700 text-white py-2 px-4 rounded-lg transition-all flex items-center justify-center"
                >
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                    Back to Products
                </button>
            </div>

            <!-- Success/Error Messages -->
            <div v-if="successMessage" class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6" role="alert">
                <p>{{ successMessage }}</p>
            </div>
            <div v-if="errorMessage" class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6" role="alert">
                <p>{{ errorMessage }}</p>
            </div>

            <!-- Form -->
            <div v-if="showForm" class="bg-white rounded-lg shadow p-6 mb-6">
                <h2 class="text-xl font-semibold text-gray-800 mb-4">
                    {{ editMode ? 'Edit Product' : 'Add New Product' }}
                </h2>

                <div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Product Name</label>
                            <input
                                v-model="form.name"
                                type="text"
                                required
                                class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                            />
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Category</label>
                            <select
                                v-model="form.category"
                                required
                                class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                            >
                                <option value="">Select Category</option>
                                <option v-for="cat in categories" :key="cat.value" :value="cat.value">
                                    {{ cat.label }}
                                </option>
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Material Type</label>
                            <select
                                v-model="form.material_type"
                                required
                                class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                            >
                                <option value="">Select Material Type</option>
                                <option v-for="type in materialTypes" :key="type.value" :value="type.value">
                                    {{ type.label }}
                                </option>
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Image URL</label>
                            <input
                                v-model="form.image_url"
                                type="text"
                                class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                            />
                        </div>
                    </div>

                    <div class="mb-6">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Description</label>
                        <textarea
                            v-model="form.description"
                            rows="4"
                            class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        ></textarea>
                    </div>

                    <div class="mb-6">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Features</label>
                        <div v-for="(feature, index) in form.features" :key="index" class="flex gap-2 mb-2">
                            <input
                                v-model="form.features[index]"
                                type="text"
                                class="flex-1 border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                                placeholder="Feature description"
                            />
                            <button
                                @click="removeFeature(index)"
                                class="px-3 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600"
                            >
                                Remove
                            </button>
                        </div>
                        <button
                            @click="addFeature"
                            class="mt-2 px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600"
                        >
                            Add Feature
                        </button>
                    </div>

                    <div class="flex gap-3">
                        <button
                            @click="showForm = false; resetForm()"
                            class="bg-gray-300 hover:bg-gray-400 text-gray-800 py-2 px-4 rounded-lg transition-all"
                        >
                            Cancel
                        </button>
                        <button
                            @click="handleSubmit"
                            class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-6 rounded-lg transition-all"
                        >
                            {{ editMode ? 'Update Product' : 'Add Product' }}
                        </button>
                    </div>
                </div>
            </div>

            <!-- Products Table -->
            <div v-else class="bg-white rounded-lg shadow overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="min-w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase">Image</th>
                                <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
                                <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase">Category</th>
                                <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase">Material</th>
                                <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <tr v-for="product in products.data" :key="product.id" class="hover:bg-gray-50">
                                <td class="py-3 px-4">
                                    <img
                                        v-if="product.image_url"
                                        :src="product.image_url"
                                        :alt="product.name"
                                        class="h-12 w-auto object-cover rounded"
                                    />
                                    <div v-else class="h-12 w-12 bg-gray-200 rounded flex items-center justify-center">
                                        <svg class="w-6 h-6 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                        </svg>
                                    </div>
                                </td>
                                <td class="py-3 px-4">
                                    <div class="text-sm font-medium text-gray-900">{{ product.name }}</div>
                                    <div class="text-sm text-gray-500 truncate max-w-xs">{{ product.description }}</div>
                                </td>
                                <td class="py-3 px-4">
                                    <span
                                        class="px-2 py-1 text-xs rounded-full"
                                        :class="getCategoryBadgeClass(product.category)"
                                    >
                                        {{ product.category }}
                                    </span>
                                </td>
                                <td class="py-3 px-4">
                                    <span class="text-sm text-gray-600">{{ product.material_type }}</span>
                                </td>
                                <td class="py-3 px-4 text-sm font-medium">
                                    <button
                                        @click="openEditForm(product)"
                                        class="text-blue-600 hover:text-blue-800 mr-3"
                                    >
                                        Edit
                                    </button>
                                    <button
                                        @click="deleteProduct(product.id, product.name)"
                                        class="text-red-600 hover:text-red-800"
                                    >
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <tr v-if="!products.data || products.data.length === 0">
                                <td colspan="5" class="py-6 px-4 text-center text-gray-500">
                                    No products found. Click "Add New Product" to create one.
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>