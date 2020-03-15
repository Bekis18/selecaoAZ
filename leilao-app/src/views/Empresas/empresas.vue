<template>
  <v-card>
    <v-card-title>
      Empresas
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
      :items="empresas"
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
          text: 'CNPJ',
          align: 'start',
          sortable: false,
          value: 'cnpj',
        },
      { text: "RAZAO_SOCIAL", value: "razao_social" },
      { text: "TELEFONE", value: "telefone" },
      { text: "EMAIL", value: "email" },
      ],
      
      empresas: [],
    }),
    created () {
      this.initialize()
    },
    methods: {
      carregaDados() {
      fetch("http://localhost:8080/empresa")
        .then(r => r.json())
        .then(r => {
          this.empresas = Object.values(r.bpi);
        });
    },
      initialize () {
        this.carregaDados()
      }
    }
  }
</script>
