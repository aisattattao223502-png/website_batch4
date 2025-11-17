<template>
    <Header />
  <div class="faq-page">
    <!-- Hero Section -->
    <div class="hero-section mt-12">
      <div class="hero-overlay" />
      <div class="hero-bg"/>
      <div class="hero-content">
        <div class="hero-badge">
          <i class="fas fa-cogs" />
          <span>Manufacturing Excellence</span>
        </div>
        <h1 class="hero-title">{{ headerTitle }}</h1>
        <p class="hero-description">
          Expert answers to your questions about our advanced plastic and rubber manufacturing processes, quality standards, and industry solutions
        </p>
        <div class="hero-divider" />
        <div class="hero-features">
          <div class="hero-feature">
            <i class="fas fa-shield-alt" />
            <span>ISO Certified</span>
          </div>
          <div class="hero-feature">
            <i class="fas fa-clock" />
            <span>24/7 Support</span>
          </div>
          <div class="hero-feature">
            <i class="fas fa-award" />
            <span>Industry Leader</span>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Stats Section -->
    <div class="stats-section">
      <div class="stats-grid">
        <div class="stat-card" style="animation-delay: 0.1s;">
          <div class="stat-icon stat-icon-blue">
            <i class="fas fa-question-circle" />
          </div>
          <div class="stat-number">{{ faqs.length }}</div>
          <div class="stat-label">Expert Answers</div>
          <div class="stat-sublabel">Comprehensive knowledge base</div>
        </div>
        <div class="stat-card" style="animation-delay: 0.2s;">
          <div class="stat-icon stat-icon-purple">
            <i class="fas fa-headset" />
          </div>
          <div class="stat-number">24/7</div>
          <div class="stat-label">Technical Support</div>
          <div class="stat-sublabel">Round-the-clock assistance</div>
        </div>
        <div class="stat-card" style="animation-delay: 0.3s;">
          <div class="stat-icon stat-icon-green">
            <i class="fas fa-star" />
          </div>
          <div class="stat-number">100%</div>
          <div class="stat-label">Quality Assurance</div>
          <div class="stat-sublabel">ISO certified processes</div>
        </div>
      </div>
    </div>

    <!-- Main Content: FAQs -->
    <div class="faq-section">
      <div class="faq-container">
        <div class="faq-header">
          <h2 class="faq-main-title">Frequently Asked Questions</h2>
          <p class="faq-subtitle">
            Get expert insights into our manufacturing processes, quality standards, and industry solutions
          </p>
        </div>

        <!-- FAQ List -->
        <div v-if="faqs.length > 0" class="faq-list">
          <div
            v-for="(faq, index) in filteredFaqs"
            :key="faq.id"
            class="faq-item"
            :style="{ animationDelay: `${index * 0.1}s` }"
          >
            <div 
              class="faq-question"
              @click="toggleFaq(faq.id)"
            >
              <div class="faq-icon">
                <i class="fa-solid fa-question" />
              </div>
              <div class="faq-question-text">
                <h3>{{ faq.question }}</h3>
              </div>
              <div class="faq-chevron" :class="{ active: activeFaq === faq.id }">
                <i class="fas fa-chevron-down" />
              </div>
            </div>
            <transition name="faq-expand">
              <div v-if="activeFaq === faq.id" class="faq-answer">
                <div class="faq-answer-content">
                  <p>{{ faq.answer }}</p>
                </div>
              </div>
            </transition>
          </div>

          <!-- No Results Message -->
          <div v-if="filteredFaqs.length === 0" class="no-results">
            No FAQs matched your search.
          </div>
        </div>

        <!-- Empty State -->
        <div v-else class="empty-state">
          <div class="empty-icon">
            <i class="fas fa-industry" />
          </div>
          <h3 class="empty-title">Knowledge Base Under Construction</h3>
          <p class="empty-description">
            We're building a comprehensive FAQ section with insights into our manufacturing processes.
          </p>
          <div class="empty-actions">
            <a href="/contact" class="btn btn-primary">
              <i class="fas fa-envelope" />
              Contact Us
            </a>
            <a href="tel:+1234567890" class="btn btn-secondary">
              <i class="fas fa-phone" />
              Call Now
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- Contact CTA Section -->
    <div class="cta-section">
      <div class="cta-content">
        <div class="cta-badge">
          <i class="fas fa-cogs" />
          <span>Technical Support</span>
        </div>
        <h2 class="cta-title">Need Technical Support?</h2>
        <p class="cta-description">
          Our manufacturing team is ready to provide detailed technical support and answer your specific questions about our processes and products.
        </p>
        <div class="cta-buttons">
          <a href="/contact" class="btn btn-primary-large">
            <i class="fas fa-envelope" />
            Contact Us
          </a>
          <a href="tel:+1234567890" class="btn btn-secondary-large">
            <i class="fas fa-phone" />
            Call Technical Support
          </a>
        </div>
        <div class="cta-features">
          <div class="cta-feature">
            <i class="fas fa-certificate" />
            <span>ISO Certified</span>
          </div>
          <div class="cta-feature">
            <i class="fas fa-clock" />
            <span>24/7 Availability</span>
          </div>
          <div class="cta-feature">
            <i class="fas fa-users" />
            <span>Professional Team</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div>
    <Footer />
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import Header from '@/layouts/Header.vue'
import Footer from '@/layouts/Footer.vue'

// Props from Inertia
const props = defineProps({
  faqs: {
    type: Array,
    default: () => []
  },
  headerTitle: {
    type: String,
    default: 'Frequently Asked Questions'
  },
  headerBg: {
    type: String,
    default: '/storage/assets/img/faq-hero-bg.jpg'
  }
})

// Reactive state
const activeFaq = ref(null)
const searchQuery = ref('')

// Toggle FAQ
const toggleFaq = (id) => {
  activeFaq.value = activeFaq.value === id ? null : id
}

// Filtered FAQs based on search
const filteredFaqs = computed(() => {
  if (!searchQuery.value.trim()) {
    return props.faqs
  }
  
  const query = searchQuery.value.toLowerCase().trim()
  return props.faqs.filter(faq => {
    return faq.question.toLowerCase().includes(query) ||
           faq.answer.toLowerCase().includes(query)
  })
})
</script>

<style scoped>
/* Base Styles */
.faq-page {
  min-height: 100vh;
  background: linear-gradient(to bottom right, #f8fafc, #eff6ff, #eef2ff);
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

/* Hero Section */
.hero-section {
  position: relative;
  overflow: hidden;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.hero-overlay {
  position: absolute;
  inset: 0;
  background-color: rgba(0, 0, 0, 0.3);
  z-index: 1;
}

.hero-bg {
  position: absolute;
  inset: 0;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  z-index: 0;
}

.hero-content {
  position: relative;
  z-index: 10;
  max-width: 1200px;
  margin: 0 auto;
  padding: 6rem 1rem;
  text-align: center;
}

.hero-badge {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 9999px;
  padding: 0.5rem 1.5rem;
  margin-bottom: 1.5rem;
  color: #bfdbfe;
  font-weight: 500;
}

.hero-title {
  font-size: clamp(2.5rem, 6vw, 4.5rem);
  font-weight: bold;
  color: white;
  margin-bottom: 2rem;
  line-height: 1.2;
  text-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
}

.hero-description {
  font-size: clamp(1.125rem, 2vw, 1.5rem);
  color: #bfdbfe;
  margin-bottom: 2.5rem;
  line-height: 1.6;
  max-width: 48rem;
  margin-left: auto;
  margin-right: auto;
}

.hero-divider {
  width: 8rem;
  height: 0.25rem;
  background: linear-gradient(to right, #60a5fa, #a78bfa, #22d3ee);
  border-radius: 9999px;
  margin: 0 auto 2rem;
}

.hero-features {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 1rem;
  color: #bfdbfe;
}

.hero-feature {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

/* Stats Section */
.stats-section {
  max-width: 1200px;
  margin: 0 auto;
  padding: 3rem 1rem;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

.stat-card {
  background: white;
  border-radius: 1rem;
  padding: 2rem;
  text-align: center;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  animation: fadeIn 0.6s ease-out forwards;
  opacity: 0;
  transition: transform 0.3s ease;
}

.stat-card:hover {
  transform: translateY(-5px);
}

@keyframes fadeIn {
  to {
    opacity: 1;
  }
}

.stat-icon {
  width: 4rem;
  height: 4rem;
  border-radius: 1rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1rem;
  font-size: 1.5rem;
  color: white;
}

.stat-icon-blue {
  background: linear-gradient(135deg, #3b82f6, #2563eb);
}

.stat-icon-purple {
  background: linear-gradient(135deg, #a855f7, #9333ea);
}

.stat-icon-green {
  background: linear-gradient(135deg, #22c55e, #16a34a);
}

.stat-number {
  font-size: 2.25rem;
  font-weight: bold;
  color: #3b82f6;
  margin-bottom: 0.5rem;
}

.stat-icon-purple + .stat-number {
  color: #a855f7;
}

.stat-icon-green + .stat-number {
  color: #22c55e;
}

.stat-label {
  font-size: 1.125rem;
  font-weight: 600;
  color: #1f2937;
  margin-bottom: 0.5rem;
}

.stat-sublabel {
  font-size: 0.875rem;
  color: #6b7280;
}

/* FAQ Section */
.faq-section {
  max-width: 1200px;
  margin: 0 auto;
  padding: 4rem 1rem;
}

.faq-container {
  background: white;
  border-radius: 1.5rem;
  padding: 2.5rem;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
}

.faq-header {
  text-align: center;
  margin-bottom: 3rem;
}

.faq-main-title {
  font-size: clamp(1.875rem, 4vw, 2.5rem);
  font-weight: bold;
  color: #1f2937;
  margin-bottom: 1rem;
}

.faq-subtitle {
  font-size: 1.125rem;
  color: #6b7280;
  max-width: 42rem;
  margin: 0 auto;
  line-height: 1.6;
}

/* FAQ Items */
.faq-list {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.faq-item {
  background: white;
  border: 2px solid #e5e7eb;
  border-radius: 1rem;
  overflow: hidden;
  transition: all 0.3s ease;
  animation: fadeIn 0.6s ease-out forwards;
  opacity: 0;
}

.faq-item:hover {
  border-color: #3b82f6;
  box-shadow: 0 4px 12px rgba(59, 130, 246, 0.1);
}

.faq-question {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1.5rem;
  cursor: pointer;
  user-select: none;
}

.faq-icon {
  width: 3rem;
  height: 3rem;
  background: linear-gradient(135deg, #3b82f6, #2563eb);
  border-radius: 0.75rem;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 1.125rem;
  flex-shrink: 0;
}

.faq-question-text {
  flex: 1;
}

.faq-question-text h3 {
  font-size: 1.125rem;
  font-weight: 600;
  color: #1f2937;
  line-height: 1.6;
}

.faq-chevron {
  width: 2rem;
  height: 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #6b7280;
  transition: transform 0.3s ease;
  flex-shrink: 0;
}

.faq-chevron.active {
  transform: rotate(180deg);
}

.faq-answer {
  border-top: 2px solid #f3f4f6;
  background: #f9fafb;
}

.faq-answer-content {
  padding: 1.5rem;
}

.faq-answer-content p {
  font-size: 1rem;
  line-height: 1.75;
  color: #4b5563;
  white-space: pre-line;
}

/* FAQ Expand Transition */
.faq-expand-enter-active,
.faq-expand-leave-active {
  transition: all 0.3s ease;
  overflow: hidden;
}

.faq-expand-enter-from,
.faq-expand-leave-to {
  max-height: 0;
  opacity: 0;
}

.faq-expand-enter-to,
.faq-expand-leave-from {
  max-height: 500px;
  opacity: 1;
}

/* No Results */
.no-results {
  text-align: center;
  padding: 5rem 1rem;
  font-size: 1.25rem;
  color: #6b7280;
}

/* Empty State */
.empty-state {
  text-align: center;
  padding: 5rem 1rem;
}

.empty-icon {
  width: 8rem;
  height: 8rem;
  background: linear-gradient(135deg, #dbeafe, #e0e7ff);
  border-radius: 9999px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 2rem;
  font-size: 4rem;
  color: #3b82f6;
}

.empty-title {
  font-size: 1.875rem;
  font-weight: bold;
  color: #1f2937;
  margin-bottom: 1rem;
}

.empty-description {
  font-size: 1.25rem;
  color: #6b7280;
  margin-bottom: 2rem;
}

.empty-actions {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  justify-content: center;
}

/* CTA Section */
.cta-section {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: 5rem 1rem;
  margin-top: 5rem;
  position: relative;
}

.cta-content {
  max-width: 64rem;
  margin: 0 auto;
  text-align: center;
  position: relative;
  z-index: 10;
}

.cta-badge {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 9999px;
  padding: 0.5rem 1.5rem;
  margin-bottom: 1.5rem;
  color: #bfdbfe;
  font-weight: 500;
}

.cta-title {
  font-size: clamp(2rem, 5vw, 3rem);
  font-weight: bold;
  color: white;
  margin-bottom: 2rem;
}

.cta-description {
  font-size: clamp(1.125rem, 2vw, 1.5rem);
  color: #bfdbfe;
  margin-bottom: 3rem;
  line-height: 1.6;
  max-width: 48rem;
  margin-left: auto;
  margin-right: auto;
}

.cta-buttons {
  display: flex;
  flex-wrap: wrap;
  gap: 1.5rem;
  justify-content: center;
  margin-bottom: 3rem;
}

.cta-features {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 2rem;
  color: #bfdbfe;
  max-width: 48rem;
  margin: 0 auto;
}

.cta-feature {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.75rem;
  font-weight: 600;
}

.cta-feature i {
  font-size: 1.5rem;
}

/* Buttons */
.btn {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  font-weight: 600;
  border-radius: 0.5rem;
  text-decoration: none;
  transition: all 0.3s ease;
  cursor: pointer;
}

.btn-primary {
  background: linear-gradient(135deg, #3b82f6, #2563eb);
  color: white;
  padding: 0.75rem 1.5rem;
}

.btn-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(59, 130, 246, 0.3);
}

.btn-secondary {
  background: linear-gradient(135deg, #8b5cf6, #7c3aed);
  color: white;
  padding: 0.75rem 1.5rem;
}

.btn-secondary:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(139, 92, 246, 0.3);
}

.btn-primary-large {
  background: linear-gradient(135deg, #3b82f6, #2563eb);
  color: white;
  padding: 1rem 2.5rem;
  border-radius: 0.75rem;
  font-size: 1.125rem;
}

.btn-primary-large:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(59, 130, 246, 0.3);
}

.btn-secondary-large {
  background: rgba(255, 255, 255, 0.2);
  backdrop-filter: blur(10px);
  color: white;
  padding: 1rem 2.5rem;
  border-radius: 0.75rem;
  font-size: 1.125rem;
  border: 2px solid rgba(255, 255, 255, 0.3);
}

.btn-secondary-large:hover {
  background: rgba(255, 255, 255, 0.3);
  transform: translateY(-2px);
}

/* Responsive */
@media (max-width: 768px) {
  .faq-container {
    padding: 1.5rem;
  }
  
  .hero-content {
    padding: 4rem 1rem;
  }
  
  .cta-features {
    grid-template-columns: 1fr;
  }
}
</style>