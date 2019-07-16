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
<g:render template="sidebarUsuario"/>
<div class="content-wrapper">
    <section class="content-header">
        <h1>Alterar Perfil</h1>
        <ol class="breadcrumb">
            <li><a href="${g.createLink(controller: 'usuario',action: 'index')}"><i class="fa fa-home"></i> Principal</a></li>
            <li class="active">Alterar Perfil</li>
        </ol>
    </section>
    <section class="content">
        <g:form name="frmAlterarCadastro" url="[controller: 'usuario',action: 'salvarTeste']" class="form-horizontal" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img id="imagem" src="${createLink(controller: 'usuario',action: 'showImagem',params: [id:'1'])}" class="profile-user-img img-responsive img-circle" style="height: 200px; width: 200px;">
                            %{--<img id="imagem" src="/Livraria2/assets/dist/img/user2-160x160.jpg" class="profile-user-img img-responsive img-circle" style="height: 200px; width: 200px;">--}%
                        </div>
                        <div class="box-footer">
                            <label class="btn btn-primary btn-block" for="upFoto"> Alterar</label>
                            <input id="upFoto" type='file' accept="image/*" onchange="openFile(event)" name="upFoto" class="hidden">
                            %{--<button type="file" class="btn btn-primary btn-block">Alterar Foto</button>--}%
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Nome</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <g:submitButton name="botao" class="btn btn-danger" value="Enviar"/>
                                </div>
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