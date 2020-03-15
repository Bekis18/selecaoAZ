<template>

    <div id="nav">
      <router-link to="/">Index</router-link> |
      <router-link to="/leiloes">Leilões</router-link> |
      <router-link to="/empresas">Empresas</router-link> |
      <router-link to="unidades">Unidades</router-link>
    </div>

  
</template>

<style>
@import url('https://fonts.googleapis.com/css?family=Bree+Serif&display=swap');


#nav {
  padding: 30px;
  background: #2c3e50;
  margin-bottom: 0.1cm;
  box-shadow: 1px 0.3px 1px 1px black;
}

#nav a {
  font-weight: bold;
  color: white;
  text-decoration: none;
  font-size: 20px;
  padding: 34.9px;
  transition: 0.3s;
}

#nav a.router-link-exact-active, #nav a:hover {
  color: rgb(76, 206, 206);
  background: white;
  opacity: 0.7;
}
</style>
