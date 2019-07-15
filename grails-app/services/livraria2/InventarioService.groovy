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
            println(livro.getErrors())
            [success: false]
        }
    }

    def inventarioLivros(){
        def livros = Livro.list()

        return livros
    }

    def quantLivrosTotal(){
        int contador = Estoque.createCriteria().get{
            projections{
                sum 'quantidadeTotal'
            }
        }
        return contador
    }

    def quantLivrosAlugados(){
        int contador = Estoque.createCriteria().get{
            projections{
                sum 'quantidadeDisponivel'
            }
        }

        return (quantLivrosTotal() - contador)
    }

    def livrosDisponiveis(){
        def livros = Estoque.findAllByQuantidadeDisponivelGreaterThanEquals(1)
        return livros
    }

    def totalAno(){
        def tabelaMeses = [['jan',0],['fev',0],['mar',0],['abr',0],['mai',0],['jun',0],['jul',0],['ago',0],['set',0],['out',0],['nov',0],['dez',0]]
        String hql = "select new map(count(*) as contAlugueis, month(al.dataAluguel) as mes) from Aluguel al group by month(al.dataAluguel) order by mes"
        def resultado = Aluguel.executeQuery(hql)

        for( i in resultado){
            int temp = i.mes - 1
            tabelaMeses[temp][1] = i.contAlugueis
        }
        return tabelaMeses
    }

}
