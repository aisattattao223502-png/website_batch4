<script setup>
import { ref } from 'vue';

const props = defineProps({
  customer: {
    type: Object,
    required: true
  },
  draggable: {
    type: Boolean,
    default: true
  }
});

const emit = defineEmits(['update', 'delete']);

const fileInput = ref(null);
const selectedFile = ref(null);
const previewUrl = ref(null);

const triggerFileInput = () => {
  fileInput.value.click();
};

const handleFileSelect = (event) => {
  const file = event.target.files[0];
  if (file) {
    selectedFile.value = file;
    
    // Create preview
    const reader = new FileReader();
    reader.onload = (e) => {
      previewUrl.value = e.target.result;
    };
    reader.readAsDataURL(file);
  }
};

const uploadLogo = () => {
  if (selectedFile.value) {
    const formData = new FormData();
    formData.append('logo', selectedFile.value);
    
    emit('update', props.customer.id, formData);
    
    // Reset
    selectedFile.value = null;
    previewUrl.value = null;
    fileInput.value.value = '';
  }
};

const cancelUpload = () => {
  selectedFile.value = null;
  previewUrl.value = null;
  fileInput.value.value = '';
};

const handleDelete = () => {
  emit('delete', props.customer);
};
</script>

<template>
  <div class="bg-white border-2 border-gray-200 rounded-lg p-4 hover:border-blue-400 hover:shadow-md transition-all duration-200 relative group">
    <!-- Drag Handle (Desktop Only) -->
    <div
      v-if="draggable"
      class="drag-handle absolute top-2 left-2 cursor-move text-gray-400 hover:text-gray-600 opacity-0 group-hover:opacity-100 transition-opacity"
      title="Drag to reorder"
    >
      <i class="fas fa-grip-vertical text-lg"></i>
    </div>

    <!-- Customer Logo -->
    <div class="mb-3">
      <div class="aspect-video bg-gray-100 rounded-lg overflow-hidden flex items-center justify-center">
        <img
          v-if="previewUrl || customer.logo_url"
          :src="previewUrl || `/storage/${customer.logo_url}`"
          :alt="customer.name"
          class="w-full h-full object-contain p-2"
        />
        <div v-else class="text-gray-400 text-center">
          <i class="fas fa-image text-4xl mb-2"></i>
          <p class="text-sm">No logo</p>
        </div>
      </div>
    </div>

    <!-- Customer Name -->
    <h3 class="font-semibold text-gray-800 text-center mb-3">{{ customer.name }}</h3>

    <!-- File Input (Hidden) -->
    <input
      ref="fileInput"
      type="file"
      accept="image/*"
      @change="handleFileSelect"
      class="hidden"
    />

    <!-- Actions -->
    <div v-if="!selectedFile" class="flex gap-2">
      <button
        @click="triggerFileInput"
        class="flex-1 bg-blue-500 hover:bg-blue-600 text-white py-2 px-3 rounded-lg text-sm transition-colors flex items-center justify-center"
      >
        <i class="fas fa-upload mr-1.5"></i>
        <span>Change Logo</span>
      </button>
      <button
        @click="handleDelete"
        class="bg-red-500 hover:bg-red-600 text-white py-2 px-3 rounded-lg text-sm transition-colors"
        title="Delete customer"
      >
        <i class="fas fa-trash"></i>
      </button>
    </div>

    <!-- Upload Actions (when file selected) -->
    <div v-else class="flex flex-col gap-2">
      <button
        @click="uploadLogo"
        class="w-full bg-green-500 hover:bg-green-600 text-white py-2 px-3 rounded-lg text-sm transition-colors flex items-center justify-center font-medium"
      >
        <i class="fas fa-check mr-1.5"></i>
        Upload New Logo
      </button>
      <button
        @click="cancelUpload"
        class="w-full bg-gray-300 hover:bg-gray-400 text-gray-800 py-2 px-3 rounded-lg text-sm transition-colors"
      >
        Cancel
      </button>
    </div>
  </div>
</template>

<style scoped>
.drag-handle {
  touch-action: none;
}
</style>