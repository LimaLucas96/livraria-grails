package livraria2

import grails.transaction.Transactional

@Transactional
class UsuarioService {
    def springSecurityService
    def nome() {
        String user = springSecurityService.principal.username
        def usuario = Usuario.findByUsername(user)
        ["nome" : usuario.nome]
    }
}
