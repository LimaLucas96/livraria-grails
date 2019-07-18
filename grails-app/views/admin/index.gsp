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
        <asset:javascript src="flotChart.js"/>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#listaLivros').dataTable({
                    'pading':true,
                    'lengthChange':false
                });
                $('#listaUsuariosBloc').dataTable({
                    'pading':false,
                    'lengthChange':false,
                    'searching':false
                })
            });

        </script>
    </sec:ifAllGranted>
</head>
<body>
    <!--Barra Lateral -->

    <g:render template="sidebarAdmin" />

    <div class="content-wrapper" >
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:render template="bodyAdmin" model="[profile:profile]"/>
        </sec:ifAllGranted>
        <%--<a href="${request.contextPath}/j_spring_security_logout">sair</a> --%>
    </div>
</body>
</html>