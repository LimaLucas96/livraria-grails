package livraria2

import grails.transaction.Transactional

@Transactional
class AluguelService {

    int NUM_MAX_ALUGUEL = 3

    def alugarLivro(String idLivro, String idUsuario){
        Usuario usuario = Usuario.get(idUsuario)

        if( usuario.bloqueioTemporario){
            return ["mensagem":"ERROR"]
        } else if(numLivrosAlugados(idUsuario) >= NUM_MAX_ALUGUEL){
            return ["mensagem":"ERROR_NUM_MAX"]
        }

        Livro livro = Livro.get(idLivro)
        Aluguel aluguel = new Aluguel()
        Date data = new Date().clearTime()

        aluguel.dataAluguel = data
        aluguel.dataEntrega = data + 7
        aluguel.livro = livro
        aluguel.usuario = usuario

        aluguel.validate()
        if(!aluguel.hasErrors()){
            aluguel.save(flush: true)
            livro.estoque.quantidadeDisponivel --
            ["mensagem":"OK","nome":livro.nome,"dataEntrega":(data + 7).getDateString()]
        }else{
            ["mensagem":"ERROR"]
        }
    }

    def numLivrosAlugados(String id){
        Usuario usuario = Usuario.get(id)
        def numA = Aluguel.createCriteria().list {
            and {
                eq 'usuario', usuario
                eq 'entreque',false
            }
        }.size()
        return numA
    }

    def alugueisUsuario( String id ){
        Usuario usuario = Usuario.get(id)
        def lista = Aluguel.createCriteria().list {
            and{
                eq 'usuario', usuario
                eq 'entreque', false
            }
        }

        return lista
    }

    def devolucao(String id){
        Aluguel aluguel = Aluguel.get(id)
        Livro livro = aluguel.livro
        livro.estoque.quantidadeDisponivel ++

        aluguel.entreque = true

        return "OK"
    }
}
