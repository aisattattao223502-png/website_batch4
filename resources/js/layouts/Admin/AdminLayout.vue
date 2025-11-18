<script setup>
import { ref, onMounted, onUnmounted } from 'vue';
import { Link, usePage } from '@inertiajs/vue3';

const page = usePage();
const sidebarOpen = ref(false);

// Toggle sidebar on mobile
const toggleSidebar = () => {
  sidebarOpen.value = !sidebarOpen.value;
};

// Close sidebar when clicking outside on mobile
const closeSidebar = () => {
  if (window.innerWidth < 1024) {
    sidebarOpen.value = false;
  }
};

// Handle window resize
const handleResize = () => {
  if (window.innerWidth >= 1024) {
    sidebarOpen.value = false;
  }
};

onMounted(() => {
  window.addEventListener('resize', handleResize);
});

onUnmounted(() => {
  window.removeEventListener('resize', handleResize);
});

// Navigation items
const navItems = [
  { name: 'Dashboard', icon: 'fa-gauge', route: 'admin.Admin/Dashboard', href: '/admin/dashboard' },
  { name: 'Products', icon: 'fa-box', route: 'admin.products', href: '/admin/products' },
  { name: 'Industries', icon: 'fa-industry', route: 'admin.industries', href: '/admin/industries' },
  { name: 'Services', icon: 'fa-cogs', route: 'admin.services', href: '/admin/services' },
  { name: 'Awards', icon: 'fa-trophy', route: 'admin.awards', href: '/admin/awards' },
  { name: 'Customers', icon: 'fa-users', route: 'admin.customers', href: '/admin/customers' },
  { name: 'Admin Users', icon: 'fa-user-shield', route: 'admin.users', href: '/admin/users' },
  { name: 'Inquiries', icon: 'fa-envelope', route: 'admin.inquiries', href: '/admin/inquiries' },
];

// Check if route is active
const isActive = (routeName) => {
  return page.component.value === `Admin/${routeName.split('.')[1].charAt(0).toUpperCase() + routeName.split('.')[1].slice(1)}`;
};
</script>

<template>
  <div class="min-h-screen bg-gray-100">
    <!-- Mobile Sidebar Backdrop -->
    <transition
      enter-active-class="transition-opacity duration-300"
      enter-from-class="opacity-0"
      enter-to-class="opacity-100"
      leave-active-class="transition-opacity duration-300"
      leave-from-class="opacity-100"
      leave-to-class="opacity-0"
    >
      <div
        v-if="sidebarOpen"
        class="fixed inset-0 bg-gray-900 bg-opacity-50 z-40 lg:hidden"
        @click="closeSidebar"
      ></div>
    </transition>

    <!-- Sidebar -->
    <aside
      :class="[
        'fixed top-0 left-0 z-50 h-screen w-64 bg-white shadow-xl transform transition-transform duration-300 ease-in-out',
        sidebarOpen ? 'translate-x-0' : '-translate-x-full',
        'lg:translate-x-0'
      ]"
    >
      <!-- Logo Section -->
      <div class="h-20 flex items-center justify-between px-6 border-b border-gray-200 bg-gradient-to-r from-blue-600 to-red-600">
        <div class="flex items-center space-x-3">
          <div class="w-10 h-10 rounded-full bg-white flex items-center justify-center">
            <img
              src="/storage/assets/img/logo-whitebg.png"
              alt="James Polymers"
              class="w-8 h-8 rounded-full object-contain"
            />
          </div>
          <div>
            <h2 class="text-white font-bold text-lg leading-tight">James Polymers</h2>
            <p class="text-blue-100 text-xs">Admin Portal</p>
          </div>
        </div>
        
        <!-- Close button for mobile -->
        <button
          @click="closeSidebar"
          class="lg:hidden text-white hover:text-gray-200 transition-colors"
        >
          <i class="fas fa-times text-xl"></i>
        </button>
      </div>

      <!-- Navigation -->
      <nav class="flex-1 overflow-y-auto py-6 px-4">
        <ul class="space-y-1">
          <li v-for="item in navItems" :key="item.route">
            <Link
              :href="item.href"
              @click="closeSidebar"
              :class="[
                'flex items-center px-4 py-3 rounded-lg font-medium transition-all duration-200',
                isActive(item.route)
                  ? 'bg-gradient-to-r from-blue-600 to-red-600 text-white shadow-md'
                  : 'text-gray-700 hover:bg-gray-100 hover:text-blue-600'
              ]"
            >
              <i :class="['fas', item.icon, 'w-5 text-center mr-3']"></i>
              <span>{{ item.name }}</span>
            </Link>
          </li>
        </ul>
      </nav>

      <!-- User Section -->
      <div class="border-t border-gray-200 p-4">
        <div class="flex items-center space-x-3 mb-4">
          <div class="w-10 h-10 rounded-full bg-gradient-to-br from-blue-600 to-red-600 flex items-center justify-center">
            <i class="fas fa-user text-white text-sm"></i>
          </div>
          <div class="flex-1 min-w-0">
            <p class="text-sm font-semibold text-gray-800 truncate">Admin User</p>
            <p class="text-xs text-gray-500 truncate">admin@jamespolymers.com</p>
          </div>
        </div>
        
        <!-- Logout Button -->
        <Link
          href="/admin/login"
          class="flex items-center justify-center w-full px-4 py-2 bg-red-50 text-red-600 rounded-lg hover:bg-red-100 transition-colors duration-200 font-medium text-sm"
        >
          <i class="fas fa-sign-out-alt mr-2"></i>
          <span>Logout</span>
        </Link>
      </div>
    </aside>

    <!-- Main Content Area -->
    <div class="lg:ml-64 min-h-screen">
      <!-- Top Navigation Bar (Mobile) -->
      <header class="lg:hidden bg-white shadow-sm sticky top-0 z-30">
        <div class="flex items-center justify-between px-4 py-4">
          <button
            @click="toggleSidebar"
            class="text-gray-600 hover:text-gray-900 focus:outline-none"
          >
            <i class="fas fa-bars text-xl"></i>
          </button>
          
          <div class="flex items-center space-x-2">
            <img
              src="/storage/assets/img/logo-whitebg.png"
              alt="James Polymers"
              class="w-8 h-8 rounded-full object-contain"
            />
            <span class="font-bold text-gray-800">James Polymers</span>
          </div>
          
          <div class="w-10"></div> <!-- Spacer for centering -->
        </div>
      </header>

      <!-- Page Content -->
      <main class="p-4 sm:p-6 lg:p-8">
        <slot />
      </main>
    </div>
  </div>
</template>

<style scoped>
/* Custom scrollbar for sidebar */
nav::-webkit-scrollbar {
  width: 6px;
}

nav::-webkit-scrollbar-track {
  background: transparent;
}

nav::-webkit-scrollbar-thumb {
  background: #cbd5e0;
  border-radius: 10px;
}

nav::-webkit-scrollbar-thumb:hover {
  background: #a0aec0;
}
</style>