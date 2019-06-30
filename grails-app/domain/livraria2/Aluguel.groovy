package livraria2

class Aluguel {

    Date data

    static hasMany = [livro:Livro, cliente:Cliente]

    static belongsTo = [Livro]

    static constraints = {
    }
    static mapping = {
        cliente column: "id_cli"
        livro joinTable: [name:"livro_aluguel",key:"id_alu",column: "id_liv"]
    }
}
