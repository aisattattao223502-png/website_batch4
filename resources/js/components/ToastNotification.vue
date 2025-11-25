<template>
  <transition name="toast">
    <div
      v-if="show"
      :class="[
        'fixed top-4 right-4 z-50 px-6 py-4 rounded-lg shadow-lg max-w-md',
        typeClasses[type]
      ]"
    >
      <div class="flex items-center gap-3">
        <i :class="['text-xl', iconClasses[type]]"></i>
        <div class="flex-1">
          <p class="font-semibold">{{ title }}</p>
          <p class="text-sm">{{ message }}</p>
        </div>
        <button @click="close" class="text-current opacity-70 hover:opacity-100">
          <i class="fas fa-times"></i>
        </button>
      </div>
    </div>
  </transition>
</template>

<script setup>
import { ref, watch } from 'vue';
import { usePage } from '@inertiajs/vue3';

const page = usePage();
const show = ref(false);
const type = ref('success');
const title = ref('');
const message = ref('');

const typeClasses = {
  success: 'bg-green-500 text-white',
  error: 'bg-red-500 text-white',
  info: 'bg-blue-500 text-white',
  warning: 'bg-yellow-500 text-white'
};

const iconClasses = {
  success: 'fas fa-check-circle',
  error: 'fas fa-exclamation-circle',
  info: 'fas fa-info-circle',
  warning: 'fas fa-exclamation-triangle'
};

watch(() => page.props.flash, (flash) => {
  if (flash?.success) {
    showToast('success', 'Success', flash.success);
  } else if (flash?.error) {
    showToast('error', 'Error', flash.error);
  }
}, { immediate: true, deep: true });

const showToast = (toastType, toastTitle, toastMessage) => {
  type.value = toastType;
  title.value = toastTitle;
  message.value = toastMessage;
  show.value = true;

  setTimeout(() => {
    show.value = false;
  }, 5000);
};

const close = () => {
  show.value = false;
};
</script>
<style scoped>
.toast-enter-active, .toast-leave-active {
  transition: all 0.3s ease;
}
.toast-enter-from {
  transform: translateX(100%);
  opacity: 0;
}
.toast-leave-to {
  transform: translateX(100%);
  opacity: 0;
}
</style>