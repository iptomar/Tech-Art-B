<?php
include 'config/dbconnection.php';
include 'models/functions.php';

$pdo = pdo_connect_mysql();

$stmt = $pdo->prepare('SELECT * FROM projetos WHERE concluido=true');
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
   <div style="padding-top: 20px;">
      <div class="container">
         <div class="row justify-content-center mt-3">

            <?php foreach ($projetos as $projeto) : ?>

               <div class="ml-5 imgList">
                  <a href="projeto.php?projeto=<?= $projeto['id'] ?>">
                     <div class="image">
                        <img class="centrare" style="object-fit: cover; width:225px; height:280px;" src="../backoffice/assets/projetos/<?= $projeto['fotografia'] ?>" alt="">
                        <div class="imgText justify-content-center m-auto"><?= $projeto['nome'] ?></div>
                     </div>
                  </a>
               </div>

            <?php endforeach; ?>

         </div>

      </div>

   </div>
</section>

<!-- end product section -->

<?= template_footer(); ?>

</body>

</html>