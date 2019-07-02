package livraria2

import grails.converters.JSON
import livraria2.Usuario
import livraria2.Permissao
import livraria2.UsuarioPermissao

class LivrariaController {
    def cadastroService

    def index() {
        String nome = "Lucas Lima"
        render (view: "index", model: [profile:nome])
    }
    def login(){
         render(view: "login")
    }
    def logout(){
        redirect(action: "login")
    }
    def erro(){
    }
    def cadastro(){
        render(view: "cadastro")
    }
    def registrarUsuario(){
        def result = cadastroService.criarUsuario(params.nome,params.email,params.username,params.password, params.checkbox)

        render result as JSON
    }
}
