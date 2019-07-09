<%--
  Created by IntelliJ IDEA.
  User: lucas lima
  Date: 09/07/2019
  Time: 13:14
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main2">
    <title>Devolução de Livros</title>
    <script type="text/javascript">
        function devolverLivro(id) {
            $('#modalSuccess').modal('show')
/*            $.ajax({
                method: 'POST',
                url:'devolverLivro',
                data:{"id":id},
                success:function () {

                }
            })*/
        }
    </script>
</head>
<body>
    <g:render template="sidebarUsuario"/>
    <div class="content-wrapper">
        <section class="content-header">
        <h1>Devolução de livros</h1>
            <ol class="breadcrumb">
                <li><a href="${g.createLink(controller: 'usuario', action: 'index')}"><i class="fa fa-home"></i> Principal</a></li>
                <li class="active">Devolução Livros</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
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
                </div>
            </div>
            <!--Modal Success -->
            <div class="modal text-center fade" id="modalSuccess">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Sucesso!</h4>
                        </div>
                        <div class="modal-body">
                            <h5>O livro foi devolvido.</h5>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--/Modal Success -->
        </section>
    </div>
</body>
</html>