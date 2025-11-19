<template>
  <div>
    <!-- Main Content -->
    <div class="admin-content min-h-screen transition-all duration-300">
      <div class="mb-6">
        <h1 class="text-xl sm:text-2xl font-bold text-gray-800">Manage Admin Users</h1>
        <p class="text-xs sm:text-sm text-gray-600">Create, edit, and manage administrator accounts</p>
      </div>
      
      <!-- Action Buttons -->
      <div class="mb-6 flex flex-col sm:flex-row justify-between items-stretch sm:items-center gap-3">
        <div class="w-full sm:w-auto">
          <button 
            @click="openAddModal" 
            class="w-full sm:w-auto bg-primary text-white px-4 py-2 rounded-md hover:bg-blue-800 transition-colors flex items-center justify-center"
          >
            <i class="fas fa-plus mr-2"></i> Add New Admin User
          </button>
        </div>
        <div class="relative w-full sm:w-auto">
          <input 
            v-model="searchQuery" 
            type="text" 
            class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent" 
            placeholder="Search users..."
          >
          <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
        </div>
      </div>
      
      <!-- Users Table -->
      <div class="bg-white rounded-md shadow-md overflow-hidden">
        <!-- Mobile Card View -->
        <div class="block lg:hidden">
          <div 
            v-for="user in filteredUsers" 
            :key="user.id"
            class="border-b border-gray-200 p-4 hover:bg-gray-50"
          >
            <div class="flex items-start gap-3 mb-3">
              <div class="flex-shrink-0 h-12 w-12 bg-primary text-white rounded-full flex items-center justify-center">
                <i class="fas fa-user"></i>
              </div>
              <div class="flex-1 min-w-0">
                <div class="text-sm font-semibold text-gray-900">{{ user.name }}</div>
                <div class="text-xs text-gray-500 break-all">{{ user.email }}</div>
                <div class="flex flex-wrap gap-2 mt-2">
                  <span 
                    :class="[
                      'px-2 py-1 text-xs leading-5 font-semibold rounded-full',
                      user.is_active ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                    ]"
                  >
                    {{ user.is_active ? 'Active' : 'Inactive' }}
                  </span>
                  <span class="text-xs text-gray-500">
                    Last: {{ formatDate(user.last_login) }}
                  </span>
                </div>
              </div>
            </div>
            
            <div class="flex gap-2">
              <button 
                @click="openEditModal(user)" 
                class="flex-1 text-center bg-primary hover:bg-blue-800 text-white py-2 px-3 rounded text-sm"
              >
                <i class="fas fa-edit"></i> Edit
              </button>
              <button 
                @click="openDeleteModal(user)" 
                class="flex-1 text-center bg-red-600 hover:bg-red-800 text-white py-2 px-3 rounded text-sm"
              >
                <i class="fas fa-trash-alt"></i> Delete
              </button>
            </div>
          </div>
          
          <div v-if="filteredUsers.length === 0" class="py-8 px-4 text-center text-gray-500">
            <p class="text-sm">No users found</p>
          </div>
        </div>
        
        <!-- Desktop Table View -->
        <div class="hidden lg:block overflow-x-auto">
          <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
              <tr>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">User</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Role</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Last Login</th>
                <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
              </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
              <tr v-for="user in filteredUsers" :key="user.id">
                <td class="px-6 py-4 whitespace-nowrap">
                  <div class="flex items-center">
                    <div class="flex-shrink-0 h-10 w-10 bg-primary text-white rounded-full flex items-center justify-center">
                      <i class="fas fa-user"></i>
                    </div>
                    <div class="ml-4">
                      <div class="text-sm font-medium text-gray-900">{{ user.name }}</div>
                      <div class="text-sm text-gray-500">{{ user.email }}</div>
                    </div>
                  </div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <div class="text-sm text-gray-900">Administrator</div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <span 
                    :class="[
                      'px-2 inline-flex text-xs leading-5 font-semibold rounded-full',
                      user.is_active ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                    ]"
                  >
                    {{ user.is_active ? 'Active' : 'Inactive' }}
                  </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                  {{ formatDateTime(user.last_login) }}
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                  <button @click="openEditModal(user)" class="text-primary hover:text-blue-800 mr-3">
                    <i class="fas fa-edit"></i>
                  </button>
                  <button @click="openDeleteModal(user)" class="text-red-600 hover:text-red-800">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </td>
              </tr>
              
              <tr v-if="filteredUsers.length === 0">
                <td colspan="5" class="px-6 py-4 text-center text-gray-500">No users found</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      
      <!-- Pagination -->
      <div class="flex flex-col sm:flex-row justify-between items-center gap-4 mt-6">
        <div class="text-xs sm:text-sm text-gray-700 order-2 sm:order-1">
          Showing <span class="font-medium">{{ pagination.from }}</span> to 
          <span class="font-medium">{{ pagination.to }}</span> of 
          <span class="font-medium">{{ pagination.total }}</span> results
        </div>
        <div class="flex flex-wrap justify-center gap-1 order-1 sm:order-2">
          <button 
            @click="changePage(pagination.current_page - 1)"
            :disabled="pagination.current_page === 1"
            class="px-3 py-1 border border-gray-300 bg-white text-xs sm:text-sm font-medium text-gray-700 hover:bg-gray-50 rounded-l-md disabled:opacity-50 disabled:cursor-not-allowed"
          >
            Previous
          </button>
          <button 
            v-for="page in paginationPages" 
            :key="page"
            @click="changePage(page)"
            :class="[
              'px-3 py-1 border border-gray-300 bg-white text-xs sm:text-sm font-medium hover:bg-gray-50',
              page === pagination.current_page ? 'text-primary' : 'text-gray-700'
            ]"
          >
            {{ page }}
          </button>
          <button 
            @click="changePage(pagination.current_page + 1)"
            :disabled="pagination.current_page === pagination.last_page"
            class="px-3 py-1 border border-gray-300 bg-white text-xs sm:text-sm font-medium text-gray-700 hover:bg-gray-50 rounded-r-md disabled:opacity-50 disabled:cursor-not-allowed"
          >
            Next
          </button>
        </div>
      </div>
    </div>

    <!-- Add/Edit User Modal -->
    <div 
      v-if="showUserModal" 
      class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center"
      @click.self="closeUserModal"
    >
      <div class="bg-white rounded-lg shadow-lg w-full max-w-md mx-4">
        <div class="flex justify-between items-center border-b p-4">
          <h3 class="text-lg font-bold text-gray-900">{{ isEditing ? 'Edit Admin User' : 'Add New Admin User' }}</h3>
          <button @click="closeUserModal" class="text-gray-400 hover:text-gray-500">
            <i class="fas fa-times"></i>
          </button>
        </div>
        <form @submit.prevent="submitUserForm">
          <div class="p-4">
            <div class="mb-4">
              <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
              <input 
                v-model="form.name" 
                type="text" 
                id="name" 
                required
                class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-primary focus:border-primary"
              >
              <span v-if="form.errors.name" class="text-red-500 text-xs">{{ form.errors.name }}</span>
            </div>
            
            <div class="mb-4">
              <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
              <input 
                v-model="form.email" 
                type="email" 
                id="email" 
                required
                class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-primary focus:border-primary"
              >
              <span v-if="form.errors.email" class="text-red-500 text-xs">{{ form.errors.email }}</span>
            </div>
            
            <div class="mb-4">
              <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
              <input 
                v-model="form.password" 
                type="password" 
                id="password" 
                :required="!isEditing"
                class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-primary focus:border-primary"
              >
              <p class="text-xs text-gray-500 mt-1">{{ isEditing ? 'Leave empty to keep current password' : 'Minimum 8 characters' }}</p>
              <span v-if="form.errors.password" class="text-red-500 text-xs">{{ form.errors.password }}</span>
            </div>
            
            <div class="mb-4">
              <label for="status" class="block text-sm font-medium text-gray-700">Status</label>
              <select 
                v-model="form.is_active" 
                id="status" 
                class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-primary focus:border-primary"
              >
                <option :value="1">Active</option>
                <option :value="0">Inactive</option>
              </select>
            </div>
          </div>
          
          <div class="bg-gray-50 px-4 py-3 flex justify-end space-x-3 rounded-b-lg">
            <button 
              type="button" 
              @click="closeUserModal" 
              class="bg-white py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50"
            >
              Cancel
            </button>
            <button 
              type="submit" 
              :disabled="form.processing"
              class="bg-primary py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white hover:bg-blue-800 disabled:opacity-50"
            >
              {{ form.processing ? 'Saving...' : 'Save User' }}
            </button>
          </div>
        </form>
      </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div 
      v-if="showDeleteModal" 
      class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center"
      @click.self="closeDeleteModal"
    >
      <div class="bg-white rounded-lg shadow-lg w-full max-w-md mx-4">
        <div class="p-6">
          <h3 class="text-lg font-bold text-gray-900 mb-4">Confirm Deletion</h3>
          <p class="text-gray-700">Are you sure you want to delete <strong>{{ userToDelete?.name }}</strong>? This action cannot be undone.</p>
          
          <div class="mt-6 flex justify-end space-x-3">
            <button 
              @click="closeDeleteModal" 
              class="bg-white py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50"
            >
              Cancel
            </button>
            <button 
              @click="confirmDelete" 
              :disabled="deleteForm.processing"
              class="bg-red-600 py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white hover:bg-red-700 disabled:opacity-50"
            >
              {{ deleteForm.processing ? 'Deleting...' : 'Delete User' }}
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <AdminLayout/>
</template>

<script setup>
import { ref, computed } from 'vue';
import { router, useForm } from '@inertiajs/vue3';
import AdminLayout from '@/layouts/Admin/AdminLayout.vue';

// Props from Inertia
const props = defineProps({
  users: {
    type: Object,
    required: true
  }
});

// Reactive state
const searchQuery = ref('');
const showUserModal = ref(false);
const showDeleteModal = ref(false);
const isEditing = ref(false);
const userToDelete = ref(null);

// Forms
const form = useForm({
  id: null,
  name: '',
  email: '',
  password: '',
  is_active: 1,
});

const deleteForm = useForm({});

// Computed
const filteredUsers = computed(() => {
  if (!searchQuery.value) {
    return props.users.data;
  }
  
  const query = searchQuery.value.toLowerCase();
  return props.users.data.filter(user => 
    user.name.toLowerCase().includes(query) || 
    user.email.toLowerCase().includes(query)
  );
});

const pagination = computed(() => ({
  current_page: props.users.current_page,
  last_page: props.users.last_page,
  from: props.users.from,
  to: props.users.to,
  total: props.users.total,
}));

const paginationPages = computed(() => {
  const pages = [];
  const current = pagination.value.current_page;
  const last = pagination.value.last_page;
  
  // Show max 5 pages
  let start = Math.max(1, current - 2);
  let end = Math.min(last, current + 2);
  
  for (let i = start; i <= end; i++) {
    pages.push(i);
  }
  
  return pages;
});

// Methods
const formatDate = (dateString) => {
  if (!dateString) return 'Never';
  const date = new Date(dateString);
  return date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
};

const formatDateTime = (dateString) => {
  if (!dateString) return 'Never';
  const date = new Date(dateString);
  return date.toLocaleDateString('en-US', { 
    month: 'short', 
    day: 'numeric', 
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit'
  });
};

const openAddModal = () => {
  isEditing.value = false;
  form.reset();
  form.clearErrors();
  showUserModal.value = true;
  document.body.style.overflow = 'hidden';
};

const openEditModal = (user) => {
  isEditing.value = true;
  form.id = user.id;
  form.name = user.name;
  form.email = user.email;
  form.password = '';
  form.is_active = user.is_active;
  form.clearErrors();
  showUserModal.value = true;
  document.body.style.overflow = 'hidden';
};

const closeUserModal = () => {
  showUserModal.value = false;
  document.body.style.overflow = '';
  form.reset();
  form.clearErrors();
};

const openDeleteModal = (user) => {
  userToDelete.value = user;
  showDeleteModal.value = true;
  document.body.style.overflow = 'hidden';
};

const closeDeleteModal = () => {
  showDeleteModal.value = false;
  document.body.style.overflow = '';
  userToDelete.value = null;
};

const submitUserForm = () => {
  if (isEditing.value) {
    form.put(route('admin.users.update', form.id), {
      preserveScroll: true,
      onSuccess: () => {
        closeUserModal();
      },
    });
  } else {
    form.post(route('admin.users.store'), {
      preserveScroll: true,
      onSuccess: () => {
        closeUserModal();
      },
    });
  }
};

const confirmDelete = () => {
  deleteForm.delete(route('admin.users.destroy', userToDelete.value.id), {
    preserveScroll: true,
    onSuccess: () => {
      closeDeleteModal();
    },
  });
};

const changePage = (page) => {
  if (page < 1 || page > pagination.value.last_page) return;
  router.get(route('admin.users.index', { page }), {}, {
    preserveState: true,
    preserveScroll: true,
  });
};
</script>

<style scoped>
.admin-content {
  transition: margin-left 0.3s ease;
  padding: 1rem;
}

@media (min-width: 768px) {
  .admin-content {
    padding: 1.5rem;
  }
}

@media (min-width: 1024px) {
  .admin-content {
    margin-left: 16rem;
    padding: 1.5rem;
  }
}

.bg-primary {
  background-color: #0f4c81;
}

.text-primary {
  color: #0f4c81;
}

.ring-primary {
  --tw-ring-color: #0f4c81;
}

.border-primary {
  border-color: #0f4c81;
}
</style>