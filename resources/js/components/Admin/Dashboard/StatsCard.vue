<script setup>
defineProps({
  label: {
    type: String,
    required: true
  },
  value: {
    type: [String, Number],
    required: true
  },
  icon: {
    type: String,
    required: true
  },
  bgColor: {
    type: String,
    default: 'bg-blue-100'
  },
  iconColor: {
    type: String,
    default: 'text-blue-500'
  }
});
</script>

<template>
  <div class="bg-white rounded-lg shadow-sm hover:shadow-md transition-all duration-300 p-4 sm:p-6 flex items-center group cursor-pointer transform hover:-translate-y-1">
    <div :class="['rounded-full p-3 sm:p-3.5 mr-3 sm:mr-4 group-hover:scale-110 transition-transform duration-300', bgColor]">
      <i :class="['fas', icon, 'text-lg sm:text-xl', iconColor]"></i>
    </div>
    <div class="flex-1 min-w-0">
      <p class="text-gray-600 text-xs sm:text-sm font-medium truncate">{{ label }}</p>
      <h2 class="text-2xl sm:text-3xl font-bold text-gray-800 mt-1">{{ value }}</h2>
    </div>
  </div>
</template>

<style scoped>
/* Additional hover effects */
.group:hover {
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}
</style>