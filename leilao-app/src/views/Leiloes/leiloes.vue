<template>
  <div>
    <v-data-table :headers="headers" :items="leiloes" :items-per-page="5" class="elevation-1"></v-data-table>
  </div>
</template>


<script>
export default {
  data: () => ({
    url : "http://192.168.2.105:8081/leilao",

    headers: [
      {
        text: "VENDEDOR",
        value: "vendedor"
      },
      {
        text: "INICIO_PREVISTO",
        value: "inicioPrevisto"
      },
       {
        text: "TOTAL_LEILAO",
        value: "valorTotalLotes"
      },
      
    ],
   leiloes: []
  }),
  methods: {
    carregaDados() {
      fetch(this.url)
        .then(r => r.json())
        .then(r => {
          console.log(r);
          this.leiloes = r;
        });
    }
  },
  created() {
    this.carregaDados();
  }
};
</script>

<style>
</style>