<%--
  Created by IntelliJ IDEA.
  User: lucas lima
  Date: 29/06/2019
  Time: 20:20
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main2">
    <title>pagina inicial</title>

</head>
<body>
    <!--Barra Lateral -->

    <g:render template="sidebarUsuario" />

    <div class="content-wrapper" >
        <sec:ifAllGranted roles="ROLE_CLIENTE">
            <g:render template="bodyUsuario" model="[profile:profile]"/>
        </sec:ifAllGranted>
        <%--<a href="${request.contextPath}/j_spring_security_logout">sair</a> --%>
    </div>
</body>
</html>