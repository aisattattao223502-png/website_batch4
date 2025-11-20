<template>
  <div
    :class="[
      'inquiry-card p-6 border-b border-gray-200 transition-all duration-300 hover:shadow-lg',
      statusClass
    ]"
  >
    <div class="flex flex-col md:flex-row justify-between">
      <div class="flex-1">
        <!-- Name and Email -->
        <div class="flex flex-col sm:flex-row sm:items-center mb-2 gap-1 sm:gap-3">
          <h3 class="text-base sm:text-lg font-semibold text-gray-800">
            {{ inquiry.name }}
          </h3>
          <span class="text-xs sm:text-sm text-gray-500 break-all">
            {{ inquiry.email }}
          </span>
          <span v-if="inquiry.phone" class="text-xs sm:text-sm text-gray-500">
            <i class="fas fa-phone-alt text-gray-400 mr-1"></i>
            {{ inquiry.phone }}
          </span>
        </div>

        <!-- Meta Info -->
        <div class="flex flex-wrap items-center gap-2 mb-2">
          <span class="inline-block bg-blue-100 text-blue-800 text-xs font-semibold px-2 py-1 rounded-full">
            {{ inquiry.subject }}
          </span>
          <span class="text-xs sm:text-sm text-gray-500">
            <i class="far fa-clock text-gray-400 mr-1"></i>
            {{ formatDate(inquiry.date_submitted) }}
          </span>
          <span v-if="inquiry.company" class="text-xs sm:text-sm text-gray-500">
            <i class="far fa-building text-gray-400 mr-1"></i>
            {{ inquiry.company }}
          </span>
        </div>

        <!-- Message -->
        <div class="text-gray-600 mt-2">
          <div v-if="!expanded && inquiry.message.length > 150">
            {{ inquiry.message.substring(0, 150) }}...
            <button
              @click="expanded = true"
              class="text-blue-600 hover:text-blue-700 text-sm mt-1"
            >
              Read more <i class="fas fa-chevron-down ml-1"></i>
            </button>
          </div>
          <div v-else>
            <p class="whitespace-pre-line">{{ inquiry.message }}</p>
            <button
              v-if="inquiry.message.length > 150"
              @click="expanded = false"
              class="text-blue-600 hover:text-blue-700 text-sm mt-1"
            >
              Show less <i class="fas fa-chevron-up ml-1"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Actions -->
      <div class="flex flex-col sm:flex-row items-stretch sm:items-center mt-4 md:mt-0 gap-2">
        <select
          :value="inquiry.status"
          @change="$emit('update-status', inquiry.id, $event.target.value)"
          class="w-full sm:w-auto rounded-lg border-gray-300 p-2 border text-xs sm:text-sm focus:ring-blue-600 focus:border-blue-600"
        >
          <option value="new">New</option>
          <option value="in-progress">In Progress</option>
          <option value="resolved">Resolved</option>
          <option value="closed">Closed</option>
        </select>

        <button
          @click="$emit('reply', inquiry)"
          class="w-full sm:w-auto bg-blue-600 hover:bg-blue-700 text-white py-2 sm:py-1 px-3 rounded-lg transition text-xs sm:text-sm"
        >
          <i class="fas fa-reply mr-1"></i> Reply
        </button>

        <button
          @click="$emit('delete', inquiry)"
          class="w-full sm:w-auto bg-red-500 hover:bg-red-600 text-white py-2 sm:py-1 px-3 rounded-lg transition text-xs sm:text-sm"
        >
          <i class="fas fa-trash-alt mr-1 sm:mr-0"></i>
          <span class="sm:hidden"> Delete</span>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import { format, parseISO } from 'date-fns';

const props = defineProps({
  inquiry: {
    type: Object,
    required: true,
  },
});

defineEmits(['update-status', 'delete', 'reply']);

const expanded = ref(false);

const statusClass = computed(() => {
  const classes = {
    'new': 'bg-blue-50 border-l-4 border-l-blue-500',
    'in-progress': 'bg-yellow-50 border-l-4 border-l-yellow-500',
    'resolved': 'bg-green-50 border-l-4 border-l-green-500',
    'closed': 'bg-gray-50 border-l-4 border-l-gray-500',
  };
  return classes[props.inquiry.status] || classes.new;
});

const formatDate = (dateString) => {
  try {
    const date = parseISO(dateString);
    return format(date, 'MMM d, yyyy h:mm a');
  } catch (e) {
    return dateString;
  }
};
</script>

<style scoped>
.inquiry-card:hover {
  transform: translateY(-2px);
}
</style>