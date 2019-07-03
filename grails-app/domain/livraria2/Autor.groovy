package livraria2

class Autor {

    String nome

    static hasMany = [livro:Livro]

    static constraints = {
        nome nullable: false, blank: false
    }

    static mapping = {
        livro joinTable: [nome:"autor_livro",key:"id_aut", column:"id_liv"]
    }
}
