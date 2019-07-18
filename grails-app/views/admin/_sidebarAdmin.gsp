<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${createLink(controller: 'admin',action: 'showImagem', params: [id:"${profile.id}"])}" class="img-circle" alt="User Image"/>
            </div>
        </div>
        <ul class="sidebar-menu" data-widget="tree">
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-database"></i><span>Cadastrar Livro</span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${createLink(controller: 'cadastro', action: 'cadastroLivro')}"><i class="fa fa-circle-o"></i>Livro</a> </li>
                    <li><a href="${createLink(controller: 'cadastro',action: 'cadastroAdmin')}"><i class="fa fa-circle-o"></i>Administrador</a> </li>
                </ul>
            </li>
        </ul>
    </section>
</aside>