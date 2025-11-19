<script setup>
import { ref, computed } from 'vue';
import { router } from '@inertiajs/vue3';

import AdminLayout from '@/layouts/Admin/AdminLayout.vue';
import ProductForm from '@/components/Admin/Products/ProductForm.vue';
import ProductTable from '@/components/Admin/Products/ProductTable.vue';
import ProductCard from '@/components/Admin/Products/ProductCard.vue';
import ConfirmDialog from '@/components/Admin/Products/ConfirmDialog.vue';

const props = defineProps({
  products: {
    type: Array,
    default: () => []
  },
  action: {
    type: String,
    default: 'list' // 'list', 'create', 'edit'
  },
  product: {
    type: Object,
    default: null
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
const showDeleteDialog = ref(false);
const productToDelete = ref(null);
const showAlert = ref(!!props.success || !!props.error);

// Computed
const isFormView = computed(() => props.action === 'create' || props.action === 'edit');
const pageTitle = computed(() => {
  if (props.action === 'create') return 'Add New Product';
  if (props.action === 'edit') return 'Edit Product';
  return 'Manage Products';
});

// Methods
const handleCreateNew = () => {
  router.get('/admin/products/create');
};

const handleBack = () => {
  router.get('/admin/products');
};

const handleEdit = (product) => {
  router.get(`/admin/products/${product.id}/edit`);
};

const handleDeleteClick = (product) => {
  productToDelete.value = product;
  showDeleteDialog.value = true;
};

const confirmDelete = () => {
  if (productToDelete.value) {
    // This will be connected to backend later
    router.delete(`/admin/products/${productToDelete.value.id}`, {
      onSuccess: () => {
        showDeleteDialog.value = false;
        productToDelete.value = null;
      }
    });
  }
};

const cancelDelete = () => {
  showDeleteDialog.value = false;
  productToDelete.value = null;
};

const handleFormSubmit = (formData) => {
  // This will be connected to backend later
  if (props.action === 'create') {
    router.post('/admin/products', formData);
  } else if (props.action === 'edit') {
    router.put(`/admin/products/${props.product.id}`, formData);
  }
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
    <div class="flex flex-col sm:flex-row sm:justify-between sm:items-center gap-4 mb-6">
      <div>
        <h1 class="text-xl sm:text-2xl font-bold text-gray-800">{{ pageTitle }}</h1>
        <p class="text-sm sm:text-base text-gray-600">
          {{ isFormView ? 'Fill in the details below' : 'Add, edit or delete products' }}
        </p>
      </div>
      
      <div class="w-full sm:w-auto">
        <button
          v-if="!isFormView"
          @click="handleCreateNew"
          class="w-full sm:w-auto bg-gradient-to-r from-blue-600 to-red-600 hover:from-red-600 hover:to-blue-600 text-white py-2.5 px-5 rounded-lg transition-all duration-300 flex items-center justify-center shadow-md hover:shadow-lg transform hover:-translate-y-0.5"
        >
          <i class="fas fa-plus mr-2"></i>
          Add New Product
        </button>
        
        <button
          v-else
          @click="handleBack"
          class="w-full sm:w-auto bg-gray-600 hover:bg-gray-700 text-white py-2.5 px-5 rounded-lg transition-all duration-300 flex items-center justify-center shadow-md"
        >
          <i class="fas fa-arrow-left mr-2"></i>
          Back to Products
        </button>
      </div>
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

    <!-- Form View (Add/Edit) -->
    <div v-if="isFormView">
      <ProductForm
        :product="product"
        :is-edit="action === 'edit'"
        @submit="handleFormSubmit"
        @cancel="handleBack"
      />
    </div>

    <!-- List View -->
    <div v-else>
      <!-- Mobile Card View -->
      <div class="block lg:hidden space-y-4">
        <ProductCard
          v-for="product in products"
          :key="product.id"
          :product="product"
          @edit="handleEdit"
          @delete="handleDeleteClick"
        />
        
        <!-- Empty State -->
        <div v-if="products.length === 0" class="bg-white rounded-lg shadow-sm p-12 text-center">
          <i class="fas fa-box-open text-gray-300 text-6xl mb-4"></i>
          <p class="text-gray-500 font-medium mb-4">No products found</p>
          <button
            @click="handleCreateNew"
            class="inline-flex items-center text-blue-600 hover:text-blue-800 font-medium"
          >
            <i class="fas fa-plus mr-2"></i>
            Add your first product
          </button>
        </div>
      </div>

      <!-- Desktop Table View -->
      <div class="hidden lg:block">
        <ProductTable
          :products="products"
          @edit="handleEdit"
          @delete="handleDeleteClick"
        />
      </div>
    </div>

    <!-- Delete Confirmation Dialog -->
    <ConfirmDialog
      :show="showDeleteDialog"
      title="Delete Product"
      :message="`Are you sure you want to delete &quot;${productToDelete?.name}&quot;? This action cannot be undone.`"
      confirm-text="Delete"
      confirm-class="bg-red-600 hover:bg-red-700"
      @confirm="confirmDelete"
      @cancel="cancelDelete"
    />
  </AdminLayout>
</template>