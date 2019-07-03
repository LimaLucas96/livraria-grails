<%--
  Created by IntelliJ IDEA.
  User: lucas lima
  Date: 30/06/2019
  Time: 12:09
--%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Livraria"/></title>

    <asset:stylesheet src="application2.css"/>


    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <g:layoutHead/>
</head>

<body class="hold-transition layout-boxed skin-blue sidebar-collapse sidebar-mini">
    <div class="wrapper">
        <g:render template="heard" model="[profile:profile]"></g:render>
        <g:layoutBody/>
    </div>
<asset:javascript src="application2.js"/>
</body>
</html>