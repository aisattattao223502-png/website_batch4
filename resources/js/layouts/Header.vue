<template>
  <div>
    <!-- OPTIMIZED RESPONSIVE HEADER -->
    <header
      ref="headerRef"
      :class="[
        'fixed top-0 left-0 right-0 z-[9999] transition-all duration-300',
        headerClasses,
      ]"
      style="font-family: 'Inter', 'Helvetica Neue', Arial, sans-serif"
      id="main-header"
    >
      <div class="container mx-auto px-3 sm:px-4 md:px-6 lg:px-8 xl:px-10 py-3 sm:py-3.5 md:py-4 flex items-center justify-between gap-2">
        <!-- LOGO + COMPANY NAME -->
        <div class="flex items-center gap-2 sm:gap-3 flex-shrink-0 max-w-[60%] sm:max-w-none">
          <img
            :src="logoPath"
            alt="James Polymers"
            :class="[
              'rounded-full object-cover shadow-md bg-white',
              'aspect-square w-12 h-12 xs:w-14 xs:h-14 sm:w-16 sm:h-16 md:w-18 md:h-18 lg:w-20 lg:h-20 xl:w-22 xl:h-22',
              'transition-transform duration-300 ease-in-out',
              'scale-125 sm:scale-150',
              'mt-2 sm:mt-4 mr-2 sm:mr-4',
              'flex-shrink-0',
              'logo-border',
            ]"
          />

          <div class="flex flex-col justify-center w-auto sm:w-64 md:w-72 lg:w-80 xl:w-96 min-w-0">
            <div class="text-sm xs:text-base sm:text-lg md:text-xl font-bold dynamic-text tracking-tight leading-tight">
              <!-- Animated Text Transition - EVERYTHING transitions -->
              <span class="block relative h-14 xs:h-16 sm:h-16 md:h-20 overflow-hidden">
                <transition name="slide-fade" mode="out-in">
                  <!-- State 1: Full Company Name -->
                  <span 
                    v-if="showMainText" 
                    :key="'main'"
                    class="flex flex-col"
                  >
                    <span class="whitespace-nowrap">
                      <span class="font-serif dynamic-j text-2xl xs:text-3xl sm:text-3xl md:text-4xl lg:text-5xl italic">J</span>
                      <span class="text-xs xs:text-sm sm:text-sm md:text-base lg:text-lg mr-2">AMES</span>
                      <span class="font-serif pe-0.5 sm:pe-1 dynamic-p text-2xl xs:text-3xl sm:text-3xl md:text-4xl lg:text-5xl italic">P</span><span class="text-xs xs:text-sm sm:text-sm md:text-base lg:text-lg">OLYMERS</span>
                    </span>
                    <span class="text-[0.55rem] xs:text-[0.6rem] sm:text-xs md:text-sm font-semibold dynamic-corp mt-1 whitespace-nowrap">
                      MANUFACTURING CORP.
                    </span>
                  </span>

                  <!-- State 2: Tagline -->
                  <span 
                    v-else 
                    :key="'tagline'"
                    class="flex flex-col tagline-font mt-3 xs:mt-4 sm:mt-4"
                  >
                    <span class="text-xs xs:text-sm sm:text-sm md:text-base lg:text-lg dynamic-tagline whitespace-nowrap">Our Expertise is</span>
                    <span class="ml-4 xs:ml-6 sm:ml-8 text-xs xs:text-sm sm:text-sm md:text-base lg:text-lg dynamic-tagline whitespace-nowrap">your Advantage</span>
                  </span>
                </transition>
              </span>
            </div>
          </div>
        </div>

        <!-- DESKTOP NAVIGATION -->
        <nav class="hidden lg:flex items-center ml-2 xl:ml-4 flex-shrink-0">
          <ul class="flex flex-nowrap space-x-3 xl:space-x-6 items-center">
            <li>
              <Link
                href="/"
                class="menu-link font-semibold uppercase text-xs xl:text-sm transition-colors dynamic-nav-link hover:text-blue-400 whitespace-nowrap"
              >
                Home
              </Link>
            </li>
            <li>
              <Link
                href="/about"
                class="menu-link font-semibold uppercase text-xs xl:text-sm transition-colors dynamic-nav-link hover:text-blue-400 whitespace-nowrap"
              >
                About
              </Link>
            </li>

            <!-- EXPLORE DROPDOWN -->
            <li class="dropdown relative" @mouseenter="toggleDropdown('explore', true)" @mouseleave="toggleDropdown('explore', false)">
              <a
                href="#"
                class="explore-dropdown font-semibold uppercase text-xs xl:text-sm flex items-center transition-colors dynamic-nav-link hover:text-blue-400 whitespace-nowrap"
                @click.prevent
              >
                Explore
                <i :class="['fas fa-chevron-down ml-1 text-[0.6rem] xl:text-xs transition-transform duration-300 dynamic-dropdown-arrow', { 'rotate-180': dropdowns.explore }]"></i>
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
                class="menu-link font-semibold uppercase text-xs xl:text-sm transition-colors dynamic-nav-link hover:text-blue-400 whitespace-nowrap"
              >
                Contact
              </Link>
            </li>

            <!-- MORE DROPDOWN -->
            <li class="dropdown relative" @mouseenter="toggleDropdown('more', true)" @mouseleave="toggleDropdown('more', false)">
              <a
                href="#"
                class="menu-link font-semibold uppercase text-xs xl:text-sm flex items-center transition-colors dynamic-nav-link hover:text-blue-400 whitespace-nowrap"
                @click.prevent
              >
                More
                <i :class="['fas fa-chevron-down ml-1 text-[0.6rem] xl:text-xs transition-transform duration-300 dynamic-dropdown-arrow', { 'rotate-180': dropdowns.more }]"></i>
              </a>
              <ul
                v-show="dropdowns.more"
                class="dropdown-menu absolute right-0 top-full w-56 bg-white shadow-lg rounded-md py-2 z-[99999] border border-gray-200"
              >
                <li>
                  <Link href="/sustainability" @click="closeDropdowns" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    Sustainability
                  </Link>
                </li>
                <li>
                  <Link href="/overview-process" @click="closeDropdowns" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    Overview Process
                  </Link>
                </li>
                <li>
                  <Link href="/news-events" @click="closeDropdowns" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    News & Events
                  </Link>
                </li>
                <li>
                  <Link href="/careers" @click="closeDropdowns" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    Careers
                  </Link>
                </li>
                <li>
                  <Link href="/faq" @click="closeDropdowns" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
                    FAQ
                  </Link>
                </li>
                <li>
                  <Link href="/privacy-policy" @click="closeDropdowns" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 text-sm transition-colors">
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
          class="lg:hidden dynamic-menu-button p-2.5 rounded-lg hover:bg-black/10 transition-colors flex-shrink-0"
        >
          <div class="hamburger-icon w-7 h-6">
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
import { Link } from '@inertiajs/vue3';

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
  }, 3000);
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
  startTextTransition();

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
/* FONT */
@font-face {
  font-family: 'WorldDiscovery';
  src: url('/storage/assets/fonts/world_discovery/WorldDiscovery_PERSONAL_USE_ONLY.otf') format('opentype');
  font-weight: normal;
  font-style: normal;
}

/* Header Foundation */
header {
  z-index: 9999 !important;
  transform: translate3d(0, 0, 0) !important;
  will-change: transform;
}

/* Logo Border - Blue */
.logo-border {
  border: 3px solid #2563eb;
  padding: 2px;
}

/* Text Transition Animation */
.slide-fade-enter-active,
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

/* Mobile Menu Transition */
.mobile-menu-enter-active,
.mobile-menu-leave-active {
  transition: opacity 0.3s ease;
}

.mobile-menu-enter-from,
.mobile-menu-leave-to {
  opacity: 0;
}

/* Mobile Menu Transition */
.mobile-menu-enter-active,
.mobile-menu-leave-active {
  transition: opacity 0.3s ease;
}

.mobile-menu-enter-from,
.mobile-menu-leave-to {
  opacity: 0;
}

/* Hamburger Icon */
.hamburger-icon {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  cursor: pointer;
}

.hamburger-line {
  width: 100%;
  height: 3px;
  background-color: currentColor;
  transition: all 0.3s ease-in-out;
  border-radius: 2px;
}

.hamburger-line:nth-child(1).active {
  transform: translateY(9px) rotate(45deg);
}

.hamburger-line:nth-child(2).active {
  opacity: 0;
}

.hamburger-line:nth-child(3).active {
  transform: translateY(-9px) rotate(-45deg);
}

/* Dropdown Effects */
.dropdown:hover .dropdown-menu {
  display: block !important;
}

.dropdown:hover .fa-chevron-down {
  transform: rotate(180deg);
}

/* Theme Colors - Light */
:deep(.header-light .dynamic-text),
:deep(.header-light .dynamic-nav-link),
:deep(.header-light .dynamic-menu-button),
:deep(.header-light .dynamic-dropdown-arrow) {
  color: #1f2937 !important;
}

:deep(.header-light .dynamic-j) {
  color: #2563eb !important;
}

:deep(.header-light .dynamic-p) {
  color: #dc2626 !important;
}

:deep(.header-light .dynamic-corp) {
  color: #4b5563 !important; /* gray-600 */
}

:deep(.header-light .dynamic-tagline) {
  color: #4b5563 !important; /* gray-600 */
}

/* Theme Colors - Dark */
:deep(.header-dark .dynamic-text),
:deep(.header-dark .dynamic-nav-link),
:deep(.header-dark .dynamic-menu-button),
:deep(.header-dark .dynamic-dropdown-arrow) {
  color: white !important;
}

:deep(.header-dark .dynamic-j) {
  color: #93c5fd !important;
}

:deep(.header-dark .dynamic-p) {
  color: #fca5a5 !important;
}

:deep(.header-dark .dynamic-corp) {
  color: #bfdbfe !important; /* blue-200 */
}

:deep(.header-dark .dynamic-tagline) {
  color: #bfdbfe !important; /* blue-200 */
}

/* Header Backgrounds */
.header-bg-light {
  background-color: white !important;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
  border-bottom: 1px solid #e5e7eb !important;
}

.header-bg-dark {
  background-color: rgba(0, 0, 0, 0.5) !important;
  backdrop-filter: blur(8px) !important;
}

/* Smooth Transitions */
.dynamic-header,
:deep(.dynamic-text),
:deep(.dynamic-nav-link),
:deep(.dynamic-menu-button),
:deep(.dynamic-dropdown-arrow),
:deep(.dynamic-j),
:deep(.dynamic-p),
:deep(.dynamic-corp) {
  transition: all 0.3s ease-in-out !important;
}

:deep(.dynamic-tagline) {
  transition: all 0.3s ease-in-out !important;
}

/* Typography */
.font-serif {
  font-family: 'Times New Roman', serif;
}

.tagline-font {
  font-family: 'WorldDiscovery', 'Inter', Arial, sans-serif !important;
  font-weight: 400;
  letter-spacing: 0.10em;
  line-height: 1.2;
}

/* Responsive Adjustments */

/* Extra Small devices (iPhone SE, Galaxy S8+, small phones: 320px - 374px) */
@media (max-width: 374px) {
  header .container {
    padding: 0.75rem 0.75rem !important;
  }
  
  .dynamic-text {
    font-size: 0.75rem !important;
  }
  
  .dynamic-j,
  .dynamic-p {
    font-size: 1.5rem !important;
  }
  
  .dynamic-corp {
    font-size: 0.5rem !important;
  }
  
  .tagline-font span {
    font-size: 0.75rem !important;
  }
  
  .tagline-font span:last-child {
    margin-left: 1rem !important;
  }
  
  .hamburger-icon {
    width: 24px !important;
    height: 20px !important;
  }
  
  .hamburger-line {
    height: 2.5px !important;
  }
  
  .hamburger-line:nth-child(1).active {
    transform: translateY(8.5px) rotate(45deg) !important;
  }
  
  .hamburger-line:nth-child(3).active {
    transform: translateY(-8.5px) rotate(-45deg) !important;
  }
}

/* Small devices (phones: 375px - 639px) */
@media (min-width: 375px) and (max-width: 639px) {
  header .container {
    padding: 0.75rem 1rem !important;
  }
  
  .dynamic-text {
    font-size: 0.875rem !important;
  }
  
  .dynamic-j,
  .dynamic-p {
    font-size: 1.75rem !important;
  }
  
  .dynamic-corp {
    font-size: 0.55rem !important;
  }
  
  .tagline-font span {
    font-size: 0.875rem !important;
  }
}

/* sm: ≥640px — small tablets and large phones */
@media (min-width: 640px) {
  header .container {
    padding: 0.875rem 1rem;
  }

  .tagline-font {
    margin-top: 0.75rem;
  }
  
  .tagline-font span {
    font-size: 0.875rem !important;
  }
}

/* iPad Mini, iPad Air portrait (768px - 820px) */
@media (min-width: 768px) and (max-width: 820px) {
  header nav ul {
    gap: 0.5rem !important;
  }
  
  header nav {
    margin-left: 0.5rem !important;
  }
  
  .menu-link,
  .explore-dropdown {
    font-size: 0.65rem !important;
  }
  
  .fa-chevron-down {
    font-size: 0.5rem !important;
  }
}

/* md: ≥768px — tablets / small laptops */
@media (min-width: 768px) {
  header nav {
    display: flex !important;
  }

  header button.dynamic-menu-button {
    display: none !important;
  }

  .dropdown-menu {
    min-width: 12rem;
  }
  
  .tagline-font {
    margin-top: 0.75rem;
  }
  
  .tagline-font span {
    font-size: 1rem !important;
  }
  
  header .container {
    padding: 1rem 1.5rem;
  }
}

/* iPad Air landscape and similar (821px - 1023px) */
@media (min-width: 821px) and (max-width: 1023px) {
  header nav ul {
    gap: 0.75rem !important;
  }
  
  .menu-link,
  .explore-dropdown {
    font-size: 0.7rem !important;
  }
}

/* lg: ≥1024px — desktops */
@media (min-width: 1024px) {
  header .container {
    padding-left: 1.5rem;
    padding-right: 1.5rem;
  }

  header nav ul {
    gap: 1rem;
  }
  
  .tagline-font {
    margin-top: 0.75rem;
  }
  
  .tagline-font span {
    font-size: 1.125rem !important;
  }
}

/* xl: ≥1280px — large desktops */
@media (min-width: 1280px) {
  header .container {
    padding-left: 2rem;
    padding-right: 2rem;
  }
  
  header nav ul {
    gap: 1.5rem;
  }
  
  .tagline-font span {
    font-size: 1.125rem !important;
  }
}

/* 2xl: ≥1536px — ultra-wide screens */
@media (min-width: 1536px) {
  header .container {
    max-width: 1440px;
    padding-left: 3rem;
    padding-right: 3rem;
  }

  header nav ul {
    gap: 2.25rem;
  }
  
  .tagline-font span {
    font-size: 1.25rem !important;
  }
}

.menu-link,
.explore-dropdown {
  font-size: 0.9rem;    /* adjust to your liking */
}

@media (min-width: 1280px) {
  .menu-link,
  .explore-dropdown {
    font-size: 1rem;
  }
}

</style>