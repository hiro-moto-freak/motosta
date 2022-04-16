<template>
  <v-app>
    <v-card width="500px" class="mx-auto mt-5">
      <v-card-title>
        <h2 class="mx-auto">新規登録</h2>
      </v-card-title>
      <v-card-text>
        <v-form v-model="isValid">
          <v-text-field
            prepend-icon="mdi-account-circle"
            label="ユーザー名"
            v-model="nickname"
            :rules="required"
          />
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
          <v-text-field
            v-bind:type="showConfirmPassword ? 'text' : 'password'"
            v-bind:append-icon="showConfirmPassword ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="showConfirmPassword = !showConfirmPassword"
            prepend-icon="mdi-lock"
            label="パスワード(確認用)"
            v-model="passwordConfirmation"
            :rules="confirmPasswordRules"
          />
          <v-card-actions>
            <v-btn
              color="teal lighten-1"
              class="white--text text-h6 font-weight-bold mx-auto"
              @click="submit"
              :disabled="!isValid"
              >登録</v-btn
            >
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
    <p class="mx-auto mt-3">
      登録済みの方は<a href="http://localhost:3000/users/sign_in">こちら</a>
    </p>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      nickname: "",
      email: "",
      password: "",
      passwordConfirmation: "",

      showPassword: false,
      showConfirmPassword: false,
      isValid: false,
      required: [(v) => !!v || "必ず入力してください"],
      emailRules: [
        (v) => /.+@.+\..+/.test(v) || "正しい形式で入力してください",
      ],
      passwordRules: [
        (v) =>
          /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,16}$/.test(v) ||
          "半角英数字をそれぞれ１つ以上含む8~16字以下の文字列を入力してください",
      ],
      confirmPasswordRules: [
        (v) => v === this.password || "パスワードが一致しません",
      ],
    };
  },
  methods: {
    async submit() {
      await axios
        .post("http://localhost:3000/users", {
          user: {
            nickname: this.nickname,
            email: this.email,
            password: this.password,
            password_confirmation: this.passwordConfirmation,
          },
        })
        .then((response) => {
          console.log({ response });
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
