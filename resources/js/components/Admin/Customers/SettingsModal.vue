<script setup>
import { ref, watch } from 'vue';

const props = defineProps({
  show: {
    type: Boolean,
    default: false
  },
  settings: {
    type: Object,
    default: () => ({})
  }
});

const emit = defineEmits(['close', 'submit']);

const form = ref({
  heading: '',
  subheading: ''
});

// Watch for settings changes
watch(() => props.settings, (newSettings) => {
  if (newSettings) {
    form.value.heading = newSettings.heading || '';
    form.value.subheading = newSettings.subheading || '';
  }
}, { immediate: true });

const handleSubmit = () => {
  emit('submit', form.value);
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
              <div class="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center">
                <i class="fas fa-cog text-blue-600 text-lg"></i>
              </div>
              <div>
                <h3 class="text-xl font-semibold text-gray-900">Section Settings</h3>
                <p class="text-sm text-gray-600">Update heading and subheading</p>
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
            <!-- Heading -->
            <div>
              <label for="heading" class="block text-sm font-semibold text-gray-700 mb-2">
                Section Heading <span class="text-red-500">*</span>
              </label>
              <input
                id="heading"
                v-model="form.heading"
                type="text"
                required
                placeholder="e.g., Our Valued Customers"
                class="w-full border-2 border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              />
            </div>

            <!-- Subheading -->
            <div>
              <label for="subheading" class="block text-sm font-semibold text-gray-700 mb-2">
                Section Subheading <span class="text-red-500">*</span>
              </label>
              <textarea
                id="subheading"
                v-model="form.subheading"
                rows="4"
                required
                placeholder="Enter a brief description..."
                class="w-full border-2 border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all resize-none"
              ></textarea>
              <p class="text-xs text-gray-500 mt-1">{{ form.subheading.length }} characters</p>
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
                class="flex-1 px-4 py-3 bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white font-medium rounded-lg transition-all shadow-md hover:shadow-lg"
              >
                <i class="fas fa-save mr-2"></i>
                Save Settings
              </button>
            </div>
          </form>
        </div>
      </transition>
    </div>
  </transition>
</template>