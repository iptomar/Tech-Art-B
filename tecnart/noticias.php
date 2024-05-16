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
if ($_SERVER["REQUEST_METHOD"] == "POST") {
   // Verifique se o campo de e-mail foi enviado
   if (isset($_POST["email"])) {
       $email = $_POST["email"];

       // Verifique se o e-mail já está na tabela de assinantes
       $query_check_email = "SELECT COUNT(*) AS total FROM assinantes WHERE email = ?";
       $stmt_check_email = $pdo->prepare($query_check_email);
       $stmt_check_email->execute([$email]);
       $row = $stmt_check_email->fetch(PDO::FETCH_ASSOC);

       // Se o e-mail não estiver na tabela, adicione-o
       if ($row['total'] == 0) {
           // Insira o e-mail na tabela de assinantes
           $query_insert_email = "INSERT INTO assinantes (nome,email, data_inscricao) VALUES (?, ?, NOW())";
           $stmt_insert_email = $pdo->prepare($query_insert_email);
           $stmt_insert_email->execute(['', $email]);

           // Exibir pop-up de sucesso
           echo '<script>alert("Inscrição realizada com sucesso!!")</script>';

       } else {
           // Exibir pop-up de erro
           echo '<script>alert("Este email ja esta registado na Newsletter!")</script>';
       }
   }
}
?>

<!DOCTYPE html>
<html>
<?= template_header('Notícias'); ?>


<section class="product_section layout_padding">
   <div style="background-color: #dbdee1; padding-top: 50px; padding-bottom: 50px;">
      <div class="container">
         <div class="heading_container3">
            <h3 style="margin-bottom: 5px; color: #002169">
               <?= change_lang("news-page-heading") ?>
            </h3>
            <h5 class="heading2_h5 color:#002169">
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
                     <div class="image_default" style="width: 330px; height: 230px; overflow: hidden;">
                           <img class="centrare" style="width: 100%; height: 100%; object-fit: cover;" src="../backoffice/assets/noticias/<?= $noticia['imagem'] ?>" alt="">
                        <div class="imgText m-auto" style="top:75%">
                           <?php
                           $titulo = trim($noticia['titulo']);
                           if (strlen($noticia['titulo']) > 35) {
                              $titulo = preg_split("/\s+(?=\S*+$)/", substr($noticia['titulo'], 0, 35))[0];
                           }
                           echo ($titulo !=  trim($noticia['titulo'])) ? $titulo . "..." : $titulo;
                           ?>
                        </div>
                        <h6 class="imgText m-auto" style="font-size: 11px; font-weight: 100; top:95%; text-align: center;"><?= date("d.m.Y", strtotime($noticia['data'])) ?></h6>
                     </div>
                  </a>
               </div>

            <?php endforeach; ?>

         </div>

      </div>

   </div>
</section>


<section class="newsletter_section layout_padding">
   <div style="background-color: #f9f9f9; padding-top: 50px; padding-bottom: 50px;">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6">
               <h3 style="margin-bottom: 20px; text-align: center;">Inscreva-se na nossa Newsletter</h3>
               <form action="noticias.php" method="post">
                  <div class="form-group d-flex">
                     <input type="email" class="form-control mr-2" id="email" name="email" placeholder="Insira o seu e-mail" style="border: 2px solid #000000;" required>
                     <button type="submit" style="height:37px;background-color: #002169; border: 2px solid #000000; color: #ffffff; border-radius: 0; transition: all 0.3s; font-family: Merriweather Sans Light; font-size: 20px;">Confirmar</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</section>

<script>
function exibirPopup(mensagem) {
    alert(mensagem);
}
</script>

<?= template_footer(); ?>

</body>

</html>
