package livraria2

import grails.converters.JSON
import livraria2.Usuario
import livraria2.Permissao
import livraria2.UsuarioPermissao

class LivrariaController {
    def cadastroService
    def springSecurityService
    def usuarioService
    def inventarioService

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
    def cadastroLivro(){
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        render(view: "cadastroLivro", model: ["profile" : retorno])
    }
    def cadastrarLivro(){
        def result = inventarioService.salvarLivro(params.nome,params.nomeAutor,params.numeroPaginas,params.quantidadeLivros)

        if(result.success){
            redirect(action: "cadastroLivro",params: [msg:"OK"])
        }else{
            redirect(action: "cadastroLivro",params: [msg:"ERROR"])
        }
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
