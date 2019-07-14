package livraria2

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class LivrariaController {
    def springSecurityService

    def index() {

        String autenticacao = springSecurityService.authentication.authorities
        println(autenticacao == "[ROLE_ADMIN]")
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
