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
                    <span class="info-box-text">Livros Aluguados</span>
                    <span class="info-box-number">5,000</span>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="ion ion-ios-book"></i> </span>
                <div class="info-box-content">
                    <span class="info-box-text">Livros Disponiveis</span>
                    <span class="info-box-number">300</span>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-users"></i> </span>
                <div class="info-box-content">
                    <span class="info-box-text">numero de usuarios</span>
                    <span class="info-box-number">33</span>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!--  -->
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
                                <th>Quantidade no Estoque</th>
                                <th>Quantidade Alugados</th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${profile.livros}" var="livro">
                                <tr>
                                    <td>${livro.nomes}</td>
                                    <td>${livro.autores}</td>
                                    <td>${livro.quantidadeEstoque}</td>
                                    <td>${livro.quantidadeAlugados}</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-4">
        </div>
    </div>

</section>