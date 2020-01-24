// Import styles
import '@sass/application'

// Init Vue instance
import Vue from 'vue/dist/vue.esm'
import Search from "@components/Search";

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    components: { Search }
  })
})
