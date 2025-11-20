<template>
  <AdminLayout>
    <div class="w-full">
      <div class="flex flex-col gap-4 mb-6">
        <h1 class="text-xl sm:text-2xl lg:text-3xl font-bold text-gray-800">
          Customer Inquiries
        </h1>
        <div class="flex flex-col sm:flex-row gap-2 w-full sm:w-auto">
          <Link
            :href="route('admin.dashboard')"
            class="w-full sm:w-auto bg-gray-500 hover:bg-gray-600 text-white py-2 px-4 rounded-lg transition text-center"
          >
            <i class="fas fa-arrow-left mr-2"></i> Back to Dashboard
          </Link>
          <a
            :href="exportUrl"
            class="w-full sm:w-auto bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-lg transition text-center"
          >
            <i class="fas fa-file-export mr-2"></i> Export CSV
          </a>
        </div>
      </div>

      <div
        v-if="($page.props.flash?.success)" 
        class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6"
        role="alert"
      >
        <p>{{ $page.props.flash.success }}</p>
      </div>

      <div
        v-if="($page.props.flash?.error)" 
        class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6"
        role="alert"
      >
        <p>{{ $page.props.flash.error }}</p>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-6 mb-6 sm:mb-8">
        <div class="bg-white rounded-lg shadow-md p-6 border-l-4 border-blue-500">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-sm text-gray-500 uppercase">New Inquiries</p>
              <p class="text-3xl font-bold text-gray-800">{{ statusCounts.new }}</p>
            </div>
            <div class="bg-blue-100 p-3 rounded-full">
              <i class="fas fa-inbox text-blue-500 text-xl"></i>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow-md p-6 border-l-4 border-yellow-500">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-sm text-gray-500 uppercase">In Progress</p>
              <p class="text-3xl font-bold text-gray-800">{{ statusCounts.in_progress }}</p>
            </div>
            <div class="bg-yellow-100 p-3 rounded-full">
              <i class="fas fa-spinner text-yellow-500 text-xl"></i>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow-md p-6 border-l-4 border-green-500">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-sm text-gray-500 uppercase">Resolved</p>
              <p class="text-3xl font-bold text-gray-800">{{ statusCounts.resolved }}</p>
            </div>
            <div class="bg-green-100 p-3 rounded-full">
              <i class="fas fa-check-circle text-green-500 text-xl"></i>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow-md p-6 border-l-4 border-gray-500">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-sm text-gray-500 uppercase">Closed</p>
              <p class="text-3xl font-bold text-gray-800">{{ statusCounts.closed }}</p>
            </div>
            <div class="bg-gray-100 p-3 rounded-full">
              <i class="fas fa-archive text-gray-500 text-xl"></i>
            </div>
          </div>
        </div>
      </div>

      <div class="bg-white rounded-lg shadow-md p-6 mb-8">
        <h2 class="text-lg font-bold text-gray-800 mb-4">Filter Inquiries</h2>
        <form @submit.prevent="applyFilters" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          <div>
            <label for="status_filter" class="block text-sm font-medium text-gray-700 mb-1">
              Status
            </label>
            <select
              v-model="filterForm.status"
              id="status_filter"
              class="w-full rounded-lg border-gray-300 p-2 border focus:ring-primary focus:border-primary"
            >
              <option value="">All Statuses</option>
              <option value="new">New</option>
              <option value="in-progress">In Progress</option>
              <option value="resolved">Resolved</option>
              <option value="closed">Closed</option>
            </select>
          </div>

          <div>
            <label for="date_filter" class="block text-sm font-medium text-gray-700 mb-1">
              Date Range
            </label>
            <select
              v-model="filterForm.date_range"
              id="date_filter"
              class="w-full rounded-lg border-gray-300 p-2 border focus:ring-primary focus:border-primary"
            >
              <option value="">All Time</option>
              <option value="today">Today</option>
              <option value="week">This Week</option>
              <option value="month">This Month</option>
            </select>
          </div>

          <div>
            <label for="search" class="block text-sm font-medium text-gray-700 mb-1">
              Search
            </label>
            <input
              v-model="filterForm.search"
              type="text"
              id="search"
              placeholder="Search by name, email or subject..."
              class="w-full rounded-lg border-gray-300 p-2 border focus:ring-primary focus:border-primary"
            />
          </div>

          <div class="flex items-end">
            <button
              type="submit"
              class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-lg transition w-full"
            >
              <i class="fas fa-filter mr-2"></i> Apply Filters
            </button>
          </div>
        </form>
      </div>

      <div class="bg-white rounded-lg shadow-md">
        <div class="p-6 border-b border-gray-200">
          <h2 class="text-xl font-bold text-gray-800">
            Inquiries ({{ inquiries.total }})
          </h2>
        </div>

        <div v-if="inquiries.data.length > 0">
          <InquiryCard
            v-for="inquiry in inquiries.data"
            :key="inquiry.id"
            :inquiry="inquiry"
            @update-status="updateStatus"
            @delete="confirmDelete"
            @reply="openReplyModal"
          />

          <div v-if="inquiries.last_page > 1" class="p-6 flex justify-center">
            <nav class="flex space-x-2">
              <Link
                v-for="page in inquiries.last_page"
                :key="page"
                :href="route('admin.inquiries.index', { ...filters, page })"
                :class="[
                  'px-3 py-1 rounded-md',
                  page === inquiries.current_page
                    ? 'bg-blue-600 text-white'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                ]"
              >
                {{ page }}
              </Link>
            </nav>
          </div>
        </div>

        <div v-else class="p-8 text-center">
          <p class="text-lg text-gray-500">No inquiries found.</p>
          <Link
            v-if="hasFilters"
            :href="route('admin.inquiries.index')"
            class="text-blue-600 hover:text-blue-700 mt-2 inline-block"
          >
            <i class="fas fa-times-circle mr-1"></i> Clear filters
          </Link>
        </div>
      </div>
    </div>

    <ConfirmModal
      :show="showDeleteModal"
      title="Confirm Deletion"
      message="Are you sure you want to delete this inquiry? This action cannot be undone."
      confirm-text="Delete"
      confirm-class="bg-red-500 hover:bg-red-600"
      @confirm="deleteInquiry"
      @cancel="showDeleteModal = false"
    />

    <ReplyModal
      :show="showReplyModal"
      :inquiry="selectedInquiry"
      @close="showReplyModal = false"
      @send="sendReply"
    />
  </AdminLayout>
</template>

<script setup>
import { ref, computed } from 'vue';
import { Link, router, useForm } from '@inertiajs/vue3';
import AdminLayout from '@/layouts/Admin/AdminLayout.vue';
import InquiryCard from '@/components/Admin/Inquiries/InquiryCard.vue';
import ConfirmModal from '@/components/Admin/Inquiries/ConfirmModal.vue';
import ReplyModal from '@/components/Admin/Inquiries/ReplyModal.vue';

const props = defineProps({
  inquiries: Object,
  statusCounts: Object,
  filters: Object,
});

const filterForm = useForm({
  status: props.filters.status || '',
  date_range: props.filters.date_range || '',
  search: props.filters.search || '',
});

const showDeleteModal = ref(false);
const showReplyModal = ref(false);
const selectedInquiry = ref(null);

const hasFilters = computed(() => {
  return props.filters.status || props.filters.date_range || props.filters.search;
});

const exportUrl = computed(() => {
  const params = new URLSearchParams();
  if (props.filters.status) params.append('status', props.filters.status);
  if (props.filters.date_range) params.append('date_range', props.filters.date_range);
  if (props.filters.search) params.append('search', props.filters.search);
  
  return route('admin.inquiries.export') + (params.toString() ? '?' + params.toString() : '');
});

const applyFilters = () => {
  router.get(route('admin.inquiries.index'), filterForm.data(), {
    preserveState: true,
  });
};

const updateStatus = (inquiryId, newStatus) => {
  router.patch(
    route('admin.inquiries.update-status', inquiryId),
    { status: newStatus },
    {
      preserveScroll: true,
    }
  );
};

const confirmDelete = (inquiry) => {
  selectedInquiry.value = inquiry;
  showDeleteModal.value = true;
};

const deleteInquiry = () => {
  if (selectedInquiry.value) {
    router.delete(route('admin.inquiries.destroy', selectedInquiry.value.id), {
      preserveScroll: true,
      onSuccess: () => {
        showDeleteModal.value = false;
        selectedInquiry.value = null;
      },
    });
  }
};

const openReplyModal = (inquiry) => {
  selectedInquiry.value = inquiry;
  showReplyModal.value = true;
};

const sendReply = (replyData) => {
  router.post(
    route('admin.inquiries.reply', selectedInquiry.value.id),
    replyData,
    {
      preserveScroll: true,
      onSuccess: () => {
        showReplyModal.value = false;
        selectedInquiry.value = null;
      },
    }
  );
};
</script>

<style scoped>
.admin-content {
  transition: margin-left 0.3s ease;
}

@media (min-width: 1024px) {
  .admin-content {
    margin-left: 16rem;
  }
}
</style>