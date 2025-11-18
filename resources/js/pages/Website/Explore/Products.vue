<template>
  <Chatbot />
  <div>
    <Header :isHomepage="false" />
    
    <div class="bg-gray-50 overflow-x-hidden">
      
      <!-- Floating Logo Watermark -->
      <img 
        src="/storage/assets/img/JP_BG_WATERMARK_CIRCLE.png"
        alt="JP Watermark"
        class="fixed bottom-0 left-0 w-full h-auto opacity-40 pointer-events-none select-none transition-opacity duration-500 ease-in-out z-0" 
      />

      <!-- HERO SLIDER SECTION -->
      <section class="relative h-64 sm:h-80 md:h-96 overflow-hidden mt-[14vh]">
        
        <!-- Slide 1 -->
        <div 
          :class="[
            'slide absolute inset-0 flex items-center justify-center bg-cover bg-center transition-all duration-700 ease-in-out transform',
            currentSlide === 0 ? 'opacity-100 translate-x-0' : 'opacity-0 -translate-x-full'
          ]"
          style="background-image: url('/storage/assets/img/banners/pltc-ap.jpg')"
        >
          <div class="absolute inset-0 bg-black bg-opacity-50"></div>
          <div class="container mx-auto px-4 text-center text-white relative z-10">
            <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold mb-3 sm:mb-4">
              Our Products & Services
            </h1>
            <p class="text-base sm:text-lg md:text-xl mb-4 sm:mb-6 max-w-2xl mx-auto">
              Delivering high-performance plastic, rubber, and polymer solutions for every industrial need.
            </p>
          </div>
        </div>

        <!-- Slide 2 -->
        <div 
          :class="[
            'slide absolute inset-0 flex items-center justify-center bg-cover bg-center transition-all duration-700 ease-in-out transform',
            currentSlide === 1 ? 'opacity-100 translate-x-0' : 'opacity-0 -translate-x-full'
          ]"
          style="background-image: url('/storage/assets/img/banners/rubber-ap.jpg')"
        >
          <div class="absolute inset-0 bg-black bg-opacity-50"></div>
          <div class="container mx-auto px-4 text-center text-white relative z-10">
            <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold mb-3 sm:mb-4">
              Appliance Parts
            </h1>
            <p class="text-base sm:text-lg md:text-xl mb-4 sm:mb-6 max-w-2xl mx-auto">
              High-quality parts developed to ensure reliability, safety, and long-lasting performance in household and commercial appliances.
            </p>
          </div>
        </div>

        <!-- Slide 3 -->
        <div 
          :class="[
            'slide absolute inset-0 flex items-center justify-center bg-cover bg-center transition-all duration-700 ease-in-out transform',
            currentSlide === 2 ? 'opacity-100 translate-x-0' : 'opacity-0 translate-x-full'
          ]"
          style="background-image: url('/storage/assets/img/banners/rubber-au.jpg')"
        >
          <div class="absolute inset-0 bg-black bg-opacity-50"></div>
          <div class="container mx-auto px-4 text-center text-white relative z-10">
            <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold mb-3 sm:mb-4">
              Automotive Parts
            </h1>
            <p class="text-base sm:text-lg md:text-xl mb-4 sm:mb-6 max-w-2xl mx-auto">
              Precision-crafted components that meet the performance standards and technical requirements of the automotive industry.
            </p>
          </div>
        </div>

        <!-- Slide 4 -->
        <div 
          :class="[
            'slide absolute inset-0 flex items-center justify-center bg-cover bg-center transition-all duration-700 ease-in-out transform',
            currentSlide === 3 ? 'opacity-100 scale-100' : 'opacity-0 scale-110'
          ]"
          style="background-image: url('/storage/assets/img/banners/plastic-au.jpg')"
        >
          <div class="absolute inset-0 bg-black bg-opacity-50"></div>
          <div class="container mx-auto px-4 text-center text-white relative z-10">
            <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold mb-3 sm:mb-4">
              Industrial Parts
            </h1>
            <p class="text-base sm:text-lg md:text-xl mb-4 sm:mb-6 max-w-2xl mx-auto">
              Engineered components designed to deliver durability and efficiency for a wide range of industrial applications.
            </p>
          </div>
        </div>

        <!-- Navigation Arrows -->
        <button 
          @click="prevSlide"
          class="absolute left-2 sm:left-4 top-1/2 transform -translate-y-1/2 bg-black bg-opacity-50 text-white p-2 sm:p-3 rounded-full z-10 hover:bg-opacity-70 transition"
        >
          <i class="fas fa-chevron-left text-sm sm:text-base"></i>
        </button>
        <button 
          @click="nextSlide"
          class="absolute right-2 sm:right-4 top-1/2 transform -translate-y-1/2 bg-black bg-opacity-50 text-white p-2 sm:p-3 rounded-full z-10 hover:bg-opacity-70 transition"
        >
          <i class="fas fa-chevron-right text-sm sm:text-base"></i>
        </button>

        <!-- Dots Indicator -->
        <div class="absolute bottom-3 sm:bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2 z-10">
          <button 
            v-for="(slide, index) in 4" 
            :key="index"
            @click="goToSlide(index)"
            :class="[
              'w-2 h-2 sm:w-3 sm:h-3 rounded-full transition',
              currentSlide === index ? 'bg-white bg-opacity-100' : 'bg-white bg-opacity-50 hover:bg-opacity-100'
            ]"
          ></button>
        </div>
      </section>

      <!-- PRODUCTS SECTION -->
      <section class="py-12 sm:py-16 bg-white relative z-10">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-8 sm:mb-10 lg:mb-12">
            <h2 class="text-2xl sm:text-3xl md:text-4xl font-bold text-gray-800 mb-2 sm:mb-3">
              Precision Polymer Components
            </h2>
            <p class="text-base sm:text-lg md:text-xl text-gray-600 max-w-3xl mx-auto">
              High-quality polymer parts for various industries and applications
            </p>
          </div>

          <!-- Product Category Tabs -->
          <div class="flex flex-wrap justify-center gap-2 sm:gap-3 mb-8 sm:mb-10 lg:mb-12">
            <button 
              @click="filterCategory('all')"
              :class="[
                'px-4 sm:px-6 py-2 rounded-full font-medium transition text-sm sm:text-base',
                selectedCategory === 'all' ? 'bg-blue-600 text-white' : 'bg-gray-200 hover:bg-gray-300'
              ]"
            >
              All Products
            </button>
            <button 
              @click="filterCategory('appliance')"
              :class="[
                'px-4 sm:px-6 py-2 rounded-full font-medium transition text-sm sm:text-base',
                selectedCategory === 'appliance' ? 'bg-blue-600 text-white' : 'bg-gray-200 hover:bg-gray-300'
              ]"
            >
              Appliance Parts
            </button>
            <button 
              @click="filterCategory('automotive')"
              :class="[
                'px-4 sm:px-6 py-2 rounded-full font-medium transition text-sm sm:text-base',
                selectedCategory === 'automotive' ? 'bg-blue-600 text-white' : 'bg-gray-200 hover:bg-gray-300'
              ]"
            >
              Automotive Parts
            </button>
            <button 
              @click="filterCategory('industrial')"
              :class="[
                'px-4 sm:px-6 py-2 rounded-full font-medium transition text-sm sm:text-base',
                selectedCategory === 'industrial' ? 'bg-blue-600 text-white' : 'bg-gray-200 hover:bg-gray-300'
              ]"
            >
              Industrial Components
            </button>
          </div>

          <!-- Material Groups -->
          <div v-for="materialType in materialTypes" :key="materialType">
            <template v-if="getFilteredProductsByMaterial(materialType).length > 0">
              <!-- Material Group Header -->
              <div :id="materialType" class="mb-4 sm:mb-6">
                <div :class="['rounded-xl p-3 sm:p-4 text-white shadow-lg relative overflow-hidden', getMaterialHeaderColor(materialType)]">
                  <div class="absolute inset-0 bg-gradient-to-r from-white/10 to-transparent opacity-20"></div>
                  <div class="relative z-10">
                    <div class="flex items-center justify-between flex-wrap gap-2">
                      <div class="flex items-center">
                        <div class="bg-white/20 rounded-full p-2 mr-2 sm:mr-3">
                          <i :class="['fas text-base sm:text-lg', getMaterialIcon(materialType)]"></i>
                        </div>
                        <div>
                          <h3 class="text-lg sm:text-xl font-bold mb-0">
                            {{ getMaterialTypeName(materialType) }}
                          </h3>
                          <p class="text-blue-100 text-xs sm:text-sm">
                            {{ getFilteredProductsByMaterial(materialType).length }} {{ getFilteredProductsByMaterial(materialType).length !== 1 ? 'products' : 'product' }}
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Product Grid -->
              <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-6 lg:gap-8 mb-8 sm:mb-10 lg:mb-12">
                <div 
                  v-for="(product, index) in getVisibleProductsByMaterial(materialType)" 
                  :key="product.id"
                  class="bg-white rounded-lg overflow-hidden shadow-md hover:shadow-2xl transition-shadow duration-300" data-aos="fade-up"
                >
                  <div class="h-48 sm:h-56 md:h-64 bg-white bg-no-repeat bg-contain bg-center relative" :style="{ backgroundImage: `url(${product.image_url})` }">
                    <span :class="[
                      'absolute top-3 sm:top-4 right-3 sm:right-4 rounded-full px-2 sm:px-3 py-1 text-xs sm:text-sm font-semibold uppercase text-white',
                      getMaterialBadgeColor(product.material_type)
                    ]">
                      {{ product.material_type }}
                    </span>
                  </div>
                  <div class="p-4 sm:p-6">
                    <div class="flex items-center mb-2 sm:mb-3">
                      <div class="bg-blue-600 bg-opacity-10 p-1.5 sm:p-2 rounded-full mr-2 sm:mr-3 flex-shrink-0">
                        <i :class="['text-blue-600 text-sm sm:text-base', getCategoryIcon(product.category)]"></i>
                      </div>
                      <h3 class="text-base sm:text-lg md:text-xl font-bold text-gray-800">{{ product.name }}</h3>
                    </div>
                    <p class="text-sm sm:text-base text-gray-600 mb-3 sm:mb-4 line-clamp-2">
                      {{ product.description || 'High-quality component for industrial applications.' }}
                    </p>

                    <button
                      @click="openProductModal(product)"
                      class="inline-flex items-center text-sm sm:text-base text-blue-600 font-semibold hover:text-blue-800 transition"
                    >
                      View Details <i class="fas fa-arrow-right ml-2"></i>
                    </button>
                  </div>
                </div>
              </div>
              <!-- See More Button -->
              <div v-if="shouldShowSeeMore(materialType)" class="text-center mb-8 sm:mb-10 lg:mb-12">
                <button
                  @click="toggleMaterialExpansion(materialType)"
                  class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-8 rounded-lg transition duration-300 inline-flex items-center"
                >
                  <span v-if="!expandedMaterials[materialType]">
                    See More <i class="fas fa-chevron-down ml-2"></i>
                  </span>
                  <span v-else>
                    See Less <i class="fas fa-chevron-up ml-2"></i>
                  </span>
                </button>
              </div>
            </template>
          </div>

          <!-- No Products Message -->
          <div v-if="filteredProducts.length === 0" class="text-center py-8 sm:py-12">
            <div class="bg-white rounded-xl shadow-lg p-6 sm:p-8">
              <i class="fas fa-box text-4xl sm:text-5xl md:text-6xl text-gray-300 mb-3 sm:mb-4"></i>
              <h3 class="text-xl sm:text-2xl font-bold text-gray-700 mb-2">No Products Available</h3>
              <p class="text-sm sm:text-base text-gray-500">Check back soon for our product catalog.</p>
            </div>
          </div>
        </div>
      </section>

      <!-- SERVICES SECTION -->
      <section id="services" class="py-12 sm:py-16 bg-gray-50 relative z-10">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-8 sm:mb-10 lg:mb-12">
            <h2 class="text-2xl sm:text-3xl md:text-4xl font-bold text-gray-800 mb-2 sm:mb-3">
              Our Manufacturing Services
            </h2>
            <p class="text-base sm:text-lg md:text-xl text-gray-600 max-w-3xl mx-auto">
              Comprehensive polymer manufacturing and finishing services
            </p>
          </div>

          <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-6 lg:gap-8">
            <div 
              v-for="service in services" 
              :key="service.id"
              class="bg-white rounded-lg shadow-md hover:shadow-2xl transition-shadow duration-300 overflow-hidden"
            >
              <div class="h-40 sm:h-44 md:h-48 bg-gray-200 bg-cover bg-center" :style="{ backgroundImage: `url(${service.image_url})` }"></div>
              <div class="p-4 sm:p-6">
                <div class="flex items-center mb-2 sm:mb-3">
                  <div class="bg-blue-600 bg-opacity-10 p-1.5 sm:p-2 rounded-full mr-2 sm:mr-3 flex-shrink-0">
                    <i class="fas fa-cogs text-blue-600 text-sm sm:text-base"></i>
                  </div>
                  <h3 class="text-base sm:text-lg md:text-xl font-bold text-gray-800">{{ service.name }}</h3>
                </div>
                <p class="text-sm sm:text-base text-gray-600 mb-3 sm:mb-4">{{ service.description }}</p>
                <button 
                  @click="openServiceModal(service)"
                  class="inline-flex items-center text-sm sm:text-base text-blue-600 font-semibold hover:text-blue-800 transition"
                >
                  Learn More <i class="fas fa-arrow-right ml-2"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- CTA SECTION -->
      <section class="relative py-12 sm:py-16 text-white">
        <div class="absolute inset-0">
          <img
            src="/storage/assets/img/banners/products_cta.jpg"
            alt="Banner Background"
            class="w-full h-full object-cover opacity-80"
          />
          <div class="absolute inset-0 bg-blue-600 opacity-60"></div>
        </div>

        <div class="relative container mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h2 class="text-2xl sm:text-3xl md:text-4xl font-bold mb-3 sm:mb-4 md:mb-6">
            Need Custom Polymer Solutions?
          </h2>
          <p class="text-base sm:text-lg md:text-xl mb-6 sm:mb-8 max-w-3xl mx-auto">
            Our team can develop and manufacture polymer components tailored to your exact specifications.
          </p>
          <div class="flex flex-col sm:flex-row justify-center gap-3 sm:gap-4">
            <Link 
              href="/contact" 
              class="bg-white text-blue-600 font-bold py-3 px-6 sm:px-8 rounded-lg hover:bg-gray-100 transition duration-300 text-sm sm:text-base"
            >
              Contact Us
            </Link>
            <a 
              href="tel:+6328529897085" 
              class="bg-transparent border-2 border-white text-white font-bold py-3 px-6 sm:px-8 rounded-lg hover:bg-white hover:text-blue-600 transition duration-300 text-sm sm:text-base"
            >
              Call Us Now
            </a>
          </div>
        </div>
      </section>

      <!-- PRODUCT MODAL -->
      <div 
        v-if="showProductModal"
        @click="closeProductModal"
        class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4"
      >
        <div 
          @click.stop
          class="bg-white rounded-lg max-w-4xl w-full max-h-[90vh] overflow-y-auto"
        >
          <div class="p-4 sm:p-6 lg:p-8">
            <div class="flex justify-between items-center mb-4 sm:mb-6">
              <h3 class="text-xl sm:text-2xl md:text-3xl font-bold text-gray-800">{{ selectedProduct?.name }}</h3>
              <button @click="closeProductModal" class="text-gray-500 hover:text-gray-700 text-xl sm:text-2xl">
                <i class="fas fa-times"></i>
              </button>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 sm:gap-8">
              <div>
                <div 
                  class="h-48 sm:h-56 md:h-64 bg-gray-200 bg-cover bg-center rounded-lg mb-4"
                  :style="{ backgroundImage: `url(${selectedProduct?.image_url})` }"
                ></div>
              </div>
              <div>
                <h4 class="text-base sm:text-lg font-semibold mb-2">Description</h4>
                <p class="text-sm sm:text-base text-gray-700 mb-4 sm:mb-6">
                  {{ selectedProduct?.description || 'High-quality component for industrial applications.' }}
                </p>

                <h4 class="text-base sm:text-lg font-semibold mb-2">Features</h4>
                <ul v-if="selectedProduct?.features && selectedProduct.features.length > 0" class="space-y-2 mb-4 sm:mb-6">
                  <li v-for="(feature, index) in selectedProduct.features" :key="index" class="flex items-start text-sm sm:text-base">
                    <i class="fas fa-check-circle text-green-500 mr-2 mt-1 flex-shrink-0"></i>
                    <span>{{ feature }}</span>
                  </li>
                </ul>
                <p v-else class="text-sm sm:text-base text-gray-500 mb-4 sm:mb-6">No features listed for this product.</p>

                <div class="flex flex-col sm:flex-row gap-3 sm:gap-4">
                  <Link 
                    href="/contact" 
                    class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 sm:py-3 px-6 rounded-lg transition duration-300 text-center text-sm sm:text-base"
                  >
                    Contact Us
                  </Link>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- SERVICE MODAL -->
      <div 
        v-if="showServiceModal"
        @click="closeServiceModal"
        class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-[9999]"
      >
        <div 
          @click.stop
          class="bg-white rounded-lg w-full max-w-xs sm:max-w-md md:max-w-2xl lg:max-w-4xl xl:max-w-5xl h-auto max-h-[85vh] sm:max-h-[90vh] overflow-hidden flex flex-col"
        >
          <!-- Header - Fixed -->
          <div class="flex-shrink-0 p-4 sm:p-6 border-b border-gray-200">
            <div class="flex justify-between items-center">
              <h3 class="text-base sm:text-lg md:text-xl lg:text-2xl font-bold text-gray-800 pr-4">
                {{ selectedService?.name }}
              </h3>
              <button 
                @click="closeServiceModal" 
                class="text-gray-500 hover:text-gray-700 text-xl flex-shrink-0 w-8 h-8 flex items-center justify-center hover:bg-gray-100 rounded-full transition"
              >
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>

          <!-- Scrollable Content -->
          <div class="flex-1 overflow-y-auto p-4 sm:p-6">
            <div class="grid grid-cols-1 gap-4">
              <!-- Video Container -->
              <div v-if="selectedService?.youtube_url" class="w-full aspect-video">
                <iframe 
                  :src="getYoutubeEmbedUrl(selectedService.youtube_url)"
                  class="w-full h-full rounded-lg"
                  frameborder="0"
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                  allowfullscreen
                ></iframe>
              </div>

              <!-- Description -->
              <div>
                <p class="text-sm sm:text-base text-gray-700 mb-4">{{ selectedService?.description }}</p>
                
                <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3">
                  <div class="bg-gray-50 p-3 rounded-lg">
                    <div class="text-blue-600 text-xl mb-1">
                      <i class="fas fa-tools"></i>
                    </div>
                    <h4 class="font-semibold text-sm mb-1">Custom Solutions</h4>
                    <p class="text-xs text-gray-600">Tailored to your specific requirements</p>
                  </div>
                  <div class="bg-gray-50 p-3 rounded-lg">
                    <div class="text-blue-600 text-xl mb-1">
                      <i class="fas fa-cogs"></i>
                    </div>
                    <h4 class="font-semibold text-sm mb-1">Modern Equipment</h4>
                    <p class="text-xs text-gray-600">State-of-the-art technology</p>
                  </div>
                  <div class="bg-gray-50 p-3 rounded-lg">
                    <div class="text-blue-600 text-xl mb-1">
                      <i class="fas fa-check-circle"></i>
                    </div>
                    <h4 class="font-semibold text-sm mb-1">Quality Assured</h4>
                    <p class="text-xs text-gray-600">Rigorous quality control</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Action Buttons - Fixed -->
          <div class="flex-shrink-0 p-4 sm:p-6 border-t border-gray-200 bg-gray-50">
            <div class="flex flex-col sm:flex-row justify-center gap-3">
              <Link 
                href="/contact" 
                class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 text-sm rounded-lg transition duration-300 text-center"
              >
                <i class="fas fa-envelope mr-1"></i> Contact Us
              </Link>
              <a 
                href="tel:+6328529897085" 
                class="bg-white border-2 border-blue-600 text-blue-600 hover:bg-gray-50 font-bold py-2 px-4 text-sm rounded-lg transition duration-300 text-center"
              >
                <i class="fas fa-phone-alt mr-1"></i> Call Now
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <Footer />
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue';
import { Link } from '@inertiajs/vue3';
import Header from '../../../layouts/Header.vue';
import Footer from '../../../layouts/Footer.vue';
import Chatbot from '@/layouts/Chatbot.vue';

// Define props to receive data from Laravel
const props = defineProps({
  products: {
    type: Array,
    default: () => []
  },
  services: {
    type: Array,
    default: () => []
  }
});

// Slider state
const currentSlide = ref(0);
let slideInterval = null;

// Category filter
const selectedCategory = ref('all');

// Modal states
const showProductModal = ref(false);
const showServiceModal = ref(false);
const selectedProduct = ref(null);
const selectedService = ref(null);

// Material types
const materialTypes = ['plastic', 'rubber', 'custom'];

const expandedMaterials = ref({
  plastic: false,
  rubber: false,
  custom: false
});

// Get material type display name
const getMaterialTypeName = (type) => {
  const names = {
    'plastic': 'Plastic Components',
    'rubber': 'Rubber Components',
    'custom': 'Custom Components',
  };
  return names[type] || type.charAt(0).toUpperCase() + type.slice(1) + ' Components';
};

// Get material type badge color
const getMaterialBadgeColor = (type) => {
  const colors = {
    'plastic': 'bg-gradient-to-r from-cyan-500 to-blue-600',
    'rubber': 'bg-gradient-to-r from-green-500 to-emerald-600',
    'custom': 'bg-gradient-to-r from-gray-500 to-slate-600'
  };
  return colors[type] || 'bg-gradient-to-r from-blue-500 to-blue-700';
};

// Get material type icon
const getMaterialIcon = (type) => {
  const icons = {
    'plastic': 'fa-cube',
    'rubber': 'fa-circle',
    'custom': 'fa-puzzle-piece'
  };
  return icons[type] || 'fa-box';
};

// Get material header color
const getMaterialHeaderColor = (type) => {
  const colors = {
    'plastic': 'bg-gradient-to-r from-cyan-600 via-blue-600 to-blue-600',
    'rubber': 'bg-gradient-to-r from-green-600 via-emerald-600 to-teal-600',
    'custom': 'bg-gradient-to-r from-gray-600 via-slate-600 to-gray-800'
  };
  return colors[type] || 'bg-gradient-to-r from-blue-600 to-indigo-600';
};

// Computed properties - NOW USING PROPS DATA
const filteredProducts = computed(() => {
  if (selectedCategory.value === 'all') {
    return props.products;
  }
  return props.products.filter(p => p.category === selectedCategory.value);
});

// Methods
const getFilteredProductsByMaterial = (materialType) => {
  return filteredProducts.value.filter(p => p.material_type === materialType);
};

const getVisibleProductsByMaterial = (materialType) => {
  const allProducts = getFilteredProductsByMaterial(materialType);
  if (expandedMaterials.value[materialType]) {
    return allProducts;
  }
  return allProducts.slice(0, 3);
};

const toggleMaterialExpansion = (materialType) => {
  expandedMaterials.value[materialType] = !expandedMaterials.value[materialType];
};

const shouldShowSeeMore = (materialType) => {
  const products = getFilteredProductsByMaterial(materialType);
  return products.length > 3;
};

const filterCategory = (category) => {
  selectedCategory.value = category;
};

const getCategoryIcon = (category) => {
  switch (category) {
    case 'appliance':
      return 'fas fa-home';
    case 'automotive':
      return 'fas fa-car';
    case 'industrial':
      return 'fas fa-industry';
    default:
      return 'fas fa-box';
  }
};

const openProductModal = (product) => {
  selectedProduct.value = product;
  showProductModal.value = true;
  document.body.style.overflow = 'hidden';
};

const closeProductModal = () => {
  showProductModal.value = false;
  selectedProduct.value = null;
  document.body.style.overflow = '';
};

const openServiceModal = (service) => {
  selectedService.value = service;
  showServiceModal.value = true;
  document.body.style.overflow = 'hidden';
};

const closeServiceModal = () => {
  showServiceModal.value = false;
  selectedService.value = null;
  document.body.style.overflow = '';
};

const getYoutubeEmbedUrl = (url) => {
  if (!url) return '';
  const videoId = url.split('youtu.be/')[1] || url.split('v=')[1];
  return `https://www.youtube.com/embed/${videoId}`;
};

// Slider methods
const nextSlide = () => {
  currentSlide.value = (currentSlide.value + 1) % 4;
};

const prevSlide = () => {
  currentSlide.value = currentSlide.value === 0 ? 3 : currentSlide.value - 1;
};

const goToSlide = (index) => {
  currentSlide.value = index;
};

// Lifecycle
onMounted(() => {
  slideInterval = setInterval(() => {
    nextSlide();
  }, 8000);

  setTimeout(() => {
    const hash = window.location.hash.substring(1);
    if (hash) {
      const element = document.getElementById(hash);
      if (element) {
        element.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    }
  }, 500);
});

onUnmounted(() => {
  if (slideInterval) {
    clearInterval(slideInterval);
  }
  document.body.style.overflow = '';
});
</script>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>