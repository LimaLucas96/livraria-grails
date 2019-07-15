package livraria2

import grails.converters.JSON

class CadastroController {

    def usuarioService
    def inventarioService
    def cadastroService

    def cadastroLivro() {
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        render(view: "cadastroLivro", model: ["profile" : retorno])
    }

    def cadastroAdmin(){
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        render(view: "cadastroAdmin", model: ["profile":retorno])
    }

    def salvarLivro(){
        def result = inventarioService.salvarLivro(params.nome,params.nomeAutor,
                params.numeroPaginas,params.quantidadeLivros)

        if(result.success){
            redirect(action: "cadastroLivro",params: [msg:"OK"])
        }else{
            redirect(action: "cadastroLivro",params: [msg:"ERROR"])
        }
    }

    def salvarUsuario(){
        def resposta = cadastroService.criarUsuario(params.nome,params.email,params.username,params.password, params.checkbox)

        render resposta as JSON
    }

    def salvarAdmin(){
        def resposta = cadastroService.criarAdmin(params.nome,params.email,params.username,params.password)

        render resposta as JSON
    }
}
