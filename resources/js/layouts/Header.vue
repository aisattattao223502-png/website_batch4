<template>
  <div>
    <!-- OPTIMIZED HEADER -->
    <header
      ref="headerRef"
      :class="[
        'fixed top-0 left-0 right-0 z-[9999] transition-all duration-300',
        headerClasses,
      ]"
      style="font-family: 'Inter', 'Helvetica Neue', Arial, sans-serif"
      id="main-header"
    >
      <div class="container mx-auto px-3 sm:px-4 py-3 flex items-center justify-between">
        <!-- LOGO + COMPANY NAME -->
        <div class="flex items-center gap-3 flex-shrink-0">
          <img
            :src="logoPath"
            alt="James Polymers"
            :class="[
              'rounded-full object-cover border-2 shadow-md bg-white',
              'aspect-square w-12 sm:w-14 md:w-16 lg:w-18 xl:w-20',
              'transition-transform duration-300 ease-in-out hover:scale-105',
              logoBorderClass,
            ]"
          />

          <div class="flex flex-col justify-center">
            <div class="text-sm sm:text-lg md:text-xl font-bold dynamic-text tracking-tight leading-tight">
              <span class="font-serif dynamic-j text-xl sm:text-2xl md:text-3xl italic">J</span>AMES
              <span class="font-serif pe-1 dynamic-p text-xl sm:text-2xl md:text-3xl italic">P</span>OLYMERS
              
              <!-- Animated Text Transition -->
              <span class="block text-xs sm:text-sm md:text-base font-semibold dynamic-corp mt-0.5 leading-tight relative h-5 sm:h-6 overflow-hidden">
                <transition name="slide-fade" mode="out-in">
                  <span 
                    v-if="showMainText" 
                    :key="'main'"
                    class="flex items-center whitespace-nowrap"
                  >
                    MANUFACTURING CORP.
                  </span>
                  <span 
                      v-else 
                      :key="'tagline'"
                      class="flex items-center whitespace-nowrap"
                    >
                      OUR EXPERTISE IS YOUR ADVANTAGE
                  </span>


                </transition>
              </span>
            </div>
          </div>
        </div>

        <!-- NAVIGATION -->
        <nav class="hidden lg:flex items-center ml-4">

          <ul class="flex flex-nowrap space-x-6 items-center">
            <li>
              <Link
                href="/"
                class="menu-link font-semibold uppercase text-sm transition-colors dynamic-nav-link hover:text-blue-400"
              >
                Home
              </Link>
            </li>
            <li>
              <Link
                href="/about"
                class="menu-link font-semibold uppercase text-sm transition-colors dynamic-nav-link hover:text-blue-400"
              >
                About
              </Link>
            </li>

            <!-- EXPLORE DROPDOWN -->
            <li class="dropdown relative" @mouseenter="toggleDropdown('explore', true)" @mouseleave="toggleDropdown('explore', false)">
              <a
                href="#"
                class="explore-dropdown font-semibold uppercase text-sm flex items-center transition-colors dynamic-nav-link hover:text-blue-400"
                @click.prevent
              >
                Explore
                <i :class="['fas fa-chevron-down ml-1 text-xs transition-transform duration-300 dynamic-dropdown-arrow', { 'rotate-180': dropdowns.explore }]"></i>
              </a>
              <ul
                v-show="dropdowns.explore"
                class="dropdown-menu absolute left-0 top-full w-48 bg-white shadow-lg rounded-md py-2 z-[99999] border border-gray-200"
              >
                <li>
                  <Link href="/products" @click="closeDropdowns" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    Products
                  </Link>
                </li>
                <li>
                  <Link href="/industries" @click="closeDropdowns" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    Industries
                  </Link>
                </li>
                <li>
                  <Link href="/awards-recognition" @click="closeDropdowns" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    Awards
                  </Link>
                </li>
              </ul>
            </li>
            <li>
              <Link
                href="/contact"
                class="menu-link font-semibold uppercase text-sm transition-colors dynamic-nav-link hover:text-blue-400"
              >
                Contact
              </Link>
            </li>

            <!-- MORE DROPDOWN -->
            <li class="dropdown relative" @mouseenter="toggleDropdown('more', true)" @mouseleave="toggleDropdown('more', false)">
              <a
                href="#"
                class="menu-link font-semibold uppercase text-sm flex items-center transition-colors dynamic-nav-link hover:text-blue-400"
                @click.prevent
              >
                More
                <i :class="['fas fa-chevron-down ml-1 text-xs transition-transform duration-300 dynamic-dropdown-arrow', { 'rotate-180': dropdowns.more }]"></i>
              </a>
              <ul
                v-show="dropdowns.more"
                class="dropdown-menu absolute right-0 top-full w-56 bg-white shadow-lg rounded-md py-2 z-[99999] border border-gray-200"
              >
                <li>
                  <Link href="/sustainability" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    Sustainability
                  </Link>
                </li>
                <li>
                  <Link href="/overview-process" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    Overview Process
                  </Link>
                </li>
                <li>
                  <Link href="/news-events" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    News & Events
                  </Link>
                </li>
                <li>
                  <Link href="/careers" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    Careers
                  </Link>
                </li>
                <li>
                  <Link href="/faq" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    FAQ
                  </Link>
                </li>
                <li>
                  <Link href="/privacy-policy" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    Privacy Policy
                  </Link>
                </li>
              </ul>
            </li>
          </ul>
        </nav>

        <!-- MOBILE MENU BUTTON WITH HAMBURGER ANIMATION -->
        <button
          @click="toggleMobileMenu"
          class="lg:hidden dynamic-menu-button p-2 rounded-lg hover:bg-black/10 transition-colors"
        >
          <div class="hamburger-icon">
            <span :class="['hamburger-line', { 'active': mobileMenuOpen }]"></span>
            <span :class="['hamburger-line', { 'active': mobileMenuOpen }]"></span>
            <span :class="['hamburger-line', { 'active': mobileMenuOpen }]"></span>
          </div>
        </button>
      </div>
    </header>

    <!-- MOBILE MENU (NO HEADER INSIDE) -->
    <div
      :class="[
        'lg:hidden fixed inset-0 bg-white z-50 transform transition-transform duration-300 ease-in-out',
        { '-translate-x-full': !mobileMenuOpen },
      ]"
    >
      <div class="p-4 h-full flex flex-col">
        <!-- CLOSE BUTTON ONLY (No header) -->
        <div class="flex justify-end mb-6">
          <button @click="toggleMobileMenu" class="text-gray-700 p-2 rounded-lg hover:bg-gray-100">
            <i class="fas fa-times text-2xl"></i>
          </button>
        </div>

        <nav class="flex-1 overflow-y-auto">
          <ul class="space-y-4">
            <li>
              <Link
                href="/"
                @click="closeMobileMenu"
                class="block text-gray-800 hover:text-blue-600 font-semibold uppercase text-base py-3 border-b border-gray-100"
              >
                Home
              </Link>
            </li>
            <li>
              <Link
                href="/about"
                @click="closeMobileMenu"
                class="block text-gray-800 hover:text-blue-600 font-semibold uppercase text-base py-3 border-b border-gray-100"
              >
                About
              </Link>
            </li>
            <li>
              <Link
                href="/products"
                @click="closeMobileMenu"
                class="block text-gray-800 hover:text-blue-600 font-semibold uppercase text-base py-3 border-b border-gray-100"
              >
                Products
              </Link>
            </li>
            <li>
              <Link
                href="/industries"
                @click="closeMobileMenu"
                class="block text-gray-800 hover:text-blue-600 font-semibold uppercase text-base py-3 border-b border-gray-100"
              >
                Industries
              </Link>
            </li>
            <li>
              <Link
                href="/awards-recognition"
                @click="closeMobileMenu"
                class="block text-gray-800 hover:text-blue-600 font-semibold uppercase text-base py-3 border-b border-gray-100"
              >
                Awards
              </Link>
            </li>
            <li>
              <Link
                href="/contact"
                @click="closeMobileMenu"
                class="block text-gray-800 hover:text-blue-600 font-semibold uppercase text-base py-3 border-b border-gray-100"
              >
                Contact
              </Link>
            </li>

            <li class="pt-2">
              <span class="block text-gray-800 font-semibold uppercase text-base py-3 text-gray-500">More</span>
              <ul class="pl-4 space-y-3">
                <li>
                  <Link
                    href="/sustainability"
                    @click="closeMobileMenu"
                    class="block text-gray-600 hover:text-blue-600 text-sm py-2"
                  >
                    Sustainability
                  </Link>
                </li>
                <li>
                  <Link
                    href="/overview-process"
                    @click="closeMobileMenu"
                    class="block text-gray-600 hover:text-blue-600 text-sm py-2"
                  >
                    Overview Process
                  </Link>
                </li>
                <li>
                  <Link
                    href="/news-events"
                    @click="closeMobileMenu"
                    class="block text-gray-600 hover:text-blue-600 text-sm py-2"
                  >
                    News & Events
                  </Link>
                </li>
                <li>
                  <Link
                    href="/careers"
                    @click="closeMobileMenu"
                    class="block text-gray-600 hover:text-blue-600 text-sm py-2"
                  >
                    Careers
                  </Link>
                </li>
                <li>
                  <Link
                    href="/faq"
                    @click="closeMobileMenu"
                    class="block text-gray-600 hover:text-blue-600 text-sm py-2"
                  >
                    FAQ
                  </Link>
                </li>
              </ul>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue';
import { Link, usePage } from '@inertiajs/vue3';

// Props
const props = defineProps({
  isHomepage: {
    type: Boolean,
    default: false,
  },
});

// Refs
const headerRef = ref(null);
const mobileMenuOpen = ref(false);
const scrollPosition = ref(0);
const isDarkMode = ref(props.isHomepage);
const showMainText = ref(true);
const dropdowns = ref({
  explore: false,
  more: false,
});

// Text transition interval
let textTransitionInterval = null;

// Computed
const logoPath = computed(() => {
  return '/storage/assets/img/logo-whitebg.png';
});

const headerClasses = computed(() => {
  if (isDarkMode.value) {
    return 'header-dark header-bg-dark';
  }
  return 'header-light header-bg-light';
});

const logoBorderClass = computed(() => {
  return isDarkMode.value ? 'dynamic-logo-border border-blue-500' : 'dynamic-logo-border border-blue-600';
});

// Methods
const toggleMobileMenu = () => {
  mobileMenuOpen.value = !mobileMenuOpen.value;
  if (mobileMenuOpen.value) {
    document.body.style.overflow = 'hidden';
  } else {
    document.body.style.overflow = '';
  }
};

const closeMobileMenu = () => {
  mobileMenuOpen.value = false;
  document.body.style.overflow = '';
};

const toggleDropdown = (dropdown, state) => {
  dropdowns.value[dropdown] = state;
};

const closeDropdowns = () => {
  dropdowns.value.explore = false;
  dropdowns.value.more = false;
};

const startTextTransition = () => {
  textTransitionInterval = setInterval(() => {
    showMainText.value = !showMainText.value;
  }, 3000); // change every 3 seconds
};

const stopTextTransition = () => {
  if (textTransitionInterval) {
    clearInterval(textTransitionInterval);
    textTransitionInterval = null;
  }
};

const updateHeaderAppearance = () => {
  scrollPosition.value = window.pageYOffset || document.documentElement.scrollTop;
  const viewportHeight = window.innerHeight;

  if (props.isHomepage) {
    const heroSection = document.querySelector('section');
    if (heroSection) {
      const heroHeight = heroSection.offsetHeight;
      if (scrollPosition.value > heroHeight * 0.7) {
        isDarkMode.value = false;
      } else {
        isDarkMode.value = true;
      }
    }
  } else {
    if (scrollPosition.value > viewportHeight * 0.3) {
      isDarkMode.value = false;
    } else {
      const currentSection = getCurrentSection(scrollPosition.value);
      if (currentSection && hasDarkBackground(currentSection)) {
        isDarkMode.value = true;
      } else {
        isDarkMode.value = false;
      }
    }
  }
};

const getCurrentSection = (scrollPos) => {
  const sections = document.querySelectorAll('section, .hero, .banner');
  for (let section of sections) {
    const rect = section.getBoundingClientRect();
    const sectionTop = rect.top + scrollPos;
    const sectionBottom = sectionTop + rect.height;

    if (scrollPos >= sectionTop - 100 && scrollPos <= sectionBottom - 100) {
      return section;
    }
  }
  return null;
};

const hasDarkBackground = (element) => {
  const styles = window.getComputedStyle(element);
  const bgColor = styles.backgroundColor;
  const bgImage = styles.backgroundImage;

  if (bgColor && bgColor !== 'rgba(0, 0, 0, 0)' && bgColor !== 'transparent') {
    const rgb = bgColor.match(/\d+/g);
    if (rgb) {
      const brightness = (parseInt(rgb[0]) * 299 + parseInt(rgb[1]) * 587 + parseInt(rgb[2]) * 114) / 1000;
      return brightness < 128;
    }
  }

  if (bgImage && bgImage !== 'none') {
    return true;
  }

  if (element.classList) {
    const darkClasses = ['bg-dark', 'bg-gray-900', 'bg-slate-900', 'bg-blue-900', 'bg-black', 'dark', 'hero-section'];
    for (let cls of darkClasses) {
      if (element.classList.contains(cls)) {
        return true;
      }
    }
  }

  return false;
};

// Lifecycle hooks
onMounted(() => {
  updateHeaderAppearance();
  window.addEventListener('scroll', updateHeaderAppearance, { passive: true });
  window.addEventListener('resize', updateHeaderAppearance, { passive: true });

  // Start text transition animation
  startTextTransition();

  // Make sure header is always visible
  if (headerRef.value) {
    headerRef.value.style.visibility = 'visible';
    headerRef.value.style.opacity = '1';
    headerRef.value.style.transform = 'translateY(0)';
  }
});

onUnmounted(() => {
  window.removeEventListener('scroll', updateHeaderAppearance);
  window.removeEventListener('resize', updateHeaderAppearance);
  stopTextTransition();
  document.body.style.overflow = '';
});
</script>

<style scoped>
/* Ensure header stays on top and visible */
header {
  z-index: 9999 !important;
  transform: translate3d(0, 0, 0) !important;
  will-change: transform;
}

/* Text Transition Animation */
.slide-fade-enter-active {
  transition: all 0.6s ease;
}

.slide-fade-leave-active {
  transition: all 0.6s ease;
}

.slide-fade-enter-from {
  transform: translateY(10px);
  opacity: 0;
}

.slide-fade-leave-to {
  transform: translateY(-10px);
  opacity: 0;
}

/* Hamburger Icon Animation */
.hamburger-icon {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  width: 24px;
  height: 18px;
  cursor: pointer;
}

.hamburger-line {
  width: 100%;
  height: 3px;
  background-color: currentColor;
  transition: all 0.3s ease-in-out;
  border-radius: 2px;
}

/* Transform to X when active */
.hamburger-line:nth-child(1).active {
  transform: translateY(7.5px) rotate(45deg);
}

.hamburger-line:nth-child(2).active {
  opacity: 0;
}

.hamburger-line:nth-child(3).active {
  transform: translateY(-7.5px) rotate(-45deg);
}

/* Dropdown hover effects */
.dropdown:hover .dropdown-menu {
  display: block !important;
}

.dropdown:hover .fa-chevron-down {
  transform: rotate(180deg);
}

/* Light theme (default for most pages) */
:deep(.header-light .dynamic-text),
:deep(.header-light .dynamic-nav-link),
:deep(.header-light .dynamic-menu-button),
:deep(.header-light .dynamic-menu-icon),
:deep(.header-light .dynamic-dropdown-arrow) {
  color: #1f2937 !important; /* gray-800 */
}

:deep(.header-light .dynamic-j) {
  color: #2563eb !important; /* blue-600 */
}

:deep(.header-light .dynamic-p) {
  color: #dc2626 !important; /* red-600 */
}

:deep(.header-light .dynamic-corp) {
  color: #4b5563 !important; /* gray-600 */
}

:deep(.header-light .dynamic-logo-border) {
  border-color: #2563eb !important; /* blue-600 */
}

/* Dark theme (for hero sections or dark backgrounds) */
:deep(.header-dark .dynamic-text),
:deep(.header-dark .dynamic-nav-link),
:deep(.header-dark .dynamic-menu-button),
:deep(.header-dark .dynamic-menu-icon),
:deep(.header-dark .dynamic-dropdown-arrow) {
  color: white !important;
}

:deep(.header-dark .dynamic-j) {
  color: #93c5fd !important; /* blue-300 */
}

:deep(.header-dark .dynamic-p) {
  color: #fca5a5 !important; /* red-300 */
}

:deep(.header-dark .dynamic-corp) {
  color: #bfdbfe !important; /* blue-200 */
}

:deep(.header-dark .dynamic-logo-border) {
  border-color: #3b82f6 !important; /* blue-500 */
}

/* Header background states */
.header-bg-light {
  background-color: white !important;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
  border-bottom: 1px solid #e5e7eb !important;
}

.header-bg-dark {
  background-color: rgba(0, 0, 0, 0.5) !important;
  backdrop-filter: blur(8px) !important;
}

/* Smooth transitions */
.dynamic-header,
:deep(.dynamic-text),
:deep(.dynamic-nav-link),
:deep(.dynamic-menu-button),
:deep(.dynamic-menu-icon),
:deep(.dynamic-dropdown-arrow),
:deep(.dynamic-j),
:deep(.dynamic-p),
:deep(.dynamic-corp),
:deep(.dynamic-logo-border) {
  transition: all 0.3s ease-in-out !important;
}

.font-serif {
  font-family: 'Times New Roman', serif;
}

@keyframes slideInDown {
  from {
    opacity: 0;
    transform: translateY(-8px) scale(0.95);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

/* ===========================================
   RESPONSIVE ADJUSTMENTS (Mobile First)
   =========================================== */

/* Default: Mobile-first (base styles already apply) */

/* sm: ≥640px — small tablets */
@media (min-width: 640px) {
  header .container {
    padding-left: 1rem;
    padding-right: 1rem;
  }

  header img {
    width: 3.5rem; /* 56px */
  }

  header .dynamic-text {
    font-size: 1rem;
  }
}

/* md: ≥768px — tablets / small laptops */
@media (min-width: 768px) {
  /* Show desktop nav, hide mobile menu button */
  header nav {
    display: flex !important;
  }

  header button.dynamic-menu-button {
    display: none !important;
  }

  /* Adjust logo sizing */
  header img {
    width: 4rem; /* 64px */
  }

  /* Adjust spacing and typography */
  header .dynamic-text {
    font-size: 1.125rem;
  }

  header .dynamic-corp {
    font-size: 0.875rem;
  }

  /* Make dropdown menus align better */
  .dropdown-menu {
    min-width: 12rem;
  }
}

/* lg: ≥1024px — desktops */
@media (min-width: 1024px) {
  header .container {
    padding-left: 2rem;
    padding-right: 2rem;
  }

  header img {
    width: 4.5rem; /* 72px */
  }

  header .dynamic-text {
    font-size: 1.25rem;
  }

  header .dynamic-corp {
    font-size: 1rem;
  }

  /* Slightly increase gap in nav links */
  header nav ul {
    gap: 1.75rem;
  }
}

/* xl: ≥1280px — large desktops */
@media (min-width: 1280px) {
  header img {
    width: 5rem; /* 80px */
  }

  header .dynamic-text {
    font-size: 1.5rem;
  }

  header .dynamic-corp {
    font-size: 1.125rem;
  }

  /* Restore your original large layout spacing */
  header .container {
    padding-left: 3rem;
    padding-right: 3rem;
  }
}

/* 2xl: ≥1536px — ultra-wide screens */
@media (min-width: 1536px) {
  header .container {
    max-width: 1440px;
  }

  header nav ul {
    gap: 2.25rem;
  }

  header img {
    width: 5.5rem; /* 88px */
  }
}
</style>