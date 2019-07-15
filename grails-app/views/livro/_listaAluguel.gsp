<div class="box box-success">
    <div class="box-header">
        <i class="fa fa-book"></i>
        <h3 class="box-title">Acervo disponivel</h3>
    </div>
    <div class="box-body">
        <table id="listaLivro" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>Titulo</th>
                <th>Autor(es)</th>
                <th>Num. Paginas</th>
                <th>Opções</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${profile.livros}" var="livro">
                <tr>
                    <td>${livro.livro.nome}</td>
                    <td>${livro.livro.autor.nome}</td>
                    <td>${livro.livro.numeroPaginas}</td>
                    <td><a href="javascript: adicionarLivro(${livro.livro.id})">Alugar</a></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>

<script>
    $(function () {
        $('#listaLivro').dataTable({
            'pading':true,
            'lengthChange' : false
        })
    });
</script>