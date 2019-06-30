package livraria2

class Cliente {

    String nome
    String email
    String senha
    Aluguel aluguel

    static constraints = {
        nome nullable: false, blank: false
        email email: true, unique: true
        senha size: 6..10
    }

    static mapping = {
        aluguel column: "id_alu"
    }
}
