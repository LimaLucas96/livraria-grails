<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/Livraria2/assets/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
        </div>
        <ul class="sidebar-menu" data-widget="tree">
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-database"></i><span>Cadastrar Livro</span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${createLink(controller: 'cadastro', action: 'cadastroLivro')}"><i class="fa fa-circle-o"></i>Livro</a> </li>
                    <li><a href="#"><i class="fa fa-circle-o"></i>Administrador</a> </li>
                </ul>
            </li>
        </ul>
    </section>
</aside>