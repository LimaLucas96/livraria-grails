package livraria2

import grails.transaction.Transactional

@Transactional
class UsuarioService {
    def springSecurityService
    //private static Usuario usuario = Usuario.findByUsername(springSecurityService.principal.username)

     def nome() {
        String user = springSecurityService.principal.username
        String nomeUser = Usuario.findByUsername(user).nome
        ["nome" : nomeUser]
    }
    def id(){
        String userId = springSecurityService.principal.id
        return userId
    }
    boolean statusBloqueio(){
        Usuario user = Usuario.get(id())
        return user.bloqueioTemporario
    }

    def dataDesbloqueio(){
        Usuario user = Usuario.get(id())
        return user.dataDesbloqueio
    }

    def verificarBloqueio(){
        Usuario usuario = Usuario.get(id())
        Date dataHoje = new Date().clearTime()

        if (dataHoje - dataDesbloqueio() >= 0 && statusBloqueio()){
            usuario.bloqueioTemporario = false
        }
    }

}
