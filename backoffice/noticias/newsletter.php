<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer/src/Exception.php';
require '../PHPMailer/src/PHPMailer.php';
require '../PHPMailer/src/SMTP.php';

require "../config/basedados.php"; // Conexão com o banco de dados

// Instanciar a classe PHPMailer
$mail = new PHPMailer(true);

try {
    // Configuração do servidor SMTP
    $mail->isSMTP();
    $mail->Host       = 'smtp.gmail.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'tecnartadm@gmail.com';
    $mail->Password   = '';
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port       = 587;

    // Configuração do remetente
    $mail->setFrom('tecnartadm@gmail.com', 'TechnArt IPT');
    $mail->addReplyTo('tecnartadm@gmail.com', 'Administração TecnArt');

    // Selecionar os assinantes
    $assinantesQuery = "SELECT nome, email FROM assinantes";
    $assinantesResult = mysqli_query($conn, $assinantesQuery);

    // Coletar as 5 últimas notícias
    $noticiasQuery = "SELECT titulo, conteudo,imagem, data FROM noticias ORDER BY data DESC LIMIT 5";
    $noticiasResult = mysqli_query($conn, $noticiasQuery);

    // Construir o corpo do email com as notícias
    $emailBody = '<h1>Últimas Notícias da TechnArt</h1>';
    while ($row = mysqli_fetch_assoc($noticiasResult)) {
        $emailBody .= '<h2>' . $row['titulo'] . '</h2>';
        $emailBody .= '<p>' . $row['conteudo'] . '</p>';
        $emailBody .= '<p>Data: ' . $row['data'] . '</p>';
        $emailBody .= '<img src="' . $row['imagem'] . '"/>';
        $emailBody .= '<hr>';
    }

    // Enviar email para cada assinante
    while ($assinante = mysqli_fetch_assoc($assinantesResult)) {
        $mail->CharSet = 'UTF-8';
        $mail->addAddress($assinante['email'], '');
        $mail->isHTML(true);
        $mail->Subject = 'Notícias TechnArt';
        $mail->Body    = $emailBody;
        $mail->AltBody = 'Para visualizar este email, use um cliente de email que suporte HTML.';
        $mail->send();
        $mail->clearAddresses(); // Limpa os destinatários para o próximo loop
    }

    echo 'E-mail enviado com sucesso para todos os assinantes!';
} catch (Exception $e) {
    echo "Erro ao enviar o e-mail: {$mail->ErrorInfo}";
}

?>
