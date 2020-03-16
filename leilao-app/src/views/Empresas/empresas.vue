<template>
  <v-data-table :headers="headers" :items="empresa" sort-by="calories" class="elevation-1">
    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>Empresas</v-toolbar-title>
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
                    <v-text-field v-model="editedItem.razaoSocial" label="RazaoSocial"></v-text-field>
                    <v-text-field v-model="editedItem.logradouro" label="Logradouro"></v-text-field>
                    <v-text-field v-model="editedItem.municipio" label="Municipio"></v-text-field>
                    <v-text-field v-model="editedItem.numero" label="Numero"></v-text-field>
                    <v-text-field v-model="editedItem.complemento" label="Complemento"></v-text-field>
                    <v-text-field v-model="editedItem.bairro" label="Bairro"></v-text-field>
                    <v-text-field v-model="editedItem.cep" label="Cep"></v-text-field>
                    <v-text-field v-model="editedItem.telefone" label="Telefone"></v-text-field>
                    <v-text-field v-model="editedItem.email" label="Email"></v-text-field>
                    <v-text-field v-model="editedItem.site" label="Site"></v-text-field>
                    <v-text-field v-model="editedItem.senha" label="Senha"></v-text-field>
                    <v-text-field v-model="editedItem.cnpj" label="CNPJ"></v-text-field>
                    <v-text-field v-model="editedItem.usuario" label="Usuario"></v-text-field>
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
    url: "http://192.168.2.105:8081/empresa",
    dialog: false,
    axios : require('axios'),
   
         headers: [
      {
        text: "CNPJ",
        value: "cnpj"
      },
      {
        text: "RAZAO_SOCIAL",
        value: "razaoSocial"
      },
      {
        text: "TELEFONE",
        value: "telefone"
      },
      {
        text: "EMAIL",
        value: "email"
      },

      { text: "Actions", value: "actions", sortable: false }
    ],
    empresa: [],

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
      return this.editedIndex === -1 ? "Nova empresa" : "Editar empresa";
    }
  },
  watch: {
    dialog(val) {
      val || this.close();
    }
  },
  created() {
    this.carregarEmpresa();
  },
  methods: {
    carregarEmpresa() {
      fetch(this.url)
        .then(r => r.json())
        .then(r => {
          console.log(r);
          this.empresa = r;
        });
    },

    criarEmpresa(item) { 
      this.axios.post(this.url, {  razaoSocial: item.razaoSocial, logradouro : item.logradouro,
       municipio : item.municipio, numero : item.numero, complemento : item.complemento, bairro : item.bairro, 
       cep : item.cep, telefone : item.telefone, email : item.email, site : item.site, senha : item.senha, cnpj : item.cnpj, 
       usuario : item.usuario });
    },

    alterarEmpresa(item) {
       this.axios.put(this.url + "/" + item.id, {  razaoSocial: item.razaoSocial, logradouro : item.logradouro,
       municipio : item.municipio, numero : item.numero, complemento : item.complemento, bairro : item.bairro, 
       cep : item.cep, telefone : item.telefone, email : item.email, site : item.site, senha : item.senha, cnpj : item.cnpj, 
       usuario : item.usuario });
    },

    deleteEmpresa(id) { 
      return fetch(this.url + '/' + id, {
      method: 'DELETE'
     })
      .then(response => response.json());
    },

  
    editItem(item) {
      this.editedIndex = this.empresa.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      const index = this.empresa.indexOf(item);
      confirm("Tem certeza que deseja deletar essa empresa?") && this.deleteEmpresa(item.id) 
      && this.empresa.splice(index, 1);
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
        Object.assign(this.empresa[this.editedIndex], this.editedItem);
        this.alterarEmpresa(this.editedItem)
      } else {
        this.empresa.push(this.editedItem);
        this.criarEmpresa(this.editedItem)  
      }
      this.close();
    }
  }
};
</script>
