<script setup>
import { Head, Link, useForm } from '@inertiajs/vue3';
import { ref } from 'vue';
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
      }
    })
  },
  success: {
    type: String,
    default: ''
  },
  error: {
    type: String,
    default: ''
  }
});

// Contact form
const contactForm = useForm({
  fullName: '',
  email: '',
  phone: '',
  companyName: '',
  position: '',
  companyAddress: '',
  subject: '',
  priority: '',
  message: ''
});

const submitContactForm = () => {
  contactForm.post(route('contact.submit'), {
    preserveScroll: true,
    onSuccess: () => {
      contactForm.reset();
    },
  });
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
    <section class="py-16 bg-white">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16">
          <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-4">Get In Touch</h2>
          <p class="text-gray-600 max-w-3xl mx-auto">Our team is ready to assist you with any questions about our polymer solutions and services.</p>
        </div>

        <!-- Contact Methods -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-16">
          <!-- Call Us -->
          <div class="contact-method bg-white rounded-lg shadow-md hover:shadow-2xl transition-shadow duration-300 p-6 text-center">
            <div class="bg-primary bg-opacity-10 w-16 h-16 rounded-full flex items-center justify-center mb-4 mx-auto">
              <i class="fas fa-phone-alt text-primary text-2xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">Call Us</h3>
            <p class="text-gray-600 mb-4">Speak directly with our technical team</p>
            <a href="tel:+63285298978" class="text-primary font-semibold hover:text-secondary transition">+63 (2) 8529 8978</a>
          </div>

          <!-- Email Us -->
          <div class="contact-method bg-white rounded-lg shadow-md hover:shadow-2xl transition-shadow duration-300 p-6 text-center">
            <div class="bg-primary bg-opacity-10 w-16 h-16 rounded-full flex items-center justify-center mb-4 mx-auto">
              <i class="fas fa-envelope text-primary text-2xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">Email Us</h3>
            <p class="text-gray-600 mb-4">Get detailed information about our products</p>
            <a href="mailto:jamespolymers.international@gmail.com" class="text-primary font-semibold hover:text-secondary transition">jamespolymers.international@gmail.com</a>
          </div>

          <!-- Visit Us -->
          <div class="contact-method bg-white rounded-lg shadow-md hover:shadow-2xl transition-shadow duration-300 p-6 text-center">
            <div class="bg-primary bg-opacity-10 w-16 h-16 rounded-full flex items-center justify-center mb-4 mx-auto">
              <i class="fas fa-map-marker-alt text-primary text-2xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">Visit Us</h3>
            <p class="text-gray-600 mb-4">Schedule a visit to our facilities</p>
            <a href="#map" class="text-primary font-semibold hover:text-secondary transition">View Location</a>
          </div>
        </div>

        <!-- Contact Form Section -->
        <div class="border border-gray-800 shadow-lg shadow-gray-800/50 py-24 rounded-lg">
          <div class="bg-white rounded-xl shadow-lg shadow-gray-900/80 p-8 max-w-5xl mx-auto border border-gray-300 mb-10">
            <h2 class="text-2xl font-bold text-center mb-6">Send us a message</h2>

            <!-- Success/Error Messages -->
            <div v-if="success" class="text-green-600 font-bold text-center mb-4 bg-green-50 p-4 rounded-lg">
              {{ success }}
            </div>
            <div v-if="error" class="text-red-600 font-bold text-center mb-4 bg-red-50 p-4 rounded-lg">
              {{ error }}
            </div>
            <div v-if="contactForm.errors && Object.keys(contactForm.errors).length > 0" class="text-red-600 font-bold text-center mb-4 bg-red-50 p-4 rounded-lg">
              Please correct the errors below
            </div>

            <form @submit.prevent="submitContactForm" class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <!-- Left Column -->
              <div class="space-y-4">
                <div>
                  <label class="block text-sm font-medium mb-1" for="fullName">Full Name*</label>
                  <input 
                    v-model="contactForm.fullName"
                    type="text" 
                    id="fullName" 
                    required 
                    class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-400" 
                    placeholder="John Doe"
                  >
                  <span v-if="contactForm.errors.fullName" class="text-red-500 text-xs">{{ contactForm.errors.fullName }}</span>
                </div>

                <div>
                  <label class="block text-sm font-medium mb-1" for="email">Email Address*</label>
                  <input 
                    v-model="contactForm.email"
                    type="email" 
                    id="email" 
                    required 
                    class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-400" 
                    placeholder="example@email.com"
                  >
                  <span v-if="contactForm.errors.email" class="text-red-500 text-xs">{{ contactForm.errors.email }}</span>
                </div>

                <div>
                  <label class="block text-sm font-medium mb-1" for="phone">Phone Number*</label>
                  <input 
                    v-model="contactForm.phone"
                    type="text" 
                    id="phone" 
                    required 
                    class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-400" 
                    placeholder="+123 456 7890"
                  >
                  <span v-if="contactForm.errors.phone" class="text-red-500 text-xs">{{ contactForm.errors.phone }}</span>
                </div>

                <div>
                  <label class="block text-sm font-medium mb-1" for="companyName">Company Name (Optional)</label>
                  <input 
                    v-model="contactForm.companyName"
                    type="text" 
                    id="companyName" 
                    class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-400" 
                    placeholder="Company Inc."
                  >
                </div>
              </div>

              <!-- Right Column -->
              <div class="space-y-4">
                <div>
                  <label class="block text-sm font-medium mb-1" for="position">Position in the Company (Optional)</label>
                  <select 
                    v-model="contactForm.position"
                    id="position" 
                    class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                  >
                    <option value="">Select a position</option>
                    <option value="ceo">CEO / President / Owner</option>
                    <option value="director">Director</option>
                    <option value="manager">Manager / Team Lead</option>
                    <option value="supervisor">Supervisor</option>
                    <option value="senior">Senior Staff / Senior Associate</option>
                    <option value="staff">Staff / Associate / Officer</option>
                    <option value="intern">Intern / Trainee</option>
                    <option value="consultant">Consultant / Advisor</option>
                  </select>
                </div>

                <div>
                  <label class="block text-sm font-medium mb-1" for="companyAddress">Company Address*</label>
                  <input 
                    v-model="contactForm.companyAddress"
                    type="text" 
                    id="companyAddress" 
                    required 
                    class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-400" 
                    placeholder="123 Main St."
                  >
                  <span v-if="contactForm.errors.companyAddress" class="text-red-500 text-xs">{{ contactForm.errors.companyAddress }}</span>
                </div>

                <div>
                  <label class="block text-sm font-medium mb-1" for="subject">Subject*</label>
                  <select 
                    v-model="contactForm.subject"
                    id="subject" 
                    required 
                    class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                  >
                    <option value="">Select a subject</option>
                    <option value="inquiry">Inquiry</option>
                    <option value="support">Support</option>
                    <option value="feedback">Feedback</option>
                  </select>
                  <span v-if="contactForm.errors.subject" class="text-red-500 text-xs">{{ contactForm.errors.subject }}</span>
                </div>

                <div>
                  <label class="block text-sm font-medium mb-1" for="priority">Priority Level*</label>
                  <select 
                    v-model="contactForm.priority"
                    id="priority" 
                    required 
                    class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                  >
                    <option value="">Select a priority</option>
                    <option value="low">Low</option>
                    <option value="medium">Medium</option>
                    <option value="high">High</option>
                  </select>
                  <span v-if="contactForm.errors.priority" class="text-red-500 text-xs">{{ contactForm.errors.priority }}</span>
                </div>
              </div>

              <!-- Message (Full Width) -->
              <div class="md:col-span-2">
                <label class="block text-sm font-medium mb-1" for="message">Message*</label>
                <textarea 
                  v-model="contactForm.message"
                  id="message" 
                  required 
                  rows="5" 
                  placeholder="Enter your message..." 
                  class="w-full p-3 border rounded-lg focus:ring-2 focus:ring-blue-500 outline-none h-[200px]"
                ></textarea>
                <span v-if="contactForm.errors.message" class="text-red-500 text-xs">{{ contactForm.errors.message }}</span>
              </div>

              <!-- Submit Button -->
              <div class="md:col-span-2 text-center">
                <button 
                  type="submit"
                  :disabled="contactForm.processing"
                  class="bg-blue-600 text-white py-2 px-6 rounded-lg cursor-pointer hover:bg-blue-700 transition duration-200 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {{ contactForm.processing ? 'Sending...' : 'Submit' }}
                </button>
              </div>
            </form>
          </div>

          <!-- Headquarters Section -->
          <div class="bg-white border border-gray-300 rounded-md p-10 shadow-lg shadow-gray-900/80 max-w-5xl mx-auto">
            <p class="text-center text-2xl font-bold text-black mb-6">Our Headquarters</p>

            <div class="flex flex-col md:flex-row justify-evenly gap-6">
              <!-- Location -->
              <div class="flex flex-col text-center w-full md:w-[280px] h-[230px] justify-start pt-8 p-4 items-center text-black border border-gray-300 shadow-lg rounded-md">
                <div class="flex border bg-gray-200 rounded-full h-[45px] w-[45px] justify-center items-center mb-4">
                  <i class="fas fa-map-marker-alt text-black text-xl"></i>
                </div>
                <p class="font-bold text-lg mb-2">Location</p>
                <p class="text-sm">016 Panapaan II, Bacoor City, <br>Cavite, Philippines</p>
              </div>

              <!-- Business Hours -->
              <div class="flex flex-col text-center w-full md:w-[280px] h-[230px] justify-start pt-8 p-4 items-center text-black border border-gray-300 shadow-lg rounded-md">
                <div class="flex border bg-gray-200 rounded-full h-[45px] w-[45px] justify-center items-center mb-4">
                  <i class="fas fa-clock text-black text-xl"></i>
                </div>
                <p class="font-bold text-lg mb-1">Business Hours</p>
                <p class="text-sm font-semibold mb-0">Weekdays:</p>
                <p class="text-sm mt-0">Monday - Friday: 8:00am - 5:00pm</p>
                <p class="text-sm font-semibold mb-0 mt-1">Weekends:</p>
                <p class="text-sm mt-0">Saturday - Sunday: Closed</p>
              </div>

              <!-- Social Media -->
              <div class="flex flex-col text-center w-full md:w-[280px] h-[230px] justify-start pt-8 p-4 items-center text-black border border-gray-300 shadow-lg rounded-md">
                <div class="flex border bg-gray-200 rounded-full h-[45px] w-[45px] justify-center items-center mb-4">
                  <i class="fas fa-share-alt text-black text-xl"></i>
                </div>
                <p class="font-bold text-lg mb-1">Connect with Us</p>
                <p class="text-sm mb-1">Our Social Media Platforms:</p>
                <div class="flex flex-row items-center gap-4 mt-2 justify-center">
                  <a href="https://www.linkedin.com/in/jgeintl/" target="_blank" class="flex flex-col items-center text-blue-700 hover:text-blue-500">
                    <i class="fab fa-linkedin text-3xl"></i>
                    <span class="text-xs text-black">LinkedIn</span>
                  </a>

                  <a href="https://www.instagram.com/jgempireintl" target="_blank" class="flex flex-col items-center text-pink-500 hover:text-pink-400">
                    <i class="fab fa-instagram text-3xl"></i>
                    <span class="text-xs text-black">Instagram</span>
                  </a>

                  <a href="https://www.facebook.com/profile.php?id=61573770164726" target="_blank" class="flex flex-col items-center text-blue-600 hover:text-blue-500">
                    <i class="fab fa-facebook text-3xl"></i>
                    <span class="text-xs text-black">Facebook</span>
                  </a>
                </div>
              </div>
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
    <Chatbot />
  </div>
</template>

<style scoped>
.bg-primary {
  background-color: #0f4c81;
}

.text-primary {
  color: #0f4c81;
}

.hover\:text-primary:hover {
  color: #0f4c81;
}

.text-secondary {
  color: #f7931e;
}

.hover\:text-secondary:hover {
  color: #f7931e;
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
}

@media (min-width: 768px) and (max-width: 1024px) {
  .container {
    padding-left: 2rem;
    padding-right: 2rem;
  }
}
</style>