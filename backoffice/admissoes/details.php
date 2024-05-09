<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer/src/Exception.php';
require '../PHPMailer/src/PHPMailer.php';
require '../PHPMailer/src/SMTP.php';


require "../verifica.php";
require "../config/basedados.php";
require "bloqueador.php";

$id = $_GET["id"];
$file_path = "../assets/ficheiros_admissao/admissao_" . $id . "/";

$sql_select = "SELECT * FROM admissoes WHERE id = ?";
$stmt_select = mysqli_prepare($conn, $sql_select);
mysqli_stmt_bind_param($stmt_select, 'i', $id);
mysqli_stmt_execute($stmt_select);
$result_select = mysqli_stmt_get_result($stmt_select);
$row = mysqli_fetch_assoc($result_select);

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['admitir_investigador'])) {
    // Verifica se há dados para inserir na tabela investigadores
    if ($row) {
        // Gerar senha aleatória
        $nova_senha = substr(str_shuffle(strtolower(sha1(rand() . time()))), 0, 8);

        // Encriptar a senha
        $password_hash = password_hash($nova_senha, PASSWORD_DEFAULT);

        // Prepara a inserção na tabela investigadores
        $sql_insert = "INSERT INTO investigadores (nome, email, ciencia_id, sobre, sobre_en, tipo, fotografia, areasdeinteresse, areasdeinteresse_en, orcid, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt_insert = mysqli_prepare($conn, $sql_insert);
        mysqli_stmt_bind_param($stmt_insert, 'sssssssssss', $row['nome_completo'], $row['email'], $row['ciencia_id'], $row['biografia'], $row['biografia'], $row['tipo'], $row['ficheiro_fotografia'], $row['area_investigacao'], $row['area_investigacao'], $row['orcid'], $password_hash);

        // Executa a inserção
        mysqli_stmt_execute($stmt_insert);

        // Verifica se a inserção foi bem-sucedida
        if (mysqli_stmt_affected_rows($stmt_insert) > 0) {
            // Remove a admissão da tabela admissoes
            $sql_delete = "DELETE FROM admissoes WHERE id = ?";
            $stmt_delete = mysqli_prepare($conn, $sql_delete);
            mysqli_stmt_bind_param($stmt_delete, 'i', $id);
            mysqli_stmt_execute($stmt_delete);

            if (mysqli_stmt_affected_rows($stmt_insert) > 0) {
                // Remove a admissão da tabela admissoes
                $sql_delete = "DELETE FROM admissoes WHERE id = ?";
                $stmt_delete = mysqli_prepare($conn, $sql_delete);
                mysqli_stmt_bind_param($stmt_delete, 'i', $id);
                mysqli_stmt_execute($stmt_delete);


                $mail = new PHPMailer(true);

                try {
                    // Configuração do servidor SMTP
                    $mail->isSMTP();
                    $mail->Host = 'smtp.gmail.com';
                    $mail->SMTPAuth = true;
                    $mail->Username = 'tecnartadm@gmail.com';
                    $mail->Password = 'nqfi ywzk jboh hpim';
                    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                    $mail->Port = 587;


                    // Configuração do remetente
                    $mail->setFrom('tecnartadm@gmail.com', 'TechnArt IPT');
                    $mail->addReplyTo('tecnartadm@gmail.com', 'Administração TecnArt');

                    $emailBody = '';  // Inicializando a variável
                    $emailBody .= '<h1>Prezado(a) ' . $row['nome_completo'] . '</h1>';
                    $emailBody .= '<p>Saudações da Administração da TechnArt!</p>';
                    $emailBody .= '<p>Gostaríamos de informá-lo(a) que sua admissão foi aceita em nosso site. Como parte do processo de criação de conta, geramos uma nova palavra-passe para você.</p>';
                    $emailBody .= '<p>Aqui está sua nova palavra-passe: <strong>' . $nova_senha . '</strong></p>';
                    $emailBody .= '<p>Por favor, lembre-se de manter esta senha em um local seguro e não compartilhá-la com ninguém. Recomendamos que você faça login em sua conta o mais rápido possível e altere a palavra-passe para uma de sua preferência.</p>';
                    $emailBody .= '<p>Se precisar de assistência adicional ou tiver alguma dúvida, não hesite em entrar em contato conosco. Estamos aqui para ajudar!</p>';
                    $emailBody .= '<p>Atenciosamente,<br>Administração TechnArt</p>';





                    $mail->CharSet = 'UTF-8';
                    $mail->addAddress($row['email'], $row['nome_completo']);
                    $mail->isHTML(true);
                    $mail->Subject = 'Admissão Aceite';
                    $mail->Body = $emailBody;
                    $mail->AltBody = 'Para visualizar este email, use um cliente de email que suporte HTML.';
                    $mail->send();
                    $mail->clearAddresses(); // Limpa os destinatários para o próximo loop

                    echo 'E-mail enviado com sucesso!';
                } catch (Exception $e) {
                    echo "Erro ao enviar o e-mail: {$mail->ErrorInfo}";
                }



                // Redireciona de volta para index.php
                header("Location: index.php");
                exit(); // Certifique-se de sair do script após o redirecionamento

            }
        }
    }
}
?>







<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</link>
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
        <h5 class="card-header text-center">Detalhes do Pedido de Admissão</h5>
        <div class="card-body">

            <form role="form" data-toggle="validator" action="details.php?id=<?= $id; ?>" method="post"
                enctype="multipart/form-data">
                <div class="form-group">
                    <button type="submit" name="admitir_investigador" class="btn btn-primary btn-block">Admitir
                        Investigador</button>
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
                    <label for="tipo">Tipo de Investigador</label>
                    <input type="text" class="form-control" id="tipo" name="tipo" value="<?= $row['tipo']; ?>" readonly>
                </div>
                <div class="form-group">
                    <form action="download.php" method="post">
                        <label for="ficheiro">Ficheiro de motivação:</label>
                        <input type="hidden" class="form-control" id="path" name="path" value="<?= $file_path ?>">
                        <input type="hidden" class="form-control" id="ficheiro" name="ficheiro"
                            value="<?= $row['ficheiro_motivacao']; ?>"><br>
                        <a target="_blank" class="mr-2 btn btn-primary"
                            href="<?= $file_path . $row['ficheiro_motivacao']; ?>">Abrir</a>
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
                            href="<?= $file_path . $row['ficheiro_recomendacao']; ?>">Abrir</a>
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
                            href="<?= $file_path . $row['ficheiro_cv']; ?>">Abrir</a>
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
                            href="<?= $file_path . $row['ficheiro_fotografia']; ?>">Abrir</a>
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