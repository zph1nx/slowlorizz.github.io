<template>
  <div class="HomeView">
    <CrtDisplay id="crt_display" content_padding="20px">
      <div id="contents">
        <h2><u>Hello Stranger</u></h2>

        Unfortunately this site is currently in development.<br>
        <br>
        In the Meantime you could play the Game<br>
        
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
  mounted(): void {
    if (process.env.NODE_ENV !== 'development') {
      this.$router.replace('/fun/game');
    }
  }
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
}

#contents {
  height: inherit;
  width: inherit;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

</style>