package livraria2

import grails.transaction.Transactional

@Transactional
class InventarioService {

    def salvarLivro(String nome,String autor, String numPaginas, String quantidadeLivros) {
        Livro livro = Livro.findByNome(nome)
        if(livro == null){
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
            println("----> MERDAAAAAAAA")
        }
    }

    def inventarioLivros(){
        def retorno = [].withDefault {[:]}
        def livros = Livro.list()

        for (int i = 0 ; i < livros.size(); i ++){
            retorno[i]["nomes"] = livros[i].nome
            retorno[i]["autores"] = livros[i].autor.nome
            retorno[i]["quantidadeEstoque"] = livros[i].estoque.quantidadeTotal
            retorno[i]["quantidadeAlugados"] = livros[i].estoque.quantidadeTotal - livros[i].estoque.quantidadeDisponivel
        }

        return retorno
    }
}
