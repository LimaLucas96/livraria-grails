package livraria2

class Aluguel {

    Date dataAluguel
    Date dataEntrega
    Usuario usuario
    Livro livro

    static constraints = {
        dataEntrega nullable: true
    }
    static mapping = {
    }
}
