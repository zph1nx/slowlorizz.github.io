<template>
  <div class="homeView">
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component';


@Options({
  components: {
  },
})
export default class HomeView extends Vue {
  mounted(): void {
    this.$router.replace('/face');
  }
}
</script>


<style>

</style>