<?php
include 'config/dbconnection.php';
include 'models/functions.php';

$pdo = pdo_connect_mysql();
$language = ($_SESSION["lang"] == "en") ? "_en" : "";

// Definir o número de resultados por página e a página atual
$results_per_page = 10;
if (!isset($_GET['page']) || !is_numeric($_GET['page']) || $_GET['page'] <= 0) {
    $page = 1;
} else {
    $page = $_GET['page'];
}

// Calcular o deslocamento para a consulta SQL
$offset = ($page - 1) * $results_per_page;

// Consulta SQL para buscar projetos concluídos paginados
$query = "SELECT id, COALESCE(NULLIF(nome{$language}, ''), nome) AS nome, fotografia FROM projetos WHERE concluido=true LIMIT :offset, :results_per_page";
$stmt = $pdo->prepare($query);
$stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
$stmt->bindValue(':results_per_page', $results_per_page, PDO::PARAM_INT);
$stmt->execute();
$projetos = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html>

<?= template_header(change_lang("projects-finished-page-heading")); ?>

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
   <div style="padding-top: 20px;">
      <div class="container">
         <div class="row justify-content-center mt-3">

            <?php
            // Verificar se houve uma pesquisa
            if (isset($_GET['search'])) {
                $search = $_GET['search'];
                if (!empty($search)) {
                    // Consulta SQL para buscar projetos concluídos com base no nome
                    $query = "SELECT id, COALESCE(NULLIF(nome{$language}, ''), nome) AS nome, fotografia FROM projetos WHERE concluido=true AND nome LIKE :search";
                    $stmt = $pdo->prepare($query);
                    $stmt->bindValue(':search', '%' . $search . '%');
                } else {
                    // Consulta SQL para buscar todos os projetos concluídos
                    $query = "SELECT id, COALESCE(NULLIF(nome{$language}, ''), nome) AS nome, fotografia FROM projetos WHERE concluido=true";
                    $stmt = $pdo->prepare($query);
                }
                $stmt->execute();
                $projetos = $stmt->fetchAll(PDO::FETCH_ASSOC);

                // Verificar se foram encontrados resultados
                if (count($projetos) == 0) {
                    echo '<div class="alert alert-warning" role="alert">Nenhum projeto encontrado com o nome "' . htmlspecialchars($search) . '".</div>';
                }

                // Exibir projetos encontrados
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
            }
            ?>
         </div>
      </div>
   </div>
</section>


<!-- Paginação -->
<div class="pagination justify-content-center">
    <?php
    // Consulta SQL para contar o total de projetos concluídos
    $query = "SELECT COUNT(*) AS total FROM projetos WHERE concluido=true";
    if (isset($_GET['search']) && !empty($_GET['search'])) {
        $search = $_GET['search'];
        $query .= " AND nome LIKE :search";
    }
    $stmt = $pdo->prepare($query);
    if (isset($search)) {
        $stmt->bindValue(':search', '%' . $search . '%');
    }
    $stmt->execute();
    $total_results = $stmt->fetch(PDO::FETCH_ASSOC)['total'];

    // Calcular o número total de páginas
    $num_pages = ceil($total_results / $results_per_page);

    // Exibir links para páginas
    for ($page = 1; $page <= $num_pages; $page++) {
        echo '<a href="pagina.php?page=' . $page . '&search=' . urlencode($search) . '">' . $page . '</a>';
    }
    ?>
</div>

<?= template_footer(); ?>

</body>

</html>
