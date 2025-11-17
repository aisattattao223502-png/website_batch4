<template>

    <div>
        <Header />
    </div>
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
                <Link href="/products" class="text-blue-600 font-semibold hover:text-blue-800 transition">
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
          <div v-for="(industry, index) in industries" :key="index" class="bg-gray-50 rounded-lg p-6 text-center transition duration-300 hover:shadow-lg hover:scale-105">
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


    <section class="py-16 bg-white">
    <div class="container mx-auto px-4">
      <h2 class="text-3xl md:text-4xl font-bold text-center text-gray-800 mb-4">
        Our Valued Customers
      </h2>
      <p class="text-xl text-center text-gray-600 max-w-3xl mx-auto mb-12">
        We're proud to partner with industry leaders across various sectors, providing them with high-performance polymer solutions.
      </p>

      <!-- Honeycomb Layout -->
<div class="hex-wrapper">
  <div
    v-for="(row, rowIndex) in layout"
    :key="rowIndex"
    class="hex-row"
    :class="{ offset: rowIndex % 2 !== 0 }"
  >
    <!-- Check if cell is NOT null -->
    <div
      v-for="(cell, cellIndex) in row"
      :key="cellIndex"
    >
      <div
        v-if="cell !== null"
        class="hexagon"
        data-aos="flip-right"
        :data-aos-delay="(rowIndex * 5 + cellIndex) * 5"
      >
        <div class="hex-inner">
          <img
            v-if="logos[cell]"
            :src="logos[cell]"
            alt="Customer Logo"
          />
          <span v-else class="coming-soon">Coming Soon</span>
        </div>
      </div>

      <!-- When the cell IS null -->
      <div v-else class="hexagon-invisible">
        <div class="hex-inner"></div>
      </div>
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
import axios from 'axios'
import { ref, onMounted, onUnmounted } from 'vue'
import Header from '../../layouts/Header.vue';
import Footer from '../../layouts/Footer.vue';



const heading = ref("Our Valued Customers");
const subheading = ref(
  "We're proud to partner with industry leaders across various sectors, providing them with high-performance polymer solutions."
);

const layout = ref([
  [ 1],
  [2, 3, null],
  [null, 4, 5, 6, null],
  [ 7, 8, 9, 10, null],
  [11, 12, 13, 14, 15],
]);

const logos = {
  1: "storage/assets/home/3M.png",
  2: "storage/assets/home/Unilab.png",
  3: "storage/assets/home/APC.png",
  4: "storage/assets/home/Carrier.png",
  5: "storage/assets/home/Panasonic.png",
  6: "storage/assets/home/Koppel.png",
  7: "storage/assets/home/Dutch.png",
  8: "storage/assets/home/WB.png",
  9: "storage/assets/home/ACS.png",
  10: "storage/assets/home/Purefoods.png",
  11: "storage/assets/home/Condura.png",
  12: "storage/assets/home/Continental.png",
  14: "storage/assets/home/coming_soon.png",
  13: "storage/assets/home/coming_soon.png",
  15: "storage/assets/home/coming_soon.png",
};

const visitorCount = ref(0)

const fetchVisitorCount = async () => {
  try {
    const res = await axios.get('/visitors/get')
    visitorCount.value = res.data.count
  } catch (err) {
    console.error('Error fetching visitor count:', err)
  }
}

const incrementVisitorCount = async () => {
  try {
    const res = await axios.post('/visitors/increment')
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

  // Small extra: force a refresh after resources load to ensure all elements are picked up.
  // (useful when images/video or dynamic content affect layout)
  AOS.refresh();

  // Also call refresh on window load in case media/images change layout after initial mount
  aosRefreshHandler = () => AOS.refresh();
  window.addEventListener('load', aosRefreshHandler);
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
    title: 'Thermoplastic Elastomers',
    description: 'High-performance TPE compounds offering excellent flexibility, durability, and processing characteristics for diverse applications.'
  },
  {
    image: '/storage/assets/home/Molded.png',
    title: 'Engineering Plastics',
    description: 'Specialized compounds designed for demanding mechanical, thermal, and chemical resistance applications.'
  },
  {
    image: '/storage/assets/home/Resin.png',
    title: 'Custom Compounds',
    description: 'Tailored polymer solutions developed to meet your specific performance, regulatory, and processing requirements.'
  },
  {
    image: '/storage/assets/home/Services.png',
    title: 'Technical Services',
    description: 'Comprehensive support including material selection, testing, processing optimization, and troubleshooting.'
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
    title: '2022 Polymer Innovation Award',
    description: 'Recognized for our breakthrough in high-temperature resistant TPE compounds by the International Polymer Association.'
  },
  {
    icon: 'fa-trophy',
    title: '2021 Excellence in Sustainability',
    description: 'Awarded for our eco-friendly polymer series with 50% recycled content without compromising performance.'
  },
  {
    icon: 'fa-certificate',
    title: '2020 Supplier of the Year',
    description: 'Honored by our automotive clients for consistent quality and innovation in material solutions.'
  },
  {
    icon: 'fa-certificate',
    title: 'ISO 9001:2015 Certified',
    description: 'Our quality management system meets international standards for consistency and continuous improvement.'
  }
];
</script>


<style scoped>
.hex-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0;
}

/* Center rows properly */
.hex-row {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: -29px;
}

/* Fix staggered alignment */
.hex-row.offset {
  transform: translateX(75px);
}

/* Hex outer shell */
.hexagon {
  width: 150px;
  height: 165px;
  background: linear-gradient(135deg, #3b82f6, #10b981);
  clip-path: polygon(50% 0%, 93% 25%, 93% 75%, 50% 100%, 7% 75%, 7% 25%);
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 2px;
  transition: transform 0.3s ease;
}

.hexagon:hover {
  transform: scale(1.05) !important;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

/* Inner white part */
.hex-inner {
  width: 128px;
  height: 142px;
  background-color: white;
  clip-path: inherit;
  display: flex;
  align-items: center;
  justify-content: center;
}

.hex-inner img {
  max-width: 70%;
  max-height: 70%;
  object-fit: contain;
}

.coming-soon {
  color: #4caf50;
  font-weight: bold;
  font-size: 0.875rem;
  text-align: center;
}

.hexagon-invisible {
  opacity: none;
  pointer-events: none;
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
</style>


