<template>
  <Teleport to="body">
    <Transition name="modal">
      <div
        v-if="show && inquiry"
        class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4"
        @click.self="closeModal"
      >
        <div class="bg-white rounded-lg p-6 max-w-2xl w-full shadow-xl max-h-[90vh] overflow-y-auto">
          <h3 class="text-xl font-bold text-gray-800 mb-4">Reply to Inquiry</h3>
          
          <form @submit.prevent="handleSubmit">
            <div class="mb-4">
              <label for="reply_to" class="block text-sm font-medium text-gray-700 mb-1">
                To
              </label>
              <input
                id="reply_to"
                type="email"
                :value="inquiry.email"
                class="w-full rounded-lg border-gray-300 p-2 border bg-gray-50"
                readonly
              />
            </div>

            <div class="mb-4">
              <label for="reply_subject" class="block text-sm font-medium text-gray-700 mb-1">
                Subject
              </label>
              <input
                id="reply_subject"
                v-model="form.subject"
                type="text"
                class="w-full rounded-lg border-gray-300 p-2 border focus:ring-blue-600 focus:border-blue-600"
                required
              />
              <div v-if="form.errors.subject" class="text-red-500 text-sm mt-1">
                {{ form.errors.subject }}
              </div>
            </div>

            <div class="mb-4">
              <label for="reply_message" class="block text-sm font-medium text-gray-700 mb-1">
                Message
              </label>
              <textarea
                id="reply_message"
                v-model="form.message"
                rows="6"
                class="w-full rounded-lg border-gray-300 p-2 border focus:ring-blue-600 focus:border-blue-600"
                required
              ></textarea>
              <div v-if="form.errors.message" class="text-red-500 text-sm mt-1">
                {{ form.errors.message }}
              </div>
            </div>

            <div class="flex justify-end space-x-3">
              <button
                type="button"
                @click="closeModal"
                class="bg-gray-300 hover:bg-gray-400 text-gray-800 py-2 px-4 rounded-lg transition"
                :disabled="form.processing"
              >
                Cancel
              </button>
              <button
                type="submit"
                class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-lg transition disabled:opacity-50"
                :disabled="form.processing"
              >
                <i class="fas fa-paper-plane mr-2"></i>
                {{ form.processing ? 'Sending...' : 'Send Reply' }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup>
import { watch } from 'vue';
import { useForm } from '@inertiajs/vue3';

const props = defineProps({
  show: {
    type: Boolean,
    default: false,
  },
  inquiry: {
    type: Object,
    default: null,
  },
});

const emit = defineEmits(['close', 'send']);

const form = useForm({
  subject: '',
  message: '',
});

watch(() => props.inquiry, (newInquiry) => {
  if (newInquiry) {
    form.subject = `Re: ${newInquiry.subject}`;
    form.message = '';
  }
}, { immediate: true });

const closeModal = () => {
  form.reset();
  form.clearErrors();
  emit('close');
};

const handleSubmit = () => {
  emit('send', {
    subject: form.subject,
    message: form.message,
  });
};
</script>

<style scoped>
.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.3s ease;
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}
</style>