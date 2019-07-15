package livraria2

import grails.transaction.Transactional

@Transactional
class UsuarioService {
    def springSecurityService

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

    def verificarDesbloqueio(){
        Usuario usuario = Usuario.get(id())
        Date dataHoje = new Date().clearTime()

        if(dataHoje - dataDesbloqueio() >= 0 && statusBloqueio()){
            usuario.bloqueioTemporario = false
        }
    }
    def verificarBloqueio(){
        Usuario usuario = Usuario.get(id())
        Date dataHoje = new Date().clearTime()
        dataHoje +=1

        def dataEntregaMax = Aluguel.createCriteria().get {
            projections{
                max 'dataEntrega'
            }
            and{
                eq 'usuario',usuario
                eq 'entreque',false
                le 'dataEntrega', dataHoje
            }
        }
        if(dataEntregaMax != null){
            usuario.bloqueioTemporario = true
            usuario.dataDesbloqueio = dataHoje + (2*(dataHoje - dataEntregaMax))
        }

    }

    def quantUsuariosCadastrados(){
        int contador = UsuarioPermissao.findAllByPermissao(Permissao.findByAuthority("ROLE_CLIENTE")).size()

        return contador
    }
}
