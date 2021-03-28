<template>
  <page-view :avatar="avatar" :title="false">
    <a-row :gutter="16">
    </a-row>
    <a-row :gutter="16">
    </a-row>
  </page-view>
</template>

<script>

import { PageView } from '../../layouts'

export default {
  name: 'Workplace',
  components: {
    PageView
  },
  data () {
    return {
      avatar: ''
    }
  },
  computed: {},
  created () {
  },
  mounted () {
  },
  methods: {
    onChange (a, b, c) {
      console.log(a, b, c)
    }
  }
}
</script>

<style scoped>
  .carousel-img {
    width: 100%;
    height: 100%;
  }
</style>
