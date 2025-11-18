<template>
  <Chatbot />
  <div>
    <Header :isHomepage="false" />
    
    <div class="bg-gray-50 overflow-x-hidden">
      
      <!-- Floating Logo Watermark -->
      <img 
        src="/storage/assets/img/JP_BG_WATERMARK_CIRCLE.png"
        alt="JP Watermark"
        class="fixed bottom-0 left-0 w-full h-auto opacity-60 pointer-events-none select-none transition-opacity duration-500 ease-in-out z-0" 
      />

      <!-- HERO SECTION -->
      <section
        data-aos="fade-down"
        class="relative bg-blue-400 h-auto flex items-center justify-center bg-cover bg-center mt-[15vh] py-16 sm:py-20 md:py-24 lg:py-32"
        style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://www.james-polymers.com/wp-content/uploads/2021/09/products-banner.jpg');"
      >
        <img
          src="/storage/assets/img/banners/about_banner.jpg"
          alt="Inclined Overlay"
          class="absolute inset-0 w-full h-full object-cover"
          style="mix-blend-mode: multiply; opacity: 1;"
        />
        <div class="relative z-10 text-center text-white px-4 sm:px-6 lg:px-8 max-w-5xl mx-auto">
          <h1 class="text-3xl sm:text-4xl md:text-5xl lg:text-6xl font-bold mb-4 sm:mb-6">
            Innovating Polymer & Rubber Solutions Since 1980
          </h1>
          <p class="text-lg sm:text-xl md:text-2xl mb-6 sm:mb-8">
            Driving progress through advanced polymer technologies and sustainable manufacturing practices
          </p>
          <div class="flex flex-col sm:flex-row justify-center gap-3 sm:gap-4" data-aos="fade-up" data-aos-delay="400">
            <a 
              href="#our-story" 
              class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 sm:px-8 rounded-lg transition duration-300 transform hover:scale-105 shadow-lg text-sm sm:text-base"
            >
              Explore Our Story
            </a>
            <Link 
              href="/contact" 
              class="bg-transparent border-2 border-white text-white font-bold py-3 px-6 sm:px-8 rounded-lg hover:bg-white hover:text-blue-700 transition duration-300 transform hover:scale-105 shadow-lg text-sm sm:text-base"
            >
              Contact Our Team
            </Link>
          </div>
        </div>
      </section>

      <!-- COMPANY PROFILE -->
      <section id="our-story" class="py-12 sm:py-16 lg:py-20 relative z-10" data-aos="fade-up">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-8 sm:mb-12 lg:mb-16">
            <span class="text-orange-600 font-bold text-3xl sm:text-4xl md:text-5xl lg:text-6xl leading-tight block mb-2">
              <span class="text-4xl sm:text-5xl md:text-6xl lg:text-7xl">W</span>e
              <span class="text-4xl sm:text-5xl md:text-6xl lg:text-7xl">W</span>ho
              <span class="text-4xl sm:text-5xl md:text-6xl lg:text-7xl">A</span>re
              <span class="font-semibold text-3xl sm:text-4xl md:text-5xl lg:text-6xl leading-snug text-gray-800 mb-3 sm:mb-4">
                as a Company...
              </span>
            </span>
            
            <p class="text-base sm:text-lg md:text-xl text-gray-600 max-w-3xl mx-auto px-4">
              For over three decades, James Polymers has been at the forefront of polymer innovation, delivering high-performance material solutions to industries worldwide.
            </p>
          </div>

          <div class="flex flex-col lg:flex-row gap-8 sm:gap-10 lg:gap-12 items-center">
            <!-- Image Column -->
            <div class="w-full lg:w-1/2" data-aos="fade-right">
              <div class="relative rounded-xl overflow-hidden shadow-2xl">
                <img 
                  src="/storage/assets/img/about/Company Profile.png"
                  alt="James Polymers Facility"
                  class="w-full h-[250px] sm:h-[300px] md:h-[350px] lg:h-[500px] object-cover transition-transform duration-500 hover:scale-105"
                />
                <div class="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent flex items-end p-4 sm:p-6">
                  <div class="text-white">
                    <h3 class="text-lg sm:text-xl font-bold">Our State-of-the-Art Manufacturing Facility</h3>
                    <p class="text-sm sm:text-base">ISO-certified production with cutting-edge technology</p>
                  </div>
                </div>
              </div>
            </div>

            <!-- Content Column -->
            <div class="w-full lg:w-1/2" data-aos="fade-left">
              <div class="prose max-w-none">
                <div class="text-justify text-sm sm:text-base text-gray-700 leading-relaxed space-y-4">
                  <p>
                    Founded in 1980, initially, it was drawn up to start with manufacturing rubber molded items and its allied products in as much as the founder's experience for almost fifteen years in the rubber industry had provided him enough technical and production know-how. Eventually, the operation was streamlined to start with plastic as its main product line and rubber as its support product.
                  </p>
                  <p>
                    As the company expanded its operation we added a new annex building to accommodate some of the additional injection machines and other equipment needed. We also maintained our rubber section in this building to cater those customers who seek our services in the rubber molding and lining jobs, be it on job-site or in-house.
                  </p>
                  <p>
                    James Polymers had acquired mold fabrication equipment including our latest machining center that could fabricate mold in a very short time and these are located in the old plant. These improvements enhance our capability to serve our customers better and faster. In our continuous effort to upgrade our operation, this company applied for ISO 14001 approved in 2004.
                  </p>
                </div>
              </div>

              <!-- Stats Cards -->
              <div class="mt-6 sm:mt-8 grid grid-cols-2 md:grid-cols-3 gap-3 sm:gap-4">
                <div class="bg-white rounded-lg shadow-md p-4 sm:p-6 text-center hover:shadow-xl transition-shadow duration-300">
                  <div class="text-3xl sm:text-4xl md:text-5xl font-black text-blue-600">45</div>
                  <div class="text-xs sm:text-sm md:text-base font-semibold text-gray-700 mt-1 sm:mt-2">Years Experience</div>
                </div>
                <div class="bg-white rounded-lg shadow-md p-4 sm:p-6 text-center hover:shadow-xl transition-shadow duration-300">
                  <div class="text-3xl sm:text-4xl md:text-5xl font-black text-blue-600">22</div>
                  <div class="text-xs sm:text-sm md:text-base font-semibold text-gray-700 mt-1 sm:mt-2">Employees</div>
                </div>
                <div class="bg-white rounded-lg shadow-md p-4 sm:p-6 text-center hover:shadow-xl transition-shadow duration-300 col-span-2 md:col-span-1">
                  <div class="text-3xl sm:text-4xl md:text-5xl font-black text-blue-600">33</div>
                  <div class="text-xs sm:text-sm md:text-base font-semibold text-gray-700 mt-1 sm:mt-2">Company Served</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- MISSION, VISION, VALUES -->
      <section id="principle" class="bg-gray-100 py-12 sm:py-16 lg:py-20 relative z-10" data-aos="fade-up">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-8 sm:mb-12 lg:mb-16">
            <span class="text-orange-600 font-bold text-3xl sm:text-4xl md:text-5xl lg:text-6xl block mb-2">
              <span class="text-4xl sm:text-5xl md:text-6xl lg:text-7xl">O</span>ur 
              <span class="text-4xl sm:text-5xl md:text-6xl lg:text-7xl">F</span>oundation
            </span>
            <h2 class="font-semibold text-3xl sm:text-4xl md:text-5xl lg:text-6xl text-gray-800 mb-3">
              <span class="lg:underline lg:underline-offset-[7px] lg:decoration-orange-600">Co</span>re Principles That Guide Us
            </h2>
            <p class="text-base sm:text-lg md:text-xl text-gray-600 max-w-3xl mx-auto px-4">
              The pillars that define our corporate identity and drive our decision-making
            </p>
          </div>

          <!-- Mission / Logo / Vision Section -->
          <div class="flex flex-col lg:flex-row gap-6 sm:gap-8">
            
            <!-- Mission -->
            <div class="w-full lg:w-1/3 bg-white p-6 sm:p-8 rounded-xl shadow-lg transition-transform duration-300 ease-in-out hover:scale-105" data-aos="fade-right">
              <div class="flex flex-col items-center mb-4 sm:mb-6">
                <div class="bg-blue-600 mb-3 sm:mb-4 flex items-center justify-center rounded-full w-16 h-16 sm:w-20 sm:h-20">
                  <img src="/storage/assets/img/icons/mission2.png" alt="Mission Icon" class="w-12 h-12 sm:w-14 sm:h-14 object-contain" />
                </div>
                <h3 class="text-xl sm:text-2xl font-bold text-gray-800 text-center">Our Mission</h3>
              </div>
              <div class="text-center text-sm sm:text-base text-gray-700 leading-relaxed">
                <p class="mb-3">
                  James Polymers Manufacturing is dedicated to achieving excellence in plastic injection molding and rubber compression molding processing in the industry by providing quality, service, and competitive pricing to our customers.
                </p>
                <p class="mb-3">
                  We aim to be internationally competitive in the world market by setting a milestone that will open a door of opportunities which will be wholly embraced and accepted by the international market and linger the eyes of Filipinos that we can also be a great leader in our own simple ways.
                </p>
                <p>
                  We aim to support long-term economic growth and progress in the regions where we operate, as well as caring for the environment and ensuring sustainable use of natural resources.
                </p>
              </div>
            </div>

            <!-- Logo -->
            <div class="w-full lg:w-1/2 flex items-center justify-center py-6 lg:py-0" data-aos="fade-up">
              <div class="bg-white p-5 sm:p-5 rounded-full shadow-lg border-4 sm:border-8 border-blue-600/10 overflow-hidden w-48 h-48 sm:w-64 sm:h-64 md:w-80 md:h-80 lg:w-96 lg:h-96 flex items-center justify-center">
                <img 
                  src="/storage/assets/img/header/logowhitebgfinal.png" 
                  alt="James Polymers Logo" 
                  class="w-full h-full object-cover scale-100"
                />
              </div>
            </div>

            <!-- Vision -->
            <div class="w-full lg:w-1/3 bg-white p-6 sm:p-8 rounded-xl shadow-lg transition-transform duration-300 ease-in-out hover:scale-105" data-aos="fade-left">
              <div class="flex flex-col items-center mb-4 sm:mb-6">
                <div class="bg-orange-600  mb-3 sm:mb-4 flex items-center justify-center rounded-full w-16 h-16 sm:w-20 sm:h-20">
                  <img src="/storage/assets/img/icons/vision1.png" alt="Vision Icon" class="w-12 h-12 sm:w-14 sm:h-14 object-contain transition-transform duration-300 ease-in-out hover:scale-110" />
                </div>
                <h3 class="text-xl sm:text-2xl font-bold text-gray-800 text-center">Our Vision</h3>
              </div>
              <div class="text-center text-sm sm:text-base text-gray-700 leading-relaxed">
                <p>
                  Achieve a profitable and growth-oriented organization satisfying its employees, customers, and community through continual improvement.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- TIMELINE / HISTORY -->
      <section id="history" class="py-12 sm:py-16 lg:py-20 relative z-10" data-aos="fade-up">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-8 sm:mb-12 lg:mb-16">
            <span class="text-orange-600 font-bold text-3xl sm:text-4xl md:text-5xl lg:text-6xl block mb-2">
              <span class="text-4xl sm:text-5xl md:text-6xl lg:text-7xl">O</span>ur
              <span class="text-4xl sm:text-5xl md:text-6xl lg:text-7xl">J</span>ourney
            </span>
            <h2 class="font-semibold text-3xl sm:text-4xl md:text-5xl lg:text-6xl text-gray-800 mb-3">
              <span class="lg:underline lg:underline-offset-[15px] lg:decoration-orange-600">Mi</span>lestones in Polymer Innovation
            </h2>
            <p class="text-base sm:text-lg md:text-xl text-gray-600 max-w-3xl mx-auto px-4">
              Key moments that shaped our company's growth and success
            </p>
          </div>

          <div class="relative max-w-4xl mx-auto">
            
            <!-- START label -->
            <div class="flex justify-center mb-8 sm:mb-12" data-aos="fade-down">
              <div class="text-white bg-orange-600 rounded-full font-bold text-lg sm:text-xl md:text-2xl px-4 sm:px-6 py-2 sm:py-3 shadow-lg">
                START
              </div>
            </div>

            <!-- Timeline Container -->
            <div class="relative">
              <!-- Vertical Line (hidden on mobile, visible on md+) -->
              <div class="hidden md:block absolute left-1/2 transform -translate-x-1/2 w-1 bg-blue-600 h-full"></div>

              <!-- Timeline Events -->
              <div 
                v-for="(event, index) in timelineEvents" 
                :key="event.id"
                :class="[
                  'relative mb-8 sm:mb-12',
                  index % 2 === 0 ? 'md:text-right' : 'md:text-left'
                ]"
                :data-aos= "index % 2 === 0 ? 'fade-right' : 'fade-left'"
              >
                <div class="flex flex-col md:flex-row items-start md:items-center gap-4">
                  
                  <!-- Content (Left side on desktop for even, right for odd) -->
                  <div :class="[
                    'w-full md:w-5/12',
                    index % 2 === 0 ? 'md:order-1' : 'md:order-3'
                  ]">
                    <div 
                      @click="toggleTimeline(index)"
                      class="bg-white rounded-lg shadow-lg p-4 sm:p-6 cursor-pointer hover:shadow-xl transition-all duration-300"
                    >
                      <span class="inline-block bg-orange-600 text-white px-3 py-1 rounded-full text-xs sm:text-sm font-bold mb-3">
                        {{ event.year }}
                      </span>
                      <h4 class="text-lg sm:text-xl font-bold text-blue-600 mb-2 sm:mb-3">{{ event.title }}</h4>
                      <p class="text-sm sm:text-base text-gray-600">{{ event.description }}</p>
                      
                      <!-- Timeline Image (Expandable) -->
                      <div 
                        v-if="event.photo"
                        :class="[
                          'mt-3 sm:mt-4 overflow-hidden transition-all duration-700 ease-in-out',
                          expandedTimeline === index ? 'max-h-96 opacity-100' : 'max-h-0 opacity-0'
                        ]"
                      >
                        <img 
                          :src="`/storage/assets/img/timeline/${event.photo}`"
                          :alt="event.title"
                          class="rounded-lg shadow-sm w-full h-auto"
                        />
                      </div>

                      <!-- Show arrow only when photo exists -->
                      <div v-if="event.photo" class="flex justify-center items-center mt-3 sm:mt-4">
                        <svg 
                          xmlns="http://www.w3.org/2000/svg" 
                          viewBox="0 0 24 24" 
                          fill="currentColor" 
                          :class="[
                            'w-5 h-5 sm:w-6 sm:h-6 text-blue-600 transition-transform duration-300',
                            expandedTimeline === index ? 'rotate-180' : ''
                          ]"
                        >
                          <path fill-rule="evenodd" d="M12.53 16.28a.75.75 0 0 1-1.06 0l-7.5-7.5a.75.75 0 0 1 1.06-1.06L12 14.69l6.97-6.97a.75.75 0 1 1 1.06 1.06l-7.5 7.5Z" clip-rule="evenodd" />
                        </svg>
                      </div>
                    </div>
                  </div>

                  <!-- Dot (Center on desktop) -->
                  <div class="hidden md:flex md:w-2/12 md:order-2 justify-center">
                    <div class="w-5 h-5 bg-white rounded-full border-4 border-blue-600 shadow-lg"></div>
                  </div>

                  <!-- Empty space (for alternating layout on desktop) -->
                  <div :class="[
                    'hidden md:block md:w-5/12',
                    index % 2 === 0 ? 'md:order-3' : 'md:order-1'
                  ]"></div>
                </div>
              </div>
            </div>

            <!-- PRESENT label -->
            <div class="flex justify-center mt-8 sm:mt-12" data-aos="fade-up">
              <div class="text-white bg-orange-600 rounded-full font-bold text-lg sm:text-xl md:text-2xl px-4 sm:px-6 py-2 sm:py-3 shadow-lg">
                PRESENT
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- CTA SECTION -->
      <section class="relative py-12 sm:py-16 lg:py-20 text-white">
        <!-- Background image with opacity -->
        <div class="absolute inset-0">
          <img
            src="/storage/assets/img/banners/about_cta.jpg"
            alt="Banner Background"
            class="w-full h-full object-cover opacity-80"
          />
          <div class="absolute inset-0 bg-blue-600 opacity-60"></div>
        </div>

        <!-- Content -->
        <div class="relative container mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h2 class="text-3xl sm:text-4xl md:text-5xl font-bold mb-3 sm:mb-4">
            Ready to Collaborate on Your Next Project?
          </h2>
          <p class="text-base sm:text-lg md:text-xl mb-6 sm:mb-8 max-w-3xl mx-auto">
            Our team in James Polymers Manufacturing Corporation is ready to help you solve your most challenging materials requirements.
          </p>
          <div class="flex flex-col sm:flex-row justify-center gap-3 sm:gap-4">
            <Link 
              href="/contact" 
              class="bg-orange-500 hover:bg-orange-600 text-white font-bold py-3 px-6 sm:px-8 rounded-full transition duration-300 transform hover:scale-105 shadow-lg text-sm sm:text-base"
            >
              Get in Touch
            </Link>
            <Link 
              href="/products" 
              class="bg-transparent border-2 border-white text-white font-bold py-3 px-6 sm:px-8 rounded-full hover:bg-white hover:text-blue-700 transition duration-300 transform hover:scale-105 shadow-lg text-sm sm:text-base"
            >
              Explore Our Products
            </Link>
          </div>
        </div>
      </section>
    </div>

    <Footer />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { Link } from '@inertiajs/vue3';
import Header from '../../layouts/Header.vue';
import Footer from '../../layouts/Footer.vue';
import Chatbot from '@/layouts/Chatbot.vue';

const expandedTimeline = ref(null);

const toggleTimeline = (index) => {
  expandedTimeline.value = expandedTimeline.value === index ? null : index;
};

// Timeline Events Data
const timelineEvents = [
  {
    id: 1,
    year: '1980',
    title: 'Company Founded',
    description: 'Founded in 1980, James Polymers started with rubber products and later expanded to plastics as its main line, while still offering rubber services.',
    photo: null
  },
  {
    id: 2,
    year: '1980-1985',
    title: 'First Production Facility',
    description: "The company's first clients came from the appliance and paint industries, marking the beginning of its business growth.",
    photo: 'Panasonic & Dutch Boy.png'
  },
  {
    id: 3,
    year: '1985-1990',
    title: 'Brand New Clients',
    description: 'The company gained brand new clients such as ACS and Purefoods, expanding its reach into their respective industries.',
    photo: 'ACS & Purefoods.png'
  },
  {
    id: 4,
    year: '1995',
    title: 'Continental Joins as a Valued Client',
    description: 'The company added Continental, a global leader in the automotive and tire manufacturing industry, to its growing list of partners.',
    photo: 'Continental.png'
  },
  {
    id: 5,
    year: '2000-2010',
    title: 'Strong Partnerships Through ISO-Certified Excellence',
    description: 'After achieving ISO 14001:2015 and ISO 9001:2015 certifications, the company earned the trust of renowned firms across diverse industries. Appliances, automotive, electric & manufacturing technology.',
    photo: 'Multiple Companies.png'
  },
  {
    id: 6,
    year: '2010-2025',
    title: 'Current Operations (Production and Delivery)',
    description: 'Current operations are actively focused on the production and timely delivery of high-quality components and packaging solutions to our valued partners.',
    photo: 'Koppel & Unilab.png'
  },
  {
    id: 7,
    year: '2025',
    title: 'ISO 14001:2015 & 9001:2015 Recertification',
    description: 'To establish the company\'s former quality & environmental management system.',
    photo: null
  }
];
</script>

<style scoped>
/* Custom styles if needed */
</style>