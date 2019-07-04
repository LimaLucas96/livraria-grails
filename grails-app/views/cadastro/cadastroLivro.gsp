<%--
  Created by IntelliJ IDEA.
  User: lucas lima
  Date: 02/07/2019
  Time: 19:39
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main2">
    <title>Cadastro de Livro</title>
</head>
<body>
    <g:render template="sidebarAdmin" />

<div class="content-wrapper">
    <section class="content-header">
        <h1>Cadastro de Livro</h1>
        <ol class="breadcrumb">
            <li><a href="${createLink(controller: 'livraria', action: 'index')}"><i class="fa fa-home"></i> Principal</a></li>
            <li>Cadastrar</li>
            <li class="active">Livro</li>
        </ol>

        <g:if test="${params.msg == "OK"}">
            <div class="alert alert-success alert-dismissible">

                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-check"></i>Sucesso!</h4>
                <h5> Livro foi cadastrado com sucesso.</h5>
            </div>
        </g:if>
        <g:elseif test="${params.msg == 'ERROR'}">
            <div class="alert alert-error alert-dismissible">

                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-ban"></i>Ops...!</h4>
                <h5>Tivemos um problema ao salvar o livro. Verifique se o o livro ja existe no estoque.</h5>
            </div>
        </g:elseif>
    </section>

    <section class="content">
        <div class="col">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Cadastrar Livro</h3>
                </div>

                <g:form name="frmCadastroLivro" url="[controller: 'cadastro',action: 'salvarLivro']">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Nome do Livro</label>
                            <g:textField name="nome" class="form-control" placeholder="Nome do livro"/>
                        </div>
                        <div class="form-group">
                            <label>Nome do(s) autor(es)</label>
                            <g:textField name="nomeAutor" class="form-control" placeholder="Autor(es)"/>
                            <p class="help-block">Separe os nomes dos autores com ";"</p>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>Quantidade de paginas</label>
                                <input type="number" name="numeroPaginas" class="form-control" placeholder="Quantidade de paginas"/>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Quantidade de livros</label>
                                <input type="number" name="quantidadeLivros" class="form-control" placeholder="Quantidade de paginas"/>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <g:submitButton name="botaoCadastrar" class="btn btn-primary" value="Cadastrar" />
                    </div>
                </g:form>
            </div>
        </div>
    </section>
</div>
</body>
</html>