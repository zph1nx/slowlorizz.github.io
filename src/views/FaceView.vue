<template>
  <div class="FaceView">
    <h1>You lost the Game!</h1>
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
export default class FaceView extends Vue {}
</script>


<style>

.FaceView {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  height: 100vh;
  width: 100%;
  margin: 0;
}

#face img {
  max-width: 100%;
  max-height: 100%;
}
h1 {
  font-size: 80px;
  color: white;
}

#face {
  width: 100%;
  height: auto;
}

@media only screen and (min-width: 1280px) {
  /* For Tablet: */
  
  #face {
    width: 100%;
    height: auto;
    max-height: 80vh;
    max-width: 80vh;
  }
}

</style>