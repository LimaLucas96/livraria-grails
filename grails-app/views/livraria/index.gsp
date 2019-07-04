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


    <sec:ifAllGranted roles="ROLE_ADMIN">
        <script type="text/javascript">
            $(document).ready(function () {
                $('#listaLivros').dataTable({
                    'pading':true,
                    'lengthChange':false
                });
            })
        </script>
    </sec:ifAllGranted>
</head>
<body>
    <!--Barra Lateral -->
    <g:render template="sidebarAdmin" />
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" >
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:render template="bodyAdmin" model="[profile:profile]"/>
        </sec:ifAllGranted>
        <%--<a href="${request.contextPath}/j_spring_security_logout">sair</a> --%>
    </div>
</body>
</html>