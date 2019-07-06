package livraria2

class UsuarioController {

    def usuarioService
    def inventarioService

    def index() {
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome

        render(view: 'index', model: ["profile" : retorno])
    }

    def alugarLivro(){
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        retorno["livros"] = inventarioService.livrosDisponiveis()
        render(view: 'alugarLivro', model: ["profile" : retorno])
    }
    def adicionarAluguel(){

    }
}
