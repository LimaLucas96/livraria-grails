package livraria2

class LivrariaController {
    def springSecurityService

    def index() {

        String autenticacao = springSecurityService.authentication.authorities
        if(autenticacao == "[ROLE_ADMIN]"){
            redirect(controller: 'admin', action: 'index')
        }else if(autenticacao == "[ROLE_CLIENTE]"){
            redirect(controller: 'usuario', action: 'index')
        }
    }

    def login(){
         render(view: "login")
    }

    def logout(){
        redirect(action: "login")
    }
    def cadastro(){
        render(view: "/cadastro/cadastroUsuario")
    }
}
