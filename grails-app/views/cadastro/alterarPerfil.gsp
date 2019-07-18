<%--
  Created by IntelliJ IDEA.
  User: macosx
  Date: 2019-07-15
  Time: 08:39
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main2">
    <title>Alterar perfil</title>

    <script type="text/javascript">
        function verificarForm() {
            var x = document.forms['frmAlterarCadastro']['nome'].value;

            if( x == ""){
                formError();
                return false
            }
            return true
        }

        function formError() {
            var divFather = $('input[name=nome]').parents('.form-group');
            var divMsg = divFather.find('.help-block');
            divFather.addClass('has-error');
            divMsg.removeClass('hidden');
        }

        var openFile = function (file) {
            var input = file.target;
            var reader = new FileReader();
            reader.onload = function () {
                var dataUrl = reader.result;
                var imagem = document.getElementById('imagem');
                imagem.src = dataUrl;
            };
            reader.readAsDataURL(input.files[0]);
        }
    </script>
</head>
<body>
<sec:ifAllGranted roles="ROLE_CLIENTE">
    <g:render template="sidebarUsuario"/>
</sec:ifAllGranted>
<sec:ifAllGranted roles="ROLE_ADMIN">
    <g:render template="sidebarAdmin"/>
</sec:ifAllGranted>
<div class="content-wrapper">
    <section class="content-header">
        <h1>Alterar Perfil</h1>
        <ol class="breadcrumb">
            <li><a href="${g.createLink(controller: 'livraria',action: 'index')}"><i class="fa fa-home"></i> Principal</a></li>
            <li class="active">Alterar Perfil</li>
        </ol>
    </section>
    <section class="content">
        <g:if test="${params.msg == "OK"}">
            <div class="alert alert-success alert-dismissible">

                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-check"></i>Sucesso!</h4>
                <h5>Seus dados foram alterados com sucesso.</h5>
            </div>
        </g:if>
        <g:elseif test="${params.msg == 'ERROR'}">
            <div class="alert alert-error alert-dismissible">

                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-ban"></i>Ops...!</h4>
                <h5>Tivemos um problema ao alterar seu perfil. Verifique se os dados estão corretos.</h5>
            </div>
        </g:elseif>

        <g:form name="frmAlterarCadastro" url="[controller: 'cadastro',action: 'alterarDados']" class="form-horizontal needs-validation" enctype="multipart/form-data" onsubmit="return verificarForm()" >
            <div class="row">
                <div class="col-md-5" style="float: none; margin: auto;">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <sec:ifAllGranted roles="ROLE_ADMIN">
                                <img id="imagem" src="${createLink(controller: 'admin',action: 'showImagem',params: [id:"${profile.dados.id}"])}" class="profile-user-img img-responsive img-circle" style="width: 100px; height: 100px;">
                            </sec:ifAllGranted>
                            <sec:ifAllGranted roles="ROLE_CLIENTE">
                                <img id="imagem" src="${createLink(controller: 'usuario',action: 'showImagem',params: [id:"${profile.dados.id}"])}" class="profile-user-img img-responsive img-circle" style="width: 100px; height: 100px;">
                            </sec:ifAllGranted>
                            %{--<img id="imagem" src="/Livraria2/assets/dist/img/user2-160x160.jpg" class="profile-user-img img-responsive img-circle" style="height: 200px; width: 200px;">--}%
                            <label class="btn btn-block text-primary" for="fotoPerfil"> Alterar foto</label>
                            <input id="fotoPerfil" type='file' accept="image/*" onchange="openFile(event)" name="fotoPerfil" class="hidden">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="nome">Nome</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="nome" name="nome" value="${profile.dados.nome}" placeholder="Nome completo">
                                    <div class="help-block hidden">Preencha seu nome completo.</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="email">Email</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="email" name="email" placeholder="Email" value="${profile.dados.email}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="username">Username</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" value="${profile.dados.username}" disabled>
                                </div>
                            </div>
                            <div class="col-sm-offset-1 col-sm-10" style="margin-top: 30px;">
                                <g:submitButton name="btnSubmit" class="btn btn-danger btn-block" value="Salvar"/>
                                <input type="hidden" name="id" value="${profile.dados.id}">
                                %{--<button type="file" class="btn btn-primary btn-block">Alterar Foto</button>--}%
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </g:form>
    </section>
</div>
</body>
</html>