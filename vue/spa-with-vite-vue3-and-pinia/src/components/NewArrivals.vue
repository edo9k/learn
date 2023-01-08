<script setup>
import { useCatalog } from '../../store/catalog.js'
</script>

<template>
</template>

<style scoped></style>

<script>
import { mapState, mapActions } from 'pinia'

export default {
  computed: {
    ...mapState(useCatalog, { newArrivals: 'results' })
  },

  methods: {
    ...mapActions(useCatalog, ['fetchNewArrivals']),

    addToCart() {
      // TODO
    }
  },

  created() {
    // TODO
    this.fetchNewArrivals()
  }
}

</script> 

