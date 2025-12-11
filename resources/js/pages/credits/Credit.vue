<template>
  <div class="min-h-screen bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50">
    <!-- Hero Section -->
    <div class="relative overflow-hidden bg-white shadow-sm">
      <div class="absolute inset-0 bg-gradient-to-r from-blue-100/50 to-indigo-100/50"></div>
      
      <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <div class="text-center">
          <h1 class="text-5xl md:text-6xl font-bold mb-6 bg-gradient-to-r from-blue-600 to-indigo-600 bg-clip-text text-transparent">
            Our Portfolio Credits
          </h1>
          <p class="text-xl text-slate-600 max-w-3xl mx-auto mb-8">
            Showcasing our expertise in modern web development and the innovative solutions we've built
          </p>
          
          <!-- Home Button -->
          <Link 
            :href="route('home')" 
            class="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-indigo-600 text-white px-6 py-3 rounded-lg font-semibold hover:from-blue-700 hover:to-indigo-700 transition-all duration-300 shadow-lg hover:shadow-xl"
          >
            <Home class="w-5 h-5" />
            Back to Home
          </Link>
        </div>
      </div>
    </div>

    <!-- Tech Stack Section -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
      <h2 class="text-3xl font-bold text-center mb-12 text-slate-800">Our Technology Stack</h2>
      
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <div 
          v-for="(service, index) in services" 
          :key="index"
          @mouseenter="activeService = index"
          @mouseleave="activeService = null"
          class="group relative bg-white rounded-xl p-6 border border-slate-200 hover:border-blue-300 transition-all duration-300 cursor-pointer shadow-sm hover:shadow-xl flex flex-col"
          :class="{ 'transform -translate-y-2': activeService === index }"
        >
          <div :class="`absolute inset-0 bg-gradient-to-br ${service.color} opacity-0 group-hover:opacity-5 rounded-xl transition-opacity duration-300`"></div>
          
          <div class="relative z-10 flex flex-col h-full">
            <component 
              :is="service.icon" 
              :class="`w-12 h-12 mb-4 text-slate-400 group-hover:text-blue-600 transition-colors duration-300`"
            />
            <h3 class="text-xl font-semibold mb-2 text-slate-800 group-hover:text-blue-600 transition-colors min-h-[3.5rem] flex items-center">
              {{ service.title }}
            </h3>
            <p class="text-slate-600 text-sm group-hover:text-slate-700 transition-colors flex-grow">
              {{ service.description }}
            </p>
          </div>
        </div>
      </div>

      <!-- Additional Technologies -->
      <div class="mt-12">
        <h3 class="text-2xl font-bold text-center mb-6 text-slate-800">Technologies & Tools</h3>
        <div class="flex flex-wrap justify-center gap-3">
          <span 
            v-for="(tech, index) in technologies" 
            :key="index"
            class="px-6 py-3 bg-white border border-slate-200 rounded-lg text-slate-700 font-medium hover:border-blue-400 hover:text-blue-600 hover:shadow-md transition-all duration-300 cursor-default"
          >
            {{ tech }}
          </span>
        </div>
      </div>
    </div>

    <!-- Achievements Section -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
      <h2 class="text-3xl font-bold text-center mb-12 text-slate-800">Key Achievements & Features</h2>
      
      <div class="space-y-6">
        <div 
          v-for="(achievement, index) in achievements" 
          :key="index"
          class="group bg-white rounded-xl p-6 border border-slate-200 hover:border-blue-300 transition-all duration-300 hover:shadow-lg"
        >
          <div class="flex items-start gap-4">
            <div :class="`flex-shrink-0 w-12 h-12 rounded-lg bg-gradient-to-br ${achievement.gradient} flex items-center justify-center group-hover:scale-110 transition-transform duration-300 shadow-sm`">
              <component :is="achievement.icon" class="w-6 h-6 text-white" />
            </div>
            
            <div class="flex-1">
              <h3 class="text-xl font-semibold mb-2 text-slate-800 group-hover:text-blue-600 transition-colors">
                {{ achievement.title }}
              </h3>
              <p class="text-slate-600 leading-relaxed group-hover:text-slate-700 transition-colors">
                {{ achievement.description }}
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Team Credits Section -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
      <h2 class="text-3xl font-bold text-center mb-12 text-slate-800">Development Team</h2>
      
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div 
          v-for="(member, index) in teamMembers" 
          :key="index"
          class="bg-white rounded-xl p-6 border border-slate-200 hover:border-blue-300 transition-all duration-300 hover:shadow-lg text-center"
        >
          <div class="w-20 h-20 mx-auto mb-4 rounded-full bg-gradient-to-br from-blue-500 to-indigo-500 flex items-center justify-center text-white text-2xl font-bold shadow-md">
            {{ member.initials }}
          </div>
          <h3 class="text-xl font-semibold text-slate-800 mb-1">
            {{ member.name }}
          </h3>
          <p class="text-blue-600 font-medium">
            {{ member.position }}
          </p>
        </div>
      </div>
    </div>

    <!-- Footer CTA -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
      <div class="bg-gradient-to-r from-blue-600 to-indigo-600 rounded-2xl p-8 md:p-12 text-center shadow-xl">
        <h2 class="text-3xl font-bold mb-4 text-white">Ready to Build Something Amazing?</h2>
        <p class="text-lg text-blue-50 mb-6 max-w-2xl mx-auto">
          Let's collaborate and bring your vision to life with our proven expertise in modern web development
        </p>
        <Link 
          :href="route('home')" 
          class="inline-flex items-center gap-2 bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-blue-50 transition-colors duration-300 shadow-lg hover:shadow-xl"
        >
          <Home class="w-5 h-5" />
          Return to Home
        </Link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { Link } from '@inertiajs/vue3';
import { Code2, Database, Search, Layers, Palette, FileText, BarChart3, Mail, Settings, Home } from 'lucide-vue-next';

const activeService = ref(null);

const technologies = [
  "HTML5",
  "CSS3",
  "Tailwind CSS",
  "JavaScript",
  "PHP",
  "Brevo API",
  "MySQL"
];

const services = [
  {
    icon: Code2,
    title: "Laravel Inertia + Vue.js",
    description: "Full-stack development using modern PHP framework with reactive frontend",
    color: "from-red-500 to-orange-500"
  },
  {
    icon: Database,
    title: "MySQL Database",
    description: "Robust database design and optimization for high-performance applications",
    color: "from-blue-500 to-cyan-500"
  },
  {
    icon: Search,
    title: "SEO Optimization",
    description: "Search engine optimization strategies to improve visibility and rankings",
    color: "from-green-500 to-emerald-500"
  },
  {
    icon: Layers,
    title: "Backend & Frontend",
    description: "Comprehensive full-stack development with seamless integration",
    color: "from-purple-500 to-pink-500"
  }
];

const achievements = [
  {
    icon: Palette,
    title: "Enhanced User Interface & Design",
    description: "Implemented comprehensive layout improvements and modern design patterns across the entire website, ensuring a cohesive and visually appealing user experience with responsive design principles.",
    gradient: "from-fuchsia-600 to-purple-600"
  },
  {
    icon: FileText,
    title: "Content Management & Optimization",
    description: "Refined and expanded website content to improve clarity, engagement, and search engine optimization, while maintaining consistency across all pages and sections.",
    gradient: "from-purple-600 to-violet-600"
  },
  {
    icon: BarChart3,
    title: "Dynamic Visitor Analytics System",
    description: "Developed and integrated a real-time visitor tracking system that monitors site traffic, providing valuable insights into user engagement and website performance metrics.",
    gradient: "from-blue-600 to-indigo-600"
  },
  {
    icon: Mail,
    title: "Email Integration via Brevo API",
    description: "Successfully implemented Brevo API integration to establish seamless email communication between the website and email servers, enabling automated notifications and contact form submissions.",
    gradient: "from-cyan-600 to-teal-600"
  },
  {
    icon: Settings,
    title: "Advanced Admin Dashboard Development",
    description: "Transformed the admin panel into a fully dynamic and interactive dashboard featuring real-time data visualization, enhanced user management capabilities, and streamlined content control systems.",
    gradient: "from-red-600 to-rose-600"
  }
];

// TODO: Add your team members here
const teamMembers = [
  {
    name: "Nyrl Jhon Ace Tavita",
    position: "DevOps Intern",
    initials: "NJAT"
  },
  {
    name: "Angelo G. Castillo",
    position: "Full Stack Developer",
    initials: "AGC"
  },
  {
    name: "Carl Joshua O. Tattao",
    position: "Full Stack Developer",
    initials: "CJOT"
  },
  {
    name: "Riyan D. Mariano",
    position: "Full Stack Developer",
    initials: "RDM"
  }

];
</script>

<style scoped>
/* Additional custom styles if needed */
</style>