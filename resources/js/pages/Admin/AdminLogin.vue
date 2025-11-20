<template>
  <div class="h-screen overflow-hidden bg-gradient-to-br from-slate-50 to-slate-100">

    <!-- Main Content -->
    <transition name="fade-in">
      <div class="min-h-screen lg:grid lg:grid-cols-2">
        <!-- Left Side - Branding Section -->
        <div class="hidden lg:flex lg:flex-col items-center justify-center p-12 bg-gradient-to-br from-blue-600 via-blue-700 to-red-600 relative overflow-hidden">
          <!-- Animated Background -->
          <div class="absolute inset-0 opacity-10">
            <div class="absolute inset-0 bg-[radial-gradient(circle_at_50%_50%,rgba(255,255,255,0.3),transparent_60%)] animate-spin-slow"></div>
          </div>

          <!-- Logo -->
          <div class="relative z-10 mb-8 group">
            <div class="w-48 h-48 rounded-full bg-white shadow-2xl flex items-center justify-center transform transition-all duration-500 group-hover:scale-110 group-hover:rotate-6 animate-float">
              <img
                src="/storage/assets/img/logo-whitebg.png"
                alt="James Polymers Logo"
                class="w-44 h-44 rounded-full object-contain"
              />
            </div>
          </div>

          <!-- Welcome Text -->
          <div class="relative z-10 text-center text-white space-y-4 max-w-md">
            <h2 class="text-4xl font-extrabold mb-3 tracking-tight">Welcome Back!</h2>
            <p class="text-xl font-semibold mb-4">James Polymers Admin Portal</p>
            <p class="text-base text-blue-100 font-medium">Empowering Excellence in Polymer Solutions</p>
          </div>

          <!-- Decorative Elements -->
          <div class="absolute top-10 left-10 w-20 h-20 border-4 border-white/20 rounded-full animate-pulse"></div>
          <div class="absolute bottom-10 right-10 w-32 h-32 border-4 border-white/20 rounded-full animate-pulse-delayed"></div>
        </div>

        <!-- Right Side - Login Form -->
        <div class="flex items-center justify-center p-6 sm:p-8 lg:p-12">
          <div class="w-full max-w-md space-y-8 animate-fade-in-up">
            <!-- Mobile Logo -->
            <div class="lg:hidden flex justify-center mb-8">
              <div class="w-24 h-24 rounded-full bg-gradient-to-br from-blue-600 to-red-600 p-1 shadow-lg">
                <div class="w-full h-full rounded-full bg-white flex items-center justify-center">
                  <img
                    src="/storage/assets/img/logo-whitebg.png"
                    alt="James Polymers Logo"
                    class="w-20 h-20 rounded-full object-contain"
                  />
                </div>
              </div>
            </div>

            <!-- Login Card -->
            <div class="bg-white rounded-3xl shadow-2xl p-8 sm:p-10 border border-slate-100">
              <!-- Header -->
              <div class="mb-8">
                <h1 class="text-3xl font-bold text-slate-800 mb-2">Admin Login</h1>
                <p class="text-slate-500 text-sm">Enter your credentials to access the admin panel</p>
              </div>

              <!-- Login Form (UI Only - No Backend) -->
              <form @submit.prevent="handleLogin" class="space-y-6">
                <!-- Email Input -->
                <div class="space-y-2">
                  <label for="email" class="block text-sm font-semibold text-slate-700">Email</label>
                  <div class="relative group">
                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                      <svg class="w-5 h-5 text-blue-600 group-focus-within:text-blue-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                      </svg>
                    </div>
                    <input
                      id="email"
                      v-model="form.email"
                      type="email"
                      placeholder="admin@example.com"
                      :disabled="loading"
                      class="w-full pl-12 pr-4 py-3.5 border-2 border-slate-200 rounded-xl focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-100 transition-all duration-200 text-slate-800 placeholder:text-slate-400 disabled:opacity-50 disabled:cursor-not-allowed"
                    />
                  </div>
                </div>

                <!-- Password Input -->
                <div class="space-y-2">
                  <label for="password" class="block text-sm font-semibold text-slate-700">Password</label>
                  <div class="relative group">
                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                      <svg class="w-5 h-5 text-blue-600 group-focus-within:text-blue-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                      </svg>
                    </div>
                    <input
                      id="password"
                      v-model="form.password"
                      :type="showPassword ? 'text' : 'password'"
                      placeholder="Enter your password"
                      :disabled="loading"
                      class="w-full pl-12 pr-12 py-3.5 border-2 border-slate-200 rounded-xl focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-100 transition-all duration-200 text-slate-800 placeholder:text-slate-400 disabled:opacity-50 disabled:cursor-not-allowed"
                    />
                    <button
                      type="button"
                      @click="togglePassword"
                      :disabled="loading"
                      class="absolute inset-y-0 right-0 pr-4 flex items-center text-slate-400 hover:text-slate-600 transition-colors disabled:opacity-50"
                    >
                      <svg v-if="!showPassword" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                      </svg>
                      <svg v-else class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                      </svg>
                    </button>
                  </div>
                </div>

                <!-- Login Button (Just redirects to dashboard) -->
                <button
                  type="submit"
                  :disabled="loading"
                  class="w-full py-4 px-6 bg-gradient-to-r from-blue-600 to-red-600 hover:from-red-600 hover:to-blue-600 text-white font-bold rounded-xl shadow-lg hover:shadow-xl hover:-translate-y-1 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none flex items-center justify-center gap-2"
                >
                  <svg v-if="loading" class="animate-spin h-5 w-5" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  <span>{{ loading ? 'Redirecting...' : 'Log In' }}</span>
                </button>
              </form>

              <!-- Back to Website Link -->
              <div class="mt-8 text-center">
                <a
                  href="/"
                  class="inline-flex items-center gap-2 text-sm text-slate-600 hover:text-blue-600 transition-colors font-medium"
                >
                  <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                  </svg>
                  Back to Website
                </a>
              </div>

              <!-- Footer Quote -->
              <div class="mt-10 pt-8 border-t border-slate-100 text-center space-y-3">
                <p class="text-sm italic text-blue-600 font-medium">
                  "Quality is never an accident; it is always the result of intelligent effort."
                </p>
                <p class="text-xs text-slate-400">
                  &copy; {{ new Date().getFullYear() }} James Polymers. All rights reserved.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { router } from '@inertiajs/vue3';

// Reactive state
const showPassword = ref(false);
const loading = ref(false);

const form = ref({
  email: '',
  password: '',
});

// Toggle password visibility
const togglePassword = () => {
  showPassword.value = !showPassword.value;
};

// Handle login - just redirect to dashboard (no authentication for now)
// Replace the handleLogin function with this:
const handleLogin = async () => {
  loading.value = true;
  
  try {
    const response = await fetch('/admin/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({
        email: form.value.email,
        password: form.value.password
      })
    });

    const data = await response.json();

    if (data.success) {
      // Redirect to dashboard
      window.location.href = data.redirect;
    } else {
      // Show error message
      alert(data.message);
      loading.value = false;
    }
  } catch (error) {
    console.error('Login error:', error);
    alert('An error occurred during login');
    loading.value = false;
  }
};
</script>

<style scoped>
:global(body) {
  overflow: hidden !important;
}

/* Animations */
@keyframes spin-slow {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

@keyframes float {
  0%, 100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-10px);
  }
}

@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-spin-slow {
  animation: spin-slow 20s linear infinite;
}

.animate-float {
  animation: float 3s ease-in-out infinite;
}

.animate-fade-in-up {
  animation: fade-in-up 0.8s ease-out;
}

.animate-pulse-delayed {
  animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
  animation-delay: 1s;
}

/* Transitions */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.fade-in-enter-active {
  transition: opacity 0.5s ease-in;
}

.fade-in-enter-from {
  opacity: 0;
}

.slide-down-enter-active,
.slide-down-leave-active {
  transition: all 0.3s ease;
}

.slide-down-enter-from {
  opacity: 0;
  transform: translateY(-10px);
}

.slide-down-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
</style>