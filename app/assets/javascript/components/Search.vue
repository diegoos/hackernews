<template>
  <div class="columns is-centered is-marginless search">
    <div class="column is-8">
      <form :action="'/search/'+formAction" class="search__form" @submit.prevent="performSearch">
        <input
          class="search__input"
          type="text"
          placeholder="Search stories"
          v-model="formAction"
        />
        <button class="button search__button">
          <svg
            enable-background="new 0 0 511.999 511.999"
            version="1.1"
            viewBox="0 0 511.999 511.999"
            xml:space="preserve"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="m508.87 478.71l-148.73-148.73c28.21-34.827 45.191-79.103 45.191-127.31 0-111.75-90.917-202.67-202.67-202.67s-202.67 90.917-202.67 202.67 90.917 202.67 202.67 202.67c48.206 0 92.482-16.982 127.31-45.191l148.73 148.73c4.167 4.165 10.919 4.165 15.086 0l15.081-15.082c4.165-4.166 4.165-10.92-1e-3 -15.085zm-306.21-116.04c-88.229 0-160-71.771-160-160s71.771-160 160-160 160 71.771 160 160-71.771 160-160 160z"
            />
          </svg>
        </button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      formAction: this.SearchQuery
    }
  },

  props: ['SearchQuery'],

  methods: {
    performSearch (e) {
      document.location.href = e.target.action
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../../stylesheets/variables";

.search {
  background-color: #fff;

  &__form {
    display: flex;
    align-items: center;
    margin-bottom: 0;
    padding: 0 10px;
    border: 1px solid #ccc;
    box-sizing: content-box;
  }

  &__input {
    width: 100%;
    border: 0;
    font-size: 1em;
    outline: 0;
  }

  &__button {
    padding: 0;
    border: 0;

    svg {
      width: 25px;
      fill: $main-color;
    }
  }
}
</style>
