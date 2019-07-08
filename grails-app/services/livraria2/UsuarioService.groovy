package livraria2

import grails.transaction.Transactional

@Transactional
class UsuarioService {
    def springSecurityService
    def nome() {
        String user = springSecurityService.principal.username
        String usuario = Usuario.findByUsername(user).nome
        ["nome" : usuario]
    }
    def id(){
        String user = springSecurityService.principal.username
        String id = Usuario.findByUsername(user).id
        return id
    }

}
