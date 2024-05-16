<?php
require "../verifica.php";
require "../config/basedados.php";
require "bloqueador.php";

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer/src/Exception.php';
require '../PHPMailer/src/PHPMailer.php';
require '../PHPMailer/src/SMTP.php';

//Apagar uma pasta
function delete_directory($dir)
{
    if (is_dir($dir)) {
        $files = array_diff(scandir($dir), array('.', '..'));
        foreach ($files as $file) {
            (is_dir("$dir/$file")) ? delete_directory("$dir/$file") : unlink("$dir/$file");
        }
        return rmdir($dir);
    } else {
        return true;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST["id"];
    $file_path = "../assets/ficheiros_admissao/admissao_" . $id . "/";

    // Enviar e-mail de admissão eliminada
    enviarEmailAdmissaoEliminada($id);

    delete_directory($file_path);
    $sql = "DELETE FROM admissoes WHERE id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);
    $id = $_POST["id"];
    if (mysqli_stmt_execute($stmt)) {
        header('Location: index.php');
        exit;
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
} else {
    $id = $_GET["id"];
    $file_path = "../assets/ficheiros_admissao/admissao_" . $id . "/";

    $sql = "SELECT id, nome_completo, nome_profissional, 
    ciencia_id, orcid, email, telefone, grau_academico, 
    ano_conclusao_academico, area_academico, area_investigacao, 
    instituicao_vinculo, percentagem_dedicacao, pertencer_outro, 
    outro_texto, biografia, ficheiro_motivacao, ficheiro_recomendacao, 
    ficheiro_cv, ficheiro_fotografia, data_criacao FROM admissoes 
    WHERE id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $row = mysqli_fetch_assoc($result);
}

function enviarEmailAdmissaoEliminada($id)
{
    global $conn;

    $sql_select_email = "SELECT email, nome_completo FROM admissoes WHERE id = ?";
    $stmt_select_email = mysqli_prepare($conn, $sql_select_email);
    mysqli_stmt_bind_param($stmt_select_email, 'i', $id);
    mysqli_stmt_execute($stmt_select_email);
    $result_select_email = mysqli_stmt_get_result($stmt_select_email);
    $row_email = mysqli_fetch_assoc($result_select_email);

    $destinatario_email = $row_email['email'];
    $nome_destinatario = $row_email['nome_completo'];

    $mail = new PHPMailer(true);

    try {
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'tecnartadm@gmail.com';
        $mail->Password = '';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        $mail->setFrom('tecnartadm@gmail.com', 'TechnArt IPT');
        $mail->addReplyTo('tecnartadm@gmail.com', 'Administração TechnArt');
        $mail->addAddress($destinatario_email, $nome_destinatario);

        $emailBody = '<h1>Prezado(a) ' . $nome_destinatario . '</h1>';
        $emailBody .= '<p>Saudações da Administração da TechnArt!</p>';
        $emailBody .= '<p>Gostaríamos de informá-lo(a) que sua admissão <strong>não</strong> foi aceita em nosso site. Suas qualificações não correspondem com os nossos critérios de admissão para um investigador.</p>';
        $emailBody .= '<p>Se achar que não foi justificado, precisar de assistência adicional ou tiver alguma dúvida, não hesite em entrar em contato conosco. Estamos aqui para ajudar!</p>';
        $emailBody .= '<p>Atenciosamente,<br>Administração TechnArt</p>';

        $mail->CharSet = 'UTF-8';
        $mail->isHTML(true);
        $mail->Subject = 'Admissão Eliminada';
        $mail->Body = $emailBody;
        $mail->AltBody = 'Para visualizar este email, use um cliente de email que suporte HTML.';

        $mail->send();
        echo "E-mail enviado com sucesso.";
    } catch (Exception $e) {
        echo "Erro ao enviar o e-mail: {$mail->ErrorInfo}";
    }
}
?>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
<style>
    .container {
        max-width: 550px;
    }

    .has-error label,
    .has-error input,
    .has-error textarea {
        color: red;
        border-color: red;
    }

    .list-unstyled li {
        font-size: 13px;
        padding: 4px 0 0;
        color: red;
    }
</style>

<div class="container-xl mt-5 mb-5">
    <div class="card">
        <h5 class="card-header text-center">Eliminar Pedido de Admissão</h5>
        <div class="card-body">
            <form role="form" data-toggle="validator" action="remove.php" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value=<?= $id; ?>>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Confirmar</button>
                </div>
                <div class="form-group">
                    <button type="button" onclick="window.location.href = 'index.php'"
                        class="btn btn-danger btn-block">Cancelar</button>
                </div>

                <div class="form-group">
                    <label for="nome_completo">Data Submissão:</label>
                    <input type="text" class="form-control" id="nome_completo"
                        value="<?= date("d-m-Y H:i", strtotime($row['data_criacao'])) ?>" readonly>
                </div>
                <div class="form-group">
                    <label for="nome_completo">Nome Completo:</label>
                    <input type="text" class="form-control" id="nome_completo" value="<?= $row['nome_completo']; ?>"
                        readonly>
                </div>

                <div class="form-group">
                    <label for="nome_profissional">Nome Profissional:</label>
                    <input type="text" class="form-control" id="nome_profissional"
                        value="<?= $row['nome_profissional']; ?>" readonly>
                </div>

                <div class="form-group">
                    <label for="ciencia_id">Ciência ID:</label>
                    <input type="text" class="form-control" id="ciencia_id" value="<?= $row['ciencia_id']; ?>" readonly>
                </div>

                <div class="form-group">
                    <label for="orcid">ORCID:</label>
                    <input type="text" class="form-control" id="orcid" value="<?= $row['orcid']; ?>" readonly>
                </div>

                <div class="form-group">
                    <label for="email">Endereço de email:</label>
                    <input type="email" class="form-control" id="email" value="<?= $row['email']; ?>" readonly>
                </div>

                <div class="form-group">
                    <label for="telefone">Contacto telefónico:</label>
                    <input type="text" class="form-control" id="telefone" value="<?= $row['telefone']; ?>" readonly>
                </div>

                <div class="form-group">
                    <label for="grau_academico">Grau Académico:</label>
                    <input type="text" class="form-control" id="grau_academico" value="<?= $row['grau_academico']; ?>"
                        readonly>
                </div>

                <div class="form-group">
                    <label for="ano_conclusao_academico">Ano de conclusão do grau académico:</label>
                    <input type="text" class="form-control" id="ano_conclusao_academico"
                        value="<?= $row['ano_conclusao_academico']; ?>" readonly>
                </div>

                <div class="form-group">
                    <label for="area_academico">Área de especialização do Grau Académico:</label>
                    <input type="text" class="form-control" id="area_academico" value="<?= $row['area_academico']; ?>"
                        readonly>
                </div>

                <div class="form-group">
                    <label for="area_investigacao">Principais áreas de Investigação:</label>
                    <input type="text" class="form-control" id="area_investigacao"
                        value="<?= $row['area_investigacao']; ?>" readonly>
                </div>
                <div class="form-group">
                    <label for="instituicao_vinculo">Instituição de vínculo (data de início e fim, se aplicável
                        [dd/mm/aaaa]):</label>
                    <input type="text" class="form-control" id="instituicao_vinculo" name="instituicao_vinculo"
                        value="<?= $row['instituicao_vinculo']; ?>" readonly>
                </div>
                <div class="form-group">
                    <label for="percentagem_dedicacao">Percentagem de dedicação ao TECHN&ART:</label>
                    <input type="text" class="form-control" id="percentagem_dedicacao" name="percentagem_dedicacao"
                        value="<?= $row['percentagem_dedicacao']; ?>" readonly>
                </div>
                <div class="form-group">
                    <label for="pertencer_outro">Pertence a outro centro de investigação e desenvolvimento?</label>
                    <input type="text" class="form-control" id="pertencer_outro" name="pertencer_outro"
                        value="<?= $row['pertencer_outro'] ? 'Sim' : 'Não'; ?>" readonly>
                </div>
                <div class="form-group">
                    <label for="outro_texto">Se sim, indique qual:</label>
                    <input type="text" class="form-control" id="outro_texto" name="outro_texto"
                        value="<?= $row['outro_texto']; ?>" readonly>
                </div>
                <div class="form-group">
                    <label for="biografia">Biografia:</label>
                    <textarea class="form-control" id="biografia" name="biografia" rows="5"
                        readonly><?= $row['biografia']; ?></textarea>
                </div>
                <div class="form-group">
                    <form action="download.php" method="post">
                        <label for="ficheiro">Ficheiro de motivação:</label>
                        <input type="hidden" class="form-control" id="path" name="path" value="<?= $file_path ?>">
                        <input type="hidden" class="form-control" id="ficheiro" name="ficheiro"
                            value="<?= $row['ficheiro_motivacao']; ?>"><br>
                        <a target="_blank" class="mr-2 btn btn-primary"
                            href="<?= $file_path . $row['ficheiro_motivacao']; ?>">Ver Ficheiro</a>
                        <button class="btn btn-primary" type="submit">Download</button>
                    </form>
                </div>
                <div class="form-group">
                    <form action="download.php" method="post">
                        <label for="ficheiro">Ficheiro de recomendação:</label>
                        <input type="hidden" class="form-control" id="path" name="path" value="<?= $file_path ?>">
                        <input type="hidden" class="form-control" id="ficheiro" name="ficheiro"
                            value="<?= $row['ficheiro_recomendacao']; ?>"><br>
                        <a target="_blank" class="mr-2 btn btn-primary"
                            href="<?= $file_path . $row['ficheiro_recomendacao']; ?>">Ver Ficheiro</a>
                        <button class="btn btn-primary" type="submit">Download</button>
                    </form>
                </div>
                <div class="form-group">
                    <form action="download.php" method="post">
                        <label for="ficheiro">Ficheiro CV:</label>
                        <input type="hidden" class="form-control" id="path" name="path" value="<?= $file_path ?>">
                        <input type="hidden" class="form-control" id="ficheiro" name="ficheiro"
                            value="<?= $row['ficheiro_cv']; ?>"><br>
                        <a target="_blank" class="mr-2 btn btn-primary"
                            href="<?= $file_path . $row['ficheiro_cv']; ?>">Ver Ficheiro</a>
                        <button class="btn btn-primary" type="submit">Download</button>
                    </form>
                </div>

                <div class="form-group">
                    <form action="download.php" method="post">
                        <label for="ficheiro">Ficheiro Fotografia:</label>
                        <input type="hidden" class="form-control" id="path" name="path" value="<?= $file_path ?>">
                        <input type="hidden" class="form-control" id="ficheiro" name="ficheiro"
                            value="<?= $row['ficheiro_fotografia']; ?>"><br>
                        <a target="_blank" class="mr-2 btn btn-primary"
                            href="<?= $file_path . $row['ficheiro_fotografia']; ?>">Ver Ficheiro</a>
                        <button class="btn btn-primary" type="submit">Download</button>
                    </form>
                </div>
            </form>
        </div>
    </div>
</div>

<?php
mysqli_close($conn);
?>