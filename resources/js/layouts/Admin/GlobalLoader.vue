<template>
  <div v-if="isLoading" class="loading-overlay">
    <orbit-spinner
      :animation-duration="1200"
      :size="80"
      color="#ff1d5e"
    />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { router } from '@inertiajs/vue3';
import { OrbitSpinner } from 'epic-spinners';

const isLoading = ref(false);

router.on('start', () => {
  isLoading.value = true;
});

router.on('finish', () => {
  isLoading.value = false;
});
</script>

<style scoped>
.loading-overlay {
  position: fixed;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(255, 255, 255, 0.8);
  z-index: 99999;
}
</style>