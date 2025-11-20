


<template>
  <div v-if="isLoading" class="loading-overlay">
  <orbit-spinner
    :animation-duration="1200"
    :size="80"
    color="#ff1d5e"
  />
</div>
    <div>
        <Header />
    </div>
    <!-- GLOBAL LOADER -->


    <Chatbot />


  <div class="homepage bg-gray-50 overflow-x-hidden">
    <!-- Modern Hero Section with Integrated Header -->
    <section class="relative bg-gradient-to-br from-slate-900 via-blue-900 to-indigo-900 min-h-screen flex items-center justify-center overflow-hidden pt-20">
      <!-- Background Elements -->
      <div class="absolute inset-0 bg-gradient-to-br from-slate-900/90 via-blue-800/80 to-indigo-900/90 z-0"></div>
      
      <!-- VIDEO BACKGROUND -->
      <div class="absolute inset-0 z-0 overflow-hidden">
        <video 
          autoplay 
          muted 
          loop 
          playsinline 
          class="w-full h-full object-cover"
        >
          <source src="storage/assets/video/heroCard.mp4" type="video/mp4">
        </video>
        <div class="absolute inset-0 bg-black/40"></div>
      </div>
      
      <!-- Subtle gradient orbs -->
      <div class="absolute inset-0 overflow-hidden z-0">
        <div class="absolute -top-40 -right-40 w-80 h-80 bg-gradient-to-r from-cyan-500/15 to-blue-600/15 rounded-full blur-3xl"></div>
        <div class="absolute -bottom-40 -left-40 w-80 h-80 bg-gradient-to-r from-blue-600/15 to-indigo-500/15 rounded-full blur-3xl"></div>
      </div>

      <!-- Content container -->
      <div class="container mx-auto px-4 relative z-10">
        <div class="max-w-6xl mx-auto">
          <!-- Modern Hero Card -->
          <div class="bg-white/5 backdrop-blur-sm rounded-3xl shadow-2xl overflow-hidden border border-white/10">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-0">
              <!-- Left Content Column -->
              <div class="p-8 sm:p-10 lg:p-12 flex flex-col justify-center">
                <!-- Status Badge -->
                <div class="inline-flex items-center bg-gradient-to-r from-cyan-500/15 to-blue-600/15 text-cyan-300 px-4 py-2 rounded-full text-sm font-medium mb-6 border border-cyan-500/20">
                  <span class="w-2 h-2 bg-cyan-400 rounded-full mr-2"></span>
                  Industry Leader Since 1978
                </div>
                
                <!-- Main Heading -->
                <h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold mb-6 leading-tight">
                  <span class="bg-gradient-to-r from-white via-cyan-100 to-blue-200 bg-clip-text text-transparent">
                    James Polymers Manufacturing Corporation
                  </span>
                </h1>
                
                <!-- Subheading -->
                <p class="text-xl sm:text-2xl mb-8 max-w-2xl leading-relaxed text-gray-200">
                  Delivering high-performance polymer compounds tailored to your specific requirements with over 45 years of expertise
                </p>
                
                <!-- CTA Buttons -->
                <div class="flex flex-col sm:flex-row gap-4 mb-8">
                  <Link 
                    href="/products"
                    class="group bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-semibold py-4 px-8 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-cyan-500/25 text-center relative overflow-hidden"
                  >
                    <span class="relative z-10 flex items-center justify-center">
                      <i class="fas fa-box-open mr-3"></i>
                      Explore Our Capabilities
                    </span>
                    <div class="absolute inset-0 bg-gradient-to-r from-blue-600 to-cyan-500 opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
                  </Link>
                  
                  <Link 
                    href="/contact"
                    class="group bg-transparent border-2 border-white/30 text-white font-semibold py-4 px-8 rounded-xl hover:bg-white hover:text-slate-900 transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-white/10 text-center relative overflow-hidden"
                  >
                    <span class="relative z-10 flex items-center justify-center">
                      <i class="fas fa-phone-alt mr-3"></i>
                      Contact Us
                    </span>
                    <div class="absolute inset-0 bg-white opacity-0 group-hover:opacity-100 transition-opacity duration-300 -z-10"></div>
                  </Link>
                </div>
                
                <!-- Trust Indicators -->
                <div class="mt-6 pt-6 border-t border-white/10">
                  <p class="text-gray-300 text-sm mb-4 font-medium">Trusted by industry leaders worldwide</p>
                  <div class="grid grid-cols-2 sm:grid-cols-4 gap-4 opacity-90">
                    <div class="flex items-center">
                      <div class="w-8 h-8 rounded-full bg-cyan-500/10 flex items-center justify-center mr-2">
                        <i class="fas fa-award text-cyan-400 text-sm"></i>
                      </div>
                      <span class="text-sm text-white">ISO Certified</span>
                    </div>
                    <div class="flex items-center">
                      <div class="w-8 h-8 rounded-full bg-yellow-500/10 flex items-center justify-center mr-2">
                        <i class="fas fa-medal text-yellow-400 text-sm"></i>
                      </div>
                      <span class="text-sm text-white">Quality Assured</span>
                    </div>
                    <div class="flex items-center">
                      <div class="w-8 h-8 rounded-full bg-green-500/10 flex items-center justify-center mr-2">
                        <i class="fas fa-industry text-green-400 text-sm"></i>
                      </div>
                      <span class="text-sm text-white">45+ Years Experience</span>
                    </div>
                    <div class="flex items-center">
                      <div class="w-8 h-8 rounded-full bg-blue-500/10 flex items-center justify-center mr-2">
                        <i class="fas fa-globe-americas text-blue-400 text-sm"></i>
                      </div>
                      <span class="text-sm text-white">Global Reach</span>
                    </div>
                  </div>
                </div>
              </div>
              
              <!-- Right Visual Column -->
              <div class="p-6 lg:p-8 flex items-center justify-center bg-gradient-to-br from-slate-800/30 to-blue-900/30 relative overflow-hidden">
                <div class="relative w-full max-w-md">
                  <div class="relative z-10 bg-white/5 backdrop-blur-sm rounded-2xl p-6 border border-white/10 shadow-2xl">
                    <img src="/storage/assets/img/certifications/cert.png" alt="45 Years of Excellence" class="w-full h-auto rounded-xl shadow-lg">
                  </div>
                  
                  <!-- Decorative elements -->
                  <div class="absolute -bottom-4 -right-4 w-12 h-12 bg-gradient-to-r from-cyan-400 to-blue-500 rounded-xl rotate-12 shadow-lg flex items-center justify-center">
                    <i class="fas fa-trophy text-white text-lg"></i>
                  </div>
                  <div class="absolute -top-4 -left-4 w-10 h-10 bg-gradient-to-r from-blue-500 to-indigo-600 rounded-lg -rotate-12 shadow-lg flex items-center justify-center">
                    <i class="fas fa-star text-white text-xs"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <!-- Scroll indicator -->
          <div class="flex justify-center mt-12">
            <div class="flex flex-col items-center text-white/70 animate-bounce">
              <span class="text-sm mb-2">Scroll to explore</span>
              <i class="fas fa-chevron-down"></i>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Products & Services Section -->
    <section class="py-16 bg-gray-50">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-bold text-center text-gray-800 mb-4">
          Products & Services
        </h2>
        <p class="text-xl text-center text-gray-600 max-w-3xl mx-auto mb-12">
          We offer a comprehensive range of polymer compounds and value-added services to meet the most demanding material requirements across various industries.
        </p>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <div v-for="(category, index) in categories" :key="index" class="bg-white rounded-lg shadow-md overflow-hidden transition duration-300 hover:shadow-xl flex flex-col">
            <div class="h-48 bg-cover bg-center" :style="{ backgroundImage: `url(${category.image})` }"></div>
            <div class="p-6 flex flex-col flex-grow">
              <h3 class="text-xl font-bold text-gray-800 mb-3">{{ category.title }}</h3>
              <p class="text-gray-600 mb-4 flex-grow">{{ category.description }}</p>
              <div class="mt-auto">
                <Link 
                  :href="`/products#${category.section}`" 
                  class="text-blue-600 font-semibold hover:text-blue-800 transition"
                >
                  Learn More <i class="fas fa-arrow-right ml-1"></i>
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Industries Section -->
    <section class="py-16 bg-white relative">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-bold text-center text-gray-800 mb-4">
          Industries We Cater
        </h2>
        <p class="text-xl text-center text-gray-600 max-w-3xl mx-auto mb-12">
          Our advanced polymer solutions serve critical applications across multiple industries, enabling innovation and performance enhancement.
        </p>
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-6">
          <div v-for="(industry, index) in industries" :key="index" class="bg-gray-50 rounded-lg p-6 text-center transition duration-300 hover:shadow-lg hover:scale-105" data-aos="fade-up" 
            :data-aos-delay="index * 100">
            <div class="bg-blue-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
              <i class="fas text-white text-2xl" :class="industry.icon"></i>
            </div>
            <h3 class="text-lg font-bold text-gray-800">{{ industry.title }}</h3>
            <p class="text-sm text-gray-600 mt-2">{{ industry.description }}</p>
          </div>
        </div>
        <Link href="/industries" class="absolute left-1/2 bottom-0 transform -translate-x-1/2 translate-y-1/2 bg-blue-600 text-white rounded-full shadow w-12 h-12 flex items-center justify-center text-xl z-10 hover:bg-blue-700 transition" title="View all industries">
          <i class="fas fa-arrow-right"></i>
        </Link>
      </div>
    </section>

    <!-- Awards & Recognition Section -->
    <section class="py-16 bg-gray-50">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-bold text-center text-gray-800 mb-4">
          Awards & Recognition
        </h2>
        <p class="text-xl text-center text-gray-600 max-w-3xl mx-auto mb-12">
          Our commitment to excellence and innovation has been recognized by industry organizations and publications.
        </p>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <div 
            v-for="(award, index) in recognitionAwards" 
            :key="index"
            class="award-card bg-white rounded-lg shadow-md p-6 h-full transition duration-300 hover:shadow-xl hover:-translate-y-1"
            data-aos="fade-up" 
            :data-aos-delay="index * 100"
          >
            <div class="flex items-center mb-4">
              <div class="bg-blue-600 p-3 rounded-full mr-4">
                <i class="fas text-white text-2xl" :class="award.icon"></i>
              </div>
              <h3 class="text-lg font-bold text-gray-800">{{ award.title }}</h3>
            </div>
            <p class="text-gray-600">{{ award.description }}</p>
          </div>
        </div>
      </div>
    </section>


    <!-- Customers Section - Single Line Carousel with Buttons -->
    <section class="py-16 bg-white">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-bold text-center text-gray-800 mb-4">
          Our Valued Customers
        </h2>
        <p class="text-xl text-center text-gray-600 max-w-3xl mx-auto mb-12">
          We're proud to partner with industry leaders across various sectors, providing them with high-performance polymer solutions.
        </p>

        <!-- Single Line Carousel with Navigation -->
        <div class="relative max-w-7xl mx-auto">
          <!-- Carousel Container -->
          <div class="overflow-hidden">
            <div 
              class="flex transition-transform duration-500 ease-in-out"
              :style="{ transform: `translateX(-${currentSlide * slideWidth}px)` }"
            >
              <!-- Customer Logos -->
              <div
                v-for="(logo, index) in allCustomerLogos.value || allCustomerLogos"
                :key="index"
                class="flex-shrink-0 px-4"
                :style="{ width: `${cardWidth}px` }"
              >
                <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition-all duration-300 hover:-translate-y-2 p-8 flex items-center justify-center h-40">
                  <img
                    v-if="logo !== 'coming_soon'"
                    :src="logo"
                    alt="Customer Logo"
                    class="max-w-full max-h-24 object-contain"
                  />
                  <span v-else class="text-green-600 font-bold text-center">
                    Coming Soon
                  </span>
                </div>
              </div>
            </div>
          </div>

          <!-- Navigation Buttons -->
          <button
            @click="prevSlide"
            :disabled="currentSlide === 0"
            class="absolute left-0 top-1/2 -translate-y-1/2 -translate-x-4 md:-translate-x-12 bg-white hover:bg-blue-600 text-blue-600 hover:text-white rounded-full p-3 md:p-4 shadow-lg transition-all duration-300 disabled:opacity-30 disabled:cursor-not-allowed z-10"
            aria-label="Previous slide"
          >
            <i class="fas fa-chevron-left text-lg md:text-xl"></i>
          </button>

          <button
            @click="nextSlide"
            :disabled="currentSlide >= maxSlide"
            class="absolute right-0 top-1/2 -translate-y-1/2 translate-x-4 md:translate-x-12 bg-white hover:bg-blue-600 text-blue-600 hover:text-white rounded-full p-3 md:p-4 shadow-lg transition-all duration-300 disabled:opacity-30 disabled:cursor-not-allowed z-10"
            aria-label="Next slide"
          >
            <i class="fas fa-chevron-right text-lg md:text-xl"></i>
          </button>

          <!-- Progress Bar -->
          <div class="mt-8 mx-auto max-w-md">
            <div class="h-2 bg-gray-200 rounded-full overflow-hidden">
              <div 
                class="h-full bg-blue-600 transition-all duration-300 rounded-full"
                :style="{ width: `${progress}%` }"
              ></div>
            </div>
            <div class="text-center mt-2 text-sm text-gray-600">
              {{ currentSlide + 1 }} / {{ maxSlide + 1 }}
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Statistics Section -->
    <section class="py-16 bg-white">
    <div class="container mx-auto px-4">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-center">
        <!-- Years of Expertise -->
        <div>
          <div class="text-5xl font-black text-blue-600">45</div>
          <div class="mt-2 text-2xl font-semibold text-gray-700">
            Years of Expertise
          </div>
        </div>

        <!-- Number of Visitors (Dynamic) -->
        <div>
          <div class="text-5xl font-black text-blue-600">
            {{ visitorCount.toLocaleString() }}
          </div>
          <div class="mt-2 text-2xl font-semibold text-gray-700">
            Number of Visitors
          </div>
        </div>

        <!-- Companies Served -->
        <div>
          <div class="text-5xl font-black text-blue-600">33</div>
          <div class="mt-2 text-2xl font-semibold text-gray-700">
            Companies Served
          </div>
        </div>
      </div>
    </div>
  </section>
  </div>
  <div>
    <Footer />
  </div>
</template>

<script setup>
import { Link } from '@inertiajs/vue3';
import { ref, onMounted, onUnmounted, computed } from 'vue'
import { useHead } from '@vueuse/head'; // for Search Engine Optimization (SEO)
import { OrbitSpinner } from "epic-spinners"; // Loading Spinner
import { router } from "@inertiajs/vue3";

import Header from '@/layouts/Header.vue';
import Footer from '@/layouts/Footer.vue';
import Chatbot from '@/layouts/Chatbot.vue'; 

import axios from 'axios'
import AOS from 'aos';
import 'aos/dist/aos.css';
AOS.init();

const isLoading = ref(false);

// Inertia starts loading
router.on("start", () => {
  isLoading.value = true;
});

// Inertia finishes loading
router.on("finish", () => {
  isLoading.value = false;
});

// ADD SEO META TAGS
useHead({
  title: 'James Polymers Manufacturing Corporation - Leading Polymer Solutions Provider',
  meta: [
    {
      name: 'description',
      content: 'James Polymers Manufacturing Corporation delivers high-performance polymer compounds with over 45 years of expertise. Specializing in thermoplastic materials, molded rubber compounds, and engineering plastics for aerospace, automotive, medical, and industrial applications.'
    },
    {
      name: 'keywords',
      content: 'polymer compounds, thermoplastic materials, engineering plastics, molded rubber, master batch resin, polymer manufacturing, Philippines, ISO certified, James Polymers, TPE compounds, industrial polymers'
    },
    // Open Graph / Facebook
    {
      property: 'og:type',
      content: 'website'
    },
    {
      property: 'og:title',
      content: 'James Polymers Manufacturing Corporation - Leading Polymer Solutions'
    },
    {
      property: 'og:description',
      content: 'High-performance polymer compounds tailored to your specific requirements with over 45 years of expertise in thermoplastic materials and engineering plastics.'
    },
    {
      property: 'og:image',
      content: '/storage/assets/img/certifications/cert.png'
    },
    {
      property: 'og:url',
      content: 'https://jamespolymers.com' // domain link
    },
    // Twitter
    {
      name: 'twitter:card',
      content: 'summary_large_image'
    },
    {
      name: 'twitter:title',
      content: 'James Polymers Manufacturing Corporation'
    },
    {
      name: 'twitter:description',
      content: 'Leading provider of high-performance polymer compounds with 45+ years of expertise'
    },
    {
      name: 'twitter:image',
      content: '/storage/assets/img/certifications/cert.png'
    },
    // Additional SEO
    {
      name: 'author',
      content: 'James Polymers Manufacturing Corporation'
    },
    {
      name: 'robots',
      content: 'index, follow'
    },
    {
      name: 'googlebot',
      content: 'index, follow'
    }
  ],
  link: [
    {
      rel: 'canonical',
      href: 'https://jamespolymers.com' // Domain URL
    }
  ],
  script: [
    {
      type: 'application/ld+json',
      children: JSON.stringify({
        "@context": "https://schema.org",
        "@type": "Organization",
        "name": "James Polymers Manufacturing Corporation",
        "description": "Leading manufacturer of high-performance polymer compounds",
        "url": "https://jamespolymers.com", // Domain URL
        "logo": "/storage/assets/img/logo-whitebg.png",
        "foundingDate": "1978",
        "address": {
          "@type": "PostalAddress",
          "streetAddress": "016 Panapaan II, Bacoor City, Cavite", 
          "addressLocality": "Bacoor City",
          "addressRegion": "Cavite",
          "postalCode": "4102", 
          "addressCountry": "PH"
        },
        "contactPoint": {
          "@type": "ContactPoint",
          "contactType": "Customer Service",
          "telephone": "+63-2-852989785", 
          "email": "jamespolymers.international@gmail.com",
          "availableLanguage": ["en", "fil"]
        },
        "sameAs": [
          "https://www.facebook.com/JamesPolymersMfg.International",
          "https://www.linkedin.com/in/jgeintl/"
        ]
      })
    }
  ]
});

const heading = computed(() => props.customersHeading);
const subheading = computed(() => props.customersSubheading);

// Add this to your Home.vue script setup section
const props = defineProps({
  products: {
    type: Array,
    default: () => []
  },
  services: {
    type: Array,
    default: () => []
  },
  customers: {
    type: Array,
    default: () => []
  },
  customersHeading: {
    type: String,
    default: 'Our Valued Customers'
  },
  customersSubheading: {
    type: String,
    default: "We're proud to partner with industry leaders."
  }
});

const layout = ref([
  [ 1],
  [2, 3, null],
  [null, 4, 5, 6, null],
  [ 7, 8, 9, 10, null],
  [11, 12, 13, 14, 15],
]);

// Customer logos from backend
const allCustomerLogos = computed(() => {
  return props.customers.map(customer => `storage/${customer.logo_url}`);
});

// Carousel state
const currentSlide = ref(0);
const cardWidth = ref(280); // Width of each card + padding
const visibleCards = ref(4); // Number of visible cards at once

// Computed properties
const slideWidth = computed(() => cardWidth.value);
const maxSlide = computed(() => Math.max(0, allCustomerLogos.value.length - visibleCards.value));
const progress = computed(() => {
  if (maxSlide.value === 0) return 100;
  return ((currentSlide.value / maxSlide.value) * 100);
});

// Navigation functions
const nextSlide = () => {
  if (currentSlide.value < maxSlide.value) {
    currentSlide.value++;
  }
};

const prevSlide = () => {
  if (currentSlide.value > 0) {
    currentSlide.value--;
  }
};

// Handle responsive card visibility
const updateVisibleCards = () => {
  const width = window.innerWidth;
  if (width < 640) {
    visibleCards.value = 1;
    cardWidth.value = 240;
  } else if (width < 768) {
    visibleCards.value = 2;
    cardWidth.value = 260;
  } else if (width < 1024) {
    visibleCards.value = 3;
    cardWidth.value = 270;
  } else {
    visibleCards.value = 4;
    cardWidth.value = 280;
  }
  // Reset to first slide if current position is invalid
  if (currentSlide.value > maxSlide.value) {
    currentSlide.value = maxSlide.value;
  }
};

const visitorCount = ref(0)

const fetchVisitorCount = async () => {
  try {
    const res = await axios.get('/api/visitors/count')
    visitorCount.value = res.data.count
  } catch (err) {
    console.error('Error fetching visitor count:', err)
  }
}

const incrementVisitorCount = async () => {
  try {
    const res = await axios.post('/api/visitors/increment')
    visitorCount.value = res.data.count
  } catch (err) {
    console.error('Error incrementing visitor count:', err)
  }
}

/* -------------------------
   Lifecycle: mount AOS + fetch data
   ------------------------- */
let aosRefreshHandler = null;

onMounted(async () => {
  // increment & fetch visitors (your existing behavior)
  await incrementVisitorCount()
  await fetchVisitorCount()

  // init AOS (ensure AOS and its css are imported)
  AOS.init({
    duration: 800,
    once: true,
    // easing: 'ease-out-cubic' // optional
  });

  AOS.refresh();

  // Also call refresh on window load in case media/images change layout after initial mount
  aosRefreshHandler = () => AOS.refresh();
  window.addEventListener('load', aosRefreshHandler);

  // Add carousel resize handler
  updateVisibleCards();
  window.addEventListener('resize', updateVisibleCards);
});


onUnmounted(() => {
  if (aosRefreshHandler) {
    window.removeEventListener('load', aosRefreshHandler);
    aosRefreshHandler = null;
  }
});

/* -------------------------
   Data arrays (unchanged)
   ------------------------- */
const categories = [
  {
    image: '/storage/assets/home/Thermoplastic.png',
    title: 'Thermoplastic Materials & Engineering Plastics',
    description: 'High-performance TPE compounds offering excellent flexibility, durability, and processing characteristics for diverse applications.',
    section: 'plastic'  // ADD THIS
  },
  {
    image: '/storage/assets/home/Molded.png',
    title: 'Molded Rubber Compounds',
    description: 'Specialized compounds designed for demanding mechanical, thermal, and chemical resistance applications.',
    section: 'rubber'  // ADD THIS
  },
  {
    image: '/storage/assets/home/Resin.png',
    title: 'Master Batch of Resin',
    description: 'Tailored polymer solutions developed to meet your specific performance, regulatory, and processing requirements.',
    section: 'custom'  // ADD THIS
  },
  {
    image: '/storage/assets/home/Services.png',
    title: 'Engineering, Design & Technical Services',
    description: 'Comprehensive support including material selection, testing, processing optimization, and troubleshooting.',
    section: 'services'  // ADD THIS
  }
];

const industries = [
  {
    icon: 'fa-plane',
    title: 'Aerospace',
    description: 'High-performance materials for aircraft interiors and components.'
  },
  {
    icon: 'fa-car',
    title: 'Automotive',
    description: 'Lightweight, durable materials for interior, exterior, and under-the-hood applications.'
  },
  {
    icon: 'fa-home',
    title: 'Consumer',
    description: 'High-performance materials for appliances, tools, and household products.'
  },
  {
    icon: 'fa-microchip',
    title: 'Electronics',
    description: 'Specialized compounds with electrical properties and flame retardancy.'
  },
  {
    icon: 'fa-cogs',
    title: 'Industrial',
    description: 'Robust materials for machinery, fluid handling, and industrial components.'
  },
  {
    icon: 'fa-medkit',
    title: 'Medical',
    description: 'Biocompatible, sterilizable compounds for devices and equipment.'
  }
];

const recognitionAwards = [
  {
    icon: 'fa-trophy',
    title: 'Best in Environmental Management System Award (2007)',
    description: 'Awarded by Panasonic Manufacturing Philippines Corporation (PMPC) and Panasonic Communication Philippines Corporation, this recognition honors outstanding environmental practices from April 2006 to March 2007.'
  },
  {
    icon: 'fa-trophy',
    title: 'Preferred Supplier (2011)',
    description: 'Given this 3rd day of May 2011 at Bayanihan Center, United Laboratories Inc.'
  },
  {
    icon: 'fa-certificate',
    title: 'Golden Globe Annual Awards for Business Excellence - BEST (2023)',
    description: 'Recognized in 2023 by the Golden Globe Annual Awards for Business Excellence, this prestigious award highlights exceptional performance, innovation, and business leadership in the industry.'
  },
  {
    icon: 'fa-certificate',
    title: 'ISO 14001:2015 & ISO 9001:2015 Recertification (2025)',
    description: 'Achieving this reflects our dedication to sustainable operations and adherence to international standards for quality, consistency, and continuous improvement.'
  }
];
</script>


<style scoped>


/* Spinner */
.spinner-wrapper {
  position: fixed;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(255,255,255,0.8);
  z-index: 9999;
}

.loading-overlay {
  position: fixed;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(255, 255, 255, 0.322);
  z-index: 99999;
}


/* Responsive */
@media (max-width: 1015px) {
  .hexagon {
    width: 80px;
    height: 90px;
  }
  .hex-inner {
    width: 68px;
    height: 78px;
  }
  .hex-row {
    margin-bottom: -10px;
  }
  .hex-row.offset {
    transform: translateX(40px);
  }
}

@media (max-width: 640px) {
  .hexagon {
    width: 50px;
    height: 60px;
  }
  .hex-inner {
    width: 48px;
    height: 58px;
  }
  .hex-row {
    margin-bottom: -10px;
  }
  .hex-row.offset {
    transform: translateX(25px);
  }
}

/* Infinite Scroll Animation */
@keyframes scroll {
  0% {
    transform: translateX(0);
  }
  100% {
    transform: translateX(-150%);
  }
}

.animate-scroll {
  animation: scroll 10s linear infinite;
}

.animate-scroll:hover,
.pause-animation:hover {
  animation-play-state: paused;
}

/* Responsive adjustments */
@media (max-width: 640px) {
  .animate-scroll > div {
    width: 12rem !important;
    margin-left: 0.75rem !important;
    margin-right: 0.75rem !important;
  }
}
</style>


