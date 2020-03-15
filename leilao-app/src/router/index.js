import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/Index.vue'
import Leiloes from '../views/Leiloes/leiloes.vue'
import Empresas from '../views/Empresas/empresas.vue'
import Unidades from '../views/Unidades/unidades.vue'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Index',
    component: Index
  },
  {
    path: '/leiloes',
    name: 'Leiloes',
    component: Leiloes
  },
  {
    path: '/empresas',
    name: 'Empresas',
    component: Empresas
  },
  {
    path: '/unidades',
    name: 'Unidades',
    component: Unidades
  }
  /* {
    path: '/about',
    name: 'About',
     route level code-splitting
     this generates a separate chunk (about.[hash].js) for this route
     which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about"  '../views/About.vue')  */
  
] 

const router = new VueRouter({
  routes
})

export default router
