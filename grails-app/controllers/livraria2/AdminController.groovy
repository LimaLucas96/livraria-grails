package livraria2

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONArray

class AdminController {

    def usuarioService
    def inventarioService

    def index() {
        def retorno = [:]
        String nome = usuarioService.nome()?.nome
        //def teste = inventarioService.inventarioLivros()
        retorno["nome"] = nome
        retorno["livros"] = inventarioService.inventarioLivros()
        // println(teste)
        //criar para estoque
        render(view: "index", model: ["profile": retorno])
    }

    def criarTabelaAno(){
        def retorno = [:]
        retorno['tabelaAno'] = inventarioService.totalAno()

        render retorno as JSON
    }
}