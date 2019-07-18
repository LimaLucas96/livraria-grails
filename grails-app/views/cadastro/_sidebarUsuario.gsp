<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${createLink(controller: 'usuario',action: 'showImagem', params: [id:"${profile.id}"])}" class="img-circle" alt="User Image"/>
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