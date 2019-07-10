package livraria2

import grails.transaction.Transactional

@Transactional
class CadastroService {

    def criarUsuario(String nome, String email, String username, String password, String  checkbox) {
        Usuario usuario = new Usuario()
        Permissao permissao = Permissao.findByAuthority("ROLE_CLIENTE")

        usuario.nome = nome
        usuario.email = email
        usuario.username = username
        usuario.password = password
        usuario.enabled = true
        usuario.accountExpired = false
        usuario.accountLocked = false
        usuario.passwordExpired = false
        usuario.dataDesbloqueio = new Date().clearTime()

        usuario.validate()
        if(!usuario.hasErrors() && permissao != null && checkbox != null){
            usuario.save(flush: true)
            UsuarioPermissao.create(usuario,permissao,true)
            ["mensagem" : "OK"]
        }
        else {
            ["mensagem" : "ERROR", "usuario" : usuario.getErrors(), "checkBox" : "null"]
        }
    }
}
