package livraria2

import grails.converters.JSON

class UsuarioController {

    def usuarioService
    def inventarioService

    def index() {
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        retorno["livros"] = inventarioService.alugueisUsuario(usuarioService.id())
        render(view: 'index', model: ["profile" : retorno])
    }

    def alugarLivro(){
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        retorno["livros"] = inventarioService.livrosDisponiveis()
        render(view: 'alugarLivro', model: ["profile" : retorno])
    }

    def adicionarAluguel(){
        def retorno = [:]
        //inventarioService.alugueis(usuarioService.id())
        retorno["mensagem"] = inventarioService.alugarLivro(params.id, usuarioService.id())
        render retorno as JSON
    }
    def devolverLivro(){
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        retorno["alugueis"] = inventarioService.alugueisUsuario(usuarioService.id())
        render(view: "devolverLivro", model: ["profile" : retorno])
    }
    def devolucaoLivro(){
        def retorno = [:]

        retorno["mensagem"] = inventarioService.devolicao(params.id)

        render retorno as JSON
    }
    def carregarListaDevolucao(){
        def retorno = [:]
        retorno["alugueis"] = inventarioService.alugueisUsuario(usuarioService.id())
        render(template: "listaDevolucao", model: ["profile":retorno])
    }
}
