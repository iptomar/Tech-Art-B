<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<title>TECHN&ART Backoffice</title>
<style>
    .navUl {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #435d7d;
        font-size: 20px;
        font-family: 'Varela Round';
    }

    .navLi {
        float: left;
    }

    .navLi a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    .navLi a:hover {
        background-color: #324c6c;
        text-decoration: none;
        color: white;
    }

    .leftnav {
        display: block;
        position: absolute;
        right: 0%;
        color: white;
        background-color: #ff0000;
        text-align: center;
        padding: 14px 16px;
        text-decoration: dashed;
    }

    .leftnav:hover {
        background-color: #dd0000;
    }
</style>

<ul class="navUl">
    <?php
    // Utilizador tem permissão para aceder ao administradores
    if ($_SESSION["autenticado"] == "administrador") {
        echo "<li class=\"navLi\"><a href=\"../administradores\">Administradores</a></li>";
    }
    ?>
    <li class="navLi"><a href="../investigadores">Investigadores</a></li>
    <li class="navLi"><a href="../projetos">Projetos</a></li>
    <li class="navLi"><a href="../noticias">Notícias</a></li>
    <li class="navLi"><a href="../oportunidades">Oportunidades</a></li>
    <?php
    // Utilizador tem permissão para aceder ao administradores
    if ($_SESSION["autenticado"] == "administrador") {
        echo "<li class='navLi'><a href='../admissoes'>Admissões</a></li>";
        echo "<li class='navLi'><a href='../imagens/index.php'>Imagens</a></li>";
    }
    ?>
    <li class="navLi"><a class="leftnav" href="../sair.php">Sair</a></li>
</ul>