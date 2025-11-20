<template>
    <Chatbot />
  <div>
    <Header />
    
    <div class="bg-gray-50">
      <!-- Page Banner -->
      <section
        class="relative bg-blue-400 h-96 flex items-center justify-center bg-cover bg-center mt-[14vh]"
        style="background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('/storage/assets/img/banners/industries_banner.jpg')"
      >
        <div class="container mx-auto px-4 text-center text-white relative z-10">
          <h1 class="text-4xl md:text-5xl font-bold mb-4">Industries We Serve</h1>
          <div class="flex justify-center items-center text-sm md:text-base">
            <Link href="/" class="text-white hover:text-blue-300">Home</Link>
            <span class="mx-2">/</span>
            <span class="text-blue-300">Industries</span>
          </div>
        </div>
      </section>

      <!-- Industries Section -->
      <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
          <div class="text-center mb-12">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-3">
              Specialized Polymer Solutions Across Industries
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              Our high-performance polymer compounds are engineered to meet the unique challenges of diverse industrial applications.
            </p>
          </div>

          <!-- Industries Carousel -->
          <div class="industries-carousel-container relative">
            <!-- Scroll Indicator -->
            <div class="text-center mb-4 text-gray-600 text-sm">
              <i class="fas fa-hand-pointer mr-1"></i> Scroll freely or click to navigate
            </div>

            <!-- Carousel Track -->
            <div class="industries-carousel-track overflow-hidden">
              <div
                class="industries-carousel-slides flex transition-transform duration-600 ease-in-out"
                :style="{ transform: `translateX(-${currentSlide * slideWidth}%)` }"
              >
                <div
                  v-for="(industry, index) in industries"
                  :key="industry.id"
                  class="industries-carousel-slide w-full sm:w-1/2 lg:w-1/3 xl:w-1/4 flex-shrink-0 px-3"
                >
                  <div class="industry-card bg-white rounded-lg shadow-md overflow-hidden flex flex-col h-full hover:shadow-xl transition-shadow duration-300">
                    <!-- Image -->
                    <div
                      class="h-48 bg-gray-200 bg-cover bg-center"
                      :style="{ backgroundImage: `url('/storage/${industry.image_url}')` }"
                    ></div>

                    <!-- Card Content -->
                    <div class="p-6 flex flex-col flex-grow">
                      <div class="flex items-center mb-3">
                        <div class="bg-blue-600 bg-opacity-10 p-2 rounded-full mr-3 flex-shrink-0">
                          <i :class="`fas ${industry.icon_class} text-blue-600`"></i>
                        </div>
                        <h3 class="text-xl font-bold text-gray-800">{{ industry.name }}</h3>
                      </div>
                      <p class="text-gray-600 mb-4 flex-grow">{{ industry.description }}</p>

                      <!-- View Solutions Button -->
                      <div class="mt-auto pt-4">
                        <button
                          @click="openModal(industry)"
                          class="group w-full inline-flex items-center justify-center text-blue-600 font-semibold border border-blue-600 rounded-lg py-2 px-4 transition duration-300 ease-in-out hover:bg-blue-600 hover:shadow-lg hover:scale-105"
                        >
                          <span class="group-hover:text-white transition">View Solutions</span>
                          <i class="fas fa-arrow-right ml-2 group-hover:text-white transition"></i>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Navigation Controls -->
            <div class="industries-carousel-controls flex justify-center items-center mt-8 gap-4 flex-wrap">
              <button
                @click="prevSlide"
                class="industries-carousel-nav prev bg-gray-100 hover:bg-gray-200 border-2 border-gray-300 rounded-full w-12 h-12 flex items-center justify-center transition duration-300"
              >
                <i class="fas fa-chevron-left text-gray-600"></i>
              </button>

              <div class="industries-carousel-counter text-sm text-gray-600">
                <span>{{ currentSlide + 1 }}</span> / <span>{{ totalSlides }}</span>
              </div>

              <div class="industries-carousel-dots flex gap-2">
                <div
                  v-for="(_, index) in totalSlides"
                  :key="index"
                  @click="goToSlide(index)"
                  :class="[
                    'industries-carousel-dot w-3 h-3 rounded-full cursor-pointer transition duration-300',
                    currentSlide === index ? 'bg-blue-600' : 'bg-gray-300'
                  ]"
                ></div>
              </div>

              <button
                @click="nextSlide"
                class="industries-carousel-nav next bg-gray-100 hover:bg-gray-200 border-2 border-gray-300 rounded-full w-12 h-12 flex items-center justify-center transition duration-300"
              >
                <i class="fas fa-chevron-right text-gray-600"></i>
              </button>
            </div>
          </div>
        </div>
      </section>

      <!-- Industry Benefits Section -->
      <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
          <div class="text-center mb-12">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-3">Industry-Specific Advantages</h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              Our polymer solutions are tailored to address the unique challenges of each industry we serve
            </p>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            <div
              v-for="benefit in benefits"
              :key="benefit.title"
              class="benefit-card bg-white rounded-lg shadow-sm p-6 hover:shadow-md transition-shadow duration-300"
            >
              <div class="bg-blue-600 bg-opacity-10 w-16 h-16 rounded-full flex items-center justify-center mb-4 mx-auto">
                <i :class="`fas ${benefit.icon} text-blue-600 text-2xl`"></i>
              </div>
              <h4 class="text-xl font-bold text-gray-800 mb-3 text-center">{{ benefit.title }}</h4>
              <p class="text-gray-600 text-center">{{ benefit.description }}</p>
            </div>
          </div>
        </div>
      </section>

      <!-- CTA Section -->
      <section class="relative py-16 text-white">
        <!-- Background Image -->
        <div class="absolute inset-0">
          <img
            src="/storage/assets/img/banners/industries_cta.jpg"
            alt="Banner Background"
            class="w-full h-full object-cover opacity-80"
          />
          <div class="absolute inset-0 bg-blue-600 opacity-60"></div>
        </div>

        <!-- Content -->
        <div class="relative container mx-auto px-4 text-center">
          <h2 class="text-3xl md:text-4xl font-bold mb-6">Need Industry-Specific Solutions?</h2>
          <p class="text-xl mb-8 max-w-3xl mx-auto">
            Our technical team has extensive experience developing polymer solutions for diverse industrial applications.
          </p>
          <div class="flex flex-col sm:flex-row justify-center gap-4">
            <Link
              href="/contact"
              class="bg-white text-blue-600 font-bold py-3 px-8 rounded-lg hover:bg-gray-100 transition duration-300"
            >
              Contact Us
            </Link>
            <a
              href="tel:+6328529897"
              class="bg-transparent border-2 border-white text-white font-bold py-3 px-8 rounded-lg hover:bg-white hover:text-blue-600 transition duration-300"
            >
              Call Us Now
            </a>
          </div>
        </div>
      </section>
    </div>

    <!-- Modal for Industry Details -->
    <transition name="modal">
      <div
        v-if="showModal"
        class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4"
        @click.self="closeModal"
      >
        <div class="bg-white rounded-lg max-w-4xl w-full max-h-[90vh] overflow-y-auto">
          <div class="p-6">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-2xl font-bold text-gray-800">{{ selectedIndustry?.name }}</h3>
              <button @click="closeModal" class="text-gray-500 hover:text-gray-700 text-2xl">
                <i class="fas fa-times"></i>
              </button>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
              <div>
                <div
                  class="h-64 bg-gray-200 bg-cover bg-center mb-4 rounded-lg"
                  :style="{ backgroundImage: `url('/storage/${selectedIndustry?.image_url}')` }"
                ></div>
                <Link
                  href="/contact"
                  class="inline-block bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-6 rounded-lg transition duration-300"
                >
                  Contact Us
                </Link>
              </div>
              <div>
                <h4 class="text-lg font-semibold mb-2">Description</h4>
                <p class="text-gray-700 mb-6">{{ selectedIndustry?.description }}</p>

                <h4 class="text-lg font-semibold mb-2">Solutions</h4>
                <ul class="space-y-2 mb-6 max-h-64 overflow-y-auto">
                  <li
                    v-for="(solution, index) in selectedIndustry?.solutions"
                    :key="index"
                    class="flex items-start"
                  >
                    <i class="fas fa-check-circle text-blue-600 mr-2 mt-1"></i>
                    <span class="text-gray-700">{{ solution }}</span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>

    <Footer />
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue';
import { Link } from '@inertiajs/vue3';
import Header from '../../../layouts/Header.vue';
import Footer from '../../../layouts/Footer.vue';
import Chatbot from '@/layouts/Chatbot.vue';

// Define props to receive data from backend
const props = defineProps({
    industries: {
        type: Array,
        default: () => []
    }
});

// Carousel state
const currentSlide = ref(0);
const slideWidth = ref(100);

// Modal state
const showModal = ref(false);
const selectedIndustry = ref(null);

// Benefits data
const benefits = ref([
  {
    icon: 'fa-certificate',
    title: 'Regulatory Compliance',
    description: 'Materials formulated to meet industry-specific standards including cGMP, ISO, RoHS, REACH, and more.'
  },
  {
    icon: 'fa-lightbulb',
    title: 'Application Expertise',
    description: 'Deep understanding of industry requirements to develop optimal material solutions.'
  },
  {
    icon: 'fa-flask',
    title: 'Material Innovation',
    description: 'Continuous R&D to develop new formulations that address emerging industry challenges.'
  },
  {
    icon: 'fa-cogs',
    title: 'Processing Support',
    description: 'Technical assistance with material selection, processing parameters, and troubleshooting.'
  }
]);

// Computed properties
const totalSlides = computed(() => props.industries.length);

// Carousel methods
const updateSlideWidth = () => {
  const width = window.innerWidth;
  if (width >= 1280) {
    slideWidth.value = 25; // 4 cards
  } else if (width >= 1024) {
    slideWidth.value = 33.333; // 3 cards
  } else if (width >= 640) {
    slideWidth.value = 50; // 2 cards
  } else {
    slideWidth.value = 100; // 1 card
  }
};

const nextSlide = () => {
  if (currentSlide.value < totalSlides.value - 1) {
    currentSlide.value++;
  } else {
    currentSlide.value = 0;
  }
};

const prevSlide = () => {
  if (currentSlide.value > 0) {
    currentSlide.value--;
  } else {
    currentSlide.value = totalSlides.value - 1;
  }
};

const goToSlide = (index) => {
  currentSlide.value = index;
};

// Modal methods
const openModal = (industry) => {
  selectedIndustry.value = industry;
  showModal.value = true;
  document.body.style.overflow = 'hidden';
};

const closeModal = () => {
  showModal.value = false;
  document.body.style.overflow = '';
};

// Lifecycle
onMounted(() => {
  updateSlideWidth();
  window.addEventListener('resize', updateSlideWidth);
});

onUnmounted(() => {
  window.removeEventListener('resize', updateSlideWidth);
  document.body.style.overflow = '';
});
</script>

<style scoped>
/* Modal transition */
.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.3s ease;
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}

/* Carousel animations */
.industries-carousel-slides {
  transition: transform 0.6s ease-in-out;
}

/* Custom scrollbar for modal */
.max-h-64::-webkit-scrollbar {
  width: 6px;
}

.max-h-64::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 10px;
}

.max-h-64::-webkit-scrollbar-thumb {
  background: #2563eb;
  border-radius: 10px;
}

.max-h-64::-webkit-scrollbar-thumb:hover {
  background: #1d4ed8;
}

/* Responsive carousel dots */
@media (max-width: 640px) {
  .industries-carousel-dots {
    max-width: 200px;
    overflow-x: auto;
    padding: 4px;
  }
  
  .industries-carousel-dots::-webkit-scrollbar {
    height: 4px;
  }
}
</style>