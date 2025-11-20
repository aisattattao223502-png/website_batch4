<script setup>
import { ref, computed } from 'vue';
import { Link } from '@inertiajs/vue3';
import AdminLayout from '@/layouts/Admin/AdminLayout.vue';
import StatsCard from '@/components/Admin/Dashboard/StatsCard.vue';
import ChartCard from '@/components/Admin/Dashboard/ChartCard.vue';
import QuickActionButton from '@/components/Admin/Dashboard/QuickActionButton.vue';

const props = defineProps({
    stats: {
        type: Object,
        default: () => ({
            products: 0,
            industries: 0,
            services: 0,
            visitors: 0
        })
    },
    recentProducts: {
        type: Array,
        default: () => []
    },
    monthlyVisitors: {
        type: Array,
        default: () => []
    }
});

// Stats configuration
const statsCards = computed(() => [
    {
        label: 'Total Products',
        value: props.stats.products,
        icon: 'fa-box',
        bgColor: 'bg-blue-100',
        iconColor: 'text-blue-500',
        textColor: 'text-blue-800',
        link: '/admin/products'
    },
    {
        label: 'Industries',
        value: props.stats.industries,
        icon: 'fa-industry',
        bgColor: 'bg-green-100',
        iconColor: 'text-green-500',
        textColor: 'text-green-800',
        link: '/admin/industries'
    },
    {
        label: 'Services',
        value: props.stats.services,
        icon: 'fa-cogs',
        bgColor: 'bg-purple-100',
        iconColor: 'text-purple-500',
        textColor: 'text-purple-800',
        link: '/admin/services'
    },
    {
        label: 'Visitors',
        value: props.stats.visitors.toLocaleString(),
        icon: 'fa-users',
        bgColor: 'bg-yellow-100',
        iconColor: 'text-yellow-500',
        textColor: 'text-yellow-800'
    }
]);

// Quick actions configuration
const quickActions = [
    {
        label: 'Manage Products',
        href: '/admin/products',
        icon: 'fa-box',
        bgColor: 'bg-blue-50',
        hoverColor: 'hover:bg-blue-100',
        iconBg: 'bg-blue-100',
        iconColor: 'text-blue-500',
        textColor: 'text-blue-800'
    },
    {
        label: 'Add Industry',
        href: '/admin/industries/create',
        icon: 'fa-plus',
        bgColor: 'bg-green-50',
        hoverColor: 'hover:bg-green-100',
        iconBg: 'bg-green-100',
        iconColor: 'text-green-500',
        textColor: 'text-green-800'
    },
    {
        label: 'Add Service',
        href: '/admin/services/create',
        icon: 'fa-plus',
        bgColor: 'bg-purple-50',
        hoverColor: 'hover:bg-purple-100',
        iconBg: 'bg-purple-100',
        iconColor: 'text-purple-500',
        textColor: 'text-purple-800'
    },
    {
        label: 'View Inquiries',
        href: '/admin/inquiries',
        icon: 'fa-envelope',
        bgColor: 'bg-orange-50',
        hoverColor: 'hover:bg-orange-100',
        iconBg: 'bg-orange-100',
        iconColor: 'text-orange-500',
        textColor: 'text-orange-800'
    }
];

// Get category badge class
const getCategoryBadgeClass = (category) => {
    const classes = {
        appliance: 'bg-blue-100 text-blue-800',
        automotive: 'bg-green-100 text-green-800',
        industrial: 'bg-purple-100 text-purple-800'
    };
    return classes[category] || 'bg-gray-100 text-gray-800';
};

// Format date
const formatDate = (date) => {
    return new Date(date).toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'short',
        day: 'numeric'
    });
};
</script>

<template>
    <AdminLayout>
        <!-- Page Header -->
        <div class="mb-6 sm:mb-8">
            <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Dashboard</h1>
            <p class="text-sm sm:text-base text-gray-600 mt-1">Welcome back, Admin</p>
        </div>

        <!-- Stats Cards Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-6 mb-6 sm:mb-8">
            <Link 
                v-for="(stat, index) in statsCards" 
                :key="index"
                :href="stat.link || '#'"
                :class="stat.link ? 'cursor-pointer hover:scale-105 transition-transform' : ''"
            >
                <StatsCard
                    :label="stat.label"
                    :value="stat.value"
                    :icon="stat.icon"
                    :bg-color="stat.bgColor"
                    :icon-color="stat.iconColor"
                />
            </Link>
        </div>

        <!-- Charts & Tables Row -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 sm:gap-8 mb-6 sm:mb-8">
            <!-- Chart Card -->
            <ChartCard
                title="Website Traffic"
                :chart-data="monthlyVisitors"
            />

            <!-- Recent Products Card -->
            <div class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow duration-300">
                <div class="p-4 sm:p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-lg font-semibold text-gray-800">Recent Products</h3>
                        <Link
                            href="/admin/products"
                            class="text-primary hover:text-secondary text-sm font-medium transition-colors duration-200"
                        >
                            View All
                        </Link>
                    </div>

                    <!-- Mobile: Card Layout -->
                    <div class="block sm:hidden space-y-3">
                        <div
                            v-for="product in recentProducts"
                            :key="product.id"
                            class="border border-gray-200 rounded-lg p-3 hover:bg-gray-50 transition-colors"
                        >
                            <div class="flex items-start space-x-3">
                                <img
                                    v-if="product.image"
                                    :src="`/${product.image}`"
                                    :alt="product.name"
                                    class="w-12 h-12 rounded object-cover flex-shrink-0"
                                />
                                <div class="flex-1 min-w-0">
                                    <p class="font-medium text-gray-800 truncate">{{ product.name }}</p>
                                    <div class="flex items-center justify-between mt-1">
                                        <span
                                            class="px-2 py-1 rounded-full text-xs font-medium"
                                            :class="getCategoryBadgeClass(product.category)"
                                        >
                                            {{ product.category.charAt(0).toUpperCase() + product.category.slice(1) }}
                                        </span>
                                        <span class="text-xs text-gray-500">
                                            {{ formatDate(product.created_at) }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Empty State Mobile -->
                        <div v-if="recentProducts.length === 0" class="py-12 text-center">
                            <i class="fas fa-box-open text-gray-300 text-5xl mb-3"></i>
                            <p class="text-gray-500 font-medium mb-2">No products found</p>
                            <Link
                                href="/admin/products"
                                class="text-primary hover:text-secondary text-sm inline-flex items-center"
                            >
                                <i class="fas fa-plus mr-1"></i>
                                Add your first product
                            </Link>
                        </div>
                    </div>

                    <!-- Desktop/Tablet: Table Layout -->
                    <div class="hidden sm:block overflow-x-auto">
                        <table class="min-w-full">
                            <thead>
                                <tr class="bg-gray-50 text-gray-600 text-sm leading-normal">
                                    <th class="py-3 px-4 text-left font-semibold">Name</th>
                                    <th class="py-3 px-4 text-left font-semibold">Category</th>
                                    <th class="py-3 px-4 text-left font-semibold">Date Added</th>
                                </tr>
                            </thead>
                            <tbody class="text-gray-600 text-sm">
                                <tr
                                    v-for="product in recentProducts"
                                    :key="product.id"
                                    class="border-b border-gray-200 hover:bg-gray-50 transition-colors"
                                >
                                    <td class="py-3 px-4">
                                        <div class="flex items-center">
                                            <img
                                                v-if="product.image"
                                                :src="`/storage/${product.image}`"
                                                :alt="product.name"
                                                class="w-10 h-10 rounded object-cover mr-3"
                                            />
                                            <span class="font-medium">{{ product.name }}</span>
                                        </div>
                                    </td>
                                    <td class="py-3 px-4">
                                        <span
                                            class="px-2 py-1 rounded-full text-xs font-medium"
                                            :class="getCategoryBadgeClass(product.category)"
                                        >
                                            {{ product.category.charAt(0).toUpperCase() + product.category.slice(1) }}
                                        </span>
                                    </td>
                                    <td class="py-3 px-4">
                                        {{ formatDate(product.created_at) }}
                                    </td>
                                </tr>

                                <!-- Empty State Desktop -->
                                <tr v-if="recentProducts.length === 0">
                                    <td colspan="3" class="py-12 text-center">
                                        <i class="fas fa-box-open text-gray-300 text-5xl mb-3"></i>
                                        <p class="text-gray-500 font-medium mb-2">No products found</p>
                                        <Link
                                            href="/admin/products"
                                            class="text-primary hover:text-secondary text-sm inline-flex items-center"
                                        >
                                            <i class="fas fa-plus mr-1"></i>
                                            Add your first product
                                        </Link>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow duration-300 p-4 sm:p-6">
            <h3 class="text-lg font-semibold text-gray-800 mb-4">Quick Actions</h3>

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-4">
                <QuickActionButton
                    v-for="(action, index) in quickActions"
                    :key="index"
                    :label="action.label"
                    :href="action.href"
                    :icon="action.icon"
                    :bg-color="action.bgColor"
                    :hover-color="action.hoverColor"
                    :icon-bg="action.iconBg"
                    :icon-color="action.iconColor"
                    :text-color="action.textColor"
                />
            </div>
        </div>
    </AdminLayout>
</template>

<style scoped>
/* Custom scrollbar for tables */
.overflow-x-auto::-webkit-scrollbar {
    height: 6px;
}

.overflow-x-auto::-webkit-scrollbar-track {
    background: #f1f1f1;
    border-radius: 10px;
}

.overflow-x-auto::-webkit-scrollbar-thumb {
    background: #cbd5e0;
    border-radius: 10px;
}

.overflow-x-auto::-webkit-scrollbar-thumb:hover {
    background: #a0aec0;
}
</style>