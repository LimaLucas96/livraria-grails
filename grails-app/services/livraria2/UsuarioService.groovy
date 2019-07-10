package livraria2

import grails.transaction.Transactional

@Transactional
class UsuarioService {
    static def springSecurityService
    private static Usuario usuario = Usuario.findByUsername(springSecurityService.principal.username)

    static def nome() {

        String nomeUser = usuario.nome
        ["nome" : nomeUser]
    }
    static def id(){
        return usuario.id
    }
    boolean statusBloqueio(){
        return usuario.bloqueioTemporario
    }

    def dataDesbloqueio(){
        return usuario.dataDesbloqueio
    }

    def verificarBloqueio(){
        Date dataHoje = new Date().clearTime()

        if (dataHoje - dataDesbloqueio() <= 1){
            usuario.dataDesbloqueio = null
            usuario.bloqueioTemporario = false
        }
    }
}
