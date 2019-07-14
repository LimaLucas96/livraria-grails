package livraria2

class UsuarioController {

    def usuarioService
    def aluguelService

    def index() {
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        retorno["livros"] = aluguelService.alugueisUsuario(usuarioService.id())

        usuarioService.verificarBloqueio()

        if(usuarioService.statusBloqueio()){
            usuarioService.verificarDesbloqueio()
            retorno["status"] = "bloqueado"
            retorno["dataDesbloqueio"] = usuarioService.dataDesbloqueio().getDateString()
        }else {
            retorno["status"] = "ativo"
        }

        render(view: 'index', model: ["profile" : retorno])
    }
}
