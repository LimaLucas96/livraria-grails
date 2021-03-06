<section class="content-header">
    <h1>Principal</h1>
    <ol class="breadcrumb">
        <li><a href="${g.createLink(controller: 'usuario',action: 'index')}"><i class="fa fa-home"></i> Principal</a></li>
    </ol>
</section>
<section class="content">
    <g:if test="${profile.status == "bloqueado"}">
        <div class="alert alert-danger alert-dismissible">
            %{--<button type="button" class="close" data-dismiss="alert">&times;</button>--}%
            <h4><i class="icon fa fa-ban"></i> Alerta!</h4>
            <h5>Você so pode pegar livros apartir do dia ${profile.dataDesbloqueio}</h5>
        </div>
    </g:if>
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-danger">
                <div class="box-header">
                    <i class="fa fa-book"></i>
                    <h3 class="box-title">Minha lista de Livros alugados</h3>
                </div>
                <div class="box-body">

                    <table id="listaLivrosAlugados" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>Titulo</th>
                            <th>Autor(es)</th>
                            <th>Data de retirada</th>
                            <th>Data de entrega</th>
                        </tr>
                        </thead>
                        <tbody>
                            %{--<h1 >NENHUM LIVRO ALUGADO</h1>--}%
                            <g:each in="${profile.livros}" var="aluguel">
                                <tr>
                                    <td>${aluguel.livro.nome}</td>
                                    <td>${aluguel.livro.autor.nome}</td>
                                    <td><g:formatDate date="${aluguel.dataAluguel}" type="date"/></td>
                                    <td><g:formatDate date="${aluguel.dataEntrega}" type="date"/> </td>
                                   %{-- <td>${aluguel.dataEntrega.date}</td>--}%
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>