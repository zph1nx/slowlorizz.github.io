<template>
  <div class="TheGameView">
    <h1>the Game</h1>
    <div id="pic">
      <img src="@/assets/img/rainbow_arcade_person.gif">
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
/*@import url(../../assets/fonts/Press_Start_2P/press_start_2p.css);*/
@import url(../../assets/fonts/lotsofdotz/lotsofdotz.css);
@import url(../../assets/fonts/karmatic-arcade/ka1.css);
@import url(../../assets/fonts/arcade-regular/arcade_regular.css);

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

#pic img {
  height: 100%;
}

h1 {
  font-size: 60px;
  color: white;
  letter-spacing: 3px;
  font-family: 'lotsofdotz';
}

#pic {
  width: fit-content;
  height: fit-content;
}

@media only screen and (max-width: 600px) {
  h1 {
    font-size: 40px;
  }
}

@media only screen and (min-width: 600px) {
  h1 {
    font-size: 50px;
  }
}

@media only screen and (min-width: 1000px) {
  h1 {
    font-size: 60px;
  }
}

</style>