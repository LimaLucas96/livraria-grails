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

    def cadastroLivro() {
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        render(view: "/cadastro/cadastroLivro", model: ["profile": retorno])
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

}