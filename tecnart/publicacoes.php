<?php
include 'config/dbconnection.php';
include 'models/functions.php';

?>

<?= template_header('Publicações'); ?>
<section class='product_section layout_padding'>
    <div style='padding-top: 50px; padding-bottom: 30px;'>
        <div class='container'>
            <div class='heading_container3'>
                <h3 class="heading_h3" style="text-transform: uppercase;">
                    <?= change_lang("publications-page-heading") ?>
                </h3><br><br>
                <?php
                $pdo = pdo_connect_mysql();
                if (!isset($_SESSION["lang"])) {
                    $lang = "pt";
                } else {
                    $lang = $_SESSION["lang"];
                }
                $valorSiteName = "valor_site_$lang";
                $query = "SELECT dados, YEAR(data) AS publication_year, p.tipo, pt.$valorSiteName FROM publicacoes p
                                LEFT JOIN publicacoes_tipos pt ON p.tipo = pt.valor_API
                                WHERE visivel = true
                                ORDER BY publication_year DESC, pt.$valorSiteName, data DESC";
                $stmt = $pdo->prepare($query);
                $stmt->execute();
                $publicacoes = $stmt->fetchAll(PDO::FETCH_ASSOC);

                $groupedPublicacoes = array();
                foreach ($publicacoes as $publicacao) {
                    $year = $publicacao['publication_year'];
                    if ($year == null) {
                        $year = change_lang("year-unknown");
                    }

                    $site = $publicacao[$valorSiteName];

                    if (!isset($groupedPublicacoes[$year])) {
                        $groupedPublicacoes[$year] = array();
                    }

                    if (!isset($groupedPublicacoes[$year][$site])) {
                        $groupedPublicacoes[$year][$site] = array();
                    }

                    // Normaliza o título da publicação removendo espaços em branco extras e convertendo para minúsculas
                    $normalized_title = strtolower(trim(preg_replace('/\s+/', ' ', $publicacao['dados'])));

                    // Verifica se a publicação já existe no site para evitar duplicatas
                    $exists = false;
                    foreach ($groupedPublicacoes[$year][$site] as $existing_publicacao) {
                        // Normaliza o título da publicação existente para comparação
                        $normalized_existing_title = strtolower(trim(preg_replace('/\s+/', ' ', $existing_publicacao)));


                        // Calcula a distância de Levenshtein entre os títulos normalizados
                        $levenshtein_distance = levenshtein($normalized_title, $normalized_existing_title);
                        $title_length = max(strlen($normalized_title), strlen($normalized_existing_title));
                        $similarity_percentage = (($title_length - $levenshtein_distance) / $title_length) * 100;

                        if ($similarity_percentage >= 90) { // Valor somos nós que escolhemos, convém ser alto 
                            // Se a similaridade for alta, consideramos as publicações duplicadas
                            $exists = true;
                            break;
                        }
                    }

                    if (!$exists) {
                        // Se não existir, adiciona a publicação ao grupo
                        $groupedPublicacoes[$year][$site][] = $publicacao['dados'];
                    }
                }
                ?>
                <script src="../backoffice/assets/js/citation-js-0.6.8.js"></script>
                <script>
                    const Cite = require('citation-js');
                </script>

                <div id="publications">
                    <?php foreach ($groupedPublicacoes as $year => $yearPublica) : ?>
                        <div class="mb-5">
                            <b><?= $year ?></b><br>
                            <?php foreach ($yearPublica as $site => $publicacoes) : ?>
                                <div style="margin-left: 10px;" class="mt-3"><b><?= $site ?></b><br></div>
                                <div style="margin-left: 20px;" id="publications<?= $year ?><?= $site ?>">
                                    <?php foreach ($publicacoes as $publicacao) : ?>
                                        <script>
                                            var formattedCitation = new Cite(<?= json_encode($publicacao) ?>).format('bibliography', {
                                                format: 'html',
                                                template: 'apa',
                                                lang: 'en-US'
                                            });
                                            var citationContainer = document.createElement('div');
                                            citationContainer.innerHTML = formattedCitation;
                                            citationContainer.classList.add('mb-3');
                                            document.getElementById('publications<?= $year ?><?= $site ?>').appendChild(citationContainer);
                                        </script>
                                    <?php endforeach; ?>
                                </div>
                            <?php endforeach; ?>
                        </div><br>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>
</section>

<?= template_footer(); ?>
