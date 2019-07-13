<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/Livraria2/assets/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
        </div>
        <ul class="sidebar-menu" data-widget="tree">
            <li>
                <a href="${g.createLink(controller: 'livro',action: 'alugar')}">
                    <i class="fa fa-files-o"></i><span>Alugar Livro</span>
                </a>
            </li>
            <li>
                <a href="${g.createLink(controller: 'livro', action: 'devolver')}">
                    <i class="glyphicon glyphicon-download-alt"></i><span>Devolver Livro</span>
                </a>
            </li>
        </ul>
    </section>
</aside>