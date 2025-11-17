<script setup>
import { Head, Link } from '@inertiajs/vue3';
import Header from '@/layouts/Header.vue';
import Footer from '@/layouts/Footer.vue';
import Chatbot from '@/layouts/Chatbot.vue';

const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      banner: {
        heading: 'Contact Us',
        breadcrumb: 'Contact',
        background_image: '/storage/assets/img/banners/contact_banner.jpg',
        overlay_image: '/storage/assets/img/banners/contact_banner.jpg'
      },
      map: {
        iframe_src: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d488.8849933426653!2d120.95594617157205!3d14.452064021803464!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397cd8f21555555%3A0xa3b07b32dcee1f3d!2sJames%20Polymers%20Manufacturing%20Corporation.!5e0!3m2!1sen!2sph!4v1746000140786!5m2!1sen!2sph'
      },
      cta: {
        heading: 'Ready to Discuss Your Project?',
        description: 'Our technical sales team is available to help you select the right polymer solution for your application.',
        button_text: 'View Products',
        background_image: '/storage/assets/img/banners/contact_cta.jpg'
      },
      google_form_url: 'https://forms.gle/Hn4KY5cUWcA8HiP8A'
    })
  }
});

const openGoogleForm = () => {
  window.open(props.content.google_form_url, '_blank');
};
</script>

<template>
  <Head title="Contact Us | James Polymers - High Performance Polymer Solutions">
    <link rel="icon" type="image/png" href="/storage/assets/img/tab_icon.png">
  </Head>

  <div>
    <!-- Header -->
    <Header />

    <!-- Hero Section -->
    <section
      class="relative bg-blue-400 h-64 md:h-80 lg:h-96 flex items-center justify-center bg-cover bg-center drop-shadow-2xl mt-[14vh]"
      :style="`background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('${content.banner.background_image}')`"
    >
      <!-- Inclined overlay image -->
      <img
        :src="content.banner.overlay_image"
        alt="Inclined Overlay"
        class="absolute inset-0 w-full h-full object-cover"
        style="mix-blend-mode: multiply; opacity: 1;"
      >

      <div class="container mx-auto px-4 text-center text-white relative z-10">
        <h1 class="text-3xl md:text-4xl lg:text-5xl font-bold mb-4">{{ content.banner.heading }}</h1>
        <div class="flex justify-center items-center text-sm md:text-base">
          <Link href="/" class="text-white hover:text-blue-300 transition">Home</Link>
          <span class="mx-2">/</span>
          <span class="text-blue-300">{{ content.banner.breadcrumb }}</span>
        </div>
      </div>
    </section>

    <!-- Contact Section -->
    <section class="py-12 md:py-16 bg-white">
      <div class="container mx-auto px-4">
        <div class="flex flex-col lg:flex-row gap-8 lg:gap-12">
          <!-- Contact Information (Left Side) -->
          <div class="w-full lg:w-1/2">
            <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold mb-6 md:mb-8 text-gray-800">Get in Touch</h2>
            <div class="space-y-6">
              <!-- Address -->
              <div class="flex items-start">
                <div class="icon-circle">
                  <i class="fas fa-map-marker-alt"></i>
                </div>
                <div>
                  <h3 class="text-lg font-bold mb-1 text-gray-800">Address</h3>
                  <p class="text-sm md:text-base text-gray-600">016 Panapaan 2, Bacoor City, 4102, Cavite, Philippines</p>
                </div>
              </div>

              <!-- Phone -->
              <div class="flex items-start">
                <div class="icon-circle">
                  <i class="fas fa-phone-alt"></i>
                </div>
                <div>
                  <h3 class="text-lg font-bold mb-1 text-gray-800">Phone</h3>
                  <a href="tel:+63285298978" class="block text-sm md:text-base text-gray-600 hover:text-primary transition">+63 (2) 85298978</a>
                </div>
              </div>

              <!-- Email -->
              <div class="flex items-start">
                <div class="icon-circle">
                  <i class="fas fa-envelope"></i>
                </div>
                <div>
                  <h3 class="text-lg font-bold mb-1 text-gray-800">Email</h3>
                  <a href="mailto:jamespro_asia@yahoo.com" class="block text-sm md:text-base text-gray-600 hover:text-primary transition break-all">jamespro_asia@yahoo.com</a>
                  <a href="mailto:jamespolymers.international@gmail.com" class="block text-sm md:text-base text-gray-600 hover:text-primary transition break-all">jamespolymers.international@gmail.com</a>
                </div>
              </div>

              <!-- Hours -->
              <div class="flex items-start">
                <div class="icon-circle">
                  <i class="fas fa-clock"></i>
                </div>
                <div>
                  <h3 class="text-lg font-bold mb-1 text-gray-800">Hours</h3>
                  <p class="text-sm md:text-base text-gray-600">Monday-Friday: 8:00am - 5:00pm</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Send Message Section (Right Side) -->
          <div class="w-full lg:w-1/2">
            <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold mb-6 md:mb-8 text-gray-800">Send Us a Message</h2>
            
            <div class="flex items-center justify-start w-full">
              <button
                @click="openGoogleForm"
                class="bg-gradient-to-r from-[#fdbb2d] to-[#f7931e] text-white hover:shadow-xl font-bold py-4 px-10 rounded-lg transition duration-300 shadow-lg transform hover:scale-105 flex items-center gap-3 text-lg uppercase"
              >
                <i class="fas fa-paper-plane"></i>
                <span>Send Message</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Map Section -->
    <section id="map" class="h-64 md:h-96 lg:h-[500px] bg-gray-100">
      <div class="map-container h-full w-full">
        <iframe
          :src="content.map.iframe_src"
          width="100%"
          height="100%"
          style="border:0;"
          allowfullscreen=""
          loading="lazy"
          class="map-container"
        ></iframe>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="relative py-12 md:py-16 lg:py-20 text-white">
      <!-- Background image with opacity -->
      <div class="absolute inset-0">
        <img
          :src="content.cta.background_image"
          alt="Banner Background"
          class="w-full h-full object-cover opacity-80"
        >
        <!-- Optional banner color overlay -->
        <div class="absolute inset-0 bg-primary opacity-60"></div>
      </div>

      <!-- Content -->
      <div class="relative container mx-auto px-4 text-center">
        <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold mb-4 md:mb-6">
          {{ content.cta.heading }}
        </h2>
        <p class="text-base md:text-lg lg:text-xl mb-6 md:mb-8 max-w-3xl mx-auto">
          {{ content.cta.description }}
        </p>
        <div class="flex flex-col sm:flex-row justify-center gap-4">
          <Link
            href="/products"
            class="bg-transparent border-2 border-white text-white font-bold py-3 px-6 md:px-8 rounded-lg hover:bg-white hover:text-primary transition duration-300 text-sm md:text-base"
          >
            {{ content.cta.button_text }}
          </Link>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <Footer />
  </div>
</template>

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

/* Icon circle styling */
.icon-circle {
  width: 50px;
  height: 50px;
  min-width: 50px;
  background: linear-gradient(135deg, #fdbb2d 0%, #f7931e 100%);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 1rem;
  margin-top: 0.25rem;
  flex-shrink: 0;
}

.icon-circle i {
  color: white;
  font-size: 1.25rem;
}

/* Smooth scroll */
html {
  scroll-behavior: smooth;
}

/* Map container responsive */
.map-container {
  width: 100%;
  height: 100%;
}

/* Responsive breakpoints for better spacing */
@media (max-width: 640px) {
  .container {
    padding-left: 1rem;
    padding-right: 1rem;
  }
  
  .icon-circle {
    width: 40px;
    height: 40px;
    min-width: 40px;
  }
  
  .icon-circle i {
    font-size: 1rem;
  }
}

@media (min-width: 768px) and (max-width: 1024px) {
  .container {
    padding-left: 2rem;
    padding-right: 2rem;
  }
}
</style>