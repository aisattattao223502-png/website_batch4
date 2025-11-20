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
                  <div class="h-48 sm:h-56 md:h-64 bg-white bg-no-repeat bg-contain bg-center relative">
                    <img 
                      v-if="product.image_url" 
                      :src="product.image_url" 
                      :alt="product.name"
                      @error="handleImageError"
                      class="w-full h-full object-contain"
                    />
                    <div v-else class="w-full h-full flex items-center justify-center bg-gray-100">
                      <i class="fas fa-image text-gray-300 text-4xl"></i>
                    </div>
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

          <div v-if="services && services.length > 0" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-6 lg:gap-8">
            <div 
              v-for="service in services" 
              :key="service.id"
              class="bg-white rounded-lg shadow-md hover:shadow-2xl transition-shadow duration-300 overflow-hidden"
            >
              <div class="h-40 sm:h-44 md:h-48 bg-gray-200 bg-cover bg-center" :style="{ backgroundImage: `url(/storage/${service.image_url})` }"></div>
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

          <!-- No Services Message -->
          <div v-else class="text-center py-8">
            <div class="bg-white rounded-xl shadow-lg p-6 sm:p-8">
              <i class="fas fa-cogs text-4xl sm:text-5xl text-gray-300 mb-3 sm:mb-4"></i>
              <h3 class="text-xl sm:text-2xl font-bold text-gray-700 mb-2">No Services Available</h3>
              <p class="text-sm sm:text-base text-gray-500">Check back soon for our services.</p>
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
                <div class="h-48 sm:h-56 md:h-64 bg-gray-200 rounded-lg mb-4 flex items-center justify-center overflow-hidden">
                  <img 
                    v-if="selectedProduct?.image_url" 
                    :src="selectedProduct.image_url" 
                    :alt="selectedProduct.name"
                    @error="handleImageError"
                    class="w-full h-full object-contain"
                  />
                  <i v-else class="fas fa-image text-gray-300 text-4xl"></i>
                </div>
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
    // Add more as needed
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

// Products data with features
const products = [
  {
    id: 1,
    name: 'Aircon Parts - Supply Grille',
    description: 'Durable polymer grilles designed for optimal airflow in air-conditioning systems.',
    category: 'appliance',
    image_url: 'storage/assets/products/AirconParts.jpg',
    material_type: 'plastic',
    features: [
      'Optimized for maximum airflow',
      'UV and temperature resistant',
      'Available in multiple colors'
    ]
  },
  {
    id: 2,
    name: 'Electric Fan Parts Series',
    description: 'High-performance polymer components for electric fan assemblies.',
    category: 'appliance',
    image_url: 'storage/assets/products/ElectricFanParts.jpg',
    material_type: 'plastic',
    features: [
      'Precision balanced components',
      'Lightweight yet durable',
      'Reduced vibration and noise'
    ]
  },
  {
    id: 3,
    name: 'Plastic Core (12MM and 18MM)',
    description: 'Precision plastic cores for industrial applications.',
    category: 'industrial',
    image_url: 'storage/assets/products/PlasticCore.jpg',
    material_type: 'plastic',
    features: [
      'Available in 12mm and 18mm sizes',
      'High dimensional accuracy',
      'Chemical and wear resistant'
    ]
  },
  {
    id: 4,
    name: 'Motorcycle Wire Insulator - Grommet',
    description: 'Protective grommets for motorcycle wiring systems.',
    category: 'automotive',
    image_url: 'storage/assets/products/Grommet.jpg',
    material_type: 'rubber',
    features: [
      'Excellent electrical insulation',
      'UV and weather resistant',
      'Withstands extreme temperatures'
    ]
  },
  {
    id: 5,
    name: 'Footing Stove',
    description: 'Portable heater used on construction sites to provide warmth or aid in concrete curing.',
    category: 'appliance',
    image_url: 'storage/assets/products/FootingStove.jpg',
    material_type: 'rubber',
    features: [
      'Durable rubber base for stable support',
      'Heat-resistant material for safety',
      'Prevents slipping and surface scratches'
    ]
  },
  {
    id: 6,
    name: 'Car Part Accessory - Front Rubber Base',
    description: 'Car accessory that provides cushioning and protection for the vehicle\'s front underbody.',
    category: 'automotive',
    image_url: 'storage/assets/products/FrontRubberBase.jpg',
    material_type: 'rubber',
    features: [
      'Provides stable front-end support',
      'Reduces vibration and road noise',
      'Made from durable, weather-resistant rubber'
    ]
  },
  {
    id: 7,
    name: 'Gas Stove Part - Knob',
    description: 'Control accessory used to adjust the flame intensity on a gas burner.',
    category: 'appliance',
    image_url: 'storage/assets/products/GasStovePart.jpg',
    material_type: 'plastic',
    features: [
      'Easy-grip design for smooth control',
      'Heat-resistant and durable material',
      'Universal fit for most gas stoves'
    ]
  },
  {
    id: 8,
    name: 'Car Part Accessory - Rear Rubber Base',
    description: 'Car accessory that cushions and protects the vehicle\'s rear underbody from impact and wear.',
    category: 'automotive',
    image_url: 'storage/assets/products/RearRubberBase.jpg',
    material_type: 'rubber',
    features: [
      'Supports rear chassis stability',
      'Minimizes road impact and noise',
      'Durable rubber construction for long-term use'
    ]
  },
  {
    id: 9,
    name: 'Refrigerator Part - Freezer Door',
    description: 'Refrigerator part that seals the freezer compartment to maintain low temperatures and preserve frozen items.',
    category: 'appliance',
    image_url: 'storage/assets/products/FreezerDoor.jpg',
    material_type: 'plastic',
    features: [
      'Provides secure sealing to lock in cold air',
      'Durable and insulated for energy efficiency',
      'Designed for easy opening and closing'
    ]
  },
  {
    id: 10,
    name: 'Paint Packaging Set - 1 Gallon (4L)',
    description: 'Durable and secure container set for storing and transporting up to 4 liters (1 gallon) of paint.',
    category: 'industrial',
    image_url: 'storage/assets/products/PaintPackaging.jpg',
    material_type: 'plastic',
    features: [
      'Leak-proof container ideal for paint storage',
      'Sturdy handle for easy carrying',
      'Tight-seal lid to prevent spills and drying'
    ]
  },
  {
    id: 11,
    name: 'Battery Accessory - Battery Dispenser Assembly',
    description: 'Compact and organized assembly for dispensing and storing batteries efficiently.',
    category: 'industrial',
    image_url: 'storage/assets/products/BatteryDispenser.jpg',
    material_type: 'plastic',
    features: [
      'Organizes and dispenses batteries efficiently',
      'Compact design for easy storage and access',
      'Protects batteries from dust and damage'
    ]
  },
  {
    id: 12,
    name: 'Paso Small',
    description: 'A small plant pot made of plastic. It is commonly used for planting flowers, herbs, or small decorative plants. ',
    category: 'industrial',
    image_url: 'storage/assets/products/PasoSmall.png ',
    material_type: 'plastic',
    features: [
      'Durable plastic construction ideal for indoor or outdoor use',
      'Compact size perfect for herbs, succulents, or small flowers'
    ]
  },
  {
    id: 13,
    name: 'Hanging Pots',
    description: 'Containers used for growing plants that are suspended from ceilings, walls, or hooks.',
    category: 'industrial',
    image_url: 'storage/assets/products/HangingPots.png',
    material_type: 'plastic',
    features: [
      'Space-saving design ideal for balconies, patios, or walls',
      'Secure hanging system with strong ropes or hooks',
      'Made from weather-resistant materials for long-lasting use'
    ]
  },
  {
    id: 14,
    name: 'Christmas Pots',
    description: 'Decorative plant pots designed with holiday themes, often in colors like red, green, gold, or silver.',
    category: 'industrial',
    image_url: 'storage/assets/products/ChristmasPots.png',
    material_type: 'plastic',
    features: [
      'Festive holiday designs in red, green, gold, or silver',
      'Perfect for seasonal plants like poinsettias or mini trees',
      'Reusable décor item that adds a cheerful holiday touch'
    ]
  },
  {
    id: 15,
    name: 'Dog Food Feeder',
    description: 'A container or device used to hold and serve food for dogs.',
    category: 'industrial',
    image_url: 'storage/assets/products/DogFeeder.jpg',
    material_type: 'plastic',
    features: [
      'Made from safe, non-toxic, and easy-to-clean materials',
      'Stable, anti-slip base to prevent spills during feeding'
    ]
  },
  {
    id: 16,
    name: 'Nicera Tray',
    description: 'A type of plastic tray often used for serving food, drinks, or organizing small items.',
    category: 'industrial',
    image_url: 'storage/assets/products/Tray.png',
    material_type: 'plastic',
    features: [
      'Lightweight and durable plastic, ideal for everyday use',
      'Versatile design suitable for serving, storage, or organization',
      'Easy to clean and resistant to stains or spills'
    ]
  },
  {
    id: 17,
    name: 'Paso Big',
    description: 'A large plant pot, usually made of plastic. It’s ideal for planting bigger plants, shrubs, or small trees.',
    category: 'industrial',
    image_url: 'storage/assets/products/PasoBig.png',
    material_type: 'plastic',
    features: [
      'Large capacity suitable for bigger plants, shrubs, or small trees',
      'Made from sturdy, weather-resistant plastic for indoor or outdoor use'
    ]
  },
  {
    id: 18,
    name: 'Guard Mark',
    description: 'A protective or safety marker/cover used in electronic equipment.',
    category: 'appliance',
    image_url: 'storage/assets/products/GuardMark.png',
    material_type: 'plastic',
    features: [
      'Designed to provide safety marking or protection on Panasonic equipment',
      'Helps prevent accidental contact with sensitive or moving parts',
      'Durable material ensures long-lasting visibility and performance'
    ]
  },
  {
    id: 19,
    name: 'Switch Knob',
    description: 'A small control handle used to turn a device on or off or adjust its settings.',
    category: 'appliance',
    image_url: 'storage/assets/products/SwitchKnob.png',
    material_type: 'plastic',
    features: [
      'Ergonomic design for easy grip and smooth turning',
      'Used to control power or adjust settings on devices',
      'Compatible with various Panasonic equipment'
    ]
  },
  {
    id: 20,
    name: 'Stand Cap',
    description: 'A protective cap or cover designed to fit onto the stand or base of electronic equipment.',
    category: 'appliance',
    image_url: 'storage/assets/products/StandCap.png',
    material_type: 'plastic',
    features: [
      'Protective cover designed to fit securely on equipment stands or bases',
      'Shields internal components from dust, debris, or damage',
      'Durable and precise fit for Panasonic devices'
    ]
  },
  {
    id: 21,
    name: 'Switch Button',
    description: 'A small control used to turn a device or machine on or off, or to change its mode.',
    category: 'appliance',
    image_url: 'storage/assets/products/SwitchButton.png',
    material_type: 'plastic',
    features: [
      'Tactile control for turning devices on/off or switching modes',
      'Made from durable materials for frequent use',
      'Compact design integrates seamlessly with control panels'
    ]
  },
  {
    id: 22,
    name: 'Wheel',
    description: 'A round object that helps things move by rolling.',
    category: 'appliance',
    image_url: 'storage/assets/products/Wheel.png',
    material_type: 'plastic',
    features: [
      'Facilitates smooth movement of Panasonic equipment or components',
      'Made from durable, wear-resistant materials for long-term performance',
      'Designed for easy installation and reliable mobility'
    ]
  },
  {
    id: 23,
    name: 'Indicator Knob',
    description: 'A small control dial that shows and adjusts the setting or level of a device.',
    category: 'appliance',
    image_url: 'storage/assets/products/IndicatorKnob.png',
    material_type: 'plastic',
    features: [
      'Provides precise control and clear visual feedback for settings adjustment',
      'Commonly used for functions like volume, speed, or temperature control',
      'Ergonomic design ensures smooth operation'
    ]
  },
  {
    id: 24,
    name: 'Footing FS600 w/ Adap.',
    description: 'A sturdy support base designed to provide stable mounting and anchoring for equipment or structural components.',
    category: 'industrial',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Provides a stable and secure base for mounting equipment',
      'Includes an adaptor for compatibility with FS600 systems',
      'Constructed from durable materials for long-term support'
    ]
  },
  {
    id: 25,
    name: 'Footing Adaptor w/ Bolt FS600',
    description: 'A strong footing adaptor designed for the FS600 model.',
    category: 'industrial',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Designed specifically to fit the FS600 footing system',
      'Includes bolt for secure attachment and easy installation',
      'Ensures stable alignment and reliable support'
    ]
  },
  {
    id: 26,
    name: 'Footing Adaptor SL100',
    description: 'A footing adaptor used with the SL100 model to ensure proper fit and alignment between the base and supported equipment.',
    category: 'industrial',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Compatible adaptor for the SL100 footing system',
      'Offers precise fit for stable connection between base and equipment',
      'Built for durability and proper alignment in structural setups'
    ]
  },
  {
    id: 27,
    name: 'Footing w/o Rubber Cap',
    description: 'A standard footing or base used to support poles or equipment.',
    category: 'industrial',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Serves as a stable base for supporting poles or equipment',
      'Designed for secure placement without the need for a rubber cap',
      'Made from durable materials suitable for indoor or outdoor use'
    ]
  },
  {
    id: 28,
    name: 'Rubber Bumper',
    description: 'A protective rubber piece designed to absorb impact, prevent scratches, and reduce noise or vibration.',
    category: 'industrial',
    image_url: '',
    material_type: 'rubber',
    features: [
      'Absorbs impact to protect equipment and surfaces',
      'Helps reduce noise, vibration, and potential damage',
      'Made from high-quality rubber for long-lasting performance'
    ]
  },
  {
    id: 29,
    name: 'Pl Compt Lock Male FS800 Black',
    description: 'A plastic component lock (male part) designed for the FS800 model.',
    category: 'industrial',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Male component lock designed for FS800 systems',
      'Provides secure interlocking fit with the corresponding female part',
      'Made from durable black plastic for strength and consistency'
    ]
  },
  {
    id: 30,
    name: 'Pl Compt Lock Female FS800 Black',
    description: 'A plastic component lock (female part) for the FS800 model.',
    category: 'industrial',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Ensures tight, secure connection with male counterpart',
      'Constructed from sturdy black plastic for reliable use',
      'Designed specifically for FS800 systems'
    ]
  },
  {
    id: 31,
    name: 'Gallon 4 Liters',
    description: 'A 4-liter plastic gallon container used for storing and carrying liquids such as water, oil, or cleaning solutions.',
    category: 'industrial',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Made from durable plastic for long-term use',
      'Ideal for industrial, household, or commercial applications',
      '4-liter capacity for liquid storage and transport'
    ]
  },
  {
    id: 32,
    name: 'Gallon Cover',
    description: 'A protective lid or cap designed to fit securely on a gallon container.',
    category: 'industrial',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Secure-fit lid designed to seal gallon containers',
      'Prevents spills, contamination, and evaporation',
      'Made from chemical-resistant material'
    ]
  },
  {
    id: 33,
    name: 'Gallon Handle',
    description: 'The sturdy grip or attachment on a gallon container that makes it easy to lift, carry, and pour.',
    category: 'industrial',
    image_url: '',
    material_type: '',
    features: [
      'Strong grip attachment for easy lifting and pouring',
      'Ergonomic design improves handling and reduces strain',
      'Built from durable plastic to support heavy use'
    ]
  },
  {
    id: 34,
    name: 'Drain Seal',
    description: 'A cover or stopper used to block or seal a drain opening.',
    category: 'appliance',
    image_url: '',
    material_type: 'rubber',
    features: [
      'Used to seal or block drain outlets in appliances',
      'Prevents water leakage and ensures proper drainage',
      'Made from flexible, durable material for a secure fit'
    ]
  },
  {
    id: 35,
    name: 'Back Cover Small',
    description: 'A protective rear panel appliances, such as air conditioners.',
    category: 'appliance',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Rear protective panel for appliances, such as air conditioners',
      'Shields internal components from dust and damage',
      'Made to fit securely and ensure reliable performance'
    ]
  },
  {
    id: 36,
    name: 'Front Cover Small E-Door',
    description: 'A protective front panel designed for the electronic door appliances, such as air conditioners.',
    category: 'appliance',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Front-facing panel designed for the electronic doors of appliances',
      'Provides protection for sensitive electronic components',
      'Precision-molded for a secure, fluch fit with the appliance body'
    ]
  },
  {
    id: 37,
    name: 'Back Cover Big',
    description: 'A large protective rear panel designed for the electronic door appliances, such as air conditioners.',
    category: 'appliance',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Large rear protective panel for the electronic doors',
      'Shields internal components from dust, moisture, and damage',
      'Built for durability and a precise fit on a larger applicance models'
    ]
  },
  {
    id: 38,
    name: 'Front Cover Big E-Door',
    description: 'A large protective front panel designed for the electronic door appliances, such as air conditioners.',
    category: 'appliance',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Large front panel designed to protect the electronic door of air conditioners',
      'Help enclose and protect sensitive front-facing components',
      'Molds securely into place for a clean, professional finsih'
    ]
  },
  {
    id: 39,
    name: 'Drain Pan',
    description: 'A shallow container placed under equipment, such as air conditioners, refrigerators, or sinks, to collect and hold water or liquid drips.',
    category: 'appliance',
    image_url: 'storage/assets/products/DrainPan.png',
    material_type: 'plastic',
    features: [
      'Collects and holds water or condensation from appliances like air conditioners',
      'Prevents leaks and protects surrounding areas from water damage',
      'Made from corrosion-resistant materials for long-lasting use'
    ]
  },
  {
    id: 40,
    name: 'Plastic Roller Hinges',
    description: 'A type of hinge that has a built-in plastic roller, allowing doors, panels, or covers to open and close smoothly.',
    category: 'industrial',
    image_url: '',
    material_type: 'plastic',
    features: [
      'Built-in plastic roller for smooth and quiet movement',
      'Durable plastic construction for long-lasting use',
      'Ideal for doors, panels, or covers in various applications'
    ]
  },
  {
    id: 41,
    name: 'E-Door Assy',
    description: 'An E-Door Assy (Electronic Door Assembly) is a complete set of components that make up an electronic door system.',
    category: 'appliance',
    image_url: 'storage/assets/products/EdoorAssy.png',
    material_type: 'plastic',
    features: [
      'Complete assembly forming an electronic door system',
      'Designed for reliable operation and easy integration',
      'Includes necessary parts for installation and maintenance'
    ]
  },
  {
    id: 42,
    name: 'Ice Cream Containers',
    description: 'A plastic ice cream container, featuring tall, rounded, and rectangular tubs. ',
    category: 'industrial',
    image_url: 'storage/assets/products/IceCreamContainer.png',
    material_type: 'plastic',
    features: [
      'Made from food-grade materials to ensure safety and freshness',
      'Available in various sizes for retail or household use',
      'Keeps ice cream fresh and well-sealed'
    ]
  }
];

// Define props to receive services from backend
const props = defineProps({
    services: {
        type: Array,
        default: () => []
    }
});

// Computed properties
const filteredProducts = computed(() => {
  if (selectedCategory.value === 'all') {
    return products;
  }
  return products.filter(p => p.category === selectedCategory.value);
});

// Methods
const getFilteredProductsByMaterial = (materialType) => {
  return filteredProducts.value.filter(p => p.material_type === materialType);
};

const getVisibleProductsByMaterial = (materialType) => {
  const allProducts = getFilteredProductsByMaterial(materialType);
  if (expandedMaterials.value[materialType]) {
    return allProducts; // Show all when expanded
  }
  return allProducts.slice(0, 3); // Show only first 3 when collapsed
};

const toggleMaterialExpansion = (materialType) => {
  expandedMaterials.value[materialType] = !expandedMaterials.value[materialType];
};

const shouldShowSeeMore = (materialType) => {
  const products = getFilteredProductsByMaterial(materialType);
  return products.length > 3; // Show button if more than 3 products
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
    const hash = window.location.hash.substring(1); // Remove the '#'
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