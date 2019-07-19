<%--
  Created by IntelliJ IDEA.
  User: lucas lima
  Date: 30/06/2019
  Time: 16:41
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <asset:stylesheet src="login.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="#"><b>Livraria</b></a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">Registre-se</p>

        <g:formRemote name="frmRegister" url="[controller:'cadastro', action:'salvarUsuario']" enctype="multipart/form-data" onSuccess="retornoFormulario(data)">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="Nome completo" name="nome" >
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                <div class="help-block hidden">preencha seu nome completo.</div>
            </div>
            <div class="form-group has-feedback">
                <input type="email" class="form-control" placeholder="Email" name="email">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                <div class="help-block hidden">Email invalido/ja existe.</div></div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="Username" name="username">
                <span class="fa fa-at form-control-feedback"></span>
                <div class="help-block hidden">username invalido/ja existe.</div>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="Senha" name="password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                <div class="help-block hidden">senha invalida.</div>
            </div>

            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck has-feedback">
                            <input type="checkbox" name="checkbox">Eu li e aceito os <a href="#">termos</a>
                        <div class="help-block hidden">campo obrigatorio.</div>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat" id="buttonRegister">Register</button>
                </div>
                <!-- /.col -->
            </div>
        </g:formRemote >
        <a href="login.html" class="text-center">Eu ja possuo uma conta</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->
    <asset:javascript src="login.js"/>
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
    };

    function retornoFormulario(data) {
        if(data.mensagem == "ERROR"){
            clearErrors();
            for (i in data.usuario.errors){
                formError(data.usuario.errors[i].field);
            }
            if(data.checkBox == "null"){ formError("checkbox")}
        }else if(data.mensagem == "OK"){
            document.location.assign("${g.createLink(controller: 'livraria',action: 'login')}?msg=CREATE_SUCCESS")
        }
    }
    function formError(name) {
        var divFather = $("input[name="+name+"]").parents(".has-feedback");
        var divMsg = divFather.find(".help-block");
        divFather.addClass("has-error");
        divMsg.removeClass("hidden");
    }
    function checkError() {

    }
    function clearErrors() {
        var divClear = document.getElementsByClassName('has-error');
        console.log(divClear.length);
        for(i = 0 ; i < divClear.length ; i++) {
            divClear[i].classList.remove("has-error");
        }
        var divClear2 = document.getElementsByClassName('help-block');
        console.log(divClear2.length);
        for(i = 0 ; i < divClear2.length ; i++) {
            if(!divClear2[i].classList.contains('hidden')){
                divClear2[i].classList.add('hidden');
            }
        }
    }
</script>
</body>
</html>