<script setup>
const props = defineProps({
  products: {
    type: Array,
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
  const currentSrc = event.target.src;
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
    parent.innerHTML = '<div class="w-full h-full flex items-center justify-center bg-gray-100"><i class="fas fa-image text-gray-300 text-2xl"></i></div>';
  }
};
</script>

<template>
  <div class="bg-white rounded-lg shadow-sm overflow-hidden">
    <div class="overflow-x-auto">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
          <tr>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Image
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Product Name
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Category
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Material
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Created
            </th>
            <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
              Actions
            </th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <tr v-for="product in products" :key="product.id" class="hover:bg-gray-50">
            <!-- Image -->
            <td class="px-6 py-4 whitespace-nowrap">
              <div class="w-16 h-16 rounded-lg overflow-hidden bg-gray-100 flex items-center justify-center">
                <img 
                  v-if="product.image_url" 
                  :src="product.image_url" 
                  :alt="product.name"
                  @error="handleImageError"
                  class="w-full h-full object-contain"
                />
                <i v-else class="fas fa-image text-gray-300 text-2xl"></i>
              </div>
            </td>

            <!-- Product Name -->
            <td class="px-6 py-4">
              <div class="text-sm font-medium text-gray-900">{{ product.name }}</div>
              <div class="text-sm text-gray-500 line-clamp-2">{{ product.description }}</div>
            </td>

            <!-- Category -->
            <td class="px-6 py-4 whitespace-nowrap">
              <span :class="[
                'px-2 inline-flex text-xs leading-5 font-semibold rounded-full',
                product.category_badge
              ]">
                {{ getCategoryLabel(product.category) }}
              </span>
            </td>

            <!-- Material -->
            <td class="px-6 py-4 whitespace-nowrap">
              <span class="text-sm text-gray-900">{{ getMaterialLabel(product.material_type) }}</span>
            </td>

            <!-- Created Date -->
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
              {{ product.created_at }}
            </td>

            <!-- Actions -->
            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
              <button
                @click="emit('edit', product)"
                class="text-blue-600 hover:text-blue-900 mr-4"
                title="Edit"
              >
                <i class="fas fa-edit"></i>
              </button>
              <button
                @click="emit('delete', product)"
                class="text-red-600 hover:text-red-900"
                title="Delete"
              >
                <i class="fas fa-trash"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Empty State -->
    <div v-if="products.length === 0" class="text-center py-12">
      <i class="fas fa-box-open text-gray-300 text-6xl mb-4"></i>
      <p class="text-gray-500 font-medium">No products found</p>
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