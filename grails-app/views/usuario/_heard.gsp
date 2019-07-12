<header class="main-header">

    <!-- Logo -->
    <a href="${g.createLink(controller: 'livraria', action: 'index')}" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>Liv</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Livraria</b></span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        %{--<span class="label label-danger">&blacksquare;</span>--}%
                    </a>
                    <div class="dropdown-menu text-muted text-wrap list-group" style="max-width: 400px;">
                        <a href="#" class="list-group-item dropdown-item">
                            <div class="dropdown-item">
                                <h5 class="text-center">sem Avisos</h5>
%{--                                <h4>Atenção!</h4>
                                <small>O livro "fefefefefweadsfsef" está a 3 dias de se vencer.</small>--}%
                            </div>
                        </a>
                </li>
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="/Livraria2/assets/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs">${profile.nome}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="/Livraria2/assets/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                            <p>
                                ${profile.nome}
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">Perfil</a>
                            </div>
                            <div class="pull-right">
                                <a href="${request.contextPath}/j_spring_security_logout" class="btn btn-default btn-flat">Sair</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

    </nav>
</header>