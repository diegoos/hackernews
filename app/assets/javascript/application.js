// Import styles
import '@sass/application'

// Init Vue instance
import Vue from 'vue/dist/vue.esm'
import Search from "@components/Search";
import CommentsList from "@components/CommentsList";


document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    components: {
      Search,
      CommentsList
    }
  })
})
