<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../Tech-Art-B/';
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
    $mail->addAddress('gughsleite10@gmail.com', 'Destinatário aqui');
    $mail->addReplyTo('tecnartadm@gmail.com', 'Administração TecnArt');

    // Conteúdo do e-mail
    $mail->isHTML(true);
    $mail->Subject = 'Admissão aceita';
    $mail->Body    = "Prezado(a) [Nome do Utilizador],<br><br>"
        . "Saudações da Administração da TecnArt!<br><br>"
        . "Gostaríamos de informá-lo(a) que sua admissão foi aceita em nosso site. Como parte do processo de criação de conta, geramos uma nova palavra-passe para você.<br><br>"
        . "Aqui está sua nova palavra-passe: [Nova Senha]<br><br>"
        . "Por favor, lembre-se de manter esta senha em um local seguro e não compartilhá-la com ninguém. Recomendamos que você faça login em sua conta o mais rápido possível e altere a palavra-passe para uma de sua preferência.<br><br>"
        . "Se precisar de assistência adicional ou tiver alguma dúvida, não hesite em entrar em contato conosco. Estamos aqui para ajudar!<br><br>"
        . "Atenciosamente,<br>"
        . "Administração TechnArt";
    $mail->AltBody = "Prezado(a) [Nome do Utilizador],<br><br>"
        . "Saudações da Administração da TecnArt!<br><br>"
        . "Gostaríamos de informá-lo(a) que sua conta foi criada com sucesso em nosso site. Como parte do processo de criação de conta, geramos uma nova senha para você.<br><br>"
        . "Aqui está sua nova senha: [Nova Senha]<br><br>"
        . "Por favor, lembre-se de manter esta senha em um local seguro e não compartilhá-la com ninguém. Recomendamos que você faça login em sua conta o mais rápido possível e altere a senha para uma de sua preferência.<br><br>"
        . "Se precisar de assistência adicional ou tiver alguma dúvida, não hesite em entrar em contato conosco. Estamos aqui para ajudar!<br><br>"
        . "Atenciosamente,<br>"
        . "Administração TechnArt";
    // Enviar o e-mail
    $mail->send();
    echo 'E-mail enviado com sucesso!';
} catch (Exception $e) {
    echo "Erro ao enviar o e-mail: {$mail->ErrorInfo}";
}
