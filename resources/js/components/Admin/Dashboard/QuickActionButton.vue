<script setup>
import { Link } from '@inertiajs/vue3';

defineProps({
  label: {
    type: String,
    required: true
  },
  href: {
    type: String,
    required: true
  },
  icon: {
    type: String,
    required: true
  },
  bgColor: {
    type: String,
    default: 'bg-blue-50'
  },
  hoverColor: {
    type: String,
    default: 'hover:bg-blue-100'
  },
  iconBg: {
    type: String,
    default: 'bg-blue-100'
  },
  iconColor: {
    type: String,
    default: 'text-blue-500'
  },
  textColor: {
    type: String,
    default: 'text-blue-800'
  }
});
</script>

<template>
  <Link
    :href="href"
    :class="[
      'p-4 rounded-lg flex items-center transition-all duration-300 transform hover:scale-105 hover:shadow-md cursor-pointer',
      bgColor,
      hoverColor
    ]"
  >
    <div :class="['rounded-full p-3 mr-3 transition-transform duration-300 group-hover:rotate-12', iconBg]">
      <i :class="['fas', icon, iconColor]"></i>
    </div>
    <span :class="['font-medium text-sm sm:text-base', textColor]">{{ label }}</span>
  </Link>
</template>

<style scoped>
a:hover .rounded-full {
  transform: rotate(12deg) scale(1.1);
}
</style>