<template>
    <Header />
    <div class="sustainability-page">
        <!-- Background Sections -->
        <div 
            v-for="n in 4" 
            :key="n"
            :class="['background-section', `bg-section-${n}`, { active: currentBg === n }]"
        />

        <!-- HERO SECTION -->
        <section 
            class="snap-section hero-section"
            data-section="1"
        >
            <div class="hero-content">
                <h1 class="hero-title">
                    Our Commitment to Sustainability
                </h1>
                <p class="hero-subtitle">
                    Driving progress through sustainable practices and responsible manufacturing
                </p>
                <div class="hero-buttons">
                    <a 
                        href="#presidents-message"
                        class="btn btn-primary"
                    >
                        Learn More
                    </a>
                    <a 
                        href="/contact"
                        class="btn btn-secondary"
                    >
                        Contact Our Team
                    </a>
                </div>
            </div>
        </section>

        <!-- PRESIDENT'S MESSAGE -->
        <section 
            id="presidents-message" 
            class="snap-section content-section"
            data-section="2"
        >
            <div class="section-container">
                <div class="message-card">
                    <h2 class="section-title">
                        A Message from Our President
                    </h2>

                    <div class="message-content">
                        <p>
                            As we enter another year, James Polymers Mfg. Corp. remains committed to innovation and excellence in plastic injection and moulded rubber solutions. Our focus on quality, sustainability, and advanced technology positions us to lead in setting new industry standards. Over the next decade, we aim to enhance efficiency and sustainability, embrace smart technologies, and expand globally. Together with our partners, we strive to transform industries and create a more sustainable future. Thank you for your continued support.
                        </p>
                    </div>

                    <div class="audio-controls">
                        <button 
                            @click="toggleAudio"
                            class="audio-btn"
                            title="Play/Pause Audio"
                        >
                            <span v-if="!isPlaying">▶</span>
                            <span v-else>⏸</span>
                        </button>
                        <audio ref="audioPlayer" class="hidden">
                            <source :src="audioUrl" type="audio/mpeg">
                        </audio>
                    </div>
                </div>
            </div>
        </section>

        <!-- CORPORATE VALUES SECTION -->
        <section class="snap-section content-section" data-section="3">
            <div class="section-container">
                <div class="values-container">
                    <h3 class="section-heading">Our Corporate Values</h3>

                    <div class="values-grid">
                        <!-- Center Image (Hidden on Mobile) -->
                        <div class="center-image">
                            <!-- <img src="/storage/assets/img/icons/globe_hands.png" alt="Front Image" /> -->
                        </div>

                        <!-- Value Cards -->
                        <div class="value-card value-primary">
                            <div class="value-icon">
                                <i class="fas fa-handshake"></i>
                            </div>
                            <h4 class="value-title">Just & Fair</h4>
                            <p class="value-text">
                                Just Fair on the price that both parties should be satisfy
                            </p>
                            <!-- <img src="/storage/assets/img/icons/arrow_blue.png" alt="Arrow Blue" class="value-arrow arrow-blue" /> -->
                        </div>

                        <div class="value-card value-accent">
                            <div class="value-icon">
                                <img src="/storage/assets/img/icons/purpose-icon1.png" alt="Purpose Icon" />
                            </div>
                            <h4 class="value-title">Purpose</h4>
                            <p class="value-text">
                                The purpose should be attainment of improvement of the organization through training and development in all aspect and impact of the IMS.
                            </p>
                            <!-- <img src="/storage/assets/img/icons/arrow_orange.png" alt="Arrow Orange" class="value-arrow arrow-orange" /> -->
                        </div>

                        <div class="value-card value-accent">
                            <div class="value-icon">
                                <img src="/storage/assets/img/icons/customer_satisfaction2.png" alt="Customer Satisfaction" />
                            </div>
                            <h4 class="value-title">Customer Satisfaction</h4>
                            <p class="value-text">
                                Customer satisfaction should be base on the performance of our organization and met the target on time.
                            </p>
                            <!-- <img src="/storage/assets/img/icons/arrow_orange.png" alt="Arrow Orange" class="value-arrow arrow-orange reverse" /> -->
                        </div>

                        <div class="value-card value-primary">
                            <div class="value-icon">
                                <img src="/storage/assets/img/icons/modernization.png" alt="Modernization Icon" />
                            </div>
                            <h4 class="value-title">Modernization</h4>
                            <p class="value-text">
                                Modernization should be the management instinct to give additional innovation for the purpose of the business achievement.
                            </p>
                            <!-- <img src="/storage/assets/img/icons/arrow_blue.png" alt="Arrow Blue" class="value-arrow arrow-blue reverse" /> -->
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- INTEGRATED POLICY SECTION -->
        <section id="quality-policy" class="snap-section content-section" data-section="4">
            <div class="section-container">
                <div class="policy-header">
                    <span class="policy-super-title">
                        <span class="large-letter">O</span>ur 
                        <span class="large-letter">C</span>ommitment
                    </span>
                    <h2 class="policy-main-title">
                        <span class="underline-accent">In</span>tegrated Quality, Environmental & Safety Policy
                    </h2>
                    <p class="policy-subtitle">
                        Our comprehensive approach to responsible manufacturing and continuous improvement
                    </p>
                </div>

                <div class="policy-content">
                    <div class="policy-intro">
                        <h4 class="policy-label">POLICY</h4>
                        <p class="policy-description">
                            James Polymers Manufacturing Corporation is committed to sustainable plastic and rubber injection operations to protect the environment and ensure consistent customer satisfaction by:
                        </p>
                    </div>

                    <div class="commitments-grid">
                        <div class="commitment-section">
                            <h5 class="commitment-heading">
                                <i class="fas fa-check-circle"></i> Our Commitments
                            </h5>
                            <ul class="commitment-list">
                                <li>
                                    <i class="fas fa-check"></i>
                                    <span>Fulfilling applicable statutory, customer & other requirements, commitments and compliance obligations relevant to the context of the organization</span>
                                </li>
                                <li>
                                    <i class="fas fa-check"></i>
                                    <span>Prevention of pollution through implementation of waste management</span>
                                </li>
                                <li>
                                    <i class="fas fa-check"></i>
                                    <span>Efficient operations leading to energy and other resources conservation, quality and reliable product thereby reducing nonconforming products</span>
                                </li>
                            </ul>
                        </div>

                        <div class="commitment-section">
                            <h5 class="commitment-heading">
                                <i class="fas fa-shield-alt"></i> Safety Focus
                            </h5>
                            <ul class="commitment-list">
                                <li>
                                    <i class="fas fa-check"></i>
                                    <span>Providing a safe and healthy work environment with proper employee training on machinery operation</span>
                                </li>
                                <li>
                                    <i class="fas fa-check"></i>
                                    <span>Following established safety procedures and utilizing appropriate personal protective equipment</span>
                                </li>
                                <li>
                                    <i class="fas fa-check"></i>
                                    <span>Maintaining equipment in good condition and adhering to strict quality control standards</span>
                                </li>
                                <li>
                                    <i class="fas fa-check"></i>
                                    <span>Promoting hazard awareness and conducting regular safety audits for continuous improvement</span>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="policy-quote">
                        <p class="quote-text">
                            All employees are made aware of the quality and environment management system related activities to instill commitment to continual improvement aiming to enhance quality and environmental performance.
                        </p>
                        <p class="quote-highlight">
                            "SATISFACTION THRU QUALITY and SUSTAINABILITY is our ultimate commitment to keep relevant focusing on customer and other relevant parties' needs and expectations."
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- QUALITY & ENVIRONMENTAL POLICY SECTION -->
        <section id="environmental-policy" class="snap-section content-section" data-section="4">
            <div class="section-container">
                <!-- Title -->
                <div class="policy-header">
                    <span class="policy-super-title">
                        <span class="large-letter">O</span>ur 
                        <span class="large-letter">S</span>tandard
                    </span>
                    <h2 class="policy-main-title">
                        <span class="underline-accent">Qu</span>uality & Environmental Excellence
                    </h2>
                </div>

                <!-- Policies Side by Side -->
                <div class="excellence-grid">
                    <!-- Quality Policy -->
                    <div class="excellence-card">
                        <h3 class="excellence-title">
                            <i class="fas fa-award"></i>
                            Quality Policy
                        </h3>
                        <div class="excellence-content">
                            <p>Our commitment to delivering excellence through systematic quality management and continuous improvement processes.</p>
                        </div>
                    </div>

                    <!-- Environmental Policy -->
                    <div class="excellence-card">
                        <h3 class="excellence-title">
                            <i class="fas fa-leaf"></i>
                            Environmental Policy
                        </h3>
                        <div class="excellence-content">
                            <p>Our dedication to environmental stewardship and sustainable practices in all our operations.</p>
                        </div>
                    </div>
                </div>

               <!-- Certificates Section -->
                <div class="certifications-section">
                    <h3 class="certifications-title"><b>Our Certifications</b></h3>

                    <div class="certifications-container">
                        <!-- All 8 Certificates in One Grid -->
                        <div class="certifications-grid">
                            <!-- Certificate 1 -->
                            <div class="certification-card">
                                <div class="cert-image">
                                    <img src="/storage/assets/img/certifications/ISO-9001.png" alt="ISO 9001:2015 Certification" />
                                </div>
                                <h4 class="cert-title">ISO 9001:2015</h4>
                            </div>

                            <!-- Certificate 2 -->
                            <div class="certification-card">
                                <div class="cert-image">
                                    <img src="/storage/assets/img/certifications/ISO-14001.png" alt="ISO 14001:2015 Certification" />
                                </div>
                                <h4 class="cert-title">ISO 14001:2015</h4>
                            </div>

                            <!-- Certificate 3 -->
                            <div class="certification-card">
                                <div class="cert-image">
                                    <img src="/storage/assets/img/certifications/RoHS.png" alt="RoHS Compliant" />
                                </div>
                                <h4 class="cert-title">RoHS Compliant</h4>
                            </div>

                            <!-- Certificate 4 -->
                            <div class="certification-card">
                                <div class="cert-image">
                                    <img src="/storage/assets/img/certifications/Reach.png" alt="Reach Compliant" />
                                </div>
                                <h4 class="cert-title">Reach Compliant</h4>
                            </div>

                            <!-- Certificate 5 -->
                            <div class="certification-card">
                                <div class="cert-image">
                                    <img src="/storage/assets/img/certifications/cGMP.png" alt="cGMP Compliant" />
                                </div>
                                <h4 class="cert-title">cGMP Compliant</h4>
                            </div>

                            <!-- Certificate 6 -->
                            <div class="certification-card">
                                <div class="cert-image">
                                    <img src="/storage/assets/img/certifications/TQCSI-9001.png" alt="TQCSI 9001" />
                                </div>
                                <h4 class="cert-title">TQCSI 9001</h4>
                            </div>

                            <!-- Certificate 7 -->
                            <div class="certification-card">
                                <div class="cert-image">
                                    <img src="/storage/assets/img/certifications/TQCSI 14001.png" alt="TQCSI 14001 " />
                                </div>
                                <h4 class="cert-title">TQCSI 14001</h4>
                            </div>

                            <!-- Certificate 8 -->
                            <div class="certification-card">
                                <div class="cert-image">
                                    <img src="/storage/assets/img/certifications/BEST.png" alt="BEST" />
                                </div>
                                <h4 class="cert-title">BEST</h4>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Continual Improvement & Kaizen -->
                <div class="improvement-section">
                    <div class="improvement-grid">
                        <!-- Left Column - Images -->
                        <div class="improvement-images">
                            <div class="improvement-image">
                                <img src="/storage/assets/img/icons/continuous_improvent_1.png" alt="Continual Improvement" />
                            </div>
                            <div class="improvement-image">
                                <img src="/storage/assets/img/icons/Kaizen.png" alt="Kaizen" />
                            </div>
                        </div>

                        <!-- Right Column - Text Sections -->
                        <div class="improvement-content">
                            <!-- Continual Improvement -->
                            <div class="improvement-item">
                                <h3 class="improvement-title">Continual Improvement</h3>
                                <p class="improvement-description">
                                    We regularly review and enhance our management systems to ensure they remain effective and aligned with industry best practices.
                                </p>
                                <ul class="improvement-list">
                                    <li>
                                        <i class="fas fa-check-circle"></i>
                                        <span>Recognize areas for improvement</span>
                                    </li>
                                    <li>
                                        <i class="fas fa-check-circle"></i>
                                        <span>Set a clear improvement goal</span>
                                    </li>
                                    <li>
                                        <i class="fas fa-check-circle"></i>
                                        <span>Understand the process in detail</span>
                                    </li>
                                    <li>
                                        <i class="fas fa-check-circle"></i>
                                        <span>Create and prepare the solution</span>
                                    </li>
                                </ul>
                            </div>

                            <!-- Kaizen -->
                            <div class="improvement-item">
                                <h3 class="improvement-title">Kaizen Approach</h3>
                                <p class="improvement-description">
                                    Kaizen emphasizes continuous, incremental improvements that involve every employee at every level of the organization.
                                </p>
                                <ul class="improvement-list">
                                    <li>
                                        <i class="fas fa-check-circle"></i>
                                        <span>Encourage small, consistent changes</span>
                                    </li>
                                    <li>
                                        <i class="fas fa-check-circle"></i>
                                        <span>Engage employees in problem-solving</span>
                                    </li>
                                    <li>
                                        <i class="fas fa-check-circle"></i>
                                        <span>Monitor and refine processes regularly</span>
                                    </li>
                                    <li>
                                        <i class="fas fa-check-circle"></i>
                                        <span>Foster a culture of improvement</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

       <!-- CSR SECTION -->
<section id="csr" class="snap-section content-section" data-section="4">
    <div class="section-container">
        <div class="policy-header">
            <span class="policy-super-title csr-title">
                <span class="large-letter">O</span>ur 
                <span class="large-letter">C</span>orporate 
                <span class="large-letter">S</span>ocial 
                <span class="large-letter">R</span>esponsibility (CSR)
            </span>
            <h2 class="policy-main-title">
                <span class="underline-accent">Co</span>mmitment
            </h2>
        </div>

        <div class="csr-list">
            <!-- CSR Item 1 -->
            <div class="csr-item">
                <div class="csr-image">
                    <img src="/storage/assets/img/about/OJT-Mission.jpg" alt="OJT Mission" />
                    <p class="csr-credit">Photo by James Polymers</p>
                </div>
                <div class="csr-content">
                    <h4 class="csr-title">OJT Mission Program</h4>
                    <p class="csr-subtitle">Empowering the next generation through hands-on training and mentorship programs</p>
                </div>
            </div>

            <!-- CSR Item 2 -->
            <div class="csr-item csr-reverse">
                <div class="csr-image">
                    <img src="/storage/assets/img/about/Plastic-Disposal.jpg" alt="Responsible Plastic Disposal" />
                    <p class="csr-credit">Photo by James Polymers</p>
                </div>
                <div class="csr-content">
                    <h4 class="csr-title">Promoting Responsible Plastic Disposal</h4>
                    <p class="csr-subtitle">As a polymer manufacturer, we advocate for proper plastic waste segregation and disposal. This initiative encourages individuals and communities to dispose of plastics correctly using designated recycle bins, helping reduce pollution and protect ecosystems from long-term plastic harm</p>
                </div>
            </div>
        </div>
    </div>
</section>

        <!-- CTA SECTION -->
        <section class="snap-section cta-section" data-section="4">
            <div class="cta-content">
                <h2 class="cta-title">
                    Ready to Partner with a Sustainable Manufacturer?
                </h2>
                <p class="cta-text">
                    Join us in our commitment to environmental responsibility and sustainable manufacturing practices.
                </p>
                <div class="cta-buttons">
                    <a href="/contact" class="btn btn-accent">
                        Get in Touch
                    </a>
                    <a href="/products" class="btn btn-outline">
                        Explore Our Products
                    </a>
                </div>
            </div>
        </section>
    </div>
    <div class="footer-wrapper">
        <Footer />
    </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import Header from '../../../layouts/Header.vue';
import Footer from '../../../layouts/Footer.vue';

// Props from Inertia
const props = defineProps({
    certifications: {
        type: Array,
        default: () => []
    },
    csrSections: {
        type: Array,
        default: () => []
    },
    sustainabilityData: {
        type: Object,
        default: () => ({})
    }
})

// Computed properties for certifications
const firstFourCerts = computed(() => props.certifications.slice(0, 4))
const remainingCerts = computed(() => props.certifications.slice(4))

// Reactive state
const currentBg = ref(1)
const isPlaying = ref(false)
const audioPlayer = ref(null)
const audioUrl = '/storage/assets/audio/presidentmessage.mp3'

// Audio control
const toggleAudio = () => {
    if (!audioPlayer.value) return
    
    if (isPlaying.value) {
        audioPlayer.value.pause()
        isPlaying.value = false
    } else {
        audioPlayer.value.play()
        isPlaying.value = true
    }
}

// Background switching on scroll
const handleScroll = () => {
    const sections = document.querySelectorAll('.snap-section')
    const scrollPosition = window.scrollY + window.innerHeight / 2

    sections.forEach((section) => {
        const sectionTop = section.offsetTop
        const sectionHeight = section.offsetHeight
        const bgIndex = parseInt(section.dataset.section)

        if (scrollPosition >= sectionTop && scrollPosition < sectionTop + sectionHeight) {
            currentBg.value = bgIndex
        }
    })
}

onMounted(() => {
    window.addEventListener('scroll', handleScroll)
    
    if (audioPlayer.value) {
        audioPlayer.value.addEventListener('ended', () => {
            isPlaying.value = false
        })
    }
})

onUnmounted(() => {
    window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
/* Reset and Base */
* {
    box-sizing: border-box;
}

.sustainability-page {
    position: relative;
    min-height: 100vh;
    overflow-x: hidden;
    font-family: 'Montserrat', 'Open Sans', -apple-system, BlinkMacSystemFont, sans-serif;
}

/* Background Sections */
.background-section {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    opacity: 0;
    transition: opacity 0.8s ease-in-out;
    z-index: 1;
    background-size: cover;
    background-position: center;
    pointer-events: none;
}

.background-section.active {
    opacity: 1;
}

.bg-section-1 {
    background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), 
                url('/storage/assets/img/sustainability/background1.jpg'); 
    background-size: cover;
    background-position: center;
}

.bg-section-2 {
    background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), 
                url('/storage/assets/img/sustainability/background2.jpg'); 
    background-size: cover;
    background-position: center;
}

.bg-section-3 {
    background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), 
                url('/storage/assets/img/sustainability/background3.png'); 
    background-size: cover;
    background-position: center;
}

.bg-section-4 {
    background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), 
                url('/storage/assets/img/sustainability/background4.jpg'); 
    background-size: cover;
    background-position: center;
}

/* Snap Sections */
.snap-section {
    min-height: 100vh;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10;
    padding: 4rem 1rem;
}

/* Hero Section */
.hero-section {
    color: white;
    text-align: center;
}

.hero-content {
    max-width: 1200px;
    margin: 0 auto;
}

.hero-title {
    font-size: clamp(2rem, 5vw, 3.5rem);
    font-weight: bold;
    margin-bottom: 1.5rem;
    line-height: 1.2;
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.8);
}

.hero-subtitle {
    font-size: clamp(1.125rem, 2.5vw, 1.5rem);
    margin-bottom: 2rem;
    opacity: 0.95;
    text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
}

.hero-buttons {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 1rem;
}

/* Buttons */
.btn {
    display: inline-block;
    font-weight: bold;
    padding: 0.875rem 2rem;
    border-radius: 0.5rem;
    text-decoration: none;
    transition: all 0.3s ease;
    cursor: pointer;
    border: 2px solid transparent;
    transform: translateY(0);
}

.btn:hover {
    transform: translateY(-2px) scale(1.05);
}

.btn-primary {
    background-color: #1e40af;
    color: white;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.btn-primary:hover {
    background-color: #1e3a8a;
}

.btn-secondary {
    background-color: transparent;
    border: 2px solid white;
    color: white;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.btn-secondary:hover {
    background-color: white;
    color: #1e40af;
}

.btn-accent {
    background-color: #f97316;
    color: white;
    border-radius: 9999px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.btn-accent:hover {
    background-color: #ea580c;
}

.btn-outline {
    background-color: transparent;
    border: 2px solid white;
    color: white;
    border-radius: 9999px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.btn-outline:hover {
    background-color: white;
    color: #1e40af;
}

/* Content Sections */
.content-section {
    padding: 4rem 1rem;
}

.section-container {
    max-width: 1400px;
    margin: 0 auto;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    border-radius: 1rem;
    padding: 1.5rem; /* Smaller padding for mobile */
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
}

.section-heading {
    font-size: clamp(1.875rem, 4vw, 3rem);
    font-weight: 600;
    text-align: center;
    margin-bottom: 3rem;
    color: #1f2937;
}

.section-title {
    font-size: clamp(2rem, 4.5vw, 3rem);
    font-weight: bold;
    color: #1e40af;
    text-align: center;
    margin-bottom: 2.5rem;
    line-height: 1.2;
}

/* Message Card */
.message-card {
    max-width: 64rem;
    margin: 0 auto;
    border: 3px solid rgba(30, 64, 175, 0.7);
    border-radius: 1rem;
    padding: 2.5rem;
    position: relative;
    z-index: 10;
}

.message-content {
    padding-left: 1.5rem;
    border-left: 4px solid rgba(249, 115, 22, 0.7);
    margin-bottom: 2rem;
}

.message-content p {
    font-size: 1.0625rem;
    line-height: 1.75;
    color: #374151;
    text-align: justify;
}

.audio-controls {
    display: flex;
    justify-content: flex-end;
    margin-right: 1.25rem;
    margin-top: 1.5rem;
}

.audio-btn {
    background-color: #f97316;
    color: white;
    padding: 0.75rem;
    border-radius: 9999px;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
    font-size: 1.25rem;
    width: 50px;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    transform: translateY(0);
}

.audio-btn:hover {
    background-color: #ff6b00;
    transform: translateY(-4px) scale(1.05);
}

.hidden {
    display: none;
}

/* Values Section */
.values-container {
    padding: 1.5rem;
    position: relative;
}

.values-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1.5rem;
    position: relative;
}

.center-image {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    z-index: 30;
    display: none;
    justify-content: center;
    align-items: center;
    pointer-events: none;
}

.center-image img {
    width: 16rem;
    height: 16rem;
    transform: rotate(-1deg);
}

.value-card {
    background: white;
    padding: 1.25rem;
    border-radius: 0.5rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    position: relative;
    z-index: 10;
}

.value-primary {
    border: 2px solid #1e40af;
}

.value-accent {
    border: 2px solid #f97316;
}

.value-icon {
    background-color: #1e40af;
    margin-bottom: 0.75rem;
    border-radius: 9999px;
    width: 4rem;
    height: 4rem;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.25rem;
}

.value-accent .value-icon {
    background-color: #f97316;
}

.value-icon img {
    width: 3rem;
    height: 3rem;
    object-fit: contain;
}

.value-title {
    font-size: 1.125rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
    color: #1f2937;
}

.value-text {
    font-size: 0.875rem;
    line-height: 1.6;
    color: #4b5563;
    text-align: center;
    max-width: 350px;
    width: 100;
    margin: 0 auto;
}
/* START OF ROTATING ARROWS */

/* Value Arrows */
.value-arrow {
    position: absolute;
    width: 100px;
    height: 100px;
    display: none;
}

/* Top Left Card - Blue Arrow pointing right */
.arrow-blue {
    bottom: 25px;
    right: 20px;
    transform: rotate(180deg);
}

/* Top Right Card - Orange Arrow pointing left */
/* .arrow-orange {
    bottom: 25px;
    left: 20px;
    transform: rotate(180deg);
} */

/* Bottom Left Card - Orange Arrow pointing up-right */
/* .arrow-orange.reverse {
    bottom: 150px;
    right: 20px;
    transform: rotate(360deg);
} */

/* Bottom Right Card - Blue Arrow pointing up-left */
.arrow-blue.reverse {
    bottom: 150px;
    left: 20px;
    transform: rotate(360deg);
}

/* Policy Sections */
.policy-header {
    text-align: center;
    margin-bottom: 3rem;
    padding: 2rem 1rem;
}

.policy-super-title {
    display: block;
    font-size: clamp(1.5rem, 3vw, 2.5rem);
    font-weight: bold;
    color: #f97316;
    margin-bottom: 1rem;
    letter-spacing: 0.1em;
}

.large-letter {
    font-size: 1.2em;
}

.policy-main-title {
    font-size: clamp(1.875rem, 4vw, 3rem);
    font-weight: 600;
    color: #1f2937;
    line-height: 1.3;
}

.underline-accent {
    text-decoration: underline;
    text-decoration-color: #f97316;
    text-underline-offset: 15px;
}

.policy-subtitle {
    font-size: 1.125rem;
    color: #6b7280;
    max-width: 800px;
    margin: 1rem auto 0;
}

.policy-content {
    max-width: 64rem;
    margin: 0 auto;
    padding: 2rem;
}

.policy-intro {
    text-align: center;
    margin-bottom: 3rem;
}

.policy-label {
    font-size: 2rem;
    font-weight: bold;
    text-decoration: underline;
    text-decoration-color: #f97316;
    text-underline-offset: 8px;
    margin-bottom: 1.5rem;
    color: #000;
}

.policy-description {
    font-size: 1.125rem;
    line-height: 1.7;
    color: #374151;
    font-weight: 500;
}

.commitments-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
}

.commitment-section {
    padding: 1rem;
}

.commitment-heading {
    font-size: 1.125rem;
    font-weight: bold;
    margin-bottom: 1rem;
    color: #1f2937;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.commitment-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.commitment-list li {
    padding: 0.75rem 0;
    line-height: 1.6;
    color: #374151;
    display: flex;
    align-items: flex-start;
    gap: 0.5rem;
}

.commitment-list li i {
    color: #f97316;
    margin-top: 0.25rem;
    flex-shrink: 0;
}

.policy-quote {
    background-color: rgba(30, 64, 175, 0.1);
    padding: 2rem;
    border-radius: 0.5rem;
    margin-top: 2rem;
    transition: all 0.3s ease;
}

.quote-text {
    font-size: 1.125rem;
    line-height: 1.7;
    color: #374151;
    margin-bottom: 1rem;
}

.quote-highlight {
    font-size: 1.125rem;
    font-weight: bold;
    color: #1e40af;
    text-align: center;
    margin: 0;
}

/* Excellence Grid */
.excellence-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin-bottom: 3rem;
}

.excellence-card {
    padding: 2rem;
    background: white;
    border-radius: 0.5rem;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.excellence-title {
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 1rem;
    color: #1f2937;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    letter-spacing: 0.05em;
}

.excellence-content p {
    line-height: 1.7;
    color: #374151;
}

/* Certifications Section - Mobile First */
.certifications-section {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin: 2rem 0;
}

.certifications-title {
    font-size: 1.5rem;
    margin-bottom: 2rem;
    color: #1f2937;
}

.certifications-container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem;
}

.certifications-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr); /* 2 columns on mobile */
    gap: 1.5rem;
    width: 100%;
}

.certification-card {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    padding: 1rem;
    background: white;
    border-radius: 0.5rem;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.certification-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.cert-image {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 0.75rem;
    width: 100%;
    height: 120px; /* Smaller for mobile */
}

.cert-image img {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
}

.cert-title {
    font-size: 0.75rem; /* Smaller text for mobile */
    font-weight: 600;
    color: #1f2937;
    line-height: 1.3;
    margin: 0;
}

/* Tablet - 3 columns */
@media (min-width: 640px) {
    .certifications-grid {
        grid-template-columns: repeat(3, 1fr);
        gap: 2rem;
    }
    
    .cert-image {
        height: 140px;
    }
    
    .cert-title {
        font-size: 0.875rem;
    }
}

/* Desktop - 4 columns */
@media (min-width: 1024px) {
    .certifications-grid {
        grid-template-columns: repeat(4, 1fr);
        gap: 2rem;
    }
    
    .cert-image {
        height: 160px;
    }
    
    .cert-title {
        font-size: 0.875rem;
    }
    
    .certifications-title {
        font-size: 2rem;
    }
}

/* Improvement Section */
.improvement-section {
    margin: 3rem 0;
    padding: 2rem;
    color: #000;
}

.improvement-grid {
    display: flex;
    flex-direction: column;
    gap: 3rem;
}

.improvement-images {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 2.5rem;
    width: 100%;
}

.improvement-image {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.improvement-image img {
    border-radius: 0.5rem;
    width: 100%;
    max-width: 350px;
    height: auto;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.improvement-image img:hover {
    transform: scale(1.05);
}

.improvement-content {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 3rem;
}

.improvement-item {
    padding: 1rem;
}

.improvement-title {
    font-size: clamp(2rem, 4vw, 2.5rem);
    font-weight: bold;
    margin-bottom: 1rem;
    color: #1f2937;
    font-family: 'Alice', serif;
}

.improvement-description {
    font-size: 1rem;
    line-height: 1.7;
    color: #374151;
    margin-bottom: 1.5rem;
    font-family: 'Tinos', serif;
}

.improvement-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.improvement-list li {
    padding: 0.75rem 0;
    font-size: 1rem;
    line-height: 1.6;
    color: #374151;
    display: flex;
    align-items: flex-start;
    gap: 0.75rem;
    font-family: 'Tinos', serif;
}

.improvement-list li i {
    color: #f97316;
    margin-top: 0.25rem;
    flex-shrink: 0;
}

/* CSR Section */
.csr-title {
    letter-spacing: normal;
}

.csr-list {
    display: flex;
    flex-direction: column;
    gap: 3rem;
}

.csr-item {
    display: flex;
    flex-direction: column;
    gap: 2rem;
    align-items: center;
}

.csr-image {
    width: 100%;
    max-width: 500px;
    height: 350px;
    border-radius: 0.75rem;
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
    position: relative;
    overflow: hidden;
}

.csr-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.csr-credit {
    position: absolute;
    bottom: 0.5rem;
    right: 0.5rem;
    font-size: 0.75rem;
    color: white;
    background: rgba(0, 0, 0, 0.6);
    padding: 0.25rem 0.5rem;
    border-radius: 0.25rem;
}

.csr-content {
    text-align: center;
    max-width: 500px;
}

.csr-title {
    font-size: 2rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
    color: #1f2937;
    font-family: 'Alice', serif;
}

.csr-subtitle {
    font-size: 1.125rem;
    color: #4b5563;
    font-family: sans-serif;
}

/* CTA Section */
.cta-section {
    color: white;
    text-align: center;
}

.cta-content {
    max-width: 800px;
    margin: 0 auto;
}

.cta-title {
    font-size: clamp(1.875rem, 4vw, 2.5rem);
    font-weight: bold;
    margin-bottom: 1.5rem;
}

.cta-text {
    font-size: 1.25rem;
    margin-bottom: 2rem;
    opacity: 0.95;
}

.cta-buttons {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 1rem;
}

.footer-wrapper {
    position: relative;
    z-index: 20;
    padding-top: 2rem;
}

/* Responsive Design */
@media (min-width: 768px) {
    .section-container {
        padding: 4rem;
    }
    
    .values-grid {
        grid-template-columns: 1fr 1fr;
    }
    
    .center-image {
        display: flex;
    }
    
    .value-arrow {
        display: block;
    }
    
    .value-text {
        text-align: left;
    }
    
    .csr-item {
        flex-direction: row;
    }
    
    .csr-reverse {
        flex-direction: row-reverse;
    }
    
    .csr-content {
        text-align: left;
    }
    
    .csr-reverse .csr-content {
        text-align: right;
    }
    
    .improvement-grid {
        flex-direction: row;
        gap: 3rem;
        align-items: flex-start;
    }
    
    .improvement-images {
        width: 50%;
    }
    
    .improvement-content {
        width: 50%;
    }
}

@media (min-width: 1024px) {
    .values-grid {
        gap: 1.5rem;
    }
}

@media (max-width: 768px) {
    .section-container {
        padding: 2rem 1rem;
    }
    
    .message-card {
        padding: 1.5rem;
    }
    
    .policy-content {
        padding: 1rem;
    }
    
    .values-grid {
        grid-template-columns: 1fr;
    }
    
    .value-text {
        text-align: center;
    }
    
    .improvement-images {
        flex-direction: column;
    }
}

/* Additional responsive padding for section container */
@media (min-width: 768px) {
    .section-container {
        padding: 2.5rem;
    }
}

@media (min-width: 1024px) {
    .section-container {
        padding: 3rem;
    }
}
</style>