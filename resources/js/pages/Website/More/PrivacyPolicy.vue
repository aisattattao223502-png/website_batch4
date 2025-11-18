<script setup>
import { onMounted } from 'vue';
import { Head, Link } from '@inertiajs/vue3';
import Header from '@/layouts/Header.vue';
import Footer from '@/layouts/Footer.vue';
import Chatbot from '@/layouts/Chatbot.vue'; 

import axios from 'axios'
import AOS from 'aos';
import 'aos/dist/aos.css';
AOS.init();

// Hard-coded privacy policy data (from SQL database)
const policySections = [
  {
    id: 1,
    section_title: 'Introduction',
    section_content: 'We value your privacy and are committed to protecting your personal information. Our data handling practices fully comply with the Data Privacy Act of 2012 (Republic Act No. 10173), ensuring that your data is collected, processed, and stored securely and responsibly. We also recognize and comply with the Cybercrime Prevention Act of 2012 (Republic Act No. 10175), safeguarding your data against unauthorized access, cyber threats, and malicious activities.',
    display_order: 1
  },
  {
    id: 2,
    section_title: 'Data Collection',
    section_content: 'We collect personal information when you use our website, including but not limited to your name, email address, and usage behavior. This information may be collected through forms, cookies, or analytics tools, in accordance with lawful and fair methods.',
    display_order: 2
  },
  {
    id: 3,
    section_title: 'Use of Data',
    section_content: 'The data we collect is used solely to provide, improve, and personalize our services. We do not sell or share your personal data with third parties without your consent, unless required by law.',
    display_order: 3
  },
  {
    id: 4,
    section_title: 'Your Rights',
    section_content: `Under the Data Privacy Act of 2012, you have the right to:

- Access your personal information
- Correct inaccurate or outdated data
- Request deletion or suspension of processing
- Be informed about how your data is used
- Lodge complaints with the National Privacy Commission (NPC) if your rights are violated

We also take measures in line with the Cybercrime Prevention Act of 2012 to ensure the protection of your data from online threats, such as hacking, identity theft, and other forms of cybercrime.`,
    display_order: 4
  }
];

onMounted(() => {
  AOS.init({
    duration: 1000,
    once: true,
    offset: 100
  });
});
</script>

<template>
  <Head title="Privacy Policy | James Polymers">
    <link rel="icon" type="image/png" href="/storage/assets/img/tab_icon.png">
  </Head>

  <Chatbot />

  <div>
    <!-- Header -->
    <Header />

    

    <!-- Privacy Policy Section -->
    <section class="py-20 bg-gradient-to-br from-gray-100 via-white to-gray-100 mt-[14vh]">
      <div class="container mx-auto px-4 max-w-4xl">
        <div
          class="bg-white p-10 md:p-12 rounded-2xl shadow-2xl border border-gray-200"
          data-aos="fade-up"
          data-aos-duration="1000"
        >
          <!-- Title -->
          <h2
            class="text-4xl font-extrabold text-center text-gray-800 mb-10 underline decoration-blue-600 decoration-4 underline-offset-8"
            data-aos="fade-down"
            data-aos-delay="100"
          >
            Privacy Policy
          </h2>

          <!-- Policy Sections -->
          <div
            v-for="(section, index) in policySections"
            :key="section.id"
            class="mb-10"
            data-aos="fade-up"
            :data-aos-delay="150 + (index * 100)"
          >
            <h3 class="text-2xl font-semibold text-blue-600 mb-3 tracking-wide">
              {{ section.section_title }}
            </h3>

            <div class="text-gray-700 text-base leading-relaxed whitespace-pre-line">
              {{ section.section_content }}
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
          src="/storage/assets/img/banners/privacy_cta.jpg"
          alt="Banner Background"
          class="w-full h-full object-cover opacity-80"
        >
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

/* Smooth scrolling */
html {
  scroll-behavior: smooth;
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
</style>