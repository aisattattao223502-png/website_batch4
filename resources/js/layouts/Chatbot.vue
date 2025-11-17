<template>
  <div>
    <!-- Chatbot Box - Smaller height to avoid header overlap -->
    <div 
      v-show="isOpen"
      class="fixed bottom-20 right-4 w-[90vw] sm:w-[380px] max-w-full bg-white border border-gray-200 rounded-2xl shadow-2xl z-[9998] max-h-[calc(100vh-140px)]"
    >
      <!-- Header - Smaller -->
      <div class="bg-gradient-to-r from-blue-600 to-blue-700 text-white p-3 sm:p-4 rounded-t-2xl flex justify-between items-center">
        <div class="flex items-center space-x-2">
          <div class="relative">
            <div class="w-8 h-8 sm:w-10 sm:h-10 bg-white rounded-full flex items-center justify-center shadow-lg overflow-hidden">
              <img 
                src="/storage/assets/img/ChatBot-Girl-img.jpg" 
                alt="JPMC Assistant" 
                class="w-7 h-7 sm:w-9 sm:h-9 rounded-full object-cover"
              />
            </div>
            <div class="absolute -bottom-1 -right-1 w-3 h-3 bg-green-400 rounded-full border-2 border-white"></div>
          </div>
          <div>
            <h3 class="font-semibold text-sm sm:text-base">JPMC Assistant</h3>
            <div class="text-[10px] sm:text-xs text-blue-100">Online</div>
          </div>
        </div>
        <button 
          @click="toggleChatbot"
          class="text-white hover:text-gray-200 text-xl sm:text-2xl font-light"
        >
          &times;
        </button>
      </div>

      <!-- Messages Container - Adjusted height -->
      <div 
        ref="messagesContainer"
        class="h-44 sm:h-52 overflow-y-auto p-3 space-y-3 bg-gray-50"
      >
        <div 
          v-for="(message, index) in messages" 
          :key="index"
          :class="[
            'flex transition-all duration-300',
            message.isUser ? 'justify-end' : 'items-start space-x-2'
          ]"
        >
          <!-- Bot Avatar -->
          <div 
            v-if="!message.isUser"
            class="w-6 h-6 sm:w-7 sm:h-7 bg-white rounded-full flex items-center justify-center flex-shrink-0 overflow-hidden shadow-sm"
          >
            <img 
              src="/storage/assets/img/ChatBot-Girl-img.jpg" 
              alt="JPMC Assistant" 
              class="w-5 h-5 sm:w-6 sm:h-6 rounded-full object-cover"
            />
          </div>

          <!-- Message Bubble -->
          <div 
            :class="[
              'rounded-2xl p-2 sm:p-2.5 max-w-[75%]',
              message.isUser 
                ? 'bg-blue-500 text-white rounded-br-sm' 
                : 'bg-gray-100 text-gray-800 rounded-tl-sm'
            ]"
          >
            <p class="text-[11px] sm:text-xs leading-relaxed whitespace-pre-line">{{ message.text }}</p>
            
            <!-- Timestamp -->
            <p 
              v-if="message.timestamp"
              :class="[
                'text-[8px] sm:text-[9px] mt-1',
                message.isUser ? 'text-blue-100 text-right' : 'text-gray-500'
              ]"
            >
              {{ message.timestamp }}
            </p>
          </div>
        </div>

        <!-- Typing Indicator -->
        <div v-if="isTyping" class="flex items-start space-x-2">
          <div class="w-6 h-6 sm:w-7 sm:h-7 bg-white rounded-full flex items-center justify-center flex-shrink-0 overflow-hidden shadow-sm">
            <img 
              src="/storage/assets/img/ChatBot-Girl-img.jpg" 
              alt="JPMC Assistant" 
              class="w-5 h-5 sm:w-6 sm:h-6 rounded-full object-cover"
            />
          </div>
          <div class="bg-gray-100 rounded-2xl rounded-tl-sm p-2">
            <div class="flex space-x-1">
              <div class="w-1.5 h-1.5 bg-gray-400 rounded-full animate-bounce"></div>
              <div class="w-1.5 h-1.5 bg-gray-400 rounded-full animate-bounce" style="animation-delay: 0.1s"></div>
              <div class="w-1.5 h-1.5 bg-gray-400 rounded-full animate-bounce" style="animation-delay: 0.2s"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Horizontal Scrollable Categories with visible scrollbar -->
      <div 
        v-if="quickQuestions.length > 0"
        class="p-2 sm:p-3 border-t border-gray-100 bg-gray-50 overflow-x-auto scrollbar-visible"
      >
        <div class="flex space-x-2 min-w-max pb-1">
          <button
            v-for="(question, index) in quickQuestions"
            :key="index"
            @click="handleQuickQuestion(question)"
            :class="[
              'px-2 sm:px-2.5 py-1 sm:py-1.5 rounded-lg text-[10px] sm:text-xs transition-colors whitespace-nowrap flex-shrink-0',
              getButtonClass(question.type)
            ]"
          >
            {{ question.text }}
          </button>
        </div>
      </div>

      <!-- Action Buttons - Smaller -->
      <div class="p-2 sm:p-3 border-t border-gray-100 bg-white">
        <div class="flex space-x-1.5 sm:space-x-2">
          <!-- <button 
            @click="showHistory"
            class="flex-1 px-2 py-1.5 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg text-[10px] sm:text-xs transition-all duration-200 flex items-center justify-center space-x-1"
          >
            <i class="fas fa-history text-[9px] sm:text-[10px]"></i>
            <span class="hidden sm:inline">History</span>
          </button> -->
          <button 
            @click="exportChat"
            class="flex-1 px-2 py-1.5 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg text-[10px] sm:text-xs transition-all duration-200 flex items-center justify-center space-x-1"
          >
            <i class="fas fa-download text-[9px] sm:text-[10px]"></i>
            <span class="hidden sm:inline">Export</span>
          </button>
          <button 
            @click="startNewConversation"
            class="flex-1 px-2 py-1.5 bg-blue-500 hover:bg-blue-600 text-white rounded-lg text-[10px] sm:text-xs transition-all duration-200 flex items-center justify-center space-x-1"
          >
            <i class="fas fa-plus text-[9px] sm:text-[10px]"></i>
            <span>New</span>
          </button>
        </div>
      </div>

      <!-- Input Area - Smaller -->
      <div class="p-2 sm:p-3 border-t border-gray-200">
        <div class="flex space-x-2">
          <input 
            v-model="userInput"
            @keypress.enter="sendMessage"
            type="text" 
            placeholder="Type your question..." 
            class="flex-1 px-2 sm:px-3 py-1.5 sm:py-2 border border-gray-300 rounded-lg text-xs sm:text-sm focus:outline-none focus:border-blue-500"
          />
          <button 
            @click="sendMessage"
            :disabled="!userInput.trim()"
            :class="[
              'px-3 sm:px-4 py-1.5 sm:py-2 rounded-lg text-xs sm:text-sm transition-all',
              userInput.trim() 
                ? 'bg-blue-600 text-white hover:bg-blue-700' 
                : 'bg-gray-200 text-gray-400 cursor-not-allowed'
            ]"
          >
            <span class="hidden sm:inline">Send</span>
            <i class="fas fa-paper-plane sm:hidden"></i>
          </button>
        </div>
      </div>
    </div>

    <!-- Chatbot Toggle Button - Always Visible -->
    <button
      @click="toggleChatbot"
      class="fixed bottom-4 right-4 z-[9999] bg-white rounded-full shadow-lg p-1.5 border border-gray-200 hover:bg-gray-100 transition-all hover:scale-105 group"
    >
      <div class="relative">
        <img 
          src="/storage/assets/img/ChatBot-Girl-img.jpg"
          alt="Chat"
          class="w-11 h-11 sm:w-12 sm:h-12 rounded-full object-cover"
        />
        <!-- Unread badge -->
        <span 
          v-if="unreadCount > 0 && !isOpen"
          class="absolute -top-1 -right-1 bg-red-500 text-white text-[10px] rounded-full w-4 h-4 flex items-center justify-center font-bold animate-pulse"
        >
          {{ unreadCount }}
        </span>
        <!-- Pulse effect -->
        <span class="absolute inset-0 rounded-full bg-blue-400 opacity-0 group-hover:opacity-20 group-hover:animate-ping"></span>
      </div>
    </button>
  </div>
</template>

<script setup>
import { ref, nextTick, watch } from 'vue';
import axios from 'axios';

// State variables
const isOpen = ref(false);
const messages = ref([]);
const userInput = ref('');
const isTyping = ref(false);
const conversationHistory = ref([]);
const conversationLevel = ref(1);
const quickQuestions = ref([]);
const messagesContainer = ref(null);
const unreadCount = ref(0);



const getGeminiResponse = async (userMessage, context = '') => {
  // TEMPORARY: Direct API call (move to backend later for security)
  const GEMINI_API_KEY = 'AIzaSyCJQRYKKZVva2YAteFXvIy_uuFApaF_sPk'; // Replace with your actual key
  const GEMINI_API_URL = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';
  
  try {
    const prompt = context 
      ? `Based on this context about JPMC (James Polymers Manufacturing Corporation):\n${context}\n\nUser question: ${userMessage}\n\nProvide a helpful, concise answer related to JPMC's services, products, or manufacturing processes.`
      : `You are a helpful assistant for JPMC (James Polymers Manufacturing Corporation), a polymer manufacturing company. Answer this question: ${userMessage}`;

    const response = await axios.post(
      `${GEMINI_API_URL}?key=${GEMINI_API_KEY}`,
      {
        contents: [{
          parts: [{
            text: prompt
          }]
        }]
      },
      {
        headers: {
          'Content-Type': 'application/json'
        }
      }
    );

    const aiResponse = response.data?.candidates?.[0]?.content?.parts?.[0]?.text;
    return aiResponse || "I'm sorry, I couldn't generate a response. Please try again.";
  } catch (error) {
    console.error('Gemini API Error:', error);
    console.error('Error details:', error.response?.data);
    return null;
  }
};

// FAQ Database (same as before)
const faqDatabase = {
  'General Information': [
    {
      question: 'What is injection molding?',
      answer: 'Injection molding is a manufacturing process where molten polymer material is injected into a mold cavity under high pressure. The material cools and solidifies, taking the shape of the mold cavity. This process is widely used for producing plastic parts in high volumes with excellent precision and repeatability.',
      keywords: ['injection', 'molding', 'what is', 'process', 'manufacturing']
    },
    {
      question: 'What services does JPMC offer?',
      answer: 'JPMC offers:\n• Plastic injection molding\n• Rubber compression molding\n• Ultrasonic welding\n• Sub-assembly services\n• CNC machining\n• Mold design & fabrication\n• Silkscreen printing\n• 3D rapid prototyping',
      keywords: ['services', 'offer', 'provide', 'jpmc', 'what do']
    },
    {
      question: 'Where is JPMC located?',
      answer: 'James Polymers Manufacturing Corporation is located at:\n\n016 Panapaan 2, Bacoor City, 4102, Cavite, Philippines\n\nPhone: +63(2) 852989785\nEmail: jamespro_asia@yahoo.com',
      keywords: ['location', 'where', 'address', 'find', 'contact']
    },
    {
      question: 'How long has JPMC been in business?',
      answer: 'JPMC has been in business since 1980, providing over 45 years of experience in polymer manufacturing.',
      keywords: ['experience', 'years', 'history', 'since', 'how long']
    }
  ],
  'Technical Details': [
    {
      question: 'What is the typical cycle time?',
      answer: 'Cycle times vary based on part size, material, and complexity. Small parts: 10-30 seconds, Large parts: 1-5 minutes.',
      keywords: ['cycle time', 'time', 'speed', 'duration']
    },
    {
      question: 'What are the key process parameters?',
      answer: 'Critical parameters: Melt temperature, Injection pressure (500-2,000 bar), Hold pressure, Cooling time, Mold temperature, Injection speed.',
      keywords: ['parameters', 'settings', 'temperature', 'pressure']
    }
  ],
  'Quality & Standards': [
    {
      question: 'What certifications does JPMC have?',
      answer: 'JPMC certifications:\n• ISO 9001:2015 ✓\n• ISO 14001:2015 ✓\n• RoHS Compliant ✓\n• REACH Compliant ✓\n• cGMP Compliant ✓',
      keywords: ['certification', 'iso', 'compliance', 'standards']
    },
    {
      question: 'How do you ensure quality?',
      answer: 'We ensure quality through rigorous quality control, ISO compliance, thorough inspections, and continuous improvement.',
      keywords: ['ensure', 'quality', 'guarantee']
    }
  ],
  'Process Optimization': [
    {
      question: 'How can I reduce cycle time?',
      answer: 'Optimize cooling system, use faster-cooling materials, reduce wall thickness, optimize gate placement, use hot runner systems.',
      keywords: ['reduce', 'cycle time', 'faster', 'optimize']
    }
  ],
  'Troubleshooting': [
    {
      question: 'What causes short shots?',
      answer: 'Short shots occur from insufficient pressure, low temperature, blocked gates, inadequate venting, or material contamination.',
      keywords: ['short shot', 'incomplete', 'troubleshoot']
    }
  ]
};

// Smart FAQ Matching
const findBestMatch = (userMessage) => {
  const messageLower = userMessage.toLowerCase().trim();
  let bestMatch = null;
  let highestScore = 0;

  Object.entries(faqDatabase).forEach(([category, faqs]) => {
    faqs.forEach(faq => {
      let score = 0;
      
      faq.keywords.forEach(keyword => {
        if (messageLower.includes(keyword.toLowerCase())) {
          score += 10;
        }
      });
      
      const questionWords = faq.question.toLowerCase().split(' ').filter(w => w.length > 3);
      questionWords.forEach(word => {
        if (messageLower.includes(word)) {
          score += 5;
        }
      });
      
      if (messageLower === faq.question.toLowerCase()) {
        score += 50;
      }
      
      if (messageLower.includes(faq.question.toLowerCase()) || 
          faq.question.toLowerCase().includes(messageLower)) {
        score += 30;
      }
      
      if (score > highestScore) {
        highestScore = score;
        bestMatch = {
          ...faq,
          category,
          score
        };
      }
    });
  });

  return highestScore > 10 ? bestMatch : null;
};

// Create context from FAQ database for Gemini
const createContextFromFAQs = () => {
  let context = "JPMC Company Information:\n\n";
  Object.entries(faqDatabase).forEach(([category, faqs]) => {
    context += `${category}:\n`;
    faqs.forEach(faq => {
      context += `Q: ${faq.question}\nA: ${faq.answer}\n\n`;
    });
  });
  return context;
};

// Initialize chatbot
const initializeChatbot = () => {
  messages.value = [
    {
      text: "Hello! I'm here to help with your questions about JPMC.",
      isUser: false,
      timestamp: formatTime(new Date())
    },
    {
      text: "Ask me anything or choose from the quick questions below:",
      isUser: false,
      timestamp: formatTime(new Date())
    }
  ];
  
  showMainCategories();
};

// Show main categories (horizontal scroll)
const showMainCategories = () => {
  quickQuestions.value = [
    { text: '📚 General Information', type: 'category', category: 'General Information' },
    { text: '🔧 Technical Details', type: 'category', category: 'Technical Details' },
    { text: '✅ Quality & Standards', type: 'category', category: 'Quality & Standards' },
    { text: '🔍 Process Optimization', type: 'category', category: 'Process Optimization' },
    { text: '⚠️ Troubleshooting', type: 'category', category: 'Troubleshooting' }
  ];
};

// Get button styling
const getButtonClass = (type) => {
  const classes = {
    'category': 'bg-blue-100 hover:bg-blue-200 text-blue-800',
    'question': 'bg-purple-100 hover:bg-purple-200 text-purple-800',
    'followup': 'bg-green-100 hover:bg-green-200 text-green-800',
    'action': 'bg-gray-100 hover:bg-gray-200 text-gray-800'
  };
  return classes[type] || classes['action'];
};

// Format timestamp
const formatTime = (date) => {
  return new Date(date).toLocaleTimeString('en-US', { 
    hour: '2-digit', 
    minute: '2-digit' 
  });
};

// Handle quick question
const handleQuickQuestion = (question) => {
  if (question.type === 'category') {
    const categoryFaqs = faqDatabase[question.category] || [];
    addBotMessage(`Here are some questions about ${question.category}:`);
    quickQuestions.value = categoryFaqs.slice(0, 5).map(faq => ({
      text: faq.question,
      type: 'question',
      answer: faq.answer,
      category: question.category
    }));
  } else if (question.type === 'question') {
    addUserMessage(question.text);
    setTimeout(() => {
      addBotMessage(question.answer);
      conversationLevel.value;
      setTimeout(() => {
        // Show follow-up options
        quickQuestions.value = [
          { text: 'Ask another question', type: 'followup', category: question.category },
          { text: 'Back to categories', type: 'action' }
        ];
      }, 1000);
    }, 800);
  } else if (question.type === 'followup') {
    // Show more questions from the same category
    if (question.category && faqDatabase[question.category]) {
      const categoryFaqs = faqDatabase[question.category];
      addBotMessage(`Here are more questions about ${question.category}:`);
      quickQuestions.value = categoryFaqs.slice(0, 5).map(faq => ({
        text: faq.question,
        type: 'question',
        answer: faq.answer,
        category: question.category
      }));
    } else {
      // Fallback: show all categories
      addBotMessage("What would you like to know about?");
      showMainCategories();
    }
  } else if (question.text === 'Back to categories') {
    addBotMessage("Choose a category:");
    showMainCategories();
  }
};

// Add user message
const addUserMessage = (text) => {
  messages.value.push({
    text,
    isUser: true,
    timestamp: formatTime(new Date())
  });
  
  conversationHistory.value.push({
    question: text,
    timestamp: new Date(),
    level: conversationLevel.value
  });
  
  scrollToBottom();
};

// Add bot message
const addBotMessage = (text) => {
  isTyping.value = true;
  
  setTimeout(() => {
    isTyping.value = false;
    messages.value.push({
      text,
      isUser: false,
      timestamp: formatTime(new Date())
    });
    
    if (!isOpen.value) {
      unreadCount.value++;
    }
    
    scrollToBottom();
  }, 800);
};

// Send message - FAQ Only (Fallback)
const sendMessage = async () => {
  const message = userInput.value.trim();
  if (!message) return;
  
  addUserMessage(message);
  userInput.value = '';
  
  // Check FAQ database first
  const faqMatch = findBestMatch(message);
  
  if (faqMatch && faqMatch.score > 20) {
    // Strong FAQ match found
    setTimeout(() => {
      addBotMessage(faqMatch.answer);
      conversationLevel.value++;
      
      setTimeout(() => {
        quickQuestions.value = [
          { text: 'Ask another question', type: 'followup', category: faqMatch.category },
          { text: 'Back to categories', type: 'action' }
        ];
      }, 1000);
    }, 500);
  } else {
    // Use Gemini AI
    isTyping.value = true;
    
    const context = createContextFromFAQs();
    const aiResponse = await getGeminiResponse(message, context);
    
    isTyping.value = false;
    
    if (aiResponse) {
      addBotMessage(aiResponse);
      conversationLevel.value++;
      
      setTimeout(() => {
        quickQuestions.value = [
          { text: 'Ask another question', type: 'followup' },
          { text: 'Back to categories', type: 'action' }
        ];
      }, 1000);
    } else {
      addBotMessage("I'm having trouble connecting right now. Here are some topics I can help you with:");
      setTimeout(() => {
        showMainCategories();
      }, 1000);
    }
  }
};

// Show history
const showHistory = () => {
  if (conversationHistory.value.length === 0) {
    addBotMessage('No conversation history yet.');
    return;
  }
  
  const historyText = `Conversation:\n\nMessages: ${messages.value.length}\nQuestions: ${conversationHistory.value.length}\nLevel: ${conversationLevel.value}`;
  addBotMessage(historyText);
};

// Export chat
const exportChat = () => {
  const chatText = messages.value.map(msg => {
    const sender = msg.isUser ? 'You' : 'JPMC Assistant';
    return `[${msg.timestamp}] ${sender}: ${msg.text}`;
  }).join('\n\n');

  const blob = new Blob([chatText], { type: 'text/plain' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = `jpmc-chat-${Date.now()}.txt`;
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  URL.revokeObjectURL(url);
  
  addBotMessage('✅ Chat exported!');
};

// Start new conversation
const startNewConversation = () => {
  conversationHistory.value = [];
  conversationLevel.value = 1;
  messages.value = [];
  
  initializeChatbot();
};

// Scroll to bottom
const scrollToBottom = () => {
  nextTick(() => {
    if (messagesContainer.value) {
      messagesContainer.value.scrollTop = messagesContainer.value.scrollHeight;
    }
  });
};

// Toggle chatbot (button stays visible)
const toggleChatbot = () => {
  isOpen.value = !isOpen.value;
  
  if (isOpen.value) {
    unreadCount.value = 0;
    if (messages.value.length === 0) {
      initializeChatbot();
    }
  }
};

// Watch for unread messages
watch(isOpen, (newValue) => {
  if (newValue) {
    unreadCount.value = 0;
  }
});
</script>

<style scoped>
/* Visible scrollbar for horizontal categories */
.scrollbar-visible {
  scrollbar-width: thin;
  scrollbar-color: #cbd5e1 #f1f1f1;
}

.scrollbar-visible::-webkit-scrollbar {
  height: 6px;
}

.scrollbar-visible::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 3px;
}

.scrollbar-visible::-webkit-scrollbar-thumb {
  background: #cbd5e1;
  border-radius: 3px;
}

.scrollbar-visible::-webkit-scrollbar-thumb:hover {
  background: #94a3b8;
}

/* Custom scrollbar for messages */
::-webkit-scrollbar {
  width: 4px;
}

::-webkit-scrollbar-track {
  background: #f1f1f1;
}

::-webkit-scrollbar-thumb {
  background: #cbd5e1;
  border-radius: 2px;
}

::-webkit-scrollbar-thumb:hover {
  background: #94a3b8;
}
</style>