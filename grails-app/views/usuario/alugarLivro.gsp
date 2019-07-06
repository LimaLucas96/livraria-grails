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
            })
        });
        function adicionarLivro(id) {
            $.ajax({
                method: 'POST',
                url: 'adicionarAluguel',
                data:{"id" : id},
                success: function () {
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
                                        <th>Poções</th>
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
        </section>
    </div>
</body>
</html>