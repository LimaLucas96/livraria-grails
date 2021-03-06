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
        $(document).ready(function () {
            carregarLista()
        });
        function carregarLista() {
            $.ajax({
                method:'POST',
                url:'carregarListaDevolucao',
                success:function (data) {
                    $('#divLista').html(data);

                }
            })
        }
        function devolverLivro(id) {
           // $("#listaLivro").dataTable().ajax.reload()
            $.ajax({
                method: 'POST',
                url:'devolucaoLivro',
                data:{"id":id},
                success:function (data) {
                    if(data.mensagem == "OK") {
                        carregarLista();

                        $('#modalSuccess').modal('show')
                    }
                }
            })
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
                <div class="col-xs-12" id="divLista">
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