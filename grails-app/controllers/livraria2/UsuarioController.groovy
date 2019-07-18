package livraria2

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.servlet.http.HttpServletRequest

class UsuarioController {

    def usuarioService
    def aluguelService

    def index() {
        def retorno = [:]
        retorno["nome"] = usuarioService.nome()?.nome
        retorno["livros"] = aluguelService.alugueisUsuario(usuarioService.id())

        usuarioService.verificarBloqueio()

        if(usuarioService.statusBloqueio()){
            usuarioService.verificarDesbloqueio()
            retorno["status"] = "bloqueado"
            retorno["dataDesbloqueio"] = usuarioService.dataDesbloqueio().getDateString()
        }else {
            retorno["status"] = "ativo"
        }

        render(view: 'index', model: ["profile" : retorno])
    }

    def alterarPerfil(){
        def retorno = [:]

        retorno["nome"] = usuarioService.nome()?.nome
        render(view: "alterarPerfil",model: ["profile" : retorno])
    }

    def salvarTeste(){
        Teste teste = new Teste()

        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request

        CommonsMultipartFile uploadFile = (CommonsMultipartFile) mpr.getFile("upFoto")

        teste.payload = uploadFile.getBytes()

        teste.nome = params.nome
        teste.type = uploadFile.contentType

        teste.validate()
        if(!teste.hasErrors()){
            teste.save(flush: true)
            println("SUCESSO!!!!!!!")
        }else{
            println "BUCETAAAAAAAAAAAAAAAAAAAA"
        }
    }

    def showImagem(){
        Usuario usuario = Usuario.get(params.id)
        response.outputStream << usuario.fotoPerfil
        response.outputStream.flush()
    }
}
