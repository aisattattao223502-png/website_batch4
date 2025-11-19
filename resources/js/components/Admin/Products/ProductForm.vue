<script setup>
import { ref, computed } from 'vue';

const props = defineProps({
  product: {
    type: Object,
    default: null
  },
  isEdit: {
    type: Boolean,
    default: false
  }
});

const emit = defineEmits(['submit', 'cancel']);

// Form data
const form = ref({
  name: props.product?.name || '',
  description: props.product?.description || '',
  category: props.product?.category || '',
  image: null,
  currentImage: props.product?.image_url || null
});

const imagePreview = ref(props.product?.image_url || null);

// Categories
const categories = [
  { value: 'thermoplastic', label: 'Thermoplastic Elastomers' },
  { value: 'engineering', label: 'Engineering Plastics' },
  { value: 'custom', label: 'Custom Compounds' },
  { value: 'appliance', label: 'Appliance' },
  { value: 'automotive', label: 'Automotive' },
  { value: 'industrial', label: 'Industrial' }
];

// Handle image selection
const handleImageChange = (event) => {
  const file = event.target.files[0];
  if (file) {
    form.value.image = file;
    
    // Create preview
    const reader = new FileReader();
    reader.onload = (e) => {
      imagePreview.value = e.target.result;
    };
    reader.readAsDataURL(file);
  }
};

// Remove image
const removeImage = () => {
  form.value.image = null;
  imagePreview.value = form.value.currentImage;
  
  // Reset file input
  const fileInput = document.getElementById('product_image');
  if (fileInput) fileInput.value = '';
};

// Handle form submission
const handleSubmit = () => {
  // Basic validation
  if (!form.value.name || !form.value.description || !form.value.category) {
    alert('Please fill in all required fields');
    return;
  }
  
  emit('submit', form.value);
};

const handleCancel = () => {
  emit('cancel');
};
</script>

<template>
  <div class="bg-white rounded-lg shadow-md overflow-hidden">
    <div class="p-6 sm:p-8">
      <form @submit.prevent="handleSubmit" class="space-y-6">
        <!-- Product Name & Category Row -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <!-- Product Name -->
          <div>
            <label for="product_name" class="block text-sm font-semibold text-gray-700 mb-2">
              Product Name <span class="text-red-500">*</span>
            </label>
            <input
              id="product_name"
              v-model="form.name"
              type="text"
              required
              placeholder="Enter product name"
              class="w-full border-2 border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
            />
          </div>

          <!-- Category -->
          <div>
            <label for="product_category" class="block text-sm font-semibold text-gray-700 mb-2">
              Category <span class="text-red-500">*</span>
            </label>
            <select
              id="product_category"
              v-model="form.category"
              required
              class="w-full border-2 border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
            >
              <option value="">Select Category</option>
              <option
                v-for="cat in categories"
                :key="cat.value"
                :value="cat.value"
              >
                {{ cat.label }}
              </option>
            </select>
          </div>
        </div>

        <!-- Description -->
        <div>
          <label for="product_description" class="block text-sm font-semibold text-gray-700 mb-2">
            Description <span class="text-red-500">*</span>
          </label>
          <textarea
            id="product_description"
            v-model="form.description"
            rows="5"
            required
            placeholder="Enter product description"
            class="w-full border-2 border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all resize-none"
          ></textarea>
          <p class="text-xs text-gray-500 mt-1">{{ form.description.length }} characters</p>
        </div>

        <!-- Image Upload -->
        <div>
          <label for="product_image" class="block text-sm font-semibold text-gray-700 mb-2">
            Product Image
          </label>

          <!-- Current Image Preview (Edit Mode) -->
          <div v-if="imagePreview" class="mb-4">
            <div class="relative inline-block">
              <img
                :src="imagePreview.startsWith('data:') ? imagePreview : `/${imagePreview}`"
                alt="Product preview"
                class="h-32 w-auto border-2 border-gray-200 rounded-lg shadow-sm"
              />
              <button
                type="button"
                @click="removeImage"
                class="absolute -top-2 -right-2 bg-red-500 hover:bg-red-600 text-white rounded-full w-6 h-6 flex items-center justify-center shadow-md transition-colors"
              >
                <i class="fas fa-times text-xs"></i>
              </button>
            </div>
            <p class="text-sm text-gray-600 mt-2">
              {{ isEdit ? 'Current Image' : 'Selected Image' }}
            </p>
          </div>

          <!-- File Input -->
          <div class="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center hover:border-blue-500 transition-colors">
            <input
              id="product_image"
              type="file"
              accept="image/jpeg,image/png,image/gif,image/jpg"
              @change="handleImageChange"
              class="hidden"
            />
            <label
              for="product_image"
              class="cursor-pointer flex flex-col items-center"
            >
              <i class="fas fa-cloud-upload-alt text-4xl text-gray-400 mb-3"></i>
              <p class="text-sm font-medium text-gray-700 mb-1">
                Click to upload or drag and drop
              </p>
              <p class="text-xs text-gray-500">
                {{ isEdit ? 'Upload a new image to replace the current one' : 'JPG, PNG or GIF (Max 5MB)' }}
              </p>
            </label>
          </div>

          <p class="text-xs text-gray-500 mt-2">
            <i class="fas fa-info-circle mr-1"></i>
            Supported formats: JPG, JPEG, PNG, GIF. Maximum file size: 5MB.
          </p>
        </div>

        <!-- Form Actions -->
        <div class="flex flex-col-reverse sm:flex-row items-center justify-end gap-3 pt-4 border-t border-gray-200">
          <button
            type="button"
            @click="handleCancel"
            class="w-full sm:w-auto px-6 py-3 bg-gray-200 hover:bg-gray-300 text-gray-800 font-medium rounded-lg transition-colors"
          >
            Cancel
          </button>
          <button
            type="submit"
            class="w-full sm:w-auto px-8 py-3 bg-gradient-to-r from-blue-600 to-red-600 hover:from-red-600 hover:to-blue-600 text-white font-medium rounded-lg shadow-md hover:shadow-lg transition-all transform hover:-translate-y-0.5"
          >
            <i :class="['fas mr-2', isEdit ? 'fa-save' : 'fa-plus']"></i>
            {{ isEdit ? 'Update Product' : 'Add Product' }}
          </button>
        </div>
      </form>
    </div>
  </div>
</template>