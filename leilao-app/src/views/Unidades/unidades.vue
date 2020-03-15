<template>


  <v-data-table
    :headers="headers"
    :items="unidades"
    :search="search"
    sort-by="id"
    class="elevation-1"
  >

    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>Unidades</v-toolbar-title>
        <v-divider
          class="mx-4"
          inset
          vertical
        ></v-divider>
        <v-spacer></v-spacer>

      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>


        <v-dialog v-model="dialog" max-width="500px">
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.id" label="ID"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.nome" label="Nome"></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
              <v-btn color="blue darken-1" text @click="save">Save</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize">Reset</v-btn>
    </template>
  </v-data-table>
</template>

<script>
  export default {
    data: () => ({
       search: '',
      dialog: false,
      headers: [
        {
          text: 'ID',
          align: 'start',
          sortable: false,
          value: 'id',
        },
      { text: "NOME", value: "nome" },
      { text: "CREATED_AT", value: "created_at" },
      { text: "UPDATED_AT", value: "updated_at" }
      ],
      
      unidades: [],

      formData: null,

      editedIndex: -1,
      editedItem: {
        id: 0,
        nome: 0,
      },
      defaultItem: {
        nome: '',
        id: 0,
      },
    }),
    computed: {
      formTitle () {
        return this.editedIndex === -1 ? 'Nova Unidade' : 'Editar Unidade'
      },
    },
    watch: {
      dialog (val) {
        val || this.close()
      },
    },
    created () {
      this.initialize()
    },
    methods: {
      carregaDados() {
      fetch("http://localhost:8081/unidades")
        .then(r => r.json())
        .then(r => {
          this.unidades = Object.values(r.bpi);
        });
    },
      initialize () {
        this.carregaDados()
      }
    }
  }
</script>
