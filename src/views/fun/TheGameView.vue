<template>
  <div class="TheGameView">
    <h1>the Game</h1>
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
export default class TheGameView extends Vue {}
</script>


<style scoped>
@import url(../../assets/fonts/Press_Start_2P/press_start_2p.css);


.TheGameView {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  height: 100vh;
  width: 100vw;
  margin: 0;
  background-color: #000000;
}

#face img {
  max-width: 100%;
  max-height: 100%;
}

h1 {
  font-size: 60px;
  color: white;
  font-family: 'press-start-2p';
}

#face {
  width: 100%;
  height: auto;
}

@media only screen and (max-width: 1000px) {
  h1 {
    font-size: 50px;
  }

  #face {
    max-height: 95vw;
    max-width: 95vw;
  }
}

@media only screen and (min-width: 1000px) {
  h1 {
    font-size: 60px;
  }
  
  #face {
    width: 100%;
    height: auto;
    max-height: 80vh;
    max-width: 80vh;
  }
}

</style>