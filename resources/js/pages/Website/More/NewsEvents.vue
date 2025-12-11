<template>
  <div>
    <Header :isHomepage="false" />
    
    <!-- News Detail View -->
    <div v-if="selectedArticle" class="bg-gray-100 min-h-screen">
      <!-- Back Navigation -->
      <div class="bg-white shadow-md">
        <div class="container mx-auto px-4 py-4">
          <Link href="/news-events" class="text-blue-700 hover:underline text-sm inline-flex items-center">
            <i class="fas fa-arrow-left mr-2"></i> Back to News & Events
          </Link>
        </div>
      </div>

      <!-- Main Content -->
      <div class="container mx-auto px-4 py-10 max-w-4xl">
        <!-- Title -->
        <h1 class="text-2xl sm:text-3xl md:text-4xl lg:text-5xl font-extrabold text-blue-900 mb-3 leading-tight">
          {{ selectedArticle.title }}
        </h1>

        <!-- Date -->
        <div class="text-black text-lg font-medium mb-3">
          {{ formatDate(selectedArticle.date) }}
        </div>

        <!-- Social Share -->
        <div class="flex items-center text-gray-500 text-base mb-8 space-x-5">
          <a href="#" class="hover:text-blue-600"><i class="fab fa-facebook fa-lg"></i></a>
          <a href="#" class="hover:text-blue-600"><i class="fab fa-twitter fa-lg"></i></a>
          <a href="#" class="hover:text-blue-600"><i class="fab fa-linkedin fa-lg"></i></a>
          <a href="#" class="hover:text-blue-600"><i class="fab fa-instagram fa-lg"></i></a>
        </div>

        <!-- Media Carousel -->
        <div v-if="currentArticleMedia.length > 0" class="w-full mb-8">
          <div class="carousel-container relative">
            <div v-if="currentArticleMedia.length > 1" class="touch-indicator absolute top-4 right-4 z-20 bg-white/90 px-3 py-2 rounded-full text-sm">
              <i class="fas fa-hand-pointer mr-1"></i> Swipe to navigate
            </div>

            <div class="carousel-track">
              <div
                v-for="(media, index) in currentArticleMedia"
                :key="index"
                class="carousel-slide"
                :class="{ active: index === currentMediaIndex }"
              >
                <!-- Image -->
                <img
                  v-if="media.type === 'image'"
                  :src="media.path"
                  :alt="media.alt_text || selectedArticle.title"
                  loading="lazy"
                  @click="openFullscreen(media.path)"
                  class="cursor-pointer w-full h-auto object-cover rounded-xl"
                />

                <!-- Video (YouTube/Vimeo) -->
                <div v-else-if="media.type === 'video' && media.video_type === 'url'" class="aspect-video">
                  <iframe
                    :src="getEmbedUrl(media.path)"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen
                    :title="media.title || 'Video'"
                    class="w-full h-full rounded-xl"
                  ></iframe>
                </div>

                <!-- Local Video -->
                <video
                  v-else-if="media.type === 'video' && media.video_type === 'local'"
                  controls
                  preload="metadata"
                  :title="media.title"
                  class="w-full h-auto rounded-xl"
                >
                  <source :src="media.path" type="video/mp4">
                  Your browser does not support the video tag.
                </video>
              </div>
            </div>

            <!-- Slide Counter -->
            <div v-if="currentArticleMedia.length > 1" class="carousel-counter absolute bottom-4 left-1/2 transform -translate-x-1/2 bg-white/90 px-4 py-2 rounded-full text-sm font-semibold">
              <span>{{ currentMediaIndex + 1}}</span> / 
              <span>{{ currentArticleMedia.length }}</span>
            </div>
          </div>

          <!-- Navigation Controls -->
          <div v-if="currentArticleMedia.length > 1" class="flex items-center justify-center mt-4 space-x-4">
            <button @click="prevMedia" class="carousel-nav-btn p-3 bg-gray-100 hover:bg-gray-200 rounded-full transition">
              <i class="fas fa-chevron-left text-gray-700"></i>
            </button>

            <div class="flex gap-2">
              <div
                v-for="(media, index) in currentArticleMedia"
                :key="index"
                class="carousel-dot w-2.5 h-2.5 rounded-full cursor-pointer transition-all"
                :class="index === currentMediaIndex ? 'bg-blue-600 scale-110' : 'bg-gray-300'"
                @click="goToMedia(index)"
              ></div>
            </div>

            <button @click="nextMedia" class="carousel-nav-btn p-3 bg-gray-100 hover:bg-gray-200 rounded-full transition">
              <i class="fas fa-chevron-right text-gray-700"></i>
            </button>
          </div>

          <!-- Media Info -->
          <div v-if="currentArticleMedia[currentMediaIndex]" class="mt-4 text-center">
            <div class="text-gray-600 text-lg">
              {{ currentArticleMedia[currentMediaIndex].description || currentArticleMedia[currentMediaIndex].alt_text || '' }}
            </div>
          </div>
        </div>

        <!-- Section Content / Descriptions -->
        <div v-if="processedSections.length > 0" class="mb-8">
          <div v-for="(section, index) in processedSections" :key="section.id || index" class="mb-8">
            <div class="text-gray-800 text-lg leading-relaxed font-serif whitespace-pre-line" :class="index === 0 ? 'text-center' : 'text-left'">
              {{ section.description }}
            </div>
          </div>
        </div>

        <!-- Fallback: Show article description if no content sections -->
        <div v-else-if="selectedArticle.description" class="mb-8">
          <div class="text-gray-800 text-lg leading-relaxed font-serif text-center whitespace-pre-line">
            {{ selectedArticle.description }}
          </div>
        </div>
      </div>
    </div>

    <!-- News Events List View -->
    <div v-else class="bg-gradient-to-br from-gray-50 to-blue-50 min-h-screen">
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
          <div class="mb-16 block">
            <div class="relative overflow-hidden rounded-2xl shadow-2xl">
              <img
                :src="headlineArticle.image_path"
                :alt="headlineArticle.title"
                class="w-full h-96 md:h-[500px] object-cover"
              />
              <!-- Updated gradient overlay for better mobile visibility -->
              <div class="absolute inset-0 bg-gradient-to-t from-black/95 via-black/50 to-transparent md:from-black/90 md:via-black/20"></div>

              <!-- Featured badge -->
              <div class="absolute top-4 left-4 md:top-6 md:left-6">
                <span class="px-3 py-1.5 md:px-4 md:py-2 bg-red-500 text-white text-xs md:text-sm font-bold rounded-full shadow-lg">
                  <i class="fas fa-star mr-1 md:mr-2"></i>BREAKING NEWS
                </span>
              </div>

              <!-- Date badge -->
              <div class="absolute top-4 right-4 md:top-6 md:right-6">
                <span class="px-3 py-1.5 md:px-4 md:py-2 bg-white/90 text-gray-800 text-xs md:text-sm font-semibold rounded-full shadow-lg">
                  <i class="fas fa-calendar mr-1 md:mr-2"></i>{{ formatDate(headlineArticle.date) }}
                </span>
              </div>

              <!-- Content overlay - Now using min-h instead of absolute bottom -->
              <div class="absolute inset-x-0 bottom-0 p-4 md:p-6 lg:p-8 min-h-[40%] flex items-end">
                <div class="max-w-4xl w-full">
                  <!-- Title -->
                  <h3 class="text-white font-bold text-xl sm:text-2xl md:text-3xl lg:text-4xl leading-tight mb-2 md:mb-3">
                    {{ headlineArticle.title }}
                  </h3>
                  <!-- Description -->
                  <p class="text-white/90 text-sm sm:text-base md:text-lg leading-relaxed max-w-4xl">
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
        <div id="content-grid">
          <!-- News Items with Batch Grouping -->
          <div v-if="activeFilter === 'news'">
            <!-- Batch 1 - 16 stories -->
            <div v-if="batch1News.length > 0" class="mb-12">
              <!-- Batch 1 Header -->
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
                          <h3 class="text-xl font-bold mb-0">Batch 1</h3>
                          <p class="text-blue-100 text-sm">{{ batch1News.length }} {{ batch1News.length !== 1 ? 'stories' : 'story' }}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Batch 1 Grid -->
              <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <Link
                  v-for="item in batch1News"
                  :key="item.id"
                  :href="`/news-events/${item.id}`"
                  class="bg-white rounded-xl shadow-lg overflow-hidden flex flex-col h-full min-h-[420px] hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1 cursor-pointer"
                >
                  <div class="relative overflow-hidden">
                    <img :src="item.image" :alt="item.title" class="w-full h-48 object-cover" />
                    <span class="absolute top-4 left-4 px-4 py-2 bg-blue-600 text-white text-xs font-semibold rounded-full">
                      BATCH 1
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
                </Link>
              </div>
            </div>

            <!-- Batch 2 - 11 stories -->
            <div v-if="batch2News.length > 0" class="mb-12">
              <!-- Batch 2 Header -->
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
                          <h3 class="text-xl font-bold mb-0">Batch 2</h3>
                          <p class="text-blue-100 text-sm">{{ batch2News.length }} {{ batch2News.length !== 1 ? 'stories' : 'story' }}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Batch 2 Grid -->
              <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <Link
                  v-for="item in batch2News"
                  :key="item.id"
                  :href="`/news-events/${item.id}`"
                  class="bg-white rounded-xl shadow-lg overflow-hidden flex flex-col h-full min-h-[420px] hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1 cursor-pointer"
                >
                  <div class="relative overflow-hidden">
                    <img :src="item.image" :alt="item.title" class="w-full h-48 object-cover" />
                    <span class="absolute top-4 left-4 px-4 py-2 bg-blue-600 text-white text-xs font-semibold rounded-full">
                      BATCH 2
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
                </Link>
              </div>
            </div>

            <!-- Batch 3 - 26 stories -->
            <div v-if="batch3News.length > 0" class="mb-12">
              <!-- Batch 3 Header -->
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
                          <h3 class="text-xl font-bold mb-0">Batch 3</h3>
                          <p class="text-blue-100 text-sm">{{ batch3News.length }} {{ batch3News.length !== 1 ? 'stories' : 'story' }}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Batch 3 Grid -->
              <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <Link
                  v-for="item in batch3News"
                  :key="item.id"
                  :href="`/news-events/${item.id}`"
                  class="bg-white rounded-xl shadow-lg overflow-hidden flex flex-col h-full min-h-[420px] hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1 cursor-pointer"
                >
                  <div class="relative overflow-hidden">
                    <img :src="item.image" :alt="item.title" class="w-full h-48 object-cover" />
                    <span class="absolute top-4 left-4 px-4 py-2 bg-blue-600 text-white text-xs font-semibold rounded-full">
                      BATCH 3
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
                </Link>
              </div>
            </div>
          </div>

          <!-- Events -->
          <div v-if="activeFilter === 'events'" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <Link
              v-for="item in events"
              :key="item.id"
              :href="`/news-events/${item.id}`"
              class="bg-white rounded-xl shadow-lg overflow-hidden flex flex-col h-full min-h-[420px] hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1 cursor-pointer"
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
            </Link>
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
              <a
                v-for="item in videosPromotions"
                :key="item.id"
                :href="item.video_url"
                target="_blank"
                rel="noopener noreferrer"
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
                    <span class="inline-flex items-center font-semibold text-blue-600 hover:text-blue-700 transition-colors">
                      Watch Now
                      <i class="fas fa-external-link-alt ml-2"></i>
                    </span>
                  </div>
                </div>
              </a>
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
                
                <!-- Video Link if available -->
                <div v-if="item.videos && item.videos.length > 0" class="mt-2">
                  <a 
                    :href="item.videos[0].video_url" 
                    target="_blank" 
                    rel="noopener noreferrer"
                    class="inline-flex items-center font-semibold text-purple-600 hover:text-purple-700 transition-colors"
                  >
                    <i class="fas fa-play-circle mr-2"></i>
                    Watch Video
                    <i class="fas fa-external-link-alt ml-2 text-sm"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <Footer />

    <!-- Fullscreen Modal -->
    <div v-if="fullscreenImage" @click="closeFullscreen" class="fixed inset-0 bg-black bg-opacity-90 z-50 flex items-center justify-center p-4">
      <button @click="closeFullscreen" class="absolute top-4 right-4 text-white text-4xl hover:text-gray-300 z-10">
        <i class="fas fa-times"></i>
      </button>
      <img :src="fullscreenImage" alt="Fullscreen view" class="max-w-full max-h-full object-contain">
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue';
import { Link } from '@inertiajs/vue3';
import Header from '@/layouts/Header.vue';
import Footer from '@/layouts/Footer.vue';

const props = defineProps({
  headlineArticle: Object,
  newsData: Array,
  events: Array,
  videosPromotions: Array,
  plantVisits: Array,
  selectedArticle: Object,
  articleImages: Array,
  articleVideos: Array,
  articleSections: Array,
});

const activeFilter = ref('news');
const currentMediaIndex = ref(0);
const fullscreenImage = ref(null);

// Touch swipe variables
let touchStartX = 0;
let touchEndX = 0;

// Filter tabs configuration
const tabs = [
  { filter: 'news', label: 'News', icon: 'fas fa-newspaper' },
  { filter: 'events', label: 'Events', icon: 'fas fa-calendar-alt' },
  { filter: 'videos', label: 'Videos & Promotion', icon: 'fas fa-video' },
  { filter: 'plant', label: 'Plant Visit', icon: 'fas fa-industry' }
];

// Computed property to group news by batch
const groupedNews = computed(() => {
  if (!props.newsData) return {};
  
  const groups = {};
  props.newsData.forEach(item => {
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

// Separate batches into individual computed properties
const batch1News = computed(() => {
  if (!props.newsData) return [];
  return props.newsData.filter(item => Number(item.batch) === 1);
});

const batch2News = computed(() => {
  if (!props.newsData) return [];
  return props.newsData.filter(item => Number(item.batch) === 2);
});

const batch3News = computed(() => {
  if (!props.newsData) return [];
  return props.newsData.filter(item => Number(item.batch) === 3);
});

// All content combined
const allContent = computed(() => {
  return [
    ...(props.newsData || []), 
    ...(props.events || []), 
    ...(props.videosPromotions || []),
    ...(props.plantVisits || [])
  ];
});

// Process sections with media
const processedSections = computed(() => {
  if (!props.articleSections) return [];
  
  return props.articleSections.map(section => {
    return {
      ...section,
      description: section.description || section.content || ''
    };
  });
});

// Current article media - prioritize videos over images
const currentArticleMedia = computed(() => {
  if (!props.selectedArticle) return [];
  
  const media = [];
  
  // Add videos FIRST (priority)
  if (props.articleVideos && props.articleVideos.length > 0) {
    props.articleVideos.forEach(vid => {
      media.push({
        type: 'video',
        path: vid.video_path,
        video_type: vid.video_type,
        title: vid.video_title,
        description: vid.video_description
      });
    });
  }
  
  // Add images only if no videos exist
  if (media.length === 0 && props.articleImages) {
    props.articleImages.forEach(img => {
      media.push({
        type: 'image',
        path: img.image_path,
        alt_text: img.alt_text
      });
    });
  }
  
  return media;
});

// Methods
const formatDate = (date) => {
  if (!date) return '';
  const d = new Date(date);
  return d.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
};

const getEmbedUrl = (url) => {
  if (!url) return '';
  
  // YouTube
  if (url.includes('youtube.com/watch?v=')) {
    const videoId = url.split('v=')[1]?.split('&')[0];
    return `https://www.youtube.com/embed/${videoId}`;
  } else if (url.includes('youtu.be/')) {
    const videoId = url.split('youtu.be/')[1]?.split('?')[0];
    return `https://www.youtube.com/embed/${videoId}`;
  }
  
  // Vimeo
  if (url.includes('vimeo.com/')) {
    const videoId = url.split('vimeo.com/')[1]?.split('?')[0];
    return `https://player.vimeo.com/video/${videoId}`;
  }
  
  return url;
};

const nextMedia = () => {
  if (currentMediaIndex.value < currentArticleMedia.value.length - 1) {
    currentMediaIndex.value++;
  } else {
    currentMediaIndex.value = 0;
  }
};

const prevMedia = () => {
  if (currentMediaIndex.value > 0) {
    currentMediaIndex.value--;
  } else {
    currentMediaIndex.value = currentArticleMedia.value.length - 1;
  }
};

const goToMedia = (index) => {
  currentMediaIndex.value = index;
};

const openFullscreen = (imagePath) => {
  fullscreenImage.value = imagePath;
};

const closeFullscreen = () => {
  fullscreenImage.value = null;
};

// Touch swipe handlers
const handleTouchStart = (e) => {
  touchStartX = e.changedTouches[0].screenX;
};

const handleTouchEnd = (e) => {
  touchEndX = e.changedTouches[0].screenX;
  handleSwipe();
};

const handleSwipe = () => {
  const swipeThreshold = 50;
  if (touchEndX < touchStartX - swipeThreshold) {
    nextMedia();
  }
  if (touchEndX > touchStartX + swipeThreshold) {
    prevMedia();
  }
};

// Keyboard navigation
const handleKeydown = (e) => {
  if (!props.selectedArticle) return;
  
  if (e.key === 'ArrowLeft') {
    prevMedia();
  } else if (e.key === 'ArrowRight') {
    nextMedia();
  } else if (e.key === 'Escape') {
    if (fullscreenImage.value) {
      closeFullscreen();
    }
  }
};

onMounted(() => {
  // Add touch event listeners for carousel swipe
  const carouselTrack = document.querySelector('.carousel-track');
  if (carouselTrack) {
    carouselTrack.addEventListener('touchstart', handleTouchStart, { passive: true });
    carouselTrack.addEventListener('touchend', handleTouchEnd, { passive: true });
  }
  
  // Add keyboard navigation
  window.addEventListener('keydown', handleKeydown);
  
  // Scroll to top if viewing article
  if (props.selectedArticle) {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }
});

onUnmounted(() => {
  // Clean up event listeners
  const carouselTrack = document.querySelector('.carousel-track');
  if (carouselTrack) {
    carouselTrack.removeEventListener('touchstart', handleTouchStart);
    carouselTrack.removeEventListener('touchend', handleTouchEnd);
  }
  
  window.removeEventListener('keydown', handleKeydown);
});
</script>

<style scoped>
/* Carousel Styles */
.carousel-container {
  position: relative;
  width: 100%;
  overflow: hidden;
  border-radius: 1rem;
  background: #f3f4f6;
}

.carousel-track {
  display: flex;
  position: relative;
  width: 100%;
}

.carousel-slide {
  display: none;
  width: 100%;
  min-height: 400px;
}

.carousel-slide.active {
  display: block;
}

.carousel-slide img {
  width: 100%;
  height: auto;
  object-fit: cover;
  border-radius: 0.75rem;
}

.carousel-slide iframe,
.carousel-slide video {
  width: 100%;
  height: 100%;
  border-radius: 0.75rem;
}

.aspect-video {
  position: relative;
  width: 100%;
  padding-bottom: 56.25%; /* 16:9 aspect ratio */
}

.aspect-video iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.touch-indicator {
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.6;
  }
}

.carousel-counter {
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(10px);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.carousel-nav-btn {
  transition: all 0.3s ease;
}

.carousel-nav-btn:hover {
  background-color: #e5e7eb !important;
  transform: scale(1.1);
}

.carousel-dot {
  transition: all 0.3s ease;
}

.carousel-dot:hover {
  transform: scale(1.2);
}

/* Fullscreen Modal */
.fixed.inset-0 {
  cursor: zoom-out;
}

/* Animation for floating badges */
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

/* Card hover effects */
.card-hover {
  transition: all 0.3s ease;
}

.card-hover:hover {
  transform: translateY(-5px);
}

/* Line clamp utility for headline text */
.line-clamp-3 {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.line-clamp-4 {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

/* Override line-clamp on larger screens */
@media (min-width: 768px) {
  .md\:line-clamp-none {
    display: block;
  }
}

/* Ensure image is always visible on mobile */
@media (max-width: 768px) {
  .headline-article-image {
    min-height: 400px;
    object-fit: cover;
  }
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .carousel-slide {
    min-height: 300px;
  }
  
  .touch-indicator {
    font-size: 0.875rem;
    padding: 0.5rem 0.75rem;
  }
}
</style>