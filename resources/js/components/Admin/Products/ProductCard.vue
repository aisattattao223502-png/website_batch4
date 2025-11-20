<script setup>
const props = defineProps({
  product: {
    type: Object,
    required: true
  }
});

const emit = defineEmits(['edit', 'delete']);

const getCategoryLabel = (category) => {
  const labels = {
    'appliance': 'Appliance Parts',
    'automotive': 'Automotive Parts',
    'industrial': 'Industrial Components'
  };
  return labels[category] || category;
};

const getMaterialLabel = (material) => {
  const labels = {
    'plastic': 'Plastic',
    'rubber': 'Rubber',
    'custom': 'Custom'
  };
  return labels[material] || material;
};

const handleImageError = (event) => {
  console.error('Image failed to load:', event.target.src);
  
  // Try alternate paths
  const imagePath = event.target.dataset.originalPath;
  
  // If this is the first error, try without /storage prefix (for direct public assets)
  if (!event.target.dataset.retried && imagePath) {
    event.target.dataset.retried = 'true';
    
    // Try as direct public path
    if (imagePath.startsWith('/storage/')) {
      const directPath = imagePath.replace('/storage/', '/');
      console.log('Retrying with direct path:', directPath);
      event.target.src = directPath;
      return;
    }
  }
  
  // If all attempts fail, show placeholder
  event.target.style.display = 'none';
  const parent = event.target.parentElement;
  if (parent) {
    parent.innerHTML = '<div class="w-full h-full flex items-center justify-center bg-gray-100"><i class="fas fa-image text-gray-300 text-4xl"></i></div>';
  }
};
</script>

<template>
  <div class="bg-white rounded-lg shadow-sm overflow-hidden">
    <!-- Image -->
    <div class="h-48 bg-gray-100 relative flex items-center justify-center">
      <img 
        v-if="product.image_url" 
        :src="product.image_url" 
        :alt="product.name"
        @error="handleImageError"
        class="w-full h-full object-contain"
      />
      <i v-else class="fas fa-image text-gray-300 text-5xl"></i>
      
      <!-- Material Badge -->
      <span class="absolute top-2 right-2 px-3 py-1 bg-blue-600 text-white text-xs font-semibold rounded-full">
        {{ getMaterialLabel(product.material_type) }}
      </span>
    </div>

    <!-- Content -->
    <div class="p-4">
      <!-- Title -->
      <h3 class="text-lg font-bold text-gray-900 mb-2">{{ product.name }}</h3>

      <!-- Description -->
      <p class="text-sm text-gray-600 mb-3 line-clamp-2">
        {{ product.description || 'No description available' }}
      </p>

      <!-- Category Badge -->
      <div class="mb-3">
        <span :class="[
          'px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full',
          product.category_badge
        ]">
          {{ getCategoryLabel(product.category) }}
        </span>
      </div>

      <!-- Debug Info - Remove after fixing -->
      <div class="text-xs text-gray-400 mb-3 truncate border-t pt-2" :title="product.image_url">
        <strong>Image Path:</strong> {{ product.image_url || 'No image' }}
      </div>

      <!-- Meta Info -->
      <div class="flex items-center justify-between text-sm text-gray-500 mb-4">
        <span class="flex items-center">
          <i class="far fa-calendar mr-1"></i>
          {{ product.created_at }}
        </span>
        <span class="flex items-center">
          <i class="fas fa-tag mr-1"></i>
          {{ product.id }}
        </span>
      </div>

      <!-- Actions -->
      <div class="flex gap-2">
        <button
          @click="emit('edit', product)"
          class="flex-1 bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded-lg transition flex items-center justify-center"
        >
          <i class="fas fa-edit mr-2"></i>
          Edit
        </button>
        <button
          @click="emit('delete', product)"
          class="flex-1 bg-red-600 hover:bg-red-700 text-white font-medium py-2 px-4 rounded-lg transition flex items-center justify-center"
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