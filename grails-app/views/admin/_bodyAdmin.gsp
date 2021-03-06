<section class="content-header">

    <h1>Principal</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Principal</a></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-book"></i> </span>
                <div class="info-box-content">
                    <span class="info-box-text">Total de Livros</span>
                    <span class="info-box-number">${profile.livrosTotal}</span>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="ion ion-ios-book"></i> </span>
                <div class="info-box-content">
                    <span class="info-box-text">Livros Alugados</span>
                    <span class="info-box-number">${profile.livrosAl}</span>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-users"></i> </span>
                <div class="info-box-content">
                    <span class="info-box-text">numero de usuarios</span>
                    <span class="info-box-number">${profile.quantUsuarios}</span>
                </div>
            </div>
        </div>
    </div>
    <!-- Inicio do grafico Barra  -->
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <i class="fa fa-bar-chart-o"></i>

                    <h3 class="box-title">Relatorio Anual</h3>

                </div>
                <div class="box-body">
                    <div id="bar-chart" style="height: 300px;"></div>
                </div>
            </div>
        </div>
        <!-- fim da Barra -->
    </div>
    <div class="row">
        <!-- Tabela com todos os livros -->
        <div class="col-md-8 col-xs-12">
            <div class="box box-success">
                <div class="box-header">
                    <h3 class="box-title">Lista de Livros</h3>
                </div>
                <div class="box-body">
                    <table id="listaLivros" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Titulo</th>
                                <th>Autores</th>
                                <th>Quantidade total</th>
                                <th>Quantidade no Estoque</th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${profile.livros}" var="livro">
                                <tr>
                                    <td>${livro.nome}</td>
                                    <td>${livro.autor.nome}</td>
                                    <td>${livro.estoque.quantidadeTotal}</td>
                                    <td>${livro.estoque.quantidadeDisponivel}</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Fim da tabela dos livos -->
        <!-- Inicio tabela inadimplentes -->
        <div class="col-md-4">
            <div class="box box-danger">
                <div class="box-header">
                    <h3 class="box-title">Usuarios bloqueados</h3>
                </div>
                <div class="box-body">
                    <table id="listaUsuariosBloc" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Data Desbl.</th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${profile.usuariosBloc}" var="usuario">
                                <tr>
                                    <td>${usuario.username}</td>
                                    <td><g:formatDate date="${usuario.dataDesbloqueio}" type="date"/></td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Fim tabela inadimplentes -->
    </div>

</section>