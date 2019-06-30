package livraria2

class Estoque {

    Integer quantidadeDisponivel
    Integer quantidadeTotal
    Livro livro

    static constraints = {
        quantidadeDisponivel min: 0
        quantidadeTotal min: 0
        livro nullable: false
    }
    static mapping = {
        livro column: "id_liv"
    }
}
