<template>
  <div id="app">
    <div id="nav">
      <router-link class="a" v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link class="a" v-bind:to="{ name: 'Profile' }">Profile</router-link>&nbsp;|&nbsp;
      <router-link class="a"  v-bind:to="{ name: 'logout' }">Login/Logout</router-link>
      
      

      </div>
    <router-view />
  </div>
</template>

<script>
export default {
  data() {
    return{
      styleObject: {
        fontFamily: 'Trebuchet MS',
      },
    }
  }
}



</script>

<style scoped>
.a{
  font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
  font-weight: bold;
   
}

</style>







