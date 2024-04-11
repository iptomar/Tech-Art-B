<?php
include 'config/dbconnection.php';
include 'models/functions.php';

$pdo = pdo_connect_mysql();

$language = ($_SESSION["lang"] == "en") ? "_en" : "";

$query = "SELECT id,
        COALESCE(NULLIF(titulo{$language}, ''), titulo) AS titulo,
        COALESCE(NULLIF(conteudo{$language}, ''), conteudo) AS conteudo,
        imagem,data
        FROM noticias WHERE data<=NOW() ORDER BY DATA DESC;";
$stmt = $pdo->prepare($query);
$stmt->execute();
$noticias = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>

<?= template_header('Notícias'); ?>


<section class="product_section layout_padding">
   <div style="background-color: #dbdee1; padding-top: 50px; padding-bottom: 50px;">
      <div class="container">
         <div class="heading_container3">
            <h3 style="margin-bottom: 5px;">
               <?= change_lang("news-page-heading") ?>
            </h3>
            <h5 class="heading2_h5">
               <?= change_lang("news-page-heading-desc") ?>
            </h5>

         </div>
      </div>
   </div>
</section>


<section class="product_section layout_padding">
   <div style="padding-top: 20px;">
      <div class="container">
         <div class="row justify-content-center mt-3">

            <?php foreach ($noticias as $noticia) : ?>
               <div class="ml-5 imgList">
                  <a href="noticia.php?noticia=<?= $noticia['id'] ?>">
                     <div class="image_default" style="width: 300px; height: 300px; overflow: hidden;">
                           <img class="centrare" style="width: 100%; height: 100%; object-fit: cover;" src="../backoffice/assets/noticias/<?= $noticia['imagem'] ?>" alt="">
                        <div class="imgText justify-content-center m-auto" style="top:75%">
                           <?php
                           $titulo = trim($noticia['titulo']);
                           if (strlen($noticia['titulo']) > 35) {
                              $titulo = preg_split("/\s+(?=\S*+$)/", substr($noticia['titulo'], 0, 35))[0];
                           }
                           echo ($titulo !=  trim($noticia['titulo'])) ? $titulo . "..." : $titulo;
                           ?>
                        </div>
                        <h6 class="imgText m-auto" style="font-size: 11px; font-weight: 100; top:95%"><?= date("d.m.Y", strtotime($noticia['data'])) ?></h6>
                     </div>
                  </a>
               </div>

            <?php endforeach; ?>

         </div>

      </div>

   </div>
</section>


<?= template_footer(); ?>

</body>

</html>