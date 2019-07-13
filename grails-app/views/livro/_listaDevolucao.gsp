<div class="box box-success">
    <div class="box-header">
        <i class="glyphicon glyphicon-book"></i>
        <h3 class="box-title">Livros Alugados</h3>
    </div>
    <div class="box-body">
        <table id="listaLivro" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>Titulo</th>
                <th>Autor(es)</th>
                <th>Opções</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${profile.alugueis}" var="aluguel">
                <tr>
                    <td>${aluguel.livro.nome}</td>
                    <td>${aluguel.livro.autor.nome}</td>
                    <td><a href="javascript: devolverLivro(${aluguel.id})">Devolver</a></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#listaLivro').dataTable({
            'pading':true,
            'lengthChange':false
        })
    });
</script>