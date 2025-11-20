<template>
  <div>
    <Header :isHomepage="false" />
    
    <div class="bg-gradient-to-br from-gray-50 to-blue-50 min-h-screen">
      <!-- Hero Section -->
      <section
        class="relative bg-blue-400 h-96 flex items-center justify-center bg-cover bg-center mt-[14vh]"
        style="background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://www.james-polymers.com/wp-content/uploads/2021/09/products-banner.jpg')"
      >
        <img
          src="/storage/assets/img/banners/news_events_banner.jpg"
          alt="News Events Banner"
          class="absolute inset-0 w-full h-full object-cover"
          style="mix-blend-mode: multiply; opacity: 1;"
        />

        <div class="container mx-auto px-4 text-white relative z-10 flex flex-col items-center justify-center h-full">
          <div class="text-center">
            <h1 class="text-4xl md:text-5xl font-bold mb-4">News & Events</h1>
            <p class="text-xl md:text-2xl text-white font-light max-w-3xl mx-auto leading-relaxed mb-4">
              Stay updated with the latest news, achievements, events, videos, and plant visits from JPMC
            </p>
            <div class="flex justify-center items-center text-sm md:text-base">
              <Link href="/" class="text-white hover:text-blue-300">Home</Link>
              <span class="mx-2">/</span>
              <span class="text-blue-300">News & Events</span>
            </div>
          </div>
        </div>
      </section>

      <!-- Headline Article Section -->
      <section v-if="headlineArticle" class="relative py-16 bg-white">
        <div class="container mx-auto px-6">
          <div class="mb-12 text-center">
            <h2 class="text-4xl font-bold mb-4 text-blue-600">Latest Headlines</h2>
            <p class="text-gray-600 text-lg max-w-2xl mx-auto">
              Stay informed with our most important news and announcements
            </p>
          </div>

          <!-- Headline Article -->
          <div class="group cursor-pointer mb-16">
            <div class="relative overflow-hidden rounded-2xl shadow-2xl">
              <img
                :src="headlineArticle.image_path"
                :alt="headlineArticle.title"
                class="w-full h-96 md:h-[500px] object-cover transform group-hover:scale-105 transition-transform duration-700"
              />
              <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/20 to-transparent"></div>

              <!-- Featured badge -->
              <div class="absolute top-6 left-6">
                <span class="px-4 py-2 bg-red-500 text-white text-sm font-bold rounded-full shadow-lg">
                  <i class="fas fa-star mr-2"></i>BREAKING NEWS
                </span>
              </div>

              <!-- Date badge -->
              <div class="absolute top-6 right-6">
                <span class="px-4 py-2 bg-white/90 text-gray-800 text-sm font-semibold rounded-full shadow-lg">
                  <i class="fas fa-calendar mr-2"></i>{{ formatDate(headlineArticle.date) }}
                </span>
              </div>

              <!-- Content overlay - positioned at bottom -->
              <div class="absolute bottom-0 left-0 w-full p-6 md:p-8">
                <div class="max-w-4xl">
                  <h3 class="text-white font-bold text-2xl md:text-3xl leading-tight mb-3">
                    {{ headlineArticle.title }}
                  </h3>
                  <p class="text-white/90 text-base md:text-lg leading-relaxed max-w-4xl">
                    {{ headlineArticle.description }}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Empty State -->
      <div v-if="allContent.length === 0" class="relative z-10 py-20">
        <div class="container mx-auto px-6">
          <div class="flex flex-col lg:flex-row justify-center items-center gap-16 mb-16">
            <!-- Left Badge -->
            <div class="animate-float">
              <div class="relative group">
                <div class="absolute inset-0 bg-gradient-to-r from-blue-500 to-purple-600 rounded-full blur-xl opacity-30 group-hover:opacity-50 transition-opacity duration-500"></div>
                <img
                  src="/storage/assets/img/left_badge.png"
                  alt="Best Award Badge"
                  class="relative w-80 h-80 object-cover rounded-full shadow-2xl"
                />
              </div>
            </div>

            <!-- Coming Soon Section -->
            <div class="text-center">
              <div class="relative inline-block">
                <div class="absolute inset-0 bg-gradient-to-r from-yellow-400 to-orange-500 rounded-2xl blur-lg opacity-30"></div>
                <img src="/storage/assets/img/coming_soon.png" alt="Coming Soon" class="relative w-80 h-80 object-contain" />
              </div>
              <div class="mt-8">
                <h2 class="text-4xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent mb-4">
                  Coming Soon
                </h2>
                <p class="text-gray-600 text-lg max-w-md mx-auto">
                  We're preparing something exciting for you. Stay tuned for the latest updates!
                </p>
              </div>
            </div>

            <!-- Right Badge -->
            <div class="animate-float" style="animation-delay: 1s;">
              <div class="relative group">
                <div class="absolute inset-0 bg-gradient-to-r from-green-500 to-teal-600 rounded-full blur-xl opacity-30 group-hover:opacity-50 transition-opacity duration-500"></div>
                <img
                  src="/storage/assets/img/right_badge.png"
                  alt="Best Award Badge"
                  class="relative w-80 h-80 object-cover rounded-full shadow-2xl"
                />
              </div>
            </div>
          </div>

          <!-- No Content Message -->
          <div class="text-center py-16">
            <div class="bg-white/80 backdrop-blur-sm rounded-3xl p-12 max-w-2xl mx-auto shadow-xl">
              <div class="text-6xl mb-6">📰</div>
              <h3 class="text-3xl font-bold text-gray-800 mb-4">No Content Available</h3>
              <p class="text-gray-600 text-lg leading-relaxed">
                We're currently updating our content section. Check back soon for the latest news,
                events, videos, and plant visits from JPMC.
              </p>
              <div class="mt-8">
                <Link
                  href="/"
                  class="inline-flex items-center px-8 py-4 bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold rounded-full hover:from-blue-700 hover:to-purple-700 transition-all duration-300 transform hover:scale-105 shadow-lg"
                >
                  <i class="fas fa-home mr-2"></i>
                  Back to Home
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Content with Filterable Tabs -->
      <div v-else class="container mx-auto px-6 py-16">
        <!-- Filter Tabs -->
        <div class="mb-12">
          <div class="flex flex-wrap justify-center gap-4 mb-8">
            <button
              v-for="tab in tabs"
              :key="tab.filter"
              @click="activeFilter = tab.filter"
              :class="[
                'px-6 py-3 text-lg font-semibold rounded-lg transition-all duration-300',
                activeFilter === tab.filter
                  ? 'bg-blue-600 text-white shadow-lg'
                  : 'bg-white text-gray-700 hover:bg-gray-100'
              ]"
            >
              <i :class="tab.icon + ' mr-2'"></i>{{ tab.label }}
            </button>
          </div>
        </div>

        <!-- Content Grid -->
        <div class="content-grid">
          <!-- News Items with Batch Grouping -->
          <div v-if="activeFilter === 'news'">
            <div v-for="(group, batchNumber) in groupedNews" :key="batchNumber" class="mb-12">
              <!-- Batch Header -->
              <div class="mb-6">
                <div class="bg-gradient-to-r from-blue-600 via-purple-600 to-indigo-600 rounded-xl p-4 text-white shadow-lg relative overflow-hidden">
                  <div class="absolute inset-0 bg-gradient-to-r from-white/10 to-transparent opacity-20"></div>
                  <div class="relative z-10">
                    <div class="flex items-center justify-between">
                      <div class="flex items-center">
                        <div class="bg-white/20 rounded-full p-2 mr-3">
                          <i class="fas fa-quote-left text-lg"></i>
                        </div>
                        <div>
                          <h3 class="text-xl font-bold mb-0">Batch {{ batchNumber }}</h3>
                          <p class="text-blue-100 text-sm">{{ group.items.length }} {{ group.items.length !== 1 ? 'stories' : 'story' }}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- News Grid -->
              <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div
                  v-for="item in group.items"
                  :key="item.id"
                  class="bg-white rounded-xl shadow-lg overflow-hidden flex flex-col h-full min-h-[420px] hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1"
                >
                  <div class="relative">
                    <img :src="item.image" :alt="item.title" class="w-full h-48 object-cover" />
                    <span class="absolute top-4 left-4 px-4 py-2 bg-blue-600 text-white text-xs font-semibold rounded-full">
                      Batch {{ batchNumber }}
                    </span>
                  </div>
                  <div class="p-6 flex flex-col flex-1">
                    <div class="flex items-center text-sm text-gray-500 mb-3">
                      <i class="fas fa-calendar mr-2"></i>
                      {{ formatDate(item.date) }}
                    </div>
                    <h4 class="font-bold text-xl leading-tight mb-4 text-blue-600 min-h-[56px]">
                      {{ item.title }}
                    </h4>
                    <div class="flex-1"></div>
                    <div class="w-full mt-2">
                      <div class="inline-flex items-center font-semibold text-blue-600 hover:text-blue-700 transition-colors">
                        Read Story
                        <i class="fas fa-arrow-right ml-2"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Events -->
          <div v-if="activeFilter === 'events'" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div
              v-for="item in events"
              :key="item.id"
              class="bg-white rounded-xl shadow-lg overflow-hidden flex flex-col h-full min-h-[420px] hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1"
            >
              <div class="relative">
                <img :src="item.image" :alt="item.title" class="w-full h-48 object-cover" />
                <span class="absolute top-4 left-4 px-4 py-2 bg-green-600 text-white text-xs font-semibold rounded-full">
                  Event
                </span>
              </div>
              <div class="p-6 flex flex-col flex-1">
                <div class="flex items-center text-sm text-gray-500 mb-3">
                  <i class="fas fa-calendar mr-2"></i>
                  {{ formatDate(item.date) }}
                </div>
                <h4 class="font-bold text-xl leading-tight mb-4 text-blue-600 min-h-[56px]">
                  {{ item.title }}
                </h4>
                <div class="flex-1"></div>
                <div class="w-full mt-2">
                  <div class="inline-flex items-center font-semibold text-blue-600 hover:text-blue-700 transition-colors">
                    Learn More
                    <i class="fas fa-arrow-right ml-2"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Videos & Promotions -->
          <div v-if="activeFilter === 'videos'">
            <div v-if="videosPromotions.length === 0" class="text-center py-20">
              <div class="bg-white rounded-xl shadow-lg p-12 max-w-2xl mx-auto">
                <div class="mb-6">
                  <svg class="w-24 h-24 mx-auto text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                    <rect x="2" y="5" width="14" height="14" rx="2" />
                    <path d="M19 7l-5 5 5 5V7z" />
                  </svg>
                </div>
                <h3 class="text-2xl font-bold text-gray-700 mb-2">No Videos & Promotions Available</h3>
                <p class="text-gray-500">Check back soon for new videos and promotional content.</p>
              </div>
            </div>
            <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
              <div
                v-for="item in videosPromotions"
                :key="item.id"
                class="bg-white rounded-xl shadow-lg overflow-hidden flex flex-col h-full min-h-[420px] hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1 group"
              >
                <div class="relative">
                  <img :src="item.image" :alt="item.title" class="w-full h-48 object-cover" />
                  <span class="absolute top-4 left-4 px-4 py-2 bg-purple-600 text-white text-xs font-semibold rounded-full">
                    {{ item.type }}
                  </span>
                  <div class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <i class="fas fa-play text-white text-4xl"></i>
                  </div>
                </div>
                <div class="p-6 flex flex-col flex-1">
                  <div class="flex items-center text-sm text-gray-500 mb-3">
                    <i class="fas fa-clock mr-2"></i>
                    {{ formatDate(item.created_at) }}
                  </div>
                  <h4 class="font-bold text-xl leading-tight mb-2 text-blue-600 min-h-[56px]">
                    {{ item.title }}
                  </h4>
                  <p class="text-gray-600 text-sm mb-4 line-clamp-3 min-h-[48px] flex items-center">
                    {{ item.description }}
                  </p>
                  <div class="flex-1"></div>
                  <div class="w-full mt-2">
                    <button class="inline-flex items-center font-semibold text-blue-600 hover:text-blue-700 transition-colors">
                      Watch Now
                      <i class="fas fa-arrow-right ml-2"></i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Plant Visits -->
          <div v-if="activeFilter === 'plant'" class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div
              v-for="item in plantVisits"
              :key="item.id"
              class="bg-white rounded-xl shadow-lg overflow-hidden flex flex-col hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1"
            >
              <div class="relative">
                <img :src="item.image" :alt="item.title" class="w-full h-64 object-cover" />
                <span class="absolute top-4 left-4 px-4 py-2 bg-purple-600 text-white text-xs font-semibold rounded-full uppercase">
                  Plant Visit
                </span>
              </div>
              <div class="p-6 flex flex-col flex-1">
                <div class="flex items-center text-sm text-gray-500 mb-3">
                  <i class="fas fa-industry mr-2"></i>
                  {{ formatDate(item.created_at) }}
                </div>
                <h4 class="font-bold text-xl leading-tight mb-3 text-blue-600">
                  {{ item.title }}
                </h4>
                <p class="text-gray-600 text-sm mb-4 leading-relaxed flex-1">
                  {{ item.description }}
                </p>
                <div class="w-full mt-2">
                  <button class="inline-flex items-center font-semibold text-gray-900 hover:text-blue-600 transition-colors">
                    Learn More
                    <i class="fas fa-arrow-right ml-2"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <Footer />
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import { Link } from '@inertiajs/vue3';

import Header from '@/layouts/Header.vue';
import Footer from '@/layouts/Footer.vue';
import Chatbot from '@/layouts/Chatbot.vue'; 

import axios from 'axios'
import AOS from 'aos';
import 'aos/dist/aos.css';
AOS.init();

const activeFilter = ref('news');

// Filter tabs configuration
const tabs = [
  { filter: 'news', label: 'News', icon: 'fas fa-newspaper' },
  { filter: 'events', label: 'Events', icon: 'fas fa-calendar-alt' },
  { filter: 'videos', label: 'Videos & Promotion', icon: 'fas fa-video' },
  { filter: 'plant', label: 'Plant Visit', icon: 'fas fa-industry' }
];

// Headline Article (hard-coded data)
const headlineArticle = ref({
  id: 1,
  title: 'CvSU Rosario Supervisors Visit Interns at JPMC',
  description: 'JPMC is honored to welcome the supervisors of Cavite State University – Rosario Campus as they visited their students undergoing On-the-Job Training with us. This meaningful visit strengthens our partnership in developing future industry professionals.',
  image_path: '/storage/assets/img/ojt_pictures/Plant_Visit1.jpg',
  date: '2025-08-14'
});

// Featured Content (hard-coded data)
const featuredContent = ref({
  id: 49,
  title: 'Aryne Kate Magsalang Shares Inspiring Testimony',
  image: '/storage/assets/img/ojt_pictures/aryne.png',
  date: '2025-07-10',
  batch: 1
});

// Hard-coded News Data (from SQL) - Alphabetically ordered by name
const newsData = ref([
  // Batch 1 - 16 stories (alphabetically ordered)
  {
    id: 49,
    title: 'Aryne Kate Magsalang Shares Inspiring Testimony',
    image: '/storage/assets/img/ojt_pictures/aryne.png',
    date: '2025-07-10',
    batch: 1
  },
  {
    id: 52,
    title: 'Gielyn Fernandez Delivers Uplifting Testimony',
    image: '/storage/assets/img/ojt_pictures/fernandez.png',
    date: '2025-07-05',
    batch: 1
  },
  {
    id: 50,
    title: 'Hanelyn Abilong Shares Empowering Testimony',
    image: '/storage/assets/img/ojt_pictures/hanelyn.png',
    date: '2025-07-05',
    batch: 1
  },
  {
    id: 64,
    title: 'John Cody Aburquez Delivers Inspiring Testimony',
    image: '/storage/assets/img/ojt_pictures/cody.png',
    date: '2025-07-06',
    batch: 1
  },
  {
    id: 53,
    title: 'John Joseph Albuera Inspires with His Testimony',
    image: '/storage/assets/img/ojt_pictures/joseph.png',
    date: '2025-07-05',
    batch: 1
  },
  {
    id: 54,
    title: 'John Vern Shares His Motivational Testimony',
    image: '/storage/assets/img/ojt_pictures/vern.png',
    date: '2025-07-05',
    batch: 1
  },
  {
    id: 55,
    title: 'Junjay Sayco Reflects on His Journey in Testimony at James Polymers',
    image: '/storage/assets/img/ojt_pictures/junjay.png',
    date: '2025-07-05',
    batch: 1
  },
  {
    id: 56,
    title: 'Justine James Belluso Shares Impactful Testimony',
    image: '/storage/assets/img/ojt_pictures/justine.png',
    date: '2025-07-05',
    batch: 1
  },
  {
    id: 65,
    title: 'Ken Levy Aniñon Shares Empowering Testimony',
    image: '/storage/assets/img/ojt_pictures/ken.png',
    date: '2025-07-06',
    batch: 1
  },
  {
    id: 57,
    title: 'Marvin Alagos Delivers His Inspiring Testimony',
    image: '/storage/assets/img/ojt_pictures/marvin.png',
    date: '2025-07-08',
    batch: 1
  },
  {
    id: 63,
    title: 'Melchor Adrian Libarnes Shares Insightful Testimony',
    image: '/storage/assets/img/ojt_pictures/adrian.png',
    date: '2025-07-03',
    batch: 1
  },
  {
    id: 58,
    title: 'Phoebe Jane Mangakoy Shares Uplifting Testimony',
    image: '/storage/assets/img/ojt_pictures/phoebe.png',
    date: '2025-07-05',
    batch: 1
  },
  {
    id: 59,
    title: 'Prince Pila Delivers His Heartfelt Testimony at James Polymers',
    image: '/storage/assets/img/ojt_pictures/prince.png',
    date: '2025-07-05',
    batch: 1
  },
  {
    id: 60,
    title: 'Rhemnel Nimrhod Cecilio Shares Powerful Testimony',
    image: '/storage/assets/img/ojt_pictures/rhemnel.png',
    date: '2025-07-03',
    batch: 1
  },
  {
    id: 61,
    title: 'Richardo Abanto Shares Motivational Testimony',
    image: '/storage/assets/img/ojt_pictures/richardo.png',
    date: '2025-07-03',
    batch: 1
  },
  {
    id: 62,
    title: 'Roland Cris Jacob Inspires with Testimony at James Polymers',
    image: '/storage/assets/img/ojt_pictures/roland.png',
    date: '2025-07-03',
    batch: 1
  },
  // Batch 2 - 10 stories (alphabetically ordered)
  {
    id: 69,
    title: 'Adrian De Lara Shares His Motivational Testimony',
    image: '/storage/assets/img/ojt_pictures/lara.png',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 70,
    title: 'Aljohnson Daet Shares His Inspiring Testimony',
    image: '/storage/assets/img/ojt_pictures/aljohnson.png',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 71,
    title: 'Carlos Luis Cataulin Shares His Empowering Testimony',
    image: '/storage/assets/img/ojt_pictures/cataulin.png',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 72,
    title: 'Francis Emmanuel Abaya Delivers His Uplifting Testimony',
    image: '/storage/assets/img/ojt_pictures/abaya.png',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 73,
    title: 'Genrey Palomares Inspires with His Testimony',
    image: '/storage/assets/img/ojt_pictures/genrey.png',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 74,
    title: 'Jerico Altabano Shares His Motivational Testimony',
    image: '/storage/assets/img/ojt_pictures/altabano.png',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 76,
    title: 'John Lawrence Agustin Shares His Impactful Testimony',
    image: '/storage/assets/img/ojt_pictures/lawrence.png',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 75,
    title: 'Jonathan Fajardo Reflects on His Journey in Testimony at James Polymers',
    image: '/storage/assets/img/ojt_pictures/fajardo.png',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 77,
    title: 'Paul Vincent Olega Delivers His Inspiring Testimony',
    image: '/storage/assets/img/ojt_pictures/olega.png',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 78,
    title: 'Randy Cornita Shares His Powerful Testimony',
    image: '/storage/assets/img/ojt_pictures/cornita.png',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 79,
    title: 'Ronald Josiah Cruz Inspires with Testimony at James Polymers',
    image: '/storage/assets/img/ojt_pictures/josiah.png',
    date: '2025-07-19',
    batch: 2
  },
  // Batch 3 - 26 stories (alphabetically ordered)
  {
    id: 91,
    title: 'Arlan M. Salisipan Jr. tells his motivating experience in James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (12).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 104,
    title: 'Arl Joseph Lagasca Rodelas offers his testimony of growth and resilience',
    image: '/storage/assets/img/ojt_pictures/3 (25).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 82,
    title: 'Angelica P. Ramirez reveals her uplifting story of new opportunities',
    image: '/storage/assets/img/ojt_pictures/3 (3).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 83,
    title: 'Cathereena Paula G. Capacia tells her motivating journey of success with James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (4).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 92,
    title: 'Cristine S. Trubanos reveals her testimony of success at James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (13).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 93,
    title: 'Daniel Ross B. Evia presents his uplifting story about James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (14).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 86,
    title: 'Danzle Ian Bucoy Vale Cruz presents his uplifting story about James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (7).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 94,
    title: 'Elisha B. Rebollos gives his heartfelt appreciation for James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (15).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 100,
    title: 'Gerimae Vega Buen tells her heartfelt story of perseverance',
    image: '/storage/assets/img/ojt_pictures/3 (21).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 102,
    title: 'Hannah Jane C. Bito-on reveals her testimony of success at James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (23).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 97,
    title: 'Harold Diaz Vivas offers his gratitude for the support of James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (18).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 106,
    title: 'Harold Miano Dizon recounts his powerful journey of dedication',
    image: '/storage/assets/img/ojt_pictures/3 (26).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 81,
    title: 'Jasmin Rize H. Calicdan tells her motivating account of professional success',
    image: '/storage/assets/img/ojt_pictures/3 (2).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 89,
    title: 'John Benedict L. Tabor offers his uplifting story of career success',
    image: '/storage/assets/img/ojt_pictures/3 (10).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 103,
    title: 'Jonel Billones Andamon reveals his encouraging testimony about James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (24).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 99,
    title: 'Julius Christian Partido Cuvos delivers his remarkable testimony of hard work',
    image: '/storage/assets/img/ojt_pictures/3 (20).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 90,
    title: 'Kenneth Gabren E. Oakes reveals his encouraging testimony about James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (11).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 95,
    title: 'Kim Irvine Ulep tells his inspiring journey of resilience',
    image: '/storage/assets/img/ojt_pictures/3 (16).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 101,
    title: 'Larrah Jane Ashley T. Manzo delivers her inspiring testimony of dedication',
    image: '/storage/assets/img/ojt_pictures/3 (22).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 87,
    title: 'Marc Daniel D. Moratalla tells his inspiring journey of resilience and determination',
    image: '/storage/assets/img/ojt_pictures/3 (8).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 84,
    title: 'Mark Jezreel C. Antivo tells his inspiring experience with James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (5).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 88,
    title: 'Mhira Shane O. Pato reveals her encouraging journey of determination',
    image: '/storage/assets/img/ojt_pictures/3 (9).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 80,
    title: 'Niña Mae M. Rubio gives her moving account of working with James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (1).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 98,
    title: 'Rhea Mae B. Lapido reveals her testimony of success at James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (19).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 85,
    title: 'Sebastian Lucas Tagalog presents his story of achievement and progress',
    image: '/storage/assets/img/ojt_pictures/3 (6).png',
    date: '2025-09-09',
    batch: 3
  },
  {
    id: 96,
    title: 'Sherlywin V. Bongalon delivers her story of professional growth with James Polymer',
    image: '/storage/assets/img/ojt_pictures/3 (17).png',
    date: '2025-09-09',
    batch: 3
  }
]);

// Hard-coded Events Data
const events = ref([
  {
    id: 66,
    title: 'Internship Journey Highlights: Batch One Graduation & Hands-On Experience',
    image: '/storage/assets/img/ojt_pictures/1 (13).jpg',
    date: '2025-07-09',
    batch: 2
  },
  {
    id: 67,
    title: 'Internship Journey Highlights: Batch Two Graduation & Hands-On Experience',
    image: '/storage/assets/img/ojt_pictures/2 (16).webp',
    date: '2025-07-19',
    batch: 2
  },
  {
    id: 68,
    title: 'Internship Journey Highlights: CvSU - Rosario Visit',
    image: '/storage/assets/img/ojt_pictures/Plant_Visit1.jpg',
    date: '2025-08-14',
    batch: 2
  }
]);

// Hard-coded Videos & Promotions Data
const videosPromotions = ref([]);

// Hard-coded Plant Visits Data
const plantVisits = ref([
  {
    id: 1,
    title: 'Business Meeting and Product Discussion with U.S. Client at James Polymers',
    description: 'James Polymers Manufacturing Corporation was honored to welcome a valued client from the United States for a focused business meeting centered around our product offerings and future partnership opportunities. The visit began with a brief introduction...',
    image: '/storage/assets/img/plant_visit/US client.jpg',
    created_at: '2025-07-03'
  },
  {
    id: 2,
    title: 'German Client Visit and Plant Tour',
    description: 'We were honored to welcome our esteemed client from Germany for an official visit to James Polymers Manufacturing Corporation. The day began with a guided plant tour, where we showcased our advanced production facilities, including key stages of our...',
    image: '/storage/assets/img/plant_visit/German client.jpg',
    created_at: '2025-07-03'
  }
]);

// Computed property to group news by batch
const groupedNews = computed(() => {
  const groups = {};
  newsData.value.forEach(item => {
    if (!groups[item.batch]) {
      groups[item.batch] = {
        name: `Batch ${item.batch}`,
        items: []
      };
    }
    groups[item.batch].items.push(item);
  });
  return groups;
});

// All content combined
const allContent = computed(() => {
  return [...newsData.value, ...events.value, ...videosPromotions.value, ...plantVisits.value];
});

// Date formatting function
const formatDate = (dateString) => {
  const date = new Date(dateString);
  return date.toLocaleDateString('en-US', { 
    year: 'numeric', 
    month: 'long', 
    day: 'numeric' 
  });
};
</script>

<style scoped>
@keyframes float {
  0%, 100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-20px);
  }
}

.animate-float {
  animation: float 3s ease-in-out infinite;
}

.line-clamp-3 {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>