<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require './PHPMailer/src/Exception.php';
require './PHPMailer/src/PHPMailer.php';
require './PHPMailer/src/SMTP.php';

// Instanciar a classe PHPMailer
$mail = new PHPMailer(true);

try {
    // Configuração do servidor SMTP
    $mail->isSMTP();
    $mail->Host       = 'smtp.gmail.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = '';
    $mail->Password   = '';
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port       = 587;

    // Configuração do remetente e destinatário
    $mail->setFrom('tecnartadm@gmail.com', 'TechnArt IPT');
    $mail->addAddress('', 'Destinatário aqui');
    $mail->addReplyTo('tecnartadm@gmail.com', 'Administração TecnArt');

    // Conteúdo do e-mail
    $mail->isHTML(true);
    $mail->Subject = 'Notícias TechnArt';
    $mail->Body    = "";
    $mail->AltBody = "";
    // Enviar o e-mail
    $mail->send();
    echo 'E-mail enviado com sucesso!';
} catch (Exception $e) {
    echo "Erro ao enviar o e-mail: {$mail->ErrorInfo}";
}
