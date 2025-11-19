<script setup>
import { ref, computed } from 'vue';
import { router } from '@inertiajs/vue3';
import AdminLayout from '@/layouts/Admin/AdminLayout.vue';
import CustomerCard from '@/components/Admin/Customers/CustomerCard.vue';
import SettingsModal from '@/components/Admin/Customers/SettingsModal.vue';
import AddCustomerModal from '@/components/Admin/Customers/AddCustomerModal.vue';
import ConfirmDialog from '@/components/Admin/Products/ConfirmDialog.vue';
import { VueDraggableNext } from 'vue-draggable-next';

const props = defineProps({
  customers: {
    type: Array,
    default: () => []
  },
  settings: {
    type: Object,
    default: () => ({})
  },
  success: {
    type: String,
    default: null
  },
  error: {
    type: String,
    default: null
  }
});

// State
const localCustomers = ref([...props.customers]);
const showSettingsModal = ref(false);
const showAddModal = ref(false);
const showDeleteDialog = ref(false);
const customerToDelete = ref(null);
const showAlert = ref(!!props.success || !!props.error);
const hasReordered = ref(false);

// Methods
const handleAddCustomer = (formData) => {
  router.post(route('admin.customers.store'), formData, {
    onSuccess: () => {
      showAddModal.value = false;
    },
  });
};

const handleUpdateLogo = (customerId, formData) => {
  router.post(route('admin.customers.update', customerId), {
    _method: 'PUT',
    ...formData
  }, {
    forceFormData: true,
  });
};

const handleDeleteClick = (customer) => {
  customerToDelete.value = customer;
  showDeleteDialog.value = true;
};

const confirmDelete = () => {
  if (customerToDelete.value) {
    router.delete(route('admin.customers.destroy', customerToDelete.value.id), {
      onSuccess: () => {
        showDeleteDialog.value = false;
        customerToDelete.value = null;
      }
    });
  }
};

const cancelDelete = () => {
  showDeleteDialog.value = false;
  customerToDelete.value = null;
};

const handleUpdateSettings = (formData) => {
  router.post(route('admin.customers.settings'), formData, {
    onSuccess: () => {
      showSettingsModal.value = false;
    },
  });
};

const handleDragEnd = () => {
  hasReordered.value = true;
};

const saveOrder = () => {
  const order = localCustomers.value.map(customer => customer.id);
  
  router.post(route('admin.customers.reorder'), {
    order: order
  }, {
    onSuccess: () => {
      hasReordered.value = false;
    }
  });
};

// Close alert after 5 seconds
if (showAlert.value) {
  setTimeout(() => {
    showAlert.value = false;
  }, 5000);
}
</script>

<template>
  <AdminLayout>
    <!-- Page Header -->
    <div class="mb-6">
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800 mb-2">Customer Carousel Management</h1>
      <p class="text-sm sm:text-base text-gray-600">Manage customer logos displayed on your website</p>
    </div>

    <!-- Alert Messages -->
    <transition
      enter-active-class="transition duration-300 ease-out"
      enter-from-class="transform translate-y-2 opacity-0"
      enter-to-class="transform translate-y-0 opacity-100"
      leave-active-class="transition duration-200 ease-in"
      leave-from-class="opacity-100"
      leave-to-class="opacity-0"
    >
      <div v-if="showAlert && success" class="mb-6">
        <div class="bg-green-50 border-l-4 border-green-500 rounded-lg p-4 flex items-start shadow-sm">
          <i class="fas fa-check-circle text-green-500 text-xl mr-3 mt-0.5"></i>
          <div class="flex-1">
            <p class="text-green-800 font-medium">{{ success }}</p>
          </div>
          <button @click="showAlert = false" class="text-green-600 hover:text-green-800 ml-3">
            <i class="fas fa-times"></i>
          </button>
        </div>
      </div>
    </transition>

    <transition
      enter-active-class="transition duration-300 ease-out"
      enter-from-class="transform translate-y-2 opacity-0"
      enter-to-class="transform translate-y-0 opacity-100"
      leave-active-class="transition duration-200 ease-in"
      leave-from-class="opacity-100"
      leave-to-class="opacity-0"
    >
      <div v-if="showAlert && error" class="mb-6">
        <div class="bg-red-50 border-l-4 border-red-500 rounded-lg p-4 flex items-start shadow-sm">
          <i class="fas fa-exclamation-circle text-red-500 text-xl mr-3 mt-0.5"></i>
          <div class="flex-1">
            <p class="text-red-800 font-medium">{{ error }}</p>
          </div>
          <button @click="showAlert = false" class="text-red-600 hover:text-red-800 ml-3">
            <i class="fas fa-times"></i>
          </button>
        </div>
      </div>
    </transition>

    <!-- Action Buttons -->
    <div class="bg-white rounded-lg shadow-sm p-4 sm:p-6 mb-6">
      <div class="flex flex-col sm:flex-row gap-3">
        <button
          @click="showAddModal = true"
          class="flex-1 sm:flex-none bg-gradient-to-r from-green-600 to-green-700 hover:from-green-700 hover:to-green-800 text-white py-2.5 px-5 rounded-lg transition-all duration-300 flex items-center justify-center shadow-md hover:shadow-lg font-medium"
        >
          <i class="fas fa-plus mr-2"></i>
          Add New Customer
        </button>
        
        <button
          @click="showSettingsModal = true"
          class="flex-1 sm:flex-none bg-blue-600 hover:bg-blue-700 text-white py-2.5 px-5 rounded-lg transition-all duration-300 flex items-center justify-center shadow-md font-medium"
        >
          <i class="fas fa-cog mr-2"></i>
          Section Settings
        </button>
        
        <button
          v-if="hasReordered"
          @click="saveOrder"
          class="flex-1 sm:flex-none bg-gradient-to-r from-purple-600 to-purple-700 hover:from-purple-700 hover:to-purple-800 text-white py-2.5 px-5 rounded-lg transition-all duration-300 flex items-center justify-center shadow-md hover:shadow-lg font-medium animate-pulse"
        >
          <i class="fas fa-save mr-2"></i>
          Save Order
        </button>
      </div>
    </div>

    <!-- Info Box -->
    <div class="bg-blue-50 border-l-4 border-blue-500 rounded-lg p-4 mb-6">
      <div class="flex items-start">
        <i class="fas fa-info-circle text-blue-500 text-lg mr-3 mt-0.5"></i>
        <p class="text-sm text-blue-800">
          <strong>Tip:</strong> Drag and drop customers to reorder them in the carousel. Click "Save Order" to apply changes.
        </p>
      </div>
    </div>

    <!-- Customers Grid -->
    <div class="bg-white rounded-lg shadow-sm p-4 sm:p-6">
      <h2 class="text-lg font-semibold text-gray-800 mb-4">Customer Logos ({{ localCustomers.length }})</h2>
      
      <!-- Desktop: Draggable Grid -->
      <div class="hidden md:block">
        <VueDraggableNext
          v-model="localCustomers"
          :animation="200"
          handle=".drag-handle"
          @end="handleDragEnd"
          class="grid grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4"
        >
          <CustomerCard
            v-for="customer in localCustomers"
            :key="customer.id"
            :customer="customer"
            :draggable="true"
            @update="handleUpdateLogo"
            @delete="handleDeleteClick"
          />
        </VueDraggableNext>
      </div>

      <!-- Mobile: Simple Grid (No Drag) -->
      <div class="block md:hidden grid grid-cols-1 sm:grid-cols-2 gap-4">
        <CustomerCard
          v-for="customer in localCustomers"
          :key="customer.id"
          :customer="customer"
          :draggable="false"
          @update="handleUpdateLogo"
          @delete="handleDeleteClick"
        />
      </div>

      <!-- Empty State -->
      <div v-if="localCustomers.length === 0" class="py-12 text-center">
        <i class="fas fa-users text-gray-300 text-6xl mb-4"></i>
        <p class="text-gray-500 font-medium mb-4">No customers in carousel yet</p>
        <button
          @click="showAddModal = true"
          class="inline-flex items-center text-blue-600 hover:text-blue-800 font-medium"
        >
          <i class="fas fa-plus mr-2"></i>
          Add your first customer
        </button>
      </div>
    </div>

    <!-- Modals -->
    <SettingsModal
      :show="showSettingsModal"
      :settings="settings"
      @close="showSettingsModal = false"
      @submit="handleUpdateSettings"
    />

    <AddCustomerModal
      :show="showAddModal"
      @close="showAddModal = false"
      @submit="handleAddCustomer"
    />

    <ConfirmDialog
      :show="showDeleteDialog"
      title="Delete Customer"
      :message="`Are you sure you want to remove &quot;${customerToDelete?.name}&quot; from the carousel? This action cannot be undone.`"
      confirm-text="Delete"
      confirm-class="bg-red-600 hover:bg-red-700"
      @confirm="confirmDelete"
      @cancel="cancelDelete"
    />
  </AdminLayout>
</template>