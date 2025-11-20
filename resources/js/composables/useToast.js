// resources/js/composables/useToast.js
import { ref, watch } from 'vue';
import { usePage } from '@inertiajs/vue3';

const toasts = ref([]);
let toastId = 0;

export function useToast() {
  const page = usePage();

  // Watch for flash messages
  watch(
    () => page.props.flash,
    (flash) => {
      if (flash?.success) {
        showToast(flash.success, 'success');
      }
      if (flash?.error) {
        showToast(flash.error, 'error');
      }
      if (flash?.warning) {
        showToast(flash.warning, 'warning');
      }
      if (flash?.info) {
        showToast(flash.info, 'info');
      }
    },
    { deep: true }
  );

  const showToast = (message, type = 'info', duration = 5000) => {
    const id = ++toastId;
    const toast = {
      id,
      message,
      type,
      show: true,
    };

    toasts.value.push(toast);

    if (duration > 0) {
      setTimeout(() => {
        removeToast(id);
      }, duration);
    }

    return id;
  };

  const removeToast = (id) => {
    const index = toasts.value.findIndex((t) => t.id === id);
    if (index > -1) {
      toasts.value[index].show = false;
      setTimeout(() => {
        toasts.value.splice(index, 1);
      }, 300);
    }
  };

  const success = (message, duration) => showToast(message, 'success', duration);
  const error = (message, duration) => showToast(message, 'error', duration);
  const warning = (message, duration) => showToast(message, 'warning', duration);
  const info = (message, duration) => showToast(message, 'info', duration);

  return {
    toasts,
    showToast,
    removeToast,
    success,
    error,
    warning,
    info,
  };
}