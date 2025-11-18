<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import Header from '@/layouts/Header.vue';
import Footer from '@/layouts/Footer.vue';
import Chatbot from '@/layouts/Chatbot.vue'; 

import axios from 'axios'
import AOS from 'aos';
import 'aos/dist/aos.css';
AOS.init();

// Props to receive Google Form URLs from backend
const props = defineProps({
  fullTimeFormUrl: {
    type: String,
    default: 'https://forms.gle/ddrfp3VqGMMk3knf9'
  },
  ojtFormUrl: {
    type: String,
    default: 'http://forms.gle/R4qkB7Aw6ViFXnVc9'
  }
});

// State
const activeTab = ref('fulltime');
const showModal = ref(false);
const selectedPosition = ref(null);
const currentStep = ref(1);
const isSubmitting = ref(false);
const successMessage = ref('');
const fileInput = ref(null);
const selectedBatch = ref('Batch 1');

// Application form data
const applicationForm = ref({
  hasSkills: '',
  hoursRequired: '',
  workOnsite: '',
  firstName: '',
  lastName: '',
  email: '',
  phone: '',
  resume: null
});

// Hardcoded data from SQL - Full-time positions (IDs 1-4)
const fulltimePositions = ref([
  {
    id: 1,
    title: 'Senior Software Engineer',
    type: 'Full-time',
    shift: 'Day Shift',
    schedule: 'Monday to Friday, 9:00 AM - 6:00 PM',
    location: 'On-site',
    description: 'Join our engineering team to build innovative solutions for the polymer industry. You will be responsible for developing and maintaining software systems, collaborating with cross-functional teams, and implementing best practices in software development. This role requires strong technical expertise and the ability to lead complex projects.',
    image: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=500',
    qualifications: [
      "Bachelor's degree in Computer Science or related field",
      '5+ years of software development experience',
      'Strong knowledge of modern programming languages and frameworks',
      'Experience with cloud platforms and microservices architecture',
      'Excellent problem-solving and communication skills',
      'Experience in leading technical teams and mentoring junior developers'
    ]
  },
  {
    id: 2,
    title: 'Product Manager',
    type: 'Full-time',
    shift: 'Day Shift',
    schedule: 'Monday to Friday, 8:00 AM - 5:00 PM',
    location: 'On-site',
    description: 'Lead product development and strategy in a fast-paced environment. You will be responsible for defining product vision, gathering requirements, and working with cross-functional teams to deliver successful products. This role requires strong leadership skills and the ability to balance business objectives with technical constraints.',
    image: 'https://images.unsplash.com/photo-1553877522-43269d4ea984?w=500',
    qualifications: [
      'Bachelor\'s degree in Business, Engineering, or related field',
      '3+ years of product management experience',
      'Strong analytical and strategic thinking skills',
      'Experience with agile methodologies',
      'Excellent communication and leadership abilities',
      'Knowledge of polymer industry is a plus'
    ]
  },
  {
    id: 3,
    title: 'Business Development Manager',
    type: 'Full-time',
    shift: 'Day Shift',
    schedule: 'Monday to Friday, 8:30 AM - 5:30 PM',
    location: 'On-site',
    description: 'Drive strategic partnerships and expand our business to new markets. You will be responsible for identifying growth opportunities, developing business relationships, and creating strategies to increase market share. This role requires strong business acumen and excellent networking skills.',
    image: 'https://images.unsplash.com/photo-1552664730-d307ca884978?w=500',
    qualifications: [
      'Bachelor\'s degree in Business Administration or related field',
      '5+ years of business development experience',
      'Proven track record of successful partnerships and sales growth',
      'Strong negotiation and presentation skills',
      'Experience in the polymer or manufacturing industry',
      'Excellent relationship-building abilities'
    ]
  },
  {
    id: 4,
    title: 'Manufacturing Engineer',
    type: 'Full-time',
    shift: 'Day Shift',
    schedule: 'Monday to Friday, 7:00 AM - 4:00 PM',
    location: 'On-site',
    description: 'Optimize production processes and ensure quality standards in our manufacturing facilities. You will be responsible for improving efficiency, reducing costs, and implementing new manufacturing technologies. This role requires strong technical knowledge and hands-on experience in manufacturing processes.',
    image: 'https://images.unsplash.com/photo-1599583863916-e06c29087f51?q=80&w=1584&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    qualifications: [
      'Bachelor\'s degree in Manufacturing Engineering or related field',
      '3+ years of manufacturing engineering experience',
      'Knowledge of lean manufacturing principles',
      'Experience with process optimization and quality control',
      'Strong problem-solving and analytical skills',
      'Familiarity with polymer manufacturing processes'
    ]
  }
]);

// Hardcoded data from SQL - Internship positions (IDs 5-9)
const internshipPositions = ref([
  {
    id: 5,
    title: 'IT Development Intern',
    type: 'Internship',
    shift: 'Day Shift',
    schedule: 'Monday to Friday, 9:00 AM - 5:00 PM',
    location: 'On-site',
    description: 'Learn and contribute to real-world projects with our engineering team. You will work on various software development tasks, participate in team meetings, and gain hands-on experience with modern development tools and practices.',
    image: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=500',
    qualifications: [
      'Currently pursuing a degree in Computer Science or related field',
      'Basic knowledge of programming languages',
      'Strong desire to learn and grow',
      'Good communication and teamwork skills',
      'Familiarity with software development concepts',
      'Available for 3-6 months internship'
    ]
  },
  {
    id: 6,
    title: 'Marketing Intern',
    type: 'Internship',
    shift: 'Day Shift',
    schedule: 'Monday to Friday, 9:00 AM - 5:00 PM',
    location: 'On-site',
    description: 'Support our marketing team with campaigns and digital outreach. You will assist in creating content, managing social media, and analyzing marketing metrics. This role provides valuable experience in modern marketing practices.',
    image: 'https://images.unsplash.com/photo-1552664730-d307ca884978?w=500',
    qualifications: [
      'Currently pursuing a degree in Marketing or related field',
      'Basic knowledge of digital marketing concepts',
      'Strong written and verbal communication skills',
      'Familiarity with social media platforms',
      'Creative thinking and problem-solving abilities',
      'Available for 3-6 months internship'
    ]
  },
  {
    id: 7,
    title: 'Engineering Intern',
    type: 'Internship',
    shift: 'Day Shift',
    schedule: 'Monday to Friday, 8:00 AM - 4:00 PM',
    location: 'On-site',
    description: 'Contribute to cutting-edge research and product development initiatives. You will work alongside experienced engineers on real projects, gaining practical experience in engineering processes and methodologies.',
    image: 'https://static.vecteezy.com/system/resources/thumbnails/001/343/510/small_2x/engineering-plans-with-blueprint-free-photo.jpg',
    qualifications: [
      'Currently pursuing a degree in Engineering',
      'Basic knowledge of engineering principles',
      'Strong analytical and problem-solving skills',
      'Good communication and teamwork abilities',
      'Familiarity with CAD software is a plus',
      'Available for 3-6 months internship'
    ]
  },
  {
    id: 8,
    title: 'Human Resources Intern',
    type: 'Internship',
    shift: 'Day Shift',
    schedule: 'Monday to Friday, 9:00 AM - 5:00 PM',
    location: 'On-site',
    description: 'Learn HR operations, recruitment, and employee engagement strategies. You will assist in various HR functions, including recruitment, onboarding, and employee relations. This role provides comprehensive exposure to HR practices.',
    image: 'https://images.unsplash.com/photo-1553877522-43269d4ea984?w=500',
    qualifications: [
      'Currently pursuing a degree in Human Resources or related field',
      'Basic knowledge of HR principles and practices',
      'Strong interpersonal and communication skills',
      'Attention to detail and organizational abilities',
      'Familiarity with HR software is a plus',
      'Available for 3-6 months internship'
    ]
  },
  {
    id: 9,
    title: 'Accounting Intern',
    type: 'Internship',
    shift: 'Day Shift',
    schedule: 'Monday to Friday, 9:00 AM - 5:00 PM',
    location: 'On-site',
    description: 'Support our accounting team with financial reporting and data management. Assist in bookkeeping, reconciling accounts, and preparing reports. This role provides valuable experience in core accounting practices and financial operations',
    image: 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    qualifications: [
      'Currently pursuing a degree in Accounting or related field',
      'Basic knowledge of accounting principles',
      'Strong attention to detail',
      'Good organizational and analytical skills',
      'Familiarity with accounting software is a plus',
      'Available for 3-6 months internship'
    ]
  }
]);

// OJT Media Gallery data from SQL
const ojtGallery = ref({
  'Batch 1': [
    { id: 1, image: '/storage/assets/img/media_gallery/1 (2).jpg' },
    { id: 2, image: '/storage/assets/img/media_gallery/1 (3).jpg' },
    { id: 3, image: '/storage/assets/img/media_gallery/1 (4).jpg' },
    { id: 4, image: '/storage/assets/img/media_gallery/1 (5).jpg' },
    { id: 5, image: '/storage/assets/img/media_gallery/1 (6).jpg' },
    { id: 6, image: '/storage/assets/img/media_gallery/1 (8).jpg' },
    { id: 8, image: '/storage/assets/img/media_gallery/1 (10).jpg' },
    { id: 9, image: '/storage/assets/img/media_gallery/1 (11).jpg' },
    { id: 10, image: '/storage/assets/img/media_gallery/1 (12).jpg' },
    { id: 11, image: '/storage/assets/img/media_gallery/1 (13).jpg' },
    { id: 12, image: '/storage/assets/img/media_gallery/1 (14).jpg' },
    { id: 13, image: '/storage/assets/img/media_gallery/1 (23).jpg' }
  ],
  'Batch 2': [
    { id: 14, image: '/storage/assets/img/media_gallery/2 (1).png' },
    { id: 15, image: '/storage/assets/img/media_gallery/2 (2).png' },
    { id: 16, image: '/storage/assets/img/media_gallery/2 (3).png' },
    { id: 17, image: '/storage/assets/img/media_gallery/2 (4).png' },
    { id: 18, image: '/storage/assets/img/media_gallery/2 (5).png' },
    { id: 19, image: '/storage/assets/img/media_gallery/2 (6).png' },
    { id: 20, image: '/storage/assets/img/media_gallery/2 (7).png' },
    { id: 21, image: '/storage/assets/img/media_gallery/2 (8).png' },
    { id: 22, image: '/storage/assets/img/media_gallery/2 (9).png' },
    { id: 23, image: '/storage/assets/img/media_gallery/2 (10).png' },
    { id: 24, image: '/storage/assets/img/media_gallery/2 (11).png' },
    { id: 25, image: '/storage/assets/img/media_gallery/2 (12).png' },
    { id: 26, image: '/storage/assets/img/media_gallery/2 (13).png' },
    { id: 27, image: '/storage/assets/img/media_gallery/2 (14).png' },
    { id: 28, image: '/storage/assets/img/media_gallery/2 (15).png' }
  ],
  'Batch 3': [
    { id: 29, image: '/storage/assets/img/media_gallery/3 (1).jpg' },
    { id: 30, image: '/storage/assets/img/media_gallery/3 (10).jpg' },
    { id: 31, image: '/storage/assets/img/media_gallery/3 (2).jpg' },
    { id: 32, image: '/storage/assets/img/media_gallery/3 (3).jpg' },
    { id: 33, image: '/storage/assets/img/media_gallery/3 (4).jpg' },
    { id: 34, image: '/storage/assets/img/media_gallery/3 (11).jpg' },
    { id: 36, image: '/storage/assets/img/media_gallery/3 (8).jpg' },
    { id: 37, image: '/storage/assets/img/media_gallery/3 (9).jpg' },
    { id: 38, image: '/storage/assets/img/media_gallery/3 (12).jpg' },
    { id: 39, image: '/storage/assets/img/media_gallery/3 (13).jpg' },
    { id: 40, image: '/storage/assets/img/media_gallery/3 (14).jpg' },
    { id: 41, image: '/storage/assets/img/media_gallery/3 (17).jpg' },
    { id: 42, image: '/storage/assets/img/media_gallery/3 (15).jpg' },
    { id: 43, image: '/storage/assets/img/media_gallery/3 (16).jpg' },
    { id: 44, image: '/storage/assets/img/media_gallery/3 (18).jpg' },
    { id: 45, image: '/storage/assets/img/media_gallery/3 (19).jpg' },
    { id: 46, image: '/storage/assets/img/media_gallery/3 (20).jpg' },
    { id: 47, image: '/storage/assets/img/media_gallery/3 (21).jpg' },
    { id: 48, image: '/storage/assets/img/media_gallery/3 (22).jpg' },
    { id: 49, image: '/storage/assets/img/media_gallery/3 (23).jpg' },
    { id: 50, image: '/storage/assets/img/media_gallery/3 (24).jpg' },
    { id: 51, image: '/storage/assets/img/media_gallery/3 (25).jpg' },
    { id: 52, image: '/storage/assets/img/media_gallery/3 (26).jpg' },
    { id: 53, image: '/storage/assets/img/media_gallery/3 (27).jpg' },
    { id: 54, image: '/storage/assets/img/media_gallery/3 (28).jpg' },
    { id: 55, image: '/storage/assets/img/media_gallery/3 (29).jpg' },
    { id: 56, image: '/storage/assets/img/media_gallery/3 (30).jpg' }
  ]
});

// Benefits data
const benefits = ref([
  {
    icon: 'fas fa-project-diagram',
    title: 'Project-based Activities',
    description: 'Learning through real-world tasks or projects that apply concepts to practical situations.'
  },
  {
    icon: 'fas fa-tools',
    title: 'Hands-on Experience',
    description: 'Gaining skills by directly engaging in practical work or experiments.'
  },
  {
    icon: 'fas fa-users',
    title: 'Collaboration',
    description: 'Working together with others to achieve shared goals and exchange ideas.'
  },
  {
    icon: 'fas fa-clipboard-check',
    title: 'Quality Assurance',
    description: 'Ensuring that a product or service meets established standards through careful checking and testing.'
  },
  {
    icon: 'fas fa-user-tie',
    title: 'Leadership',
    description: 'Acquire leadership skills by providing opportunities to collaborate, take responsibility, and make decisions through group projects.'
  }
]);

const openApplicationModal = (position) => {
  // Determine which form to open based on position type
  const formUrl = position.type === 'Internship' ? props.ojtFormUrl : props.fullTimeFormUrl;
  
  // Open the Google Form in a new tab
  window.open(formUrl, '_blank');
};

const closeApplicationModal = () => {
  showModal.value = false;
  selectedPosition.value = null;
  currentStep.value = 1;
  resetForm();
  document.body.style.overflow = '';
};

const nextStep = () => {
  if (currentStep.value < 3) {
    currentStep.value++;
  }
};

const prevStep = () => {
  if (currentStep.value > 1) {
    currentStep.value--;
  }
};

const handleFileUpload = (event) => {
  const file = event.target.files[0];
  if (file) {
    applicationForm.value.resume = file;
  }
};

const resetForm = () => {
  applicationForm.value = {
    hasSkills: '',
    hoursRequired: '',
    workOnsite: '',
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    resume: null
  };
};

const submitApplication = () => {
  isSubmitting.value = true;
  
  // Simulate form submission
  setTimeout(() => {
    console.log('Application submitted:', {
      position: selectedPosition.value.title,
      ...applicationForm.value
    });
    
    isSubmitting.value = false;
    closeApplicationModal();
    successMessage.value = 'Thank you for your application! We will review your submission and get back to you soon.';
    
    // Hide success message after 5 seconds
    setTimeout(() => {
      successMessage.value = '';
    }, 5000);
  }, 1500);
};
</script>

<template>
  <Head title="Careers - Join Our Team | James Polymers">
    <link rel="icon" type="image/png" href="/storage/assets/img/tab_icon.png">
  </Head>

  <Chatbot />

  <div>
    <!-- Header -->
    <Header />

    <!-- Success/Error Messages -->
    <div v-if="successMessage" class="fixed top-20 right-4 z-50 animate-slide-in">
      <div class="bg-green-100 border border-green-400 text-green-700 px-6 py-4 rounded-lg shadow-lg flex items-center">
        <i class="fas fa-check-circle mr-3 text-xl"></i>
        <div>
          <strong>Success!</strong> {{ successMessage }}
        </div>
        <button @click="successMessage = ''" class="ml-4 text-green-700 hover:text-green-900">
          <i class="fas fa-times"></i>
        </button>
      </div>
    </div>

    <!-- Hero Section -->
    <section
      class="relative bg-blue-400 h-64 md:h-80 lg:h-96 flex items-center justify-center bg-cover bg-center drop-shadow-2xl animate__animated animate__fadeIn mt-[14vh]"
      style="background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('/storage/assets/img/banners/careers_banner.jpg')"
    >
      <img
        src="/storage/assets/img/banners/careers_banner.jpg"
        alt="Inclined Overlay"
        class="absolute inset-0 w-full h-full object-cover"
        style="mix-blend-mode: multiply; opacity: 1;"
      >

      <div class="container mx-auto px-4 text-center text-white relative z-10">
        <h1 class="text-3xl md:text-4xl lg:text-5xl font-bold mb-4 md:mb-6">CAREERS</h1>
        <p class="text-base md:text-xl lg:text-2xl mb-6 md:mb-8 max-w-3xl mx-auto">
          Be part of a team that values innovation, learning, and growth. Explore our open positions and internship programs.
        </p>
        <div class="flex flex-wrap justify-center gap-4">
          <a href="#careers-tabs" class="bg-white text-blue-600 font-bold py-3 px-6 md:px-8 rounded-lg hover:bg-blue-50 transition duration-300">
            View Opportunities
          </a>
        </div>
      </div>
    </section>

    <!-- Careers Tabs Section -->
    <section id="careers-tabs" class="py-12 md:py-16 bg-gray-50">
      <div class="container mx-auto px-4">
        <div class="text-center mb-12 md:mb-16">
          <span class="text-blue-600 font-bold uppercase tracking-widest text-sm">Opportunities</span>
          <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-800 mb-4 mt-2">Join Our Team</h2>
          <p class="text-gray-600 max-w-3xl mx-auto text-sm md:text-base">
            Explore our full-time positions and internship programs.
          </p>
        </div>

        <!-- Tabs Navigation -->
        <div class="flex justify-center mb-8 border-b border-gray-200">
          <button
            @click="activeTab = 'fulltime'"
            :class="[
              'px-6 md:px-8 py-3 md:py-4 font-semibold text-sm md:text-base transition-all',
              activeTab === 'fulltime'
                ? 'border-b-2 border-blue-600 text-blue-600'
                : 'text-gray-600 hover:text-blue-600'
            ]"
          >
            Full-Time Positions
          </button>
          <button
            @click="activeTab = 'internship'"
            :class="[
              'px-6 md:px-8 py-3 md:py-4 font-semibold text-sm md:text-base transition-all',
              activeTab === 'internship'
                ? 'border-b-2 border-blue-600 text-blue-600'
                : 'text-gray-600 hover:text-blue-600'
            ]"
          >
            Internship Programs
          </button>
        </div>

        <!-- Full-Time Positions -->
        <Transition name="fade" mode="out-in">
          <div v-if="activeTab === 'fulltime'" key="fulltime" class="grid grid-cols-1 md:grid-cols-2 gap-6 md:gap-8">
            <div
              v-for="position in fulltimePositions"
              :key="position.id"
              class="bg-white rounded-xl shadow-md hover:shadow-2xl transition-all duration-300 overflow-hidden flex flex-col"
            >
              <img
                :src="position.image"
                :alt="position.title"
                class="w-full h-40 md:h-48 object-cover"
              >
              <div class="p-6 md:p-8 flex flex-col flex-grow">
                <h3 class="text-xl md:text-2xl font-bold text-gray-800 mb-2">{{ position.title }}</h3>
                <p class="text-gray-600 mb-4 text-sm md:text-base">
                  {{ position.type }} • {{ position.location }}
                </p>
                <p class="text-gray-700 mb-6 flex-grow text-sm md:text-base">{{ position.description }}</p>
                <button
                  @click="openApplicationModal(position)"
                  class="bg-blue-600 text-white font-bold py-3 px-6 rounded-lg hover:bg-blue-700 transition duration-300 mt-auto"
                >
                  Apply Now
                </button>
              </div>
            </div>
          </div>

          <!-- Internship Programs -->
          <div v-else key="internship">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 md:gap-8 mb-12">
              <div
                v-for="position in internshipPositions"
                :key="position.id"
                class="bg-white rounded-xl shadow-md hover:shadow-2xl transition-all duration-300 overflow-hidden flex flex-col"
              >
                <img
                  :src="position.image"
                  :alt="position.title"
                  class="w-full h-40 md:h-48 object-cover"
                >
                <div class="p-6 md:p-8 flex flex-col flex-grow">
                  <h3 class="text-xl md:text-2xl font-bold text-gray-800 mb-2">{{ position.title }}</h3>
                  <p class="text-gray-600 mb-4 text-sm md:text-base">
                    {{ position.type }} • {{ position.location }}
                  </p>
                  <p class="text-gray-700 mb-6 flex-grow text-sm md:text-base">{{ position.description }}</p>
                  <button
                    @click="openApplicationModal(position)"
                    class="bg-blue-600 text-white font-bold py-3 px-6 rounded-lg hover:bg-blue-700 transition duration-300 mt-auto"
                  >
                    Apply Now
                  </button>
                </div>
              </div>
            </div>

            <!-- OJT Media Gallery -->
            <div class="mt-12">
              <div class="text-center mb-12">
                <span class="text-blue-600 font-bold uppercase tracking-widest text-sm">Experience</span>
                <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-800 mb-4 mt-2">OJT Media Gallery</h2>
                <p class="text-gray-600 max-w-3xl mx-auto text-sm md:text-base">
                  Explore our training program and student experiences through photos.
                </p>
              </div>

              <!-- Batch Tabs -->
              <div class="flex justify-center mb-8 gap-4">
                <button
                  v-for="batch in ['Batch 1', 'Batch 2', 'Batch 3']"
                  :key="batch"
                  @click="selectedBatch = batch"
                  :class="[
                    'px-6 py-3 font-semibold text-sm md:text-base rounded-lg transition-all',
                    selectedBatch === batch
                      ? 'bg-blue-600 text-white'
                      : 'bg-white text-gray-700 hover:bg-gray-100'
                  ]"
                >
                  {{ batch }}
                </button>
              </div>

              <!-- Gallery Grid -->
              <Transition name="fade" mode="out-in">
                <div :key="selectedBatch" class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                  <div
                    v-for="item in ojtGallery[selectedBatch]"
                    :key="item.id"
                    class="aspect-square overflow-hidden rounded-lg shadow-md hover:shadow-xl transition-all duration-300 cursor-pointer group"
                  >
                    <img
                      :src="item.image"
                      :alt="`${selectedBatch} Photo ${item.id}`"
                      class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
                    >
                  </div>
                </div>
              </Transition>
            </div>
          </div>
        </Transition>
      </div>
    </section>

    <!-- Benefits Section -->
    <section
      class="relative py-12 md:py-16 lg:py-20 text-white"
      style="background-image: url('/storage/assets/img/banners/careers_cta.jpg'); background-size: cover; background-position: center;"
    >
      <div class="absolute inset-0 bg-black opacity-60"></div>
      
      <div class="container mx-auto px-4 relative z-10">
        <div class="text-center mb-12 md:mb-16">
          <span class="text-cyan-300 font-bold uppercase tracking-widest text-sm">Why Join Us</span>
          <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold mb-4 mt-2">Our Benefits</h2>
          <p class="text-base md:text-lg max-w-3xl mx-auto">
            We offer comprehensive benefits that support your professional growth and personal wellbeing.
          </p>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-6 md:gap-8">
          <div
            v-for="(benefit, index) in benefits"
            :key="index"
            class="bg-white text-gray-800 rounded-xl p-6 md:p-8 hover:shadow-2xl transition-all duration-300 hover:-translate-y-2"
          >
            <div class="bg-blue-100 w-16 h-16 md:w-20 md:h-20 rounded-full flex items-center justify-center mb-4 mx-auto">
              <i :class="`${benefit.icon} text-blue-600 text-2xl md:text-3xl`"></i>
            </div>
            <h4 class="text-lg md:text-xl font-bold mb-2 text-center">{{ benefit.title }}</h4>
            <p class="text-gray-700 text-sm md:text-base text-center">{{ benefit.description }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Application Modal -->
    <Teleport to="body">
      <Transition name="modal">
        <div
          v-if="showModal && selectedPosition"
          class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black bg-opacity-50 overflow-y-auto"
          @click.self="closeApplicationModal"
        >
          <div class="bg-white rounded-2xl shadow-2xl max-w-4xl w-full max-h-[90vh] overflow-y-auto">
            <!-- Modal Header -->
            <div class="sticky top-0 bg-white border-b px-4 md:px-6 py-4 flex justify-between items-center z-10">
              <h3 class="text-lg md:text-xl font-bold text-gray-800">
                Apply for {{ selectedPosition.title }}
              </h3>
              <button
                @click="closeApplicationModal"
                class="text-gray-500 hover:text-gray-800 transition"
              >
                <i class="fas fa-times text-2xl"></i>
              </button>
            </div>

            <!-- Modal Body -->
            <div class="p-4 md:p-8">
              <!-- Progress Steps -->
              <div class="flex justify-between mb-8 relative px-4">
                <div class="absolute top-1/2 left-0 w-full h-0.5 bg-gray-200 -translate-y-1/2"></div>
                <div
                  v-for="step in 3"
                  :key="step"
                  class="relative flex flex-col items-center"
                >
                  <div
                    :class="[
                      'w-8 h-8 md:w-10 md:h-10 rounded-full flex items-center justify-center font-bold text-sm md:text-base z-10',
                      currentStep >= step
                        ? 'bg-blue-600 text-white'
                        : 'bg-gray-200 text-gray-600'
                    ]"
                  >
                    {{ step }}
                  </div>
                  <span
                    :class="[
                      'text-xs md:text-sm font-medium mt-2 hidden md:block',
                      currentStep >= step ? 'text-blue-600' : 'text-gray-600'
                    ]"
                  >
                    {{ ['Job Details', 'Questions', 'Your Info'][step - 1] }}
                  </span>
                </div>
              </div>

              <!-- Step Content -->
              <div class="mt-8">
                <!-- Step 1: Job Details -->
                <div v-show="currentStep === 1" class="space-y-6">
                  <div>
                    <h4 class="text-lg md:text-xl font-bold mb-4">Company Description</h4>
                    <p class="text-gray-700 text-sm md:text-base">
                      JPMC is a leading polymer manufacturing company committed to innovation and sustainability. 
                      We specialize in developing advanced polymer solutions for various industries.
                    </p>
                  </div>

                  <div>
                    <h4 class="text-lg md:text-xl font-bold mb-4">Job Details</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm md:text-base">
                      <div>
                        <p class="text-gray-600">Position</p>
                        <p class="font-semibold">{{ selectedPosition.title }}</p>
                      </div>
                      <div>
                        <p class="text-gray-600">Type</p>
                        <p class="font-semibold">{{ selectedPosition.type }}</p>
                      </div>
                      <div>
                        <p class="text-gray-600">Shift</p>
                        <p class="font-semibold">{{ selectedPosition.shift }}</p>
                      </div>
                      <div>
                        <p class="text-gray-600">Location</p>
                        <p class="font-semibold">{{ selectedPosition.location }}</p>
                      </div>
                    </div>
                    <div class="mt-4">
                      <p class="text-gray-600 text-sm md:text-base">Description</p>
                      <p class="text-gray-700 mt-2 text-sm md:text-base">{{ selectedPosition.description }}</p>
                    </div>
                  </div>

                  <div>
                    <h4 class="text-lg md:text-xl font-bold mb-4">Qualifications</h4>
                    <ul class="space-y-2">
                      <li
                        v-for="(qual, index) in selectedPosition.qualifications"
                        :key="index"
                        class="flex items-start text-sm md:text-base"
                      >
                        <i class="fas fa-check-circle text-blue-600 mt-1 mr-3"></i>
                        <span class="text-gray-700">{{ qual }}</span>
                      </li>
                    </ul>
                  </div>

                  <div class="text-right">
                    <button
                      @click="nextStep"
                      class="bg-blue-600 text-white font-bold py-3 px-6 md:px-8 rounded-lg hover:bg-blue-700 transition"
                    >
                      Proceed to Application
                    </button>
                  </div>
                </div>

                <!-- Step 2: Initial Questions -->
                <div v-show="currentStep === 2" class="space-y-6">
                  <div>
                    <h4 class="text-base md:text-lg font-bold mb-4">
                      Do you have the required skills for this position?
                    </h4>
                    <div class="flex gap-6">
                      <label class="flex items-center cursor-pointer">
                        <input
                          v-model="applicationForm.hasSkills"
                          type="radio"
                          value="Yes"
                          class="w-5 h-5 text-blue-600"
                        >
                        <span class="ml-2 text-sm md:text-base">Yes</span>
                      </label>
                      <label class="flex items-center cursor-pointer">
                        <input
                          v-model="applicationForm.hasSkills"
                          type="radio"
                          value="No"
                          class="w-5 h-5 text-blue-600"
                        >
                        <span class="ml-2 text-sm md:text-base">No</span>
                      </label>
                    </div>
                  </div>

                  <div v-if="selectedPosition.type === 'Internship'">
                    <h4 class="text-base md:text-lg font-bold mb-4">
                      How many hours is your requirement to render?
                    </h4>
                    <input
                      v-model="applicationForm.hoursRequired"
                      type="number"
                      min="1"
                      max="1040"
                      class="w-full border border-gray-300 rounded-lg p-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                      placeholder="Enter hours (1-1040)"
                    >
                  </div>

                  <div>
                    <h4 class="text-base md:text-lg font-bold mb-4">
                      Are you willing to work on-site?
                    </h4>
                    <div class="flex gap-6">
                      <label class="flex items-center cursor-pointer">
                        <input
                          v-model="applicationForm.workOnsite"
                          type="radio"
                          value="yes"
                          class="w-5 h-5 text-blue-600"
                        >
                        <span class="ml-2 text-sm md:text-base">Yes</span>
                      </label>
                    </div>
                  </div>

                  <div class="flex justify-between flex-col sm:flex-row gap-4">
                    <button
                      @click="prevStep"
                      class="bg-gray-300 text-gray-700 font-bold py-3 px-6 md:px-8 rounded-lg hover:bg-gray-400 transition"
                    >
                      Previous
                    </button>
                    <button
                      @click="nextStep"
                      class="bg-blue-600 text-white font-bold py-3 px-6 md:px-8 rounded-lg hover:bg-blue-700 transition"
                    >
                      Next
                    </button>
                  </div>
                </div>

                <!-- Step 3: Personal Details -->
                <div v-show="currentStep === 3" class="space-y-6">
                  <div>
                    <h4 class="text-lg md:text-xl font-bold mb-4">Personal Information</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                      <div>
                        <label class="block text-sm font-medium mb-2">First Name*</label>
                        <input
                          v-model="applicationForm.firstName"
                          type="text"
                          required
                          class="w-full border border-gray-300 rounded-lg p-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        >
                      </div>
                      <div>
                        <label class="block text-sm font-medium mb-2">Last Name*</label>
                        <input
                          v-model="applicationForm.lastName"
                          type="text"
                          required
                          class="w-full border border-gray-300 rounded-lg p-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        >
                      </div>
                    </div>
                  </div>

                  <div>
                    <h4 class="text-lg md:text-xl font-bold mb-4">Contact Information</h4>
                    <div class="space-y-4">
                      <div>
                        <label class="block text-sm font-medium mb-2">Email*</label>
                        <input
                          v-model="applicationForm.email"
                          type="email"
                          required
                          class="w-full border border-gray-300 rounded-lg p-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        >
                      </div>
                      <div>
                        <label class="block text-sm font-medium mb-2">Phone*</label>
                        <input
                          v-model="applicationForm.phone"
                          type="tel"
                          required
                          class="w-full border border-gray-300 rounded-lg p-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        >
                      </div>
                    </div>
                  </div>

                  <div>
                    <h4 class="text-lg md:text-xl font-bold mb-4">Resume/CV Upload</h4>
                    <div class="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center hover:border-blue-500 transition">
                      <input
                        @change="handleFileUpload"
                        type="file"
                        accept=".pdf,.doc,.docx"
                        class="hidden"
                        ref="fileInput"
                      >
                      <i class="fas fa-cloud-upload-alt text-4xl text-gray-400 mb-4"></i>
                      <p class="text-gray-600 mb-2">
                        {{ applicationForm.resume ? applicationForm.resume.name : 'Click to upload or drag and drop' }}
                      </p>
                      <p class="text-sm text-gray-500">PDF, DOC, DOCX up to 10MB</p>
                      <button
                        @click="$refs.fileInput.click()"
                        type="button"
                        class="mt-4 bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition"
                      >
                        Choose File
                      </button>
                    </div>
                  </div>

                  <div class="flex justify-between flex-col sm:flex-row gap-4">
                    <button
                      @click="prevStep"
                      class="bg-gray-300 text-gray-700 font-bold py-3 px-6 md:px-8 rounded-lg hover:bg-gray-400 transition"
                    >
                      Previous
                    </button>
                    <button
                      @click="submitApplication"
                      :disabled="isSubmitting"
                      class="bg-blue-600 text-white font-bold py-3 px-6 md:px-8 rounded-lg hover:bg-blue-700 transition disabled:opacity-50"
                    >
                      {{ isSubmitting ? 'Submitting...' : 'Submit Application' }}
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </Transition>
    </Teleport>

    <!-- Footer -->
    <Footer />
  </div>
</template>

<style scoped>
/* Fade transition */
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

/* Slide in animation */
@keyframes slide-in {
  from {
    transform: translateX(100%);
    opacity: 0;
  }
  to {
    transform: translateX(0);
    opacity: 1;
  }
}

.animate-slide-in {
  animation: slide-in 0.3s ease-out;
}

/* Smooth scrolling */
html {
  scroll-behavior: smooth;
}

/* Custom scrollbar for modal */
.overflow-y-auto::-webkit-scrollbar {
  width: 8px;
}

.overflow-y-auto::-webkit-scrollbar-track {
  background: #f1f1f1;
}

.overflow-y-auto::-webkit-scrollbar-thumb {
  background: #888;
  border-radius: 4px;
}

.overflow-y-auto::-webkit-scrollbar-thumb:hover {
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