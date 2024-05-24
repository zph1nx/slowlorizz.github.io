<template>
  <div class="HomeView">
    <CrtDisplay id="crt_display" content_padding="20px">
      <div id="contents">
        <h2>Hello Stranger</h2>

        Unfortunately this site is currently in development.<br>
        <br>
        In the Meantime you could play <br>
        <br>
        <router-link to="/fun/game" style="border-style: solid; border-color: white; padding: 6px; color: white;">a game</router-link>
        
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
  /*mounted(): void {
    if (process.env.NODE_ENV !== 'development') {
      this.$router.replace('/fun/game');
    }
  }*/
}
</script>


<style scoped>

.HomeView {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100%;
  margin: 0;
  overflow: hidden;
}

#crt_display {
  height: fit-content;
  width: 75%;
  border-radius: 20px;
  font-size: 30px;
  letter-spacing: 1px;
}

#contents {
  height: inherit;
  width: inherit;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
}

#contents > h2 {
  letter-spacing: 3px;
}

@media only screen and (max-width: 600px) {
  #crt_display {
    width: 100%;
    font-size: 20px;
  }

  .HomeView {
    background-color: black;
  }

  #contents > h2 {
    font-size: 25px;
  }
}

@media only screen and (max-width: 800px) {
  #crt_display {
    width: 100%;
    font-size: 25px;
  }

  .HomeView {
    background-color: black;
  }

  #contents > h2 {
    font-size: 30px;
  }
}

@media only screen and (max-width: 1000px) {
  /* For Tablet: */
  #crt_display {
    width: 75%;
    font-size: 30px;
  }

  #contents > h2 {
    font-size: 35px;
  }
}

</style>