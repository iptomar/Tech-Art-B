<?php
include 'config/dbconnection.php';
include 'models/functions.php';

$pdo = pdo_connect_mysql();
$language = ($_SESSION["lang"] == "en") ? "_en" : "";

// Define o número de projetos por página
$projetos_por_pagina = 3;

// Verifica se houve uma pesquisa
$search_query = isset($_GET['search']) ? $_GET['search'] : '';

// Consulta SQL para buscar projetos com base no nome
$query_search = "SELECT COUNT(id) AS total FROM projetos WHERE concluido=false AND nome{$language} LIKE :search";
$stmt_search = $pdo->prepare($query_search);
$stmt_search->bindValue(':search', '%' . $search_query . '%');
$stmt_search->execute();
$total_projetos = $stmt_search->fetch(PDO::FETCH_ASSOC)['total'];

// Calcula o número total de páginas
$total_paginas = ceil($total_projetos / $projetos_por_pagina);

// Obtém o número da página atual
$pagina_atual = isset($_GET['pagina']) && is_numeric($_GET['pagina']) ? $_GET['pagina'] : 1;

// Calcula o deslocamento (offset) para a consulta SQL
$offset = ($pagina_atual - 1) * $projetos_por_pagina;

// Consulta os projetos para a página atual, considerando a pesquisa
$query = "SELECT id, COALESCE(NULLIF(nome{$language}, ''), nome) AS nome, fotografia 
          FROM projetos 
          WHERE concluido=false AND nome{$language} LIKE :search 
          ORDER BY nome 
          LIMIT :offset, :projetos_por_pagina";
$stmt = $pdo->prepare($query);
$stmt->bindValue(':search', '%' . $search_query . '%');
$stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
$stmt->bindParam(':projetos_por_pagina', $projetos_por_pagina, PDO::PARAM_INT);
$stmt->execute();
$projetos = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>

<?= template_header(change_lang("projects-ongoing-page-heading")); ?>

<!-- product section -->
<section class="product_section layout_padding">
   <div style="background-color: #dbdee1; padding-top: 50px; padding-bottom: 50px;">
      <div class="container">
         <div class="heading_container3">

            <h3 style="margin-bottom: 5px; color: #002169">
               <?= change_lang("projects-ongoing-page-heading") ?>
            </h3>

            <h5 class="heading2_h5; color: #002169">
               <?= change_lang("projects-ongoing-page-description") ?>
            </h5>

         </div>
      </div>
   </div>
</section>
<!-- end product section -->

<section class="product_section layout_padding">
   <div style="padding-top: 20px;">
      <div class="container">
         <!-- Barra de pesquisa -->
         <div class="row justify-content-center mb-3">
            <form method="GET" class="form-inline">
               <div class="input-group">
                  <input type="text" class="form-control" placeholder="Pesquisar por nome" name="search" value="<?= htmlspecialchars($search_query) ?>">
                  <div class="input-group-append" >
                     <button class="btn btn-outline-secondary" type="submit" style="color: #002169">Pesquisar</button>
                  </div>
               </div>
            </form>
         </div>

         <?php if (empty($projetos)) : ?>
            <div class="alert alert-warning" role="alert">
               <?= 'Nenhum projeto encontrado com o nome "' . htmlspecialchars($search_query) . '".' ?>
            </div>
         <?php else : ?>
            <div class="row justify-content-center mt-3">
               <?php foreach ($projetos as $projeto) : ?>
                  <div class="ml-5 imgList">
                     <a href="projeto.php?projeto=<?= $projeto['id'] ?>">
                        <div class="image_default">
                           <img class="centrare" style="object-fit: cover; width:300px; height:200px;" src="../backoffice/assets/projetos/<?= $projeto['fotografia'] ?>" alt="">
                           <div class="imgText justify-content-center m-auto"><?= $projeto['nome'] ?></div>
                        </div>
                     </a>
                  </div>
               <?php endforeach; ?>
            </div>
         <?php endif; ?>
      </div>
   </div>
</section>
<!-- end product section -->

<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <!-- Botão da seta esquerda -->
        <li class="page-item">
            <a style="color: #002169" class="page-link" href="?pagina=<?= max(1, $pagina_atual - 1) ?>" aria-label="Previous">
                <span aria-hidden="true"><i class="fas fa-chevron-left"></i></span>
                <span class="sr-only">Previous</span>
            </a>
        </li>
        <?php for ($i = 1; $i <= $total_paginas; $i++) : ?>
            <li class="page-item <?= $i == $pagina_atual ? 'active' : '' ?>">
                <a style="color: #002169" class="page-link" href="?pagina=<?= $i ?>&search=<?= htmlspecialchars($search_query) ?>"><?= $i ?></a>
            </li>
        <?php endfor; ?>
        <!-- Botão da seta direita -->
        <li class="page-item">
            <a style="color: #002169" class="page-link" href="?pagina=<?= min($total_paginas, $pagina_atual + 1) ?>&search=<?= htmlspecialchars($search_query) ?>" aria-label="Next">
                <span aria-hidden="true"><i class="fas fa-chevron-right"></i></span>
                <span class="sr-only">Next</span>
            </a>
        </li>
    </ul>
</nav>

<?= template_footer(); ?>

</body>

</html>
