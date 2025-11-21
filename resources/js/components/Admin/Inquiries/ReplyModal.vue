<template>
  <transition name="modal">
    <div v-if="show" class="fixed inset-0 z-50 overflow-y-auto">
      <div class="flex items-center justify-center min-h-screen px-4">
        <!-- Backdrop -->
        <div 
          class="fixed inset-0 bg-black bg-opacity-50 transition-opacity"
          @click="$emit('close')"
        ></div>

        <!-- Modal -->
        <div class="relative bg-white rounded-lg shadow-xl max-w-2xl w-full p-6 z-10">
          <div class="flex items-center justify-between mb-4">
            <h3 class="text-xl font-semibold text-gray-900">
              Reply to Inquiry
            </h3>
            <button
              @click="$emit('close')"
              class="text-gray-400 hover:text-gray-600"
            >
              <i class="fas fa-times text-xl"></i>
            </button>
          </div>

          <!-- Original Inquiry Info -->
          <div v-if="inquiry" class="bg-gray-50 p-4 rounded-lg mb-4">
            <p class="text-sm text-gray-600 mb-1">
              <strong>From:</strong> {{ inquiry.name }} ({{ inquiry.email }})
            </p>
            <p class="text-sm text-gray-600 mb-1">
              <strong>Subject:</strong> {{ inquiry.subject }}
            </p>
            <p class="text-sm text-gray-600">
              <strong>Message:</strong> {{ inquiry.message }}
            </p>
          </div>

          <!-- Reply Form -->
          <form @submit.prevent="submitReply">
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700 mb-2">
                Subject
              </label>
              <input
                v-model="form.subject"
                type="text"
                required
                class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                placeholder="Re: Your inquiry..."
              />
            </div>

            <div class="mb-6">
              <label class="block text-sm font-medium text-gray-700 mb-2">
                Message
              </label>
              <textarea
                v-model="form.message"
                rows="6"
                required
                class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                placeholder="Write your reply..."
              ></textarea>
            </div>

            <div class="flex gap-3 justify-end">
              <button
                type="button"
                @click="$emit('close')"
                class="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-800 rounded-lg transition"
              >
                Cancel
              </button>
              <button
                type="submit"
                :disabled="processing"
                class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition disabled:opacity-50"
              >
                {{ processing ? 'Sending...' : 'Send Reply' }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </transition>
</template>

<script setup>
import { ref, watch } from 'vue';

const props = defineProps({
  show: Boolean,
  inquiry: Object
});

const emit = defineEmits(['close', 'send']);

const form = ref({
  subject: '',
  message: ''
});

const processing = ref(false);

watch(() => props.inquiry, (newInquiry) => {
  if (newInquiry) {
    form.value.subject = `Re: ${newInquiry.subject}`;
    form.value.message = '';
  }
});

const submitReply = () => {
  if (!form.value.subject || !form.value.message) return;
  
  processing.value = true;
  emit('send', {
    subject: form.value.subject,
    message: form.value.message
  });
  
  setTimeout(() => {
    processing.value = false;
    form.value = { subject: '', message: '' };
  }, 1000);
};
</script>

<style scoped>
.modal-enter-active, .modal-leave-active {
  transition: opacity 0.3s;
}
.modal-enter-from, .modal-leave-to {
  opacity: 0;
}
</style>