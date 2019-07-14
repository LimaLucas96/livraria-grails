package livraria2

import grails.converters.JSON

class LivroController {

    def usuarioService
    def inventarioService
    def aluguelService

    def alugar() {
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        retorno["livros"] = inventarioService.livrosDisponiveis()

        usuarioService.verificarBloqueio()

        if(usuarioService.statusBloqueio()){
            retorno["status"] = "bloqueado"
            retorno["dataDesbloqueio"] = usuarioService.dataDesbloqueio().getDateString()
        }else {
            retorno["status"] = "ativo"
        }

        render(view: 'alugar', model: ["profile": retorno])
    }

    def adicionarAluguel(){
        def retorno = aluguelService.alugarLivro(params.id, usuarioService.id())

        render retorno as JSON
    }

    def devolver(){
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        retorno["alugueis"] = aluguelService.alugueisUsuario(usuarioService.id())
        render(view: "devolver", model: ["profile": retorno])
    }

    def devolucaoLivro(){
        def retorno = [:]

        retorno["mensagem"] = aluguelService.devolucao(params.id)

        render retorno as JSON
    }
    def carregarListaDevolucao(){
        def retorno = [:]
        retorno["alugueis"] = aluguelService.alugueisUsuario(usuarioService.id())
        render(template: "listaDevolucao", model: ["profile":retorno])
    }
}
