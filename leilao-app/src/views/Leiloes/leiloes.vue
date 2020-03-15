<template>
  <v-card>
    <v-card-title>
      Leilões
      <v-spacer></v-spacer>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="desserts"
      :search="search"
    ></v-data-table>
  </v-card>
</template>


<script>
  export default {
    data: () => ({
      dialog: false,
      search: '',
      headers: [
        {
          text: 'ID',
          align: 'start',
          sortable: false,
          value: 'id',
        },
      { text: "CODIGO", value: "codigo" },
      { text: "DESCRICAO", value: "descricao" },
      { text: "VENDEDOR", value: "vendedor" },
      { text: "INICIO_PREVISTO", value: "inicio_previsto" },
      { text: "CREATED_AT", value: "created_at" },
      { text: "UPDATED_AT", value: "updated_at" }
      ],
      
      desserts: [],
    }),
    created () {
      this.initialize()
    },
    methods: {
      carregaDados() {
      fetch("http://localhost:8080/leilao")
        .then(r => r.json())
        .then(r => {
          this.desserts = Object.values(r.bpi);
        });
    },
      initialize () {
        this.carregaDados()
      }
    }
  }
</script>
