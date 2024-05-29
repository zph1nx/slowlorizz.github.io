<template>
  <div class="HomeView">
    <CrtDisplay id="crt_display" content_padding="20px">
      <div id="contents">
        <h2>Hello Stranger</h2>

        Wanna play a game?<br>
        <br>
        <router-link to="/fun/game" class="crt_box_item" style="border-style: solid; border-color: white; padding: 0px 10px; color: #313535; text-shadow: none; border-radius: 50px; background-color: white; text-decoration: none;">PLAY</router-link>
        
      </div>  
    </CrtDisplay>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component';
import CrtDisplay from '@/components/crt/CrtDisplay.vue';

@Options({
  components: {
    CrtDisplay,
  },
})
export default class HomeView extends Vue {
}
</script>


<style scoped>
@import url(../assets/styles/aleclownes_crt.css);

.HomeView {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100vw;
  margin: 0;
  overflow: hidden;
}

#crt_display {
  height: 100%;
  width: 100%;
  font-size: 45px;
  letter-spacing: 1px;
  display: block;
  position: relative;
}

#contents {
  min-height: fit-content;
  max-height: 100%;
  min-width: fit-content;
  max-width: 100%;
  text-align: center;
  margin: 40px;
}

#contents > h2 {
  font-size: 50;
  letter-spacing: 3px;
}

@media only screen and (max-width: 600px) {
  #crt_display {
    font-size: 30px;
  }


  #contents > h2 {
    font-size: 35px;
  }
}

@media only screen and (max-width: 800px) {
  #crt_display {
    font-size: 35px;
  }

  #contents > h2 {
    font-size: 40px;
  }
}

@media only screen and (max-width: 1000px) {
  /* For Tablet: */
  #crt_display {
    font-size: 40px;
  }

  #contents > h2 {
    font-size: 45px;
  }
}

</style>