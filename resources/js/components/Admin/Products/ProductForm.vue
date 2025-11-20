<script setup>
import { ref, watch } from 'vue';
import { useForm, router } from '@inertiajs/vue3';

const props = defineProps({
  product: {
    type: Object,
    default: null
  },
  isEdit: {
    type: Boolean,
    default: false
  }
});

const emit = defineEmits(['cancel']);

// Initialize form
const form = useForm({
  name: props.product?.name || '',
  description: props.product?.description || '',
  category: props.product?.category || 'appliance',
  material_type: props.product?.material_type || 'plastic',
  image_url: props.product?.image_url || '',
  features: props.product?.features || []
});

// Image handling
const imageFile = ref(null);
const imagePreview = ref(props.product?.image_url || null);

// Features handling
const featureInput = ref('');
const features = ref([...(props.product?.features || [])]);

// Watch for product changes
watch(() => props.product, (newProduct) => {
  if (newProduct) {
    form.name = newProduct.name || '';
    form.description = newProduct.description || '';
    form.category = newProduct.category || 'appliance';
    form.material_type = newProduct.material_type || 'plastic';
    form.image_url = newProduct.image_url || '';
    form.features = newProduct.features || [];
    features.value = [...(newProduct.features || [])];
    imagePreview.value = newProduct.image_url || null;
  }
}, { immediate: true });

const handleImageChange = (event) => {
  const file = event.target.files[0];
  if (file) {
    imageFile.value = file;
    const reader = new FileReader();
    reader.onload = (e) => {
      imagePreview.value = e.target.result;
    };
    reader.readAsDataURL(file);
  }
};

const addFeature = () => {
  if (featureInput.value.trim()) {
    features.value.push(featureInput.value.trim());
    featureInput.value = '';
  }
};

const removeFeature = (index) => {
  features.value.splice(index, 1);
};

const handleSubmit = () => {
  // Create FormData for file upload
  const formData = new FormData();
  formData.append('name', form.name);
  formData.append('description', form.description || '');
  formData.append('category', form.category);
  formData.append('material_type', form.material_type);
  
  // Append features as array
  features.value.forEach((feature, index) => {
    formData.append(`features[${index}]`, feature);
  });

  // Append image if changed
  if (imageFile.value) {
    formData.append('image', imageFile.value);
  } else if (form.image_url) {
    formData.append('image_url', form.image_url);
  }

  if (props.isEdit) {
    // For update, use POST with _method override
    formData.append('_method', 'PUT');
    router.post(route('admin.products.update', props.product.id), formData, {
      forceFormData: true,
      preserveScroll: true
    });
  } else {
    // For create
    router.post(route('admin.products.store'), formData, {
      forceFormData: true,
      preserveScroll: true
    });
  }
};

const cancel = () => {
  emit('cancel');
};
</script>

<template>
  <div class="bg-white rounded-lg shadow-sm p-6">
    <form @submit.prevent="handleSubmit" class="space-y-6">
      <!-- Product Name -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">
          Product Name <span class="text-red-500">*</span>
        </label>
        <input
          v-model="form.name"
          type="text"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          placeholder="Enter product name"
          required
        />
        <p v-if="form.errors.name" class="mt-1 text-sm text-red-600">{{ form.errors.name }}</p>
      </div>

      <!-- Description -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">
          Description
        </label>
        <textarea
          v-model="form.description"
          rows="4"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          placeholder="Enter product description"
        ></textarea>
        <p v-if="form.errors.description" class="mt-1 text-sm text-red-600">{{ form.errors.description }}</p>
      </div>

      <!-- Category and Material Type -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Category <span class="text-red-500">*</span>
          </label>
          <select
            v-model="form.category"
            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            required
          >
            <option value="appliance">Appliance Parts</option>
            <option value="automotive">Automotive Parts</option>
            <option value="industrial">Industrial Components</option>
          </select>
          <p v-if="form.errors.category" class="mt-1 text-sm text-red-600">{{ form.errors.category }}</p>
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Material Type <span class="text-red-500">*</span>
          </label>
          <select
            v-model="form.material_type"
            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            required
          >
            <option value="plastic">Plastic</option>
            <option value="rubber">Rubber</option>
            <option value="custom">Custom</option>
          </select>
          <p v-if="form.errors.material_type" class="mt-1 text-sm text-red-600">{{ form.errors.material_type }}</p>
        </div>
      </div>

      <!-- Image Upload -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">
          Product Image
        </label>
        <div class="space-y-4">
          <input
            type="file"
            @change="handleImageChange"
            accept="image/*"
            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          />
          <div v-if="imagePreview" class="relative w-48 h-48 border-2 border-gray-300 rounded-lg overflow-hidden">
            <img :src="imagePreview" alt="Preview" class="w-full h-full object-contain" />
          </div>
        </div>
        <p v-if="form.errors.image_url" class="mt-1 text-sm text-red-600">{{ form.errors.image_url }}</p>
      </div>

      <!-- Features -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">
          Features
        </label>
        <div class="flex gap-2 mb-3">
          <input
            v-model="featureInput"
            type="text"
            @keyup.enter="addFeature"
            class="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            placeholder="Enter a feature and press Enter"
          />
          <button
            type="button"
            @click="addFeature"
            class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition"
          >
            <i class="fas fa-plus"></i>
          </button>
        </div>
        <div v-if="features.length > 0" class="space-y-2">
          <div
            v-for="(feature, index) in features"
            :key="index"
            class="flex items-center justify-between bg-gray-50 px-4 py-2 rounded-lg"
          >
            <span class="text-sm text-gray-700">{{ feature }}</span>
            <button
              type="button"
              @click="removeFeature(index)"
              class="text-red-600 hover:text-red-800"
            >
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <p v-if="form.errors.features" class="mt-1 text-sm text-red-600">{{ form.errors.features }}</p>
      </div>

      <!-- Form Actions -->
      <div class="flex justify-end gap-4 pt-4 border-t">
        <button
          type="button"
          @click="cancel"
          class="px-6 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 transition"
        >
          Cancel
        </button>
        <button
          type="submit"
          :disabled="form.processing"
          class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition disabled:opacity-50 disabled:cursor-not-allowed"
        >
          <span v-if="form.processing">
            <i class="fas fa-spinner fa-spin mr-2"></i>
            {{ isEdit ? 'Updating...' : 'Creating...' }}
          </span>
          <span v-else>
            {{ isEdit ? 'Update Product' : 'Create Product' }}
          </span>
        </button>
      </div>
    </form>
  </div>
</template>