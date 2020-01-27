<template>
  <div>
    <a
      href="#"
      class="is-size-7"
      @click.prevent="openComments"
    >{{openBtnText}} most relevant comments</a>

    <ul
      class="comment comment__container comment__container--loading m-top-15 p-top-15 is-content-loading"
      v-show="commentsOpen"
      ref="commentsList"
    >
      <li class="m-bottom-15" v-for="comment in comments" :key="comment.id">
        <p class="comment__info--underline subtitle is-7 m-bottom-10 m-top-0 has-text-weight-bold">
          {{ comment.by }}
          {{ comment.time }}
        </p>

        <p class="comment__body" v-html="comment.text"></p>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      openBtnText: "+ Show",
      commentsOpen: false,
      haveComment: false,
      comments: [
        {
          id: 1,
          by: "",
          text: "",
          time: 0
        }
      ]
    };
  },

  props: ["commentIds"],

  methods: {
    openComments() {
      if (this.commentsOpen) {
        this.commentsOpen = false;
        this.openBtnText = "+ Show";
      } else {
        this.commentsOpen = true;
        this.openBtnText = "- Hide";
        this.loadComments();
      }
    },

    loadComments() {
      if (this.haveComment) {
        this.removeLoading();
      } else {
        let ids = JSON.parse(this.commentIds);
        let commentsArray = [];

        let load = new Promise((resolve, reject) => {
          let lastId = ids[ids.length - 1];

          ids.forEach(id => {
            axios
              .get("https://hacker-news.firebaseio.com/v0/item/" + id + ".json")
              .then(response => {
                commentsArray.push(response.data);

                if (response.data.id == lastId) {
                  resolve();
                }
              })
              .catch(error => {
                reject(error);
              });
          });
        });

        load
          .then(() => {
            this.comments = commentsArray;
            this.haveComment = true;
            this.removeLoading();
          })
          .catch(error => {
            console.log(error);
          });
      }
    },

    removeLoading() {
      this.$refs.commentsList.classList.remove(
        "comment__container--loading",
        "is-content-loading"
      );
    }
  }
};
</script>

<style lang="scss">
@import "../../stylesheets/variables";

.comment {
  &__container {
    border-top: 1px solid;

    &--loading {
      p {
        background: $content-text-color;
        opacity: 0.1;
      }
    }
  }

  &__info {
    color: $content-text-color;

    &--underline {
      text-decoration: underline;
    }
  }

  &__body {
    font-size: 0.9em;
  }
}
</style>
