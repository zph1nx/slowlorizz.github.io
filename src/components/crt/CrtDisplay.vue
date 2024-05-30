<template>
  <div :class="{CrtDisplay: true}">
    <div class="crt">
      <div id="content_wrapper">
        <slot></slot>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component';

@Options({
  props: {
  }
})
export default class CrtDisplay extends Vue {
}
</script>

<style scoped>
@import url(../../assets/styles/aleclownes_crt.css);
@import url(../../assets/fonts/Jersey_10/jersey_10.css);

.CrtDisplay {
  color: #FFFFFF;
  position: relative;
  /*background: radial-gradient(at center,  
    #131516 0%,
    #0f1012 60%,
    #000000 100%)*/

}

.crt, .crt:before, .crt:after {
  border-radius: inherit;
  font-family: 'jersey-10';
  font-size: inherit;
  letter-spacing: inherit;
  height: 100%;
  width: 100%;
}

#content_wrapper {
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

</style>