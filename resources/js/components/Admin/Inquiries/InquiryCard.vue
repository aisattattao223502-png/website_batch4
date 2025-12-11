<template>
  <div class="border-b border-gray-200 p-6 hover:bg-gray-50 transition">
    <div class="flex items-start justify-between">
      <div class="flex-1">
        <!-- Header -->
        <div class="flex items-center gap-3 mb-3">
          <span 
            :class="[
              'px-3 py-1 rounded-full text-xs font-semibold',
              statusColors[inquiry.status]
            ]"
          >
            {{ statusLabels[inquiry.status] }}
          </span>
          <span 
            :class="[
              'px-2 py-1 rounded text-xs font-semibold',
              priorityColors[inquiry.priority]
            ]"
          >
            {{ inquiry.priority.toUpperCase() }}
          </span>
          <span class="text-sm text-gray-500">
            {{ formatDate(inquiry.date_submitted) }}
          </span>
        </div>

        <!-- Customer Info -->
        <div class="mb-3">
          <h3 class="text-lg font-semibold text-gray-900">{{ inquiry.name }}</h3>
          <div class="flex flex-wrap gap-4 mt-1 text-sm text-gray-600">
            <span class="flex items-center gap-1">
              <i class="fas fa-envelope"></i>
              {{ inquiry.email }}
            </span>
            <span class="flex items-center gap-1">
              <i class="fas fa-phone"></i>
              {{ inquiry.phone }}
            </span>
            <span v-if="inquiry.company" class="flex items-center gap-1">
              <i class="fas fa-building"></i>
              {{ inquiry.company }}
            </span>
          </div>
        </div>

        <!-- Subject & Message -->
        <div class="mb-3">
          <p class="font-medium text-gray-800 mb-1">{{ inquiry.subject }}</p>
          <p class="text-gray-600 text-sm line-clamp-2">{{ inquiry.message }}</p>
        </div>
      </div>

      <!-- Actions -->
      <div class="flex gap-2 ml-4">
        <!-- <button
          @click="$emit('reply', inquiry)"
          class="p-2 text-blue-600 hover:bg-blue-50 rounded-lg transition"
          title="Reply"
        >
          <i class="fas fa-reply"></i>
        </button> -->
        <button
          @click="showStatusMenu = !showStatusMenu"
          class="p-2 text-gray-600 hover:bg-gray-100 rounded-lg transition relative"
          title="Change Status"
        >
          <i class="fas fa-ellipsis-v"></i>
          
          <!-- Status Dropdown -->
          <div 
            v-if="showStatusMenu"
            class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg border border-gray-200 z-10"
          >
            <button
              v-for="status in statuses"
              :key="status.value"
              @click="changeStatus(status.value)"
              class="w-full text-left px-4 py-2 hover:bg-gray-50 first:rounded-t-lg last:rounded-b-lg"
            >
              {{ status.label }}
            </button>
          </div>
        </button>
        <button
          @click="$emit('delete', inquiry)"
          class="p-2 text-red-600 hover:bg-red-50 rounded-lg transition"
          title="Delete"
        >
          <i class="fas fa-trash"></i>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const props = defineProps({
  inquiry: Object
});

const emit = defineEmits(['update-status', 'delete', 'reply']);

const showStatusMenu = ref(false);

const statusColors = {
  'new': 'bg-blue-100 text-blue-800',
  'in-progress': 'bg-yellow-100 text-yellow-800',
  'resolved': 'bg-green-100 text-green-800',
  'closed': 'bg-gray-100 text-gray-800'
};

const statusLabels = {
  'new': 'New',
  'in-progress': 'In Progress',
  'resolved': 'Resolved',
  'closed': 'Closed'
};

const priorityColors = {
  'low': 'bg-gray-100 text-gray-700',
  'medium': 'bg-orange-100 text-orange-700',
  'high': 'bg-red-100 text-red-700'
};

const statuses = [
  { value: 'new', label: 'Mark as New' },
  { value: 'in-progress', label: 'Mark as In Progress' },
  { value: 'resolved', label: 'Mark as Resolved' },
  { value: 'closed', label: 'Mark as Closed' }
];

const formatDate = (date) => {
  return new Date(date).toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit'
  });
};

const changeStatus = (status) => {
  emit('update-status', props.inquiry.id, status);
  showStatusMenu.value = false;
};
</script>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>