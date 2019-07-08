package livraria2

class Livro {
    String nome
    Integer numeroPaginas
    Estoque estoque

    static belongsTo = [Autor]
    static hasMany = [autor:Autor, aluguel:Aluguel]

    static constraints = {
        nome nullable: false, blank: false ,unique: true
        numeroPaginas nullable: false, min: 3
        estoque nullable: false
        aluguel nullable: true
    }

    static mapping = {
        estoque column: "id_est"
        autor joinTable: [key:"id_liv",column: "id_aut"]
    }
}
