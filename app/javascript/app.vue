<template>
  <v-app id="app">
    <Header />
    <div>
      <p>{{ message }}</p>
    </div>
    <v-tabs>
      <v-tab>Item One</v-tab>
      <v-tab>Item Two</v-tab>
      <v-tab>Item Three</v-tab>
    </v-tabs>
  </v-app>
</template>

<script>
import Header from "./components/Header";
export default {
  components: {
    Header,
  },
  data: function () {
    return {
      message: "Hello Vue!",
    };
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
