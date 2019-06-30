package livraria2

class LivrariaController {

    def index() {
        String nome = "Lucas Lima"
        render (view: "login", model: [profile:nome])
    }
}
