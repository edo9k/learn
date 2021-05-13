
<template>
  <div class="hello">
    <h1>{{ msg }}</h1> 
  </div>
</template>


<script>
export default {
  name: 'Hi',
  props: {
    msg: String
  }
}
</script>


<style scoped>
h1 {
  margin: 1px solid red;
}
</style>
