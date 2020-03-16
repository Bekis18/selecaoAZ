<template>
  <v-data-table :headers="headers" :items="unidades" sort-by="calories" class="elevation-1">
    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>Unidades</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="500px">
          <template v-slot:activator="{ on }">
            <v-btn color="primary" dark class="mb-2" v-on="on">New Item</v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="2" md="10">
                    <v-text-field v-model="editedItem.nome" label="Nome da unidade"></v-text-field>
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
    <template v-slot:item.actions="{ item }">
      <v-icon small class="mr-2" @click="editItem(item)">mdi-pencil</v-icon>
      <v-icon small @click="deleteItem(item)">mdi-delete</v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize">Reset</v-btn>
    </template>
  </v-data-table>
</template>

<script>


export default {

  data: () => ({
    url: "http://localhost:8081/unidades",
    dialog: false,
    axios : require('axios'),
   
    headers: [
      {
        text: "ID",
        align: "start",
        sortable: false,
        value: "id"
      },
      { text: "NOME", value: "nome" },
      { text: "CREATED_AT", value: "createdAt" },
      { text: "UPDATED_AT", value: "updateAt" },
      { text: "Actions", value: "actions", sortable: false }
    ],
    unidades: [],

    editedIndex: -1,
    editedItem: {
      nome: ""
    },
    defaultItem: {
      id: "",
      nome: "",
      created_at: "",
      update_at: ""
    }
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nova unidade" : "Editar unidade";
    }
  },
  watch: {
    dialog(val) {
      val || this.close();
    }
  },
  created() {
    this.carregarUnidades();
  },
  methods: {
    carregarUnidades() {
      fetch(this.url)
        .then(r => r.json())
        .then(r => {
          console.log(r);
          this.unidades = r;
        });
    },

    criarUnidade(item) { 
      this.axios.post(this.url, {  nome: item.nome });
    },

    alterarUnidade(item) {
       this.axios.put(this.url + "/" + item.id, {  nome: item.nome });
    },

    deleteUnidade(id) { 
      return fetch(this.url + '/' + id, {
      method: 'DELETE'
     })
      .then(response => response.json());
    },

  
    editItem(item) {
      this.editedIndex = this.unidades.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      const index = this.unidades.indexOf(item);
      confirm("Tem certeza que deseja deletar essa unidade?") && this.deleteUnidade(item.id) 
      && this.unidades.splice(index, 1);
    },

    close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },
    save() {
      if (this.editedIndex > -1) {
        Object.assign(this.unidades[this.editedIndex], this.editedItem);
        this.alterarUnidade(this.editedItem)
      } else {
        this.unidades.push(this.editedItem);
        this.criarUnidade(this.editedItem)  
      }
      this.close();
    }
  }
};
</script>
