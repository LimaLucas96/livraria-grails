import livraria2.Permissao
import livraria2.Usuario
import livraria2.UsuarioPermissao

class BootStrap {

    def init = { servletContext ->
        Permissao admin = Permissao.findByAuthority("ROLE_ADMIN")
        if(admin == null){
            admin = new Permissao(authority: "ROLE_ADMIN").save(flush: true)
        }

        Permissao cliente = Permissao.findByAuthority("ROLE_CLIENTE")
        if(cliente == null){
            cliente = new Permissao(authority: "ROLE_CLIENTE").save(flush: true)
        }

        Usuario rootU = Usuario.findByUsername("root")
        if(rootU == null){
            File fotoPerfil = new File("./grails-app/assets/images/noimg.png")
            rootU = new Usuario(nome: "root",email: "root@root.com",username: "root", password: "root", enabled: true,accountExpired: false,accountLocked: false,passwordExpired: false, fotoPerfil: fotoPerfil.getBytes() ).save(flush: true)
        }

        if(UsuarioPermissao.findByUsuarioAndPermissao(rootU,admin) == null){
            new UsuarioPermissao(usuario: rootU,permissao: admin).save(flush: true)
        }
    }
    def destroy = {
    }
}
