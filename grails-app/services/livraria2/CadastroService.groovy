package livraria2

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class CadastroService {

    def criarUsuario(String nome, String email, String username, String password, String  checkbox) {
        Usuario usuario = new Usuario()
        Permissao permissao = Permissao.findByAuthority("ROLE_CLIENTE")

        File fotoPerfil = new File("./grails-app/assets/images/noimg.png")

        usuario.nome = nome
        usuario.email = email
        usuario.username = username
        usuario.password = password
        usuario.enabled = true
        usuario.accountExpired = false
        usuario.accountLocked = false
        usuario.passwordExpired = false
        usuario.dataDesbloqueio = new Date().clearTime()
        usuario.fotoPerfil = fotoPerfil.getBytes()

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

    def criarAdmin(String nome, String email, String username, String password){
        Usuario usuario = new Usuario()
        Permissao permissao = Permissao.findByAuthority("ROLE_ADMIN")

        File fotoPerfil = new File("./grails-app/assets/images/noimg.png")

        usuario.nome = nome
        usuario.email = email
        usuario.username = username
        usuario.password = password
        usuario.enabled = true
        usuario.accountExpired = false
        usuario.accountLocked = false
        usuario.passwordExpired = false
        usuario.dataDesbloqueio = new Date().clearTime()
        usuario.fotoPerfil = fotoPerfil.getBytes()

        usuario.validate()
        if(!usuario.hasErrors() && permissao != null){
            usuario.save(flush: true)
            UsuarioPermissao.create(usuario,permissao,true)
            ["mensagem": "OK"]
        }else{
            ["mensagem":"ERROR", "usuario": usuario.getErrors()]
        }
    }

    def alterarDados(String id,String nome, MultipartHttpServletRequest request){
        Usuario usuario = Usuario.get(id)

        CommonsMultipartFile foto = request.getFile('fotoPerfil')

        if(!foto.isEmpty()){
            usuario.fotoPerfil = foto.getBytes()
        }
        usuario.nome = nome

        usuario.validate()
        if(!usuario.hasErrors()){
            usuario.save(flush: true)
            [success: true]
        }else{
            println(usuario.getErrors())
            [success: false]
        }
    }
}
