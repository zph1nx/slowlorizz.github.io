<template>
  <div class="CrtDisplay">
    <div class="crt">
      <slot></slot>
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
@import url(../../assets/fonts/Jersey_10/jersey_10.css);

.CrtDisplay {
  color: white;
  position: relative;
  background: radial-gradient(at center, 
  #42354a 10%, 
  #101113 100%)

  /*background: radial-gradient(at center, 
  #504656 10%, 
  #171717 100%)*/

  /*background: radial-gradient(at center, 
  #50506b 0%, 
  #232323 100%)*/
}

.crt, .crt:before, .crt:after {
  border-radius: inherit;
  font-family: 'jersey-10';
  font-size: inherit;
  letter-spacing: inherit;
  height: 100%;
  width: 100%;
}

</style>