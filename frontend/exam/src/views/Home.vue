<template>
  <page-view :title="false">
    <banner/>
  </page-view>
</template>

<script>
import { PageView } from '../layouts'
import Banner from './home/Banner'

export default {
  name: 'Home',
  components: {
    PageView,
    Banner
  }
}
</script>
