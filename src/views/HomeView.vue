<template>
  <div class="homeView">
    <h1>You RN:</h1>
    <div id="face">
      <img src="@/assets/face.jpg">
    </div>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component';


@Options({
  components: {
  },
})
export default class HomeView extends Vue {}
</script>


<style>

.homeView {
  display: flex;
  flex-direction: column;
  height: 100vh;
  width: 100vw;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  background-color: black;
}

h1 {
  font-size: 3vw;
  color: white;
}

#face {
  width: 30vw;
  height: 30vw;
}

#face img {
  max-width: 100%;
  max-height: 100%;
}

</style>