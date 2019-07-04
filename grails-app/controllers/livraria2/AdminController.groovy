package livraria2

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
}