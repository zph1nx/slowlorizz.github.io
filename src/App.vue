<template>
  <router-view/>
</template>

<style lang="scss">
html {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica, sans-serif;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: white;
  height: 100vh;
  width: 100vw;
}

body {
  margin: 0;
  padding: 0;
}

@media only screen and (max-width: 600px) {
  /* For Mobile: */
  body {
    height: 100vh;
    width: 100vw;
    max-width: 600px;
  }
}

@media only screen and (min-width: 600px) {
  /* For Tablet: */
  body {
    height: 100vh;
    width: 600px;
    min-width: 600px;
    max-width: 600px;
  }
}

@media only screen and (min-width: 800px) {
  /* For Tablet: */
  body {
    height: 100vh;
    width: 800px;
    min-width: 800px;
    max-width: 800px;
  }
}

@media only screen and (min-width: 1000px) {
  /* For Tablet: */
  body {
    height: 100vh;
    width: 1000px;
    min-width: 1000px;
    max-width: 1000px;
  }
}

@media only screen and (min-width: 1200px) {
  /* For Tablet: */
  body {
    height: 100vh;
    width: 1200px;
    min-width: 1200px;
    max-width: 1200px;
  }
}

@media only screen and (min-width: 1400px) {
  /* For Tablet: */
  body {
    height: 100vh;
    width: 1400px;
    min-width: 1400px;
    max-width: 1400px;
  }
}
</style>
