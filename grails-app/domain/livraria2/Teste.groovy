package livraria2

class Teste {
    String nome
    String type
    byte[] payload

    static constraints = {
        payload nullable: false, maxSize: 1073741824
        type blank: true, nullable: true
        nome blank: true, nullable: true
    }
}
