<script setup>
import { computed } from 'vue';

const props = defineProps({
  products: {
    type: Array,
    required: true
  }
});

const emit = defineEmits(['edit', 'delete']);

// Get category badge classes
const getCategoryClass = (category) => {
  const classes = {
    thermoplastic: 'bg-blue-100 text-blue-800',
    engineering: 'bg-green-100 text-green-800',
    custom: 'bg-purple-100 text-purple-800',
    appliance: 'bg-yellow-100 text-yellow-800',
    automotive: 'bg-red-100 text-red-800',
    industrial: 'bg-indigo-100 text-indigo-800'
  };
  return classes[category] || 'bg-gray-100 text-gray-800';
};

// Format date
const formatDate = (dateString) => {
  const date = new Date(dateString);
  return date.toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric'
  });
};

// Truncate description
const truncate = (text, length = 100) => {
  if (!text) return '';
  return text.length > length ? text.substring(0, length) + '...' : text;
};

const handleEdit = (product) => {
  emit('edit', product);
};

const handleDelete = (product) => {
  emit('delete', product);
};
</script>

<template>
  <div class="bg-white rounded-lg shadow-md overflow-hidden">
    <div class="overflow-x-auto">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
          <tr>
            <th scope="col" class="py-4 px-6 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">
              Image
            </th>
            <th scope="col" class="py-4 px-6 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">
              Product Details
            </th>
            <th scope="col" class="py-4 px-6 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">
              Category
            </th>
            <th scope="col" class="py-4 px-6 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">
              Date Added
            </th>
            <th scope="col" class="py-4 px-6 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">
              Actions
            </th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <tr
            v-for="product in products"
            :key="product.id"
            class="hover:bg-gray-50 transition-colors"
          >
            <!-- Image -->
            <td class="py-4 px-6 whitespace-nowrap">
              <div v-if="product.image_url" class="flex-shrink-0 h-16 w-16">
                <img
                  :src="`/${product.image_url}`"
                  :alt="product.name"
                  class="h-16 w-16 rounded-lg object-cover shadow-sm"
                />
              </div>
              <div v-else class="h-16 w-16 bg-gray-200 rounded-lg flex items-center justify-center">
                <i class="fas fa-image text-gray-400 text-xl"></i>
              </div>
            </td>

            <!-- Product Details -->
            <td class="py-4 px-6">
              <div class="max-w-md">
                <div class="text-sm font-semibold text-gray-900 mb-1">
                  {{ product.name }}
                </div>
                <div class="text-sm text-gray-500">
                  {{ truncate(product.description) }}
                </div>
              </div>
            </td>

            <!-- Category -->
            <td class="py-4 px-6 whitespace-nowrap">
              <span
                :class="['px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full', getCategoryClass(product.category)]"
              >
                {{ product.category.charAt(0).toUpperCase() + product.category.slice(1) }}
              </span>
            </td>

            <!-- Date -->
            <td class="py-4 px-6 whitespace-nowrap text-sm text-gray-500">
              {{ formatDate(product.created_at) }}
            </td>

            <!-- Actions -->
            <td class="py-4 px-6 whitespace-nowrap text-sm font-medium">
              <div class="flex items-center space-x-3">
                <button
                  @click="handleEdit(product)"
                  class="text-blue-600 hover:text-blue-800 transition-colors"
                  title="Edit product"
                >
                  <i class="fas fa-edit text-lg"></i>
                </button>
                <button
                  @click="handleDelete(product)"
                  class="text-red-600 hover:text-red-800 transition-colors"
                  title="Delete product"
                >
                  <i class="fas fa-trash text-lg"></i>
                </button>
              </div>
            </td>
          </tr>

          <!-- Empty State -->
          <tr v-if="products.length === 0">
            <td colspan="5" class="py-12 text-center">
              <i class="fas fa-box-open text-gray-300 text-6xl mb-4"></i>
              <p class="text-gray-500 font-medium mb-2">No products found</p>
              <p class="text-sm text-gray-400">Click "Add New Product" to create one</p>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>