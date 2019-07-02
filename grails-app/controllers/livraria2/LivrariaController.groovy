package livraria2

import grails.converters.JSON
import livraria2.Usuario
import livraria2.Permissao
import livraria2.UsuarioPermissao

class LivrariaController {
    def cadastroService
    def springSecurityService
    def usuarioService

    def index() {
        def retorno = [:]
        String nome = usuarioService.nome()?.nome

        retorno["nome"] = nome
        //criar para estoque
        render (view: "index", model:[ "profile" : retorno])
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
