<template>
<div id="login">
<div id="Welcome">
<img id="loginPhoto" src="../img/WalkCle.png"/>
<p id="loginText">"WalkCLE is a self guided tour of the Cleveland area that encourages users to walk or bike through all of the distinct locations 
  that make Cleveland such a great place to live!
  The numerous sites highlighted inform the user about the area's history, architecture, foods, sports and places of natural beauty. 
  A fun built-in challenge
  is to earn badges for visiting each location, and if all of the locations are visited, 
  you will receive a badge for being a Defender of the Land!"
</p>

</div>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
        
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password" 
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <router-link  :to="{ name: 'register' }" class="accountSignIn">Need an account?    </router-link>
      <button type="submit">Sign in</button>
    </form>
  </div>
  </div>
 
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>

#login {
  text-align: center;
  background-image: linear-gradient(to right, #50967F, #BAFFE8,#8FE4C8, #BAFFE8, #50967F );
  height: 100vh;
}

.sr-only::before {
    content: "\a";
    white-space: pre;
}

.accountSignIn::before {
  content: "\a";
  white-space: pre;
}

#loginPhoto{
  display: block; 
  margin-left: auto;
  margin-right: auto;
  width: 400px;
  height: 300px;
}

#loginText {
  text-align: center;
  margin-left: 300px;
  margin-right: 300px;
  font-size: 22px;
}
div {
  background-color:#5F9EA0; 

}
#login {
  font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}
.accountSignIn{
  font-weight: bold;
}
.form-control{
margin: 2px;
padding: 5px;
}
</style>