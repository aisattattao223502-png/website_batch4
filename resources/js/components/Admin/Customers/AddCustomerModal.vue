<script setup>
import { ref, watch } from 'vue';

const props = defineProps({
  show: {
    type: Boolean,
    default: false
  }
});

const emit = defineEmits(['close', 'submit']);

const form = ref({
  name: '',
  logo: null
});

const previewUrl = ref(null);
const fileInput = ref(null);

// Reset form when modal closes
watch(() => props.show, (newVal) => {
  if (!newVal) {
    resetForm();
  }
});

const resetForm = () => {
  form.value.name = '';
  form.value.logo = null;
  previewUrl.value = null;
  if (fileInput.value) {
    fileInput.value.value = '';
  }
};

const handleFileSelect = (event) => {
  const file = event.target.files[0];
  if (file) {
    form.value.logo = file;
    
    // Create preview
    const reader = new FileReader();
    reader.onload = (e) => {
      previewUrl.value = e.target.result;
    };
    reader.readAsDataURL(file);
  }
};

const removeImage = () => {
  form.value.logo = null;
  previewUrl.value = null;
  if (fileInput.value) {
    fileInput.value.value = '';
  }
};

const handleSubmit = () => {
  if (!form.value.name || !form.value.logo) {
    alert('Please fill in all required fields');
    return;
  }

  const formData = new FormData();
  formData.append('name', form.value.name);
  formData.append('logo', form.value.logo);
  
  emit('submit', formData);
};

const handleClose = () => {
  emit('close');
};
</script>

<template>
  <!-- Backdrop -->
  <transition
    enter-active-class="transition-opacity duration-300"
    enter-from-class="opacity-0"
    enter-to-class="opacity-100"
    leave-active-class="transition-opacity duration-200"
    leave-from-class="opacity-100"
    leave-to-class="opacity-0"
  >
    <div
      v-if="show"
      class="fixed inset-0 bg-gray-900 bg-opacity-50 z-50 flex items-center justify-center p-4"
      @click="handleClose"
    >
      <!-- Modal -->
      <transition
        enter-active-class="transition-all duration-300"
        enter-from-class="opacity-0 scale-95"
        enter-to-class="opacity-100 scale-100"
        leave-active-class="transition-all duration-200"
        leave-from-class="opacity-100 scale-100"
        leave-to-class="opacity-0 scale-95"
      >
        <div
          v-if="show"
          class="bg-white rounded-lg shadow-2xl max-w-2xl w-full p-6 max-h-[90vh] overflow-y-auto"
          @click.stop
        >
          <!-- Header -->
          <div class="flex items-center justify-between mb-6">
            <div class="flex items-center gap-3">
              <div class="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center">
                <i class="fas fa-plus text-green-600 text-lg"></i>
              </div>
              <div>
                <h3 class="text-xl font-semibold text-gray-900">Add New Customer</h3>
                <p class="text-sm text-gray-600">Add a customer logo to the carousel</p>
              </div>
            </div>
            <button
              @click="handleClose"
              class="text-gray-400 hover:text-gray-600 transition-colors"
            >
              <i class="fas fa-times text-xl"></i>
            </button>
          </div>

          <!-- Form -->
          <form @submit.prevent="handleSubmit" class="space-y-6">
            <!-- Customer Name -->
            <div>
              <label for="customerName" class="block text-sm font-semibold text-gray-700 mb-2">
                Customer Name <span class="text-red-500">*</span>
              </label>
              <input
                id="customerName"
                v-model="form.name"
                type="text"
                required
                placeholder="e.g., ABC Corporation"
                class="w-full border-2 border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:border-green-500 focus:ring-2 focus:ring-green-200 transition-all"
              />
            </div>

            <!-- Logo Upload -->
            <div>
              <label class="block text-sm font-semibold text-gray-700 mb-2">
                Customer Logo <span class="text-red-500">*</span>
              </label>

              <!-- Preview -->
              <div v-if="previewUrl" class="mb-4">
                <div class="relative inline-block">
                  <div class="w-48 h-36 bg-gray-100 rounded-lg overflow-hidden border-2 border-gray-200">
                    <img
                      :src="previewUrl"
                      alt="Logo preview"
                      class="w-full h-full object-contain p-2"
                    />
                  </div>
                  <button
                    type="button"
                    @click="removeImage"
                    class="absolute -top-2 -right-2 bg-red-500 hover:bg-red-600 text-white rounded-full w-7 h-7 flex items-center justify-center shadow-md transition-colors"
                  >
                    <i class="fas fa-times text-sm"></i>
                  </button>
                </div>
                <p class="text-sm text-gray-600 mt-2">Selected Image</p>
              </div>

              <!-- File Input -->
              <div class="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center hover:border-green-500 transition-colors">
                <input
                  ref="fileInput"
                  type="file"
                  accept="image/*"
                  @change="handleFileSelect"
                  class="hidden"
                />
                <button
                  type="button"
                  @click="fileInput.click()"
                  class="inline-flex flex-col items-center"
                >
                  <i class="fas fa-cloud-upload-alt text-5xl text-gray-400 mb-3"></i>
                  <p class="text-sm font-medium text-gray-700 mb-1">
                    Click to upload logo
                  </p>
                  <p class="text-xs text-gray-500">
                    PNG, JPG, GIF (Max 2MB) • Recommended: 400x300px
                  </p>
                </button>
              </div>
            </div>

            <!-- Actions -->
            <div class="flex flex-col-reverse sm:flex-row gap-3 pt-4 border-t border-gray-200">
              <button
                type="button"
                @click="handleClose"
                class="flex-1 px-4 py-3 bg-gray-200 hover:bg-gray-300 text-gray-800 font-medium rounded-lg transition-colors"
              >
                Cancel
              </button>
              <button
                type="submit"
                class="flex-1 px-4 py-3 bg-gradient-to-r from-green-600 to-green-700 hover:from-green-700 hover:to-green-800 text-white font-medium rounded-lg transition-all shadow-md hover:shadow-lg"
              >
                <i class="fas fa-plus mr-2"></i>
                Add Customer
              </button>
            </div>
          </form>
        </div>
      </transition>
    </div>
  </transition>
</template>