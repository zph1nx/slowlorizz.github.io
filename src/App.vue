<template>
  <router-view/>
</template>

<style lang="scss">
html, body {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica, sans-serif;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
}

html {
  height: 100vh;
  width: 100vw;
}

body {
  background-color: black;
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

@media only screen and (min-width: 1280px) {
  /* For Tablet: */
  body {
    height: 100vh;
    width: 1280px;
    min-width: 1280px;
    max-width: 1280px;
  }
}
</style>
