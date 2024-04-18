<?php
include 'config/dbconnection.php';
include 'models/functions.php';

$pdo = pdo_connect_mysql();
$language = ($_SESSION["lang"] == "en") ? "_en" : "";

// Define o número de projetos por página
$projetos_por_pagina = 3;

// Obtém o número total de projetos
$query_total = "SELECT COUNT(id) AS total FROM projetos WHERE concluido=true";
$stmt_total = $pdo->prepare($query_total);
$stmt_total->execute();
$total_projetos = $stmt_total->fetch(PDO::FETCH_ASSOC)['total'];

// Calcula o número total de páginas
$total_paginas = ceil($total_projetos / $projetos_por_pagina);

// Obtém o número da página atual
$pagina_atual = isset($_GET['pagina']) && is_numeric($_GET['pagina']) ? $_GET['pagina'] : 1;

// Calcula o deslocamento (offset) para a consulta SQL
$offset = ($pagina_atual - 1) * $projetos_por_pagina;

// Verifica se houve uma pesquisa
if (isset($_GET['search']) && !empty($_GET['search'])) {
    $search = '%' . $_GET['search'] . '%';
    // Consulta os projetos com base na pesquisa
    $query = "SELECT id, COALESCE(NULLIF(nome{$language}, ''), nome) AS nome, fotografia FROM projetos WHERE concluido=true AND nome LIKE :search ORDER BY nome LIMIT :offset, :projetos_por_pagina";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':search', $search, PDO::PARAM_STR);
} else {
    // Consulta os projetos para a página atual
    $query = "SELECT id, COALESCE(NULLIF(nome{$language}, ''), nome) AS nome, fotografia FROM projetos WHERE concluido=true ORDER BY nome LIMIT :offset, :projetos_por_pagina";
    $stmt = $pdo->prepare($query);
}
$stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
$stmt->bindParam(':projetos_por_pagina', $projetos_por_pagina, PDO::PARAM_INT);
$stmt->execute();
$projetos = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html>

<?= template_header(change_lang("projects-finished-page-heading")); ?>



<!-- product section -->
<section class="product_section layout_padding">
   <div style="background-color: #dbdee1; padding-top: 50px; padding-bottom: 50px;">
      <div class="container">
         <div class="heading_container3">

            <h3 style="margin-bottom: 5px;">
               <?= change_lang("projects-finished-page-heading") ?>
            </h3>

            <h5 class="heading2_h5">
               <?= change_lang("projects-finished-page-description") ?>
            </h5>

         </div>
      </div>
   </div>
</section>
<!-- end product section -->

<section class="product_section layout_padding">
    <!-- Barra de pesquisa -->
<div class="container mt-3">
    <form method="get">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Pesquisar por nome" name="search">
            <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="submit">Pesquisar</button>
            </div>
        </div>
    </form>
</div>
   <div style="padding-top: 20px;">
      <div class="container">
         <div class="row justify-content-center mt-3">
            <?php
            // Verifica se há resultados da pesquisa
            if (count($projetos) > 0) {
                foreach ($projetos as $projeto) {
                    echo '
                    <div class="ml-5 imgList">
                        <a href="projeto.php?projeto=' . $projeto['id'] . '">
                            <div class="image_default">
                                <img class="centrare" style="object-fit: cover; width:225px; height:280px;" src="../backoffice/assets/projetos/' . $projeto['fotografia'] . '" alt="">
                                <div class="imgText justify-content-center m-auto">' . $projeto['nome'] . '</div>
                            </div>
                        </a>
                    </div>';
                }
            } else {
                // Caso não haja resultados da pesquisa
                echo '<div class="alert alert-warning" role="alert">Nenhum projeto encontrado com o nome "' . htmlspecialchars($_GET['search']) . '".</div>';
            }
            ?>
         </div>
      </div>
   </div>
</section>


<<nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <!-- Botão da seta esquerda -->
            <li class="page-item">
                <a class="page-link" href="?pagina=<?= max(1, $pagina_atual - 1) ?>" aria-label="Previous">
                    <span aria-hidden="true"><i class="fas fa-chevron-left"></i></span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            <?php for ($i = 1; $i <= $total_paginas; $i++) : ?>
                <li class="page-item <?= $i == $pagina_atual ? 'active' : '' ?>">
                    <a class="page-link" href="?pagina=<?= $i ?>"><?= $i ?></a>
                </li>
            <?php endfor; ?>
            <!-- Botão da seta direita -->
            <li class="page-item">
                <a class="page-link" href="?pagina=<?= min($total_paginas, $pagina_atual + 1) ?>" aria-label="Next">
                    <span aria-hidden="true"><i class="fas fa-chevron-right"></i></span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>
    </nav>

<?= template_footer(); ?>

</body>

</html>
