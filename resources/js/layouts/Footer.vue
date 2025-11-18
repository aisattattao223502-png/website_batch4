<template>
  <footer
    id="site-footer"
    class="footer-bg text-white py-12 md:py-16 relative"
    style="font-family: 'Inter', 'Helvetica Neue', Arial, sans-serif;"
  >
    <!-- Floating Particles -->
    <div class="floating-particles">
      <div class="particle"></div>
      <div class="particle"></div>
      <div class="particle"></div>
    </div>

    <div class="container mx-auto px-4 footer-content">
      <!-- Main Footer Content -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-12 gap-8 mb-10">
        <!-- Logo and Company Info -->
        <div class="md:col-span-2 lg:col-span-4">
          <div class="brand-section">
            <!-- Logo and Company Info -->
            <div class="logo-container">
              <img
                src="/storage/assets/img/header/logowhitebgfinal.png"
                alt="James Polymers Logo"
                class="responsive-logo rounded-full object-contain"
              />
              <div class="company-info">
                <h3 class="text-xl font-bold text-blue-400 mb-2">
                  James Golden Empire International
                </h3>
                <div class="company-tagline">Leading Polymer Solutions Provider</div>
              </div>
            </div>

            <!-- Social Media -->
            <div class="social-section">
              <div class="follow-us-title">Follow Us</div>
              <div class="flex space-x-3">
                <a
                  v-for="social in socialLinks"
                  :key="social.name"
                  :href="social.url"
                  target="_blank"
                  :class="[
                    'social-icon flex items-center justify-center w-10 h-10',
                    'bg-white/10 rounded-lg text-white transition-all duration-300',
                    social.hoverColor
                  ]"
                >
                  <i :class="social.icon"></i>
                </a>
              </div>
            </div>
          </div>
        </div>

        <!-- Quick Links -->
        <div class="lg:col-span-2">
          <h3 class="section-title">Quick Links</h3>
          <ul class="grid grid-cols-2 sm:grid-cols-1 gap-x-4 gap-y-3">
            <li v-for="link in quickLinks" :key="link.url">
              <Link
                :href="link.url"
                class="link-hover text-gray-300 hover:text-white transition-colors duration-300 inline-block text-sm sm:text-base"
              >
                {{ link.text }}
              </Link>
            </li>
          </ul>
        </div>

        <!-- Explore -->
        <div class="lg:col-span-2">
          <h3 class="section-title">Explore</h3>
          <ul class="grid grid-cols-2 sm:grid-cols-1 gap-x-4 gap-y-3">
            <li v-for="link in exploreLinks" :key="link.url">
              <Link
                :href="link.url"
                class="link-hover text-gray-300 hover:text-white transition-colors duration-300 inline-block text-sm sm:text-base"
              >
                {{ link.text }}
              </Link>
            </li>
          </ul>
        </div>

        <!-- Company -->
        <div class="lg:col-span-2">
          <h3 class="section-title">Company</h3>
          <ul class="grid grid-cols-2 sm:grid-cols-1 gap-x-4 gap-y-3">
            <li v-for="link in companyLinks" :key="link.url">
              <Link
                :href="link.url"
                class="link-hover text-gray-300 hover:text-white transition-colors duration-300 inline-block text-sm sm:text-base"
              >
                {{ link.text }}
              </Link>
            </li>
          </ul>
        </div>

        <!-- Contact Info -->
        <div class="lg:col-span-2">
          <h3 class="section-title">Contact</h3>
          <ul class="space-y-3 text-sm">
            <li class="flex items-start">
              <i class="fas fa-map-marker-alt mt-1 mr-3 text-blue-400"></i>
              <span class="text-gray-300">
                016 Panapaan 2, Bacoor City, 4102, Cavite, Philippines
              </span>
            </li>
            <li class="flex items-start">
              <i class="fas fa-phone mt-1 mr-3 text-blue-400"></i>
              <a
                href="tel:+632852989785"
                class="text-gray-300 hover:text-white transition-colors"
              >
                +63 (2) 852989785
              </a>
            </li>
            <li class="flex items-start">
              <i class="fas fa-envelope mt-1 mr-3 text-blue-400"></i>
              <a
                href="mailto:jamespro_asia@yahoo.com"
                class="text-gray-300 hover:text-white transition-colors"
              >
                jamespro_asia@yahoo.com
              </a>
            </li>
          </ul>
        </div>
      </div>

      <!-- Section Divider -->
      <div class="section-divider my-8"></div>

      <!-- Bottom Footer -->
<div
  class="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0"
>
  <!-- Copyright and Back to Top combined for mobile -->
  <div class="text-center md:text-left flex flex-col sm:flex-row items-center gap-4 w-full md:w-auto justify-center md:justify-start">
    <p class="text-gray-400 text-sm">
      &copy; {{ currentYear }} James Golden Empire International. All Rights Reserved.
    </p>
    <a
      href="#top"
      class="inline-flex items-center text-gray-400 hover:text-white transition-colors duration-300 group text-sm md:hidden"
    >
      <span>Back to Top</span>
      <i
        class="fas fa-chevron-up ml-2 group-hover:-translate-y-1 transition-transform duration-300"
      ></i>
    </a>
  </div>

  <div class="flex flex-wrap justify-center gap-4 text-sm">
    <Link
      href="/privacy-policy"
      class="text-gray-400 hover:text-white transition-colors duration-300 link-hover"
    >
      Privacy Policy
    </Link>
    <span class="text-gray-600 hidden md:inline">|</span>
    <a
      href="https://www.privacy.gov.ph/data-privacy-act/"
      target="_blank"
      class="text-gray-400 hover:text-white transition-colors duration-300 link-hover"
    >
      Data Privacy Act
    </a>
    <span class="text-gray-600 hidden md:inline">|</span>
    <a
      href="https://www.officialgazette.gov.ph/2012/09/12/republic-act-no-10175/"
      target="_blank"
      class="text-gray-400 hover:text-white transition-colors duration-300 link-hover"
    >
      Cybercrime Prevention
    </a>
  </div>

  <!-- Back to Top - Desktop only, on the right side -->
  <div class="hidden md:block text-right">
    <a
      href="#top"
      class="inline-flex items-center text-gray-400 hover:text-white transition-colors duration-300 group text-sm"
    >
      <span>Back to Top</span>
      <i
        class="fas fa-chevron-up ml-2 group-hover:-translate-y-1 transition-transform duration-300"
      ></i>
    </a>
  </div>
</div>
    </div>
  </footer>
</template>

<script setup>
import { computed } from 'vue';
import { Link } from '@inertiajs/vue3';

const currentYear = computed(() => new Date().getFullYear());

const socialLinks = [
  {
    name: 'Facebook',
    url: 'https://www.facebook.com/profile.php?id=61573770164726',
    icon: 'fab fa-facebook-f',
    hoverColor: 'hover:bg-blue-500'
  },
  {
    name: 'Instagram',
    url: 'https://www.instagram.com/jgempireintl?igsh=YWRxeXFsczMxdzFm',
    icon: 'fab fa-instagram',
    hoverColor: 'hover:bg-pink-500'
  },
  {
    name: 'YouTube',
    url: 'https://www.youtube.com/@jamesgoldenempireinternational',
    icon: 'fab fa-youtube',
    hoverColor: 'hover:bg-red-500'
  },
  {
    name: 'LinkedIn',
    url: 'https://www.linkedin.com/in/jgeintl/',
    icon: 'fab fa-linkedin-in',
    hoverColor: 'hover:bg-blue-600'
  }
];

const quickLinks = [
  { text: 'Home', url: '/' },
  { text: 'About', url: '/about' },
  { text: 'Products', url: '/products' },
  { text: 'Contact', url: '/contact' }
];

const exploreLinks = [
  { text: 'Industries', url: '/industries' },
  { text: 'Sustainability', url: '/sustainability' },
  { text: 'Awards', url: '/awards' },
  { text: 'FAQs', url: '/faq' }
];

const companyLinks = [
  { text: 'News & Events', url: '/news-events' },
  { text: 'Careers', url: '/careers' },
  { text: 'Privacy Policy', url: '/privacy-policy' },
  { text: 'Overview Process', url: '/overview-process' }
];
</script>

<style scoped>

/* Add these new responsive styles */
@media (max-width: 640px) {
  .section-title {
    font-size: 1rem;
  }
  
  .footer-bg {
    padding-top: 2rem;
    padding-bottom: 2rem;
  }
}

/* Tablet breakpoint */
@media (min-width: 641px) and (max-width: 1024px) {
  .grid.grid-cols-1.md\:grid-cols-2.lg\:grid-cols-12 > div {
    padding: 0 1rem;
  }
}

/* Ensure contact info is readable on all devices */
.contact-info-text {
  font-size: 0.875rem;
  line-height: 1.5;
}

@media (max-width: 640px) {
  .contact-info-text {
    font-size: 0.8125rem;
  }
}

.footer-bg {
  background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.9)),
  url('/storage/assets/img/footer/bgg.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  position: relative;
  overflow: hidden;
}

.footer-bg::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(
    135deg,
    rgba(59, 130, 246, 0.1) 0%,
    rgba(99, 102, 241, 0.05) 100%
  );
  z-index: 1;
}

.footer-content {
  position: relative;
  z-index: 2;
}

.responsive-logo {
  max-width: 140px;
  height: auto;
}

@media (max-width: 768px) {
  .responsive-logo {
    max-width: 110px;
  }
}

.floating-particles {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 1;
}

.particle {
  position: absolute;
  background: rgba(59, 130, 246, 0.3);
  border-radius: 50%;
  animation: float 6s ease-in-out infinite;
}

.particle:nth-child(1) {
  width: 4px;
  height: 4px;
  top: 20%;
  left: 10%;
  animation-delay: 0s;
}

.particle:nth-child(2) {
  width: 3px;
  height: 3px;
  top: 60%;
  left: 80%;
  animation-delay: 2s;
}

.particle:nth-child(3) {
  width: 2px;
  height: 2px;
  top: 40%;
  left: 50%;
  animation-delay: 4s;
}

@keyframes float {
  0%,
  100% {
    transform: translateY(0) translateX(0);
  }
  50% {
    transform: translateY(-20px) translateX(10px);
  }
}

.section-divider {
  height: 1px;
  background: linear-gradient(
    90deg,
    transparent,
    rgba(59, 130, 246, 0.5),
    transparent
  );
}

.social-icon {
  transition: all 0.3s ease;
}

.social-icon:hover {
  transform: translateY(-3px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.link-hover {
  transition: all 0.3s ease;
  position: relative;
}

.link-hover::after {
  content: '';
  position: absolute;
  width: 0;
  height: 1px;
  bottom: -2px;
  left: 0;
  background: #3b82f6;
  transition: width 0.3s ease;
}

.link-hover:hover::after {
  width: 100%;
}

.section-title {
  @apply text-lg font-bold mb-4 text-blue-400 relative pb-2;
}

.section-title::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 3rem;
  height: 0.125rem;
  background: #3b82f6;
}

.company-tagline {
  font-size: 1rem;
  color: #d1d5db;
  font-weight: 400;
  margin-bottom: 1.5rem;
}

.follow-us-title {
  font-size: 1.125rem;
  font-weight: 600;
  color: white;
  margin-bottom: 1rem;
}

.brand-section {
  display: flex;
  flex-direction: column;
  width: 100%;
}

.logo-container {
  display: flex;
  align-items: center;
  margin-bottom: 1rem;
}

.company-info {
  margin-left: 1.5rem;
}

.social-section {
  display: flex;
  flex-direction: column;
  width: 100%;
}

@media (max-width: 768px) {
  .logo-container {
    flex-direction: column;
    text-align: center;
  }

  .company-info {
    margin-left: 0;
    margin-top: 1rem;
  }
}
</style>