<%--
  Created by IntelliJ IDEA.
  User: lucas lima
  Date: 05/07/2019
  Time: 21:24
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main2">
    <title>Alugar Livro</title>

    <script type="text/javascript">
        $(document).ready(function () {
            console.log("abre");
            $('#listaLivro').dataTable({
                'pading':true,
                'lengthChange':false
            });
        });
        function adicionarLivro(id) {

            $.ajax({
                method: 'POST',
                url: 'adicionarAluguel',
                data:{"id" : id},
                success: function (data) {
                    if(data.mensagem == "OK"){
                        $('#modalSuccess').modal('show');
                    }else if(data.mensagem == "ERROR"){
                        $('#modalError').modal('show');
                    }else if(data.mensagem == "ERROR_NUM_MAX"){
                        $('#modalErroMax').modal('show');
                    }
                    //criar modal para exibir mensagem de sucesso ou erro

                }
            })
        }
    </script>
</head>
<body>
    <g:render template="sidebarUsuario"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Aluguel de Livros</h1>
            <ol class="breadcrumb">
                <li><a href="${g.createLink(controller: 'usuario',action: 'index')}"><i class="fa fa-home"></i> Principal</a></li>
                <li class="active">Aluguel de Livros</li>
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
                                    <th>Opções</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${profile.livros}" var="livro">
                                    <tr>
                                        <td>${livro.livro.nome}</td>
                                        <td>${livro.livro.autor.nome}</td>
                                        <td><a href="javascript: adicionarLivro(${livro.livro.id})">Alugar</a></td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Success -->
            <div class="modal text-center fade" id="modalSuccess">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Sucesso!</h4>
                        </div>
                        <div class="modal-body">
                            <h5>Você alugou o livro com sucesso!</h5>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Modal Success -->
            <!-- Modal Error -->
            <div class="modal text-center fade" id="modalError">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Erro!</h4>
                        </div>
                        <div class="modal-body">
                            <h5>Não foi possivel alugar o livro.</h5>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Modal Error -->
            <!-- Modal Error Aluguel Max -->
            <div class="modal text-center fade" id="modalErroMax">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Erro!</h4>
                        </div>
                        <div class="modal-body">
                            <h5>Você excedeu o numero maximo de alugueis.</h5>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Modal Error Aluguel Max -->
        </section>
    </div>
</body>
</html>