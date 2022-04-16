<template>
  <v-app>
    <v-card width="500px" class="mx-auto mt-5">
      <v-card-title>
        <h2 class="mx-auto">ログイン</h2>
      </v-card-title>
      <v-card-text>
        <v-form v-model="isValid">
          <v-text-field
            prepend-icon="mdi-email"
            type="email"
            label="メールアドレス"
            v-model="email"
            :rules="emailRules"
          />
          <v-text-field
            v-bind:type="showPassword ? 'text' : 'password'"
            v-bind:append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="showPassword = !showPassword"
            prepend-icon="mdi-lock"
            label="パスワード"
            v-model="password"
            :rules="passwordRules"
          />
          <v-card-actions>
            <v-btn
              color="teal lighten-1"
              class="white--text text-h6 font-weight-bold mx-auto"
              @click="submit"
              :disabled="!isValid"
              >ログイン</v-btn
            >
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
    <p class="mx-auto mt-3">
      初めての方は<a href="http://localhost:3000/users/sign_up">こちら</a>
    </p>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      email: "",
      password: "",

      showPassword: false,
      isValid: false,
      emailRules: [
        (v) => /.+@.+\..+/.test(v) || "正しい形式で入力してください",
      ],
      passwordRules: [
        (v) =>
          /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,16}$/.test(v) ||
          "半角英数字をそれぞれ１つ以上含む8~16字以下の文字列を設定してください",
      ],
    };
  },
  methods: {
    async submit() {
      await axios
        .post("http://localhost:3000/users/sign_in", {
          user: {
            email: this.email,
            password: this.password,
          },
        })
        .then((response) => {
          if (response.status == 200) {
            window.location = "/";
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style scoped>
</style>
