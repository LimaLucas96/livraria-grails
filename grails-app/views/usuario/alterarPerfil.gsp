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
        <div class="row">
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <img src="/Livraria2/assets/dist/img/user2-160x160.jpg" class="profile-user-img img-responsive img-circle" style="height: 200px; width: 200px;">
                    </div>
                    <div class="box-footer">
                        <label class="btn btn-primary btn-block" for="upFoto"> Alterar</label>
                        <input id="upFoto" type='file' class="hidden">
                        %{--<button type="file" class="btn btn-primary btn-block">Alterar Foto</button>--}%
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="box box-primary">

                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>