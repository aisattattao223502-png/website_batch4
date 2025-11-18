<template>
  <Head title="Overview Process | James Polymers - High Performance Polymer Solutions">
    <link rel="icon" type="image/png" href="/storage/assets/img/tab_icon.png">
  </Head>

  <div>
    <!-- Header -->
    <Header />

    <!-- Floating Watermark -->
    <img 
      src="/storage/assets/img/JP_BG_WATERMARK_CIRCLE.png" 
      alt="JP Watermark" 
      class="fixed inset-0 w-full h-full object-cover opacity-20 pointer-events-none select-none transition-opacity duration-500 ease-in-out z-0"
    >

    <!-- Hero Section -->
    <section
      class="relative bg-blue-400 h-64 md:h-80 lg:h-96 flex items-center justify-center bg-cover bg-center mt-[14vh]"
      style="background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('/storage/assets/img/banners/overview_banner.jpg')"
    >
      <!-- Inclined overlay image -->
      <img
        src="/storage/assets/img/banners/overview_banner.jpg"
        alt="Inclined Overlay"
        class="absolute inset-0 w-full h-full object-cover"
        style="mix-blend-mode: multiply; opacity: 1;"
      >

      <div class="container mx-auto px-4 text-center text-white relative z-10">
        <h1 class="text-3xl md:text-4xl lg:text-5xl font-bold mb-4">{{ headerTitle }}</h1>
      </div>
    </section>

    <!-- Dynamic Overview Title & Description -->
    <div class="w-full my-8 md:my-10 px-4 md:px-12 py-6 text-center relative z-10">
      <h2 class="text-2xl md:text-3xl my-4 font-bold text-gray-800">{{ overviewHeading }}</h2>
      <h3 class="max-w-3xl mx-auto text-base md:text-lg text-gray-700">{{ overviewDescription }}</h3>
    </div>

    <!-- Toggle Buttons -->
    <div class="flex justify-center mt-6 md:mt-8 space-x-3 md:space-x-4 px-4 relative z-10">
      <button 
        @click="showProcess('plastic')"
        :class="[
          'font-bold px-6 md:px-10 py-2 border rounded-full transition duration-300 text-sm md:text-base',
          activeProcess === 'plastic' 
            ? 'bg-blue-700 text-white' 
            : 'bg-white text-gray-700 hover:bg-blue-700 hover:text-white'
        ]"
      >
        Plastic Injection
      </button>

      <button 
        @click="showProcess('rubber')"
        :class="[
          'font-bold px-6 md:px-10 py-2 border rounded-full transition duration-300 text-sm md:text-base',
          activeProcess === 'rubber' 
            ? 'bg-blue-700 text-white' 
            : 'bg-white text-gray-700 hover:bg-blue-700 hover:text-white'
        ]"
      >
        Rubber Molding
      </button>
    </div>

    <!-- Dynamic Content -->
    <div class="p-4 md:p-6 max-w-5xl mx-auto mt-6 md:mt-8 relative z-10">
      <!-- Plastic Section -->
      <Transition name="fade" mode="out-in">
        <div v-if="activeProcess === 'plastic'" key="plastic" class="space-y-6 md:space-y-8">
          <div 
            v-for="(item, index) in plasticProcesses" 
            :key="index"
            class="bg-white rounded-lg shadow-md p-4 md:p-6 hover:shadow-xl transition-shadow duration-300"
          >
            <h3 class="px-4 md:px-10 pt-4 md:pt-6 text-xl md:text-2xl font-bold text-gray-800 mb-3">
              {{ item.title }}
            </h3>
            <p class="px-4 md:px-10 text-base md:text-lg text-gray-700 mt-2 mb-4 whitespace-pre-line">
              {{ item.description }}
            </p>
            <div v-if="item.image" class="px-4 md:px-10 pb-4 md:pb-6 mt-4">
              <img
                :src="`/storage/assets/img/overview_process/${item.image}`"
                :alt="item.title"
                class="w-full border rounded cursor-pointer hover:scale-105 transition-transform duration-300"
                @click="openImageModal(`/storage/assets/img/overview_process/${item.image}`, item.title)"
              >
            </div>
          </div>
        </div>

        <!-- Rubber Section -->
        <div v-else key="rubber" class="space-y-6 md:space-y-8">
          <div 
            v-for="(item, index) in rubberProcesses" 
            :key="index"
            class="bg-white rounded-lg shadow-md p-4 md:p-6 hover:shadow-xl transition-shadow duration-300"
          >
            <h3 class="px-4 md:px-10 pt-4 md:pt-6 text-xl md:text-2xl font-bold text-gray-800 mb-3">
              {{ item.title }}
            </h3>
            <p class="px-4 md:px-10 text-base md:text-lg text-gray-700 mt-2 mb-4 whitespace-pre-line">
              {{ item.description }}
            </p>
            <div v-if="item.image" class="px-4 md:px-10 pb-4 md:pb-6 mt-4">
              <img
                :src="`/storage/assets/img/overview_process/${item.image}`"
                :alt="item.title"
                class="w-full border rounded cursor-pointer hover:scale-105 transition-transform duration-300"
                @click="openImageModal(`/storage/assets/img/overview_process/${item.image}`, item.title)"
              >
            </div>
          </div>
        </div>
      </Transition>

      <!-- No Data Messages -->
      <div v-if="activeProcess === 'plastic' && plasticProcesses.length === 0" class="text-center py-12">
        <p class="text-gray-500 italic text-base md:text-lg">No plastic injection process data available.</p>
      </div>

      <div v-if="activeProcess === 'rubber' && rubberProcesses.length === 0" class="text-center py-12">
        <p class="text-gray-500 italic text-base md:text-lg">No rubber molding process data available.</p>
      </div>
    </div>

    <!-- Fullscreen Image Modal -->
    <Teleport to="body">
      <Transition name="modal">
        <div
          v-if="showModal"
          class="fixed inset-0 bg-black bg-opacity-80 flex items-center justify-center z-50 p-4"
          @click="closeImageModal"
        >
          <button
            @click="closeImageModal"
            class="absolute top-4 right-4 text-white text-3xl md:text-4xl font-bold focus:outline-none hover:text-gray-300 transition z-10"
          >
            &times;
          </button>
          <div class="relative max-w-7xl max-h-[90vh] w-full">
            <img
              :src="modalImage"
              :alt="modalTitle"
              class="w-full h-auto max-h-[90vh] object-contain rounded shadow-2xl"
              @click.stop
            >
            <p v-if="modalTitle" class="text-white text-center mt-4 text-sm md:text-base">{{ modalTitle }}</p>
          </div>
        </div>
      </Transition>
    </Teleport>

    <!-- Footer -->
    <Footer />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import Header from '@/layouts/Header.vue';
import Footer from '@/layouts/Footer.vue';
import Chatbot from '@/layouts/Chatbot.vue';

// Hardcoded data from SQL
const headerTitle = ref('OVERVIEW PROCESS');

const overviewHeading = ref('Company Business Overview Process');
const overviewDescription = ref(
  'At James Polymers Manufacturing Corporation, our business process is designed to ensure efficiency, quality, and client satisfaction at every stage. From initial consultation to final delivery, we follow a structured approach that promotes transparency and results-driven action.'
);

const plasticProcesses = ref([
  {
    id: 1,
    title: 'Plastic Injection Process',
    description: `Plastic injection molding involves melting plastic pellets and injecting them into a mold cavity to form precise and durable parts. It's ideal for high-volume production of consistent plastic components.
The image below illustrates our plastic injection processing diagram.`,
    image: 'Plastic Injection Process Chart.png'
  }
]);

const rubberProcesses = ref([
  {
    id: 2,
    title: 'Rubber Molding Process',
    description: `Rubber molding involves shaping rubber material by applying heat and pressure within a mold cavity to produce flexible, resilient parts. It is commonly used for manufacturing seals, gaskets, and custom rubber components with excellent durability and performance. The image below illustrates our rubber molding processing diagram.`,
    image: 'Rubber Molding Process Chart.png'
  }
]);

// State management
const activeProcess = ref('plastic');
const showModal = ref(false);
const modalImage = ref('');
const modalTitle = ref('');

// Methods
const showProcess = (type) => {
  activeProcess.value = type;
};

const openImageModal = (imageSrc, title) => {
  modalImage.value = imageSrc;
  modalTitle.value = title;
  showModal.value = true;
  document.body.style.overflow = 'hidden';
};

const closeImageModal = () => {
  showModal.value = false;
  modalImage.value = '';
  modalTitle.value = '';
  document.body.style.overflow = '';
};
</script>

<style scoped>
/* Fade transition for content switching */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease, transform 0.3s ease;
}

.fade-enter-from {
  opacity: 0;
  transform: translateY(10px);
}

.fade-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}

/* Modal transitions */
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

/* Smooth scrolling */
html {
  scroll-behavior: smooth;
}

/* Image hover effect */
img.cursor-pointer:hover {
  filter: brightness(1.05);
}

/* Button active state */
button:active {
  transform: scale(0.98);
}

/* Responsive adjustments */
@media (max-width: 640px) {
  .container {
    padding-left: 1rem;
    padding-right: 1rem;
  }
}

@media (min-width: 768px) and (max-width: 1024px) {
  .container {
    padding-left: 2rem;
    padding-right: 2rem;
  }
}

/* Custom scrollbar */
::-webkit-scrollbar {
  width: 10px;
}

::-webkit-scrollbar-track {
  background: #f1f1f1;
}

::-webkit-scrollbar-thumb {
  background: #888;
  border-radius: 5px;
}

::-webkit-scrollbar-thumb:hover {
  background: #555;
}
</style>