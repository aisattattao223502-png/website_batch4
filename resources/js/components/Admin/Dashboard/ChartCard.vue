<script setup>
import { ref, onMounted, watch } from 'vue';
import { Line } from 'vue-chartjs';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
  Filler
} from 'chart.js';

// Register ChartJS components
ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
  Filler
);

const props = defineProps({
  title: {
    type: String,
    default: 'Chart'
  },
  chartData: {
    type: Array,
    default: () => []
  }
});

const chartRef = ref(null);

// Chart configuration
const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      display: false
    },
    tooltip: {
      backgroundColor: 'rgba(0, 0, 0, 0.8)',
      padding: 12,
      titleFont: {
        size: 14,
        weight: 'bold'
      },
      bodyFont: {
        size: 13
      },
      borderColor: 'rgba(0, 102, 204, 0.5)',
      borderWidth: 1,
      displayColors: false,
      callbacks: {
        label: function(context) {
          return 'Visitors: ' + context.parsed.y.toLocaleString();
        }
      }
    }
  },
  scales: {
    y: {
      beginAtZero: true,
      grid: {
        color: 'rgba(0, 0, 0, 0.05)',
        drawBorder: false
      },
      ticks: {
        font: {
          size: 11
        },
        color: '#6B7280',
        callback: function(value) {
          return value.toLocaleString();
        }
      }
    },
    x: {
      grid: {
        display: false
      },
      ticks: {
        font: {
          size: 11
        },
        color: '#6B7280'
      }
    }
  },
  interaction: {
    intersect: false,
    mode: 'index'
  }
};

const data = ref({
  labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
  datasets: [
    {
      label: 'Monthly Visitors',
      data: props.chartData,
      backgroundColor: 'rgba(0, 102, 204, 0.1)',
      borderColor: 'rgba(0, 102, 204, 1)',
      borderWidth: 2,
      tension: 0.4,
      pointBackgroundColor: 'rgba(0, 102, 204, 1)',
      pointBorderColor: '#fff',
      pointBorderWidth: 2,
      pointRadius: 4,
      pointHoverRadius: 6,
      pointHoverBackgroundColor: 'rgba(0, 102, 204, 1)',
      pointHoverBorderColor: '#fff',
      pointHoverBorderWidth: 3,
      fill: true
    }
  ]
});

// Update chart data when prop changes
watch(() => props.chartData, (newData) => {
  data.value.datasets[0].data = newData;
});
</script>

<template>
  <div class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow duration-300 p-4 sm:p-6">
    <h3 class="text-lg font-semibold text-gray-800 mb-4">{{ title }}</h3>
    <div class="h-64 sm:h-80">
      <Line
        ref="chartRef"
        :data="data"
        :options="chartOptions"
      />
    </div>
  </div>
</template>