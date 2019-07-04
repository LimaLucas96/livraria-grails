package livraria2

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class LivrariaController {
    def cadastroService
    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index() {

        redirect(controller: 'admin', action: 'index')

/*        def retorno = [:]
        String nome = usuarioService.nome()?.nome
        //def teste = inventarioService.inventarioLivros()
        retorno["nome"] = nome
        retorno["livros"] = inventarioService.inventarioLivros()
       // println(teste)
        //criar para estoque
        render (view: "index", model:[ "profile" : retorno])*/
    }
    def login(){
         render(view: "login")
    }

    def logout(){
        redirect(action: "login")
    }
    def cadastro(){
        render(view: "cadastro")
    }

    def registrarUsuario(){
        def result = cadastroService.criarUsuario(params.nome,params.email,params.username,params.password, params.checkbox)

        render result as JSON
    }
}
