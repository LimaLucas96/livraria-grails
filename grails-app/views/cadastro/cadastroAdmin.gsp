<%--
  Created by IntelliJ IDEA.
  User: lucas lima
  Date: 14/07/2019
  Time: 18:25
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main2">
    <title>Cadastro de Administrador</title>

    <script type="text/javascript">
        function retornoFormulario(data) {
            if(data.mensagem == "ERROR"){
                clearErrors();
                for( i in data.usuario.errors){
                    formError(data.usuario.errors[i].field);
                }
            }else if (data.mensagem == "OK"){
                document.location.assign("${g.createLink(controller: 'cadastro',action: 'cadastroAdmin')}?msg=OK")
                //show alert
            }
        }

        function formError(name) {
            var divFather = $("input[name="+name+"]").parents(".has-feedback");
            var divMsg = divFather.find(".help-block");
            divFather.addClass("has-error");
            divMsg.removeClass("hidden");
        }

        function clearErrors() {
            var divClear = document.getElementsByClassName('has-error');

            for(i = 0 ; i < divClear.length ; i++) {
                divClear[i].classList.remove("has-error");
            }
            var divClear2 = document.getElementsByClassName('help-block');

            for(i = 0 ; i < divClear2.length ; i++) {
                if(!divClear2[i].classList.contains('hidden')){
                    divClear2[i].classList.add('hidden');
                }
            }
        }
    </script>
</head>
<body>
    <g:render template="sidebarAdmin"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Cadastro Administrador</h1>
            <ol class="breadcrumb">
                <li><a href="${createLink(controller: 'admin',action: 'index')}"><i class="fa fa-home"></i> Principal</a></li>
                <li>Cadastrar</li>
                <li class="active">Administrador</li>
            </ol>
        </section>

        <section class="content">
            <g:if test="${params.msg == "OK"}">
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-check"></i> Sucesso!</h4>
                    <h5> Administrador criado com sucesso.</h5>
                </div>
            </g:if>
            <div class="col">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Cadastrar Administrador</h3>
                    </div>
                    <g:formRemote name="frmCadastroAdmin" url="[controller: 'cadastro',action: 'salvarAdmin']" onSuccess="retornoFormulario(data)">
                        <div class="box-body">
                            <div class="form-group has-feedback">
                                <label>Nome completo</label>
                                <g:textField name="nome" class="form-control" placeholder="Nome Completo"/>
                                <div class="help-block hidden">preencha seu nome completo</div>
                            </div>
                            <div class="form-group has-feedback">
                                <label>Email</label>
                                <g:textField type="email" name="email" class="form-control" placeholder="email"/>
                                <div class="help-block hidden">Email invalido/ja existe.</div>
                            </div>
                            <div class="form-group has-feedback">
                                <label>Username</label>
                                <g:textField name="username" class="form-control" placeholder="Username"/>
                                <div class="help-block hidden">username invalido/ja existe.</div>
                            </div>
                            <div class="form-group has-feedback">
                                <label>Senha</label>
                                <g:passwordField name="password" class="form-control" placeholder="Senha" />
                                <div class="help-block hidden">senha invalida.</div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <g:submitButton name="botaoCadastrar" class="btn btn-primary" value="Cadastrar"/>
                        </div>
                    </g:formRemote>
                </div>
            </div>
        </section>
    </div>
</body>
</html>