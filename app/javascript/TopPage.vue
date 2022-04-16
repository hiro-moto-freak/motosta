<template>
  <v-app>
    <Header />
    <v-btn class="my-3 ml-auto mr-3" href="http://localhost:3000/users/sign_out"
      >ログアウト</v-btn
    >
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
