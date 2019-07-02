<%--
  Created by IntelliJ IDEA.
  User: lucas lima
  Date: 30/06/2019
  Time: 13:35
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
<body class="hold-transition login-page">

    <div class="login-box">
        <div class="login-logo">
            <g:if test="${params.msg == "ERROR"}">
                <div class="alert alert-danger alert-dismissible">

                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-ban"></i>Alerta! </h4>
                    <h5> usuario e/ou senha incorretos.</h5>
                </div>
            </g:if>
            <g:elseif test="${params.msg == "CREATE_SUCCESS"}">
                <div class="alert alert-success alert-dismissible">

                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <h4><i class="icon fa fa-check"></i>Alerta!</h4>
                    <h5>Usuario Criado com sucesso.</h5>
                </div>
            </g:elseif>
            <a href="#"><b>Livraria</b></a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">Entre para iniciar sua sessão</p>

            <form action="${request.contextPath}/j_spring_security_check" method="POST" id="formLogin">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="Username" name="j_username" id="username">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Password" name="j_password" id="password">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <input type="checkbox"> Lembre de mim
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>
            <!-- /.social-auth-links -->
            <a href="cadastro" class="text-center">ainda não é cadastrado? cadastre-se aqui</a>

        </div>
        <!-- /.login-box-body -->
    </div>
<asset:javascript src="login.js"/>
</body>
</html>