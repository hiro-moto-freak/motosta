<template>
  <v-app>
    <Header />
    <a href="http://localhost:3000/users/sign_out">ログアウト</a>
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
};
</script>

<style>
</style>
