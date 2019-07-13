package livraria2

import grails.transaction.Transactional

@Transactional
class InventarioService {

    int NUM_MAX_ALUGUEL = 3

    def salvarLivro(String nome,String autor, String numPaginas, String quantidadeLivros) {
        Livro livro = Livro.findByNome(nome)
        if(livro == null && numPaginas != "" && quantidadeLivros != ""){
            livro = new Livro()
        }else {
            return [success: false]
        }
        livro.nome = nome
        livro.numeroPaginas = numPaginas.toInteger()

        Estoque estoque = new Estoque()
        estoque.quantidadeTotal = quantidadeLivros.toInteger()
        estoque.quantidadeDisponivel = quantidadeLivros.toInteger()

        livro.estoque = estoque

        String[] autors = autor.split(";")

        for(int i = 0; i < autors.length; i++){
            Autor autor1 = Autor.findByNome(autors[i])

            if(autor1 == null){
                autor1 = new Autor()
            }
           // autor1.livro = livro
            autor1.nome = autors[i]
            livro.addToAutor(autor1.save())
        }

        livro.validate()
        if(!livro.hasErrors()){
            livro.save(flush: true)
            [success: true]
        }else{
            println(livro.getErrors())
            [success: false]
        }
    }

    def inventarioLivros(){
        def livros = Livro.list()

        return livros
    }

    def livrosDisponiveis(){
        def livros = Estoque.findAllByQuantidadeDisponivelGreaterThanEquals(1)
        return livros
    }
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
        //println("data atual - > "+data.getDateString())
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
                //isNull 'dataEntrega'
            }
        }

        return lista
    }

    def devolucao(String id){
        Aluguel aluguel = Aluguel.get(id)
        Livro livro = aluguel.livro
        Date dataHoje = new Date().clearTime()
        Date dataAluguel = aluguel.dataAluguel
        dataHoje += 10 //<-------------------------------------temporario!!!!!!
        livro.estoque.quantidadeDisponivel ++
        //aluguel.dataEntrega = dataHoje
        aluguel.entreque = true

/*        if(dataHoje - dataAluguel > 7 ){
            int diasBloqueados = dataHoje - dataAluguel
            Usuario usuario = aluguel.usuario

            usuario.bloqueioTemporario = true
            usuario.dataDesbloqueio = (dataHoje + (2*diasBloqueados))
        }*/

        return "OK"
    }
}
