<template>
  <Head title="Awards & Recognition | James Polymers">
    <link rel="icon" type="image/png" href="/storage/assets/img/tab_icon.png">
  </Head>

  <Chatbot />

  <div>
    <!-- Header -->
    <Header />

    <!-- Floating Watermark -->
    <img 
      src="/storage/assets/img/JP_BG_WATERMARK_CIRCLE.png" 
      alt="JP Watermark" 
      class="fixed bottom-0 left-0 w-full h-auto opacity-40 pointer-events-none select-none transition-opacity duration-500 ease-in-out z-0"
    >

    <!-- Hero Section -->
    <section
      class="relative bg-blue-400 h-64 md:h-80 lg:h-96 flex items-center justify-center bg-cover bg-center mt-[14vh]"
      style="background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://www.james-polymers.com/wp-content/uploads/2021/09/awards-banner.jpg')"
    >
      <!-- Inclined overlay image -->
      <img
        src="/storage/assets/img/banners/trophies_banner.png"
        alt="Inclined Overlay"
        class="absolute inset-0 w-full h-full object-cover"
        style="mix-blend-mode: multiply; opacity: 1;"
      >

      <div class="container mx-auto px-4 text-center text-white relative z-10">
        <h1 class="text-3xl md:text-4xl lg:text-5xl font-bold mb-4">Awards & Recognition</h1>
        <div class="flex justify-center items-center text-sm md:text-base">
          <Link href="/" class="text-white hover:text-blue-300 transition">Home</Link>
          <span class="mx-2">/</span>
          <span class="text-blue-300">Awards</span>
        </div>
      </div>
    </section>

    <!-- Awards Section -->
    <section class="py-12 md:py-16 bg-white relative z-10">
      <div class="container mx-auto px-4">
        <div class="text-center mb-12 md:mb-16">
          <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-800 mb-4">Our Achievements</h2>
          <p class="text-gray-600 max-w-3xl mx-auto text-sm md:text-base">
            James Polymers has been recognized for excellence in polymer innovation, manufacturing, and business performance by prestigious industry organizations.
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
          <div
            v-for="(award, index) in sortedAwards"
            :key="award.id"
            @click="openAwardModal(award)"
            data-aos="zoom-in"
            :data-aos-delay="index * 50"
            class="award-card bg-white rounded-lg shadow-md p-4 md:p-6 cursor-pointer flex flex-col hover:shadow-xl transition-shadow duration-300"
          >
            <!-- Header with Icon/Title -->
            <div class="flex items-start mb-4">
              <div v-if="!award.image" class="bg-primary bg-opacity-10 p-3 rounded-full mr-4 flex-shrink-0">
                <i :class="`fas ${award.icon} text-primary text-xl md:text-2xl`"></i>
              </div>
              <div class="flex-1">
                <h3 class="text-lg md:text-xl font-bold text-gray-800 line-clamp-2">{{ award.title }}</h3>
              </div>
            </div>

            <!-- Image Section -->
            <div v-if="award.image" class="mb-4 flex-shrink-0">
              <img
                :src="`/storage/assets/img/awards/${award.image}`"
                :alt="award.title"
                class="w-full h-40 md:h-48 object-cover rounded-lg award-image"
              >
            </div>

            <!-- Description Section - Fixed Height -->
            <div class="flex-1 mb-4">
              <p v-if="award.description" class="text-gray-600 text-sm line-clamp-4 h-20 overflow-hidden">
                {{ award.description }}
              </p>
              <div v-else class="h-20"></div>
            </div>

            <!-- Year Section - Fixed at Bottom -->
            <div v-if="award.year" class="mt-auto">
              <div class="flex items-center text-sm text-gray-500">
                <i class="far fa-calendar-alt mr-2"></i>
                <span>{{ award.year }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Modal for Award Details -->
<Teleport to="body">
  <Transition name="modal">
    <div
      v-if="showModal"
      class="fixed inset-0 z-[10000] bg-black bg-opacity-50 p-4 overflow-y-auto flex items-center justify-center"
      @click.self="closeAwardModal"
    >
      <div class="bg-white rounded-2xl shadow-2xl max-w-4xl w-full max-h-[85vh] flex flex-col my-auto relative">
        <!-- Modal Header - Fixed -->
        <div class="flex-shrink-0 bg-white border-b px-4 md:px-6 py-4 flex justify-between items-start rounded-t-2xl sticky top-0 z-10">
          <h3 class="text-base md:text-lg lg:text-xl font-bold text-gray-800 pr-8 flex-1 leading-tight">
            {{ selectedAward?.title }}
          </h3>
          <button
            @click="closeAwardModal"
            class="text-gray-500 hover:text-gray-800 transition flex-shrink-0"
            aria-label="Close modal"
          >
            <i class="fas fa-times text-xl md:text-2xl"></i>
          </button>
        </div>

        <!-- Modal Body - Scrollable -->
        <div class="flex-1 overflow-y-auto p-4 md:p-6 lg:p-8">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6 md:gap-8">
            <!-- Image -->
            <div v-if="selectedAward?.image" class="flex items-start justify-center">
              <img
                :src="`/storage/assets/img/awards/${selectedAward.image}`"
                :alt="selectedAward.title"
                class="w-full h-auto max-h-[400px] object-contain rounded-lg"
              >
            </div>
            <div v-else class="flex items-center justify-center bg-gray-100 rounded-lg h-64 md:h-96">
              <i :class="`fas ${selectedAward?.icon} text-primary text-6xl md:text-8xl`"></i>
            </div>

            <!-- Details -->
            <div class="flex flex-col space-y-4">
              <div v-if="selectedAward?.description">
                <h4 class="font-bold text-gray-800 mb-2 text-sm md:text-base">Description:</h4>
                <p class="text-gray-700 text-sm md:text-base leading-relaxed">
                  {{ selectedAward.description }}
                </p>
              </div>
              
              <div v-if="selectedAward?.event_title">
                <h4 class="font-bold text-gray-800 mb-2 text-sm md:text-base">Event:</h4>
                <p class="text-gray-600 text-sm md:text-base">{{ selectedAward.event_title }}</p>
              </div>

              <div v-if="selectedAward?.year" class="flex items-center text-sm md:text-base text-gray-500 pt-2">
                <i class="far fa-calendar-alt mr-2"></i>
                <span class="font-semibold">{{ selectedAward.year }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </Transition>
</Teleport>

    <!-- Timeline Section -->
    <section class="py-12 md:py-16 bg-gray-50 relative z-10">
      <div class="container mx-auto px-4">
        <div class="text-center mb-12 md:mb-16">
          <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-800 mb-4">Our Journey</h2>
          <p class="text-gray-600 max-w-3xl mx-auto text-sm md:text-base">
            Milestones and recognitions that mark our commitment to excellence in polymer solutions.
          </p>
        </div>

        <div class="relative max-w-4xl mx-auto">
          <div
            v-for="(item, index) in timeline"
            :key="item.id"
            data-aos="fade-up"
            :data-aos-delay="index * 100"
            class="relative timeline-item pl-12 md:pl-16 mb-8 md:mb-12"
          >
            <div class="absolute left-0 top-0 flex items-center justify-center w-10 h-10 md:w-12 md:h-12 rounded-full bg-primary text-white">
              <i :class="`fas ${item.icon} text-lg md:text-xl`"></i>
            </div>
            <div class="bg-white p-4 md:p-6 rounded-lg shadow-md hover:shadow-xl transition-shadow">
              <h3 class="text-lg md:text-xl font-bold text-gray-800 mb-2">{{ item.title }}</h3>
              <div class="flex items-center text-xs md:text-sm text-gray-500 mb-3">
                <i class="far fa-calendar-alt mr-2"></i>
                <span>{{ formatDate(item.date) }}</span>
              </div>
              <p class="text-gray-600 text-sm md:text-base">{{ item.description }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="relative py-12 md:py-16 lg:py-20 text-white">
      <!-- Background image with opacity -->
      <div class="absolute inset-0">
        <img
          src="/storage/assets/img/banners/trophies_cta.png"
          alt="Banner Background"
          class="w-full h-full object-cover opacity-80"
        >
        <!-- Optional banner color overlay -->
        <div class="absolute inset-0 bg-primary opacity-60"></div>
      </div>

      <!-- Content -->
      <div class="relative container mx-auto px-4 text-center z-10">
        <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold mb-4 md:mb-6">
          Partner with an Award-Winning Polymer Solutions Provider
        </h2>
        <p class="text-base md:text-lg lg:text-xl mb-6 md:mb-8 max-w-3xl mx-auto">
          Our recognized expertise ensures you get the highest quality polymer solutions for your specific needs.
        </p>
        <div class="flex flex-col sm:flex-row justify-center gap-4">
          <Link
            href="/contact"
            class="bg-white text-primary font-bold py-3 px-6 md:px-8 rounded-lg hover:bg-gray-100 transition duration-300 text-sm md:text-base"
          >
            Contact Us
          </Link>
          <a
            href="tel:+63285298978"
            class="bg-transparent border-2 border-white text-white font-bold py-3 px-6 md:px-8 rounded-lg hover:bg-white hover:text-primary transition duration-300 text-sm md:text-base"
          >
            Call Us Now
          </a>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <Footer />
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue';
import { Head, Link } from '@inertiajs/vue3';
import Header from '@/layouts/Header.vue';
import Footer from '@/layouts/Footer.vue';
import Chatbot from '@/layouts/Chatbot.vue';

import AOS from 'aos';
import 'aos/dist/aos.css';

const showModal = ref(false);
const selectedAward = ref(null);

// Hardcoded Awards Data from SQL
// Define props to receive data from backend
const props = defineProps({
    awards: {
        type: Array,
        default: () => []
    },
    timeline: {
        type: Array,
        default: () => []
    }
});

// Use props data instead of hardcoded
const awards = computed(() => props.awards);
const timeline = computed(() => props.timeline);

// Sort awards alphabetically by title, but keep "All Awards" at the end
const sortedAwards = computed(() => {
  const allAwardsItem = awards.value.find(award => award.title === 'All Awards');
  const otherAwards = awards.value.filter(award => award.title !== 'All Awards');
  
  const sorted = otherAwards.sort((a, b) => {
    return a.title.localeCompare(b.title);
  });
  
  return allAwardsItem ? [...sorted, allAwardsItem] : sorted;
});

const openAwardModal = (award) => {
  selectedAward.value = award;
  showModal.value = true;
  document.body.style.overflow = 'hidden';
};

const closeAwardModal = () => {
  showModal.value = false;
  selectedAward.value = null;
  document.body.style.overflow = '';
};

const formatDate = (dateString) => {
  const date = new Date(dateString);
  return date.toLocaleDateString('en-US', { month: 'long', year: 'numeric' });
};

// Close modal on ESC key
const handleEscape = (e) => {
  if (e.key === 'Escape' && showModal.value) {
    closeAwardModal();
  }
};

onMounted(() => {
  AOS.init({
    duration: 800,
    once: true,
    offset: 100
  });

  document.addEventListener('keydown', handleEscape);
});

onUnmounted(() => {
  document.removeEventListener('keydown', handleEscape);
  document.body.style.overflow = '';
});
</script>

<style scoped>
.bg-primary {
  background-color: #0066cc;
}

.text-primary {
  color: #0066cc;
}

.hover\:text-primary:hover {
  color: #0066cc;
}

.line-clamp-2 {
  display: -webkit-box;
  /* autoprefixer: ignore next */
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.line-clamp-4 {
  display: -webkit-box;
  /* autoprefixer: ignore next */
  -webkit-box-orient: vertical;
  overflow: hidden;
}

/* Award card hover effect */
.award-card {
  transition: all 0.3s ease;
}

.award-card:hover {
  transform: translateY(-5px);
}

.award-image {
  transition: transform 0.3s ease;
}

.award-card:hover .award-image {
  transform: scale(1.05);
}

/* Timeline styling */
.timeline-item::before {
  content: '';
  position: absolute;
  left: 1.25rem;
  top: 3rem;
  bottom: -2rem;
  width: 2px;
  background: linear-gradient(to bottom, #0066cc, #e5e7eb);
}

.timeline-item:last-child::before {
  display: none;
}

@media (min-width: 768px) {
  .timeline-item::before {
    left: 1.5rem;
  }
}

/* Modal Transitions */
.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.3s ease;
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}

.modal-enter-active > div,
.modal-leave-active > div {
  transition: transform 0.3s ease;
}

.modal-enter-from > div {
  transform: scale(0.9);
}

.modal-leave-to > div {
  transform: scale(0.9);
}

/* Smooth scrolling for modal */
@media (max-width: 768px) {
  .max-h-\[90vh\] {
    max-height: 95vh;
  }
}

/* Custom scrollbar for modal */
.overflow-y-auto::-webkit-scrollbar {
  width: 8px;
}

.overflow-y-auto::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 10px;
}

.overflow-y-auto::-webkit-scrollbar-thumb {
  background: #888;
  border-radius: 10px;
}

.overflow-y-auto::-webkit-scrollbar-thumb:hover {
  background: #555;
}
</style>