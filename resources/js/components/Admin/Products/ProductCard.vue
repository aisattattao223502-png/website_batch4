<script setup>
const props = defineProps({
  product: {
    type: Object,
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

// Truncate text
const truncate = (text, length = 80) => {
  if (!text) return '';
  return text.length > length ? text.substring(0, length) + '...' : text;
};

const handleEdit = () => {
  emit('edit', props.product);
};

const handleDelete = () => {
  emit('delete', props.product);
};
</script>

<template>
  <div class="bg-white rounded-lg shadow-sm hover:shadow-md transition-all duration-300 overflow-hidden border border-gray-200">
    <!-- Product Image & Info -->
    <div class="p-4">
      <div class="flex items-start gap-4 mb-4">
        <!-- Image -->
        <div class="flex-shrink-0">
          <div v-if="product.image_url" class="w-20 h-20 rounded-lg overflow-hidden shadow-sm">
            <img
              :src="`/${product.image_url}`"
              :alt="product.name"
              class="w-full h-full object-cover"
            />
          </div>
          <div v-else class="w-20 h-20 bg-gray-200 rounded-lg flex items-center justify-center">
            <i class="fas fa-image text-gray-400 text-2xl"></i>
          </div>
        </div>

        <!-- Info -->
        <div class="flex-1 min-w-0">
          <h3 class="text-base font-semibold text-gray-900 mb-2 line-clamp-2">
            {{ product.name }}
          </h3>
          <p class="text-sm text-gray-600 mb-3 line-clamp-2">
            {{ truncate(product.description) }}
          </p>

          <!-- Category & Date -->
          <div class="flex flex-wrap items-center gap-2">
            <span
              :class="['px-2.5 py-1 text-xs font-medium rounded-full', getCategoryClass(product.category)]"
            >
              {{ product.category.charAt(0).toUpperCase() + product.category.slice(1) }}
            </span>
            <span class="text-xs text-gray-500 flex items-center">
              <i class="far fa-calendar mr-1"></i>
              {{ formatDate(product.created_at) }}
            </span>
          </div>
        </div>
      </div>

      <!-- Action Buttons -->
      <div class="flex gap-2">
        <button
          @click="handleEdit"
          class="flex-1 bg-blue-600 hover:bg-blue-700 text-white py-2.5 px-4 rounded-lg transition-all duration-200 font-medium text-sm shadow-sm hover:shadow flex items-center justify-center"
        >
          <i class="fas fa-edit mr-2"></i>
          Edit
        </button>
        <button
          @click="handleDelete"
          class="flex-1 bg-red-600 hover:bg-red-700 text-white py-2.5 px-4 rounded-lg transition-all duration-200 font-medium text-sm shadow-sm hover:shadow flex items-center justify-center"
        >
          <i class="fas fa-trash mr-2"></i>
          Delete
        </button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>