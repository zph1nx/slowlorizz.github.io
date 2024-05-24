<template>
  <div class="CrtDisplay">
    <div class="crt" :style="{padding: content_padding}">
      <slot id="contents"></slot>
      <!--<div class="scanline"></div>
      <div class="terminal"></div>-->
    </div>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component';



@Options({
  props: {
    content_padding: {
      type: String,
      default: "10px"
    }
  }
})
export default class CrtDisplay extends Vue {
  content_padding!: string
}
</script>

<style scoped>
@import url(../../assets/styles/aleclownes_crt.css);
@import url(../../assets/fonts/Press_Start_2P/press_start_2p.css);

.CrtDisplay {
  color: white;
  position: relative;
  background: radial-gradient(at center, 
  #504656 10%, 
  #232323 100%)

  /*background: radial-gradient(at center, 
  #50506b 0%, 
  #232323 100%)*/
}

.crt, .crt:before, .crt:after {
  border-radius: inherit;
  font-family: 'press-start-2p';
  font-size: inherit;
}

</style>