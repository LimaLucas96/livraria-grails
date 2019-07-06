package livraria2

import grails.transaction.Transactional

@Transactional
class InventarioService {

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
}
