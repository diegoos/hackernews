<template>
  <div class="columns is-centered is-marginless search">
    <div class="column is-8">
      <form action="" class="search__form">
        <input class="search__input" type="text" placeholder="Text input">
        <button class="button">Buscar</button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      message: "test"
    }
  }
}
</script>

<style lang="scss" scoped>
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
  }
</style>
