<?php
require "./config/dbconnection.php";
require "models/functions.php";
include_once "config/configurations.php";

//Guardar um ficheiro na pasta pedido_<id pedido> mudando o nome do ficheiro
function save_file($id, $new_name, $file)
{
    $directory = "../backoffice/assets/ficheiros_admissao/admissao_$id/";
    if (!is_dir($directory) && !mkdir($directory, 0777, true)) {
        //Se ocurrer algum erro e não possivel criar a pasta returnar falso
        return false;
    }
    if (move_uploaded_file($_FILES[$file]["tmp_name"], $directory . $new_name)) {
        return true;
    }
    return false;
}


function changeLanguage($language){
    $_SESSION["lang"] = $language;
}

//Array que mapeia os nomes/ids dos inputs com os seus respectivos títulos
//exceto o dados_pertencer_outro, dados_outro_texto, e dados_biografia
$dados = array(
    "dados_nome" => change_lang("admission-name"),
    "dados_nome_prof" => change_lang("admission-name-prof"),
    "dados_ciencia_id" => change_lang("admission-cienciaid"),
    "dados_orcid" => change_lang("admission-orcid"),
    "dados_email" => change_lang("admission-email"),
    "dados_telefone" =>  change_lang("admission-cellphone"),
    "dados_grau_academico" => change_lang("admission-academic-qualifications"),
    "dados_ano_conclusao_academico" => change_lang("admission-year-conclusion"),
    "dados_area_academico" => change_lang("admission-field-expertise"),
    "dados_area_investigacao" => change_lang("admission-main-research-areas"),
    "dados_instituicao_vinculo" => change_lang("admission-institucional-affliation"),
    "dados_percentagem_dedicacao" => change_lang("admission-percentage-dedication-tech")
);

//Array que mapeia os nomes/ids dos ficheiros com os seus respectivos títulos
$files = array(
    "motivacao" => change_lang("admission-motivation"),
    "recomendacao" => change_lang("admission-recommendation"),
    "cv" => change_lang("admission-cv"),
    "fotografia" => change_lang("admission-photo"),
);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    //Verifica se o POST exceder o limite de tamanho maximo do servidor
    //Visto que uma requisição POST foi feita, mas não há dados POST e ficheiros enviados, e o tamanho do conteúdo da requisição é maior que zero
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && empty($_POST) && empty($_FILES) && $_SERVER['CONTENT_LENGTH'] > 0) {
        $max_upload_size = ini_get('upload_max_filesize');
        $content_length = $_SERVER['CONTENT_LENGTH'];
        if ($content_length > $max_upload_size) {
            //Se a verificação de tamanho do ficheiro no cliente funcionar este erro nunca será mostrado
            show_error(change_lang("admission-file-size-error"));
        }
    } else {
        $error = false;
        $msg = change_lang("admission-required-error") . ": <br>";
        //Verificar se todos os campos do array dados existem e foram preenchidos
        foreach ($dados as $key => $value) {
            if (!isset($_POST[$key]) || empty(trim($_POST[$key]))) {
                $msg .= $value . "<br>";
                $error = true;
            }
        }
        //Verificar se um dos botões radio dados_pertencer_outro foi selecianado
        if (!isset($_POST['dados_pertencer_outro'])) {
            $msg .=  change_lang('admission-member-another') . "<br>";
            $error = true;
        }
        //O input dados_outro_texto não é obrigatorio logo pode estar vazio mas deve existir para o comando correr
        if (!isset($_POST['dados_outro_texto'])) {
            $msg .= change_lang('admission-another-centre-info') . "<br>";
            $error = true;
        }
        //Verificar se o texto da textarea dados_biografia não está vario
        if (!isset($_POST['dados_biografia']) || empty(trim($_POST['dados_biografia']))) {
            $msg .= change_lang('admission-biography')  . "<br>";
            $error = true;
        }

        //Verificar se todos os ficheiros foram uploaded com sucesso
        foreach ($files as $key => $value) {
            if (!isset($_FILES[$key]) || $_FILES[$key]['error'] == 4 || $_FILES[$key]['error'] != 0) {
                $msg .= $value . "<br>";
                $error = true;
            }
        }
        if (!$error) {
            //Verificar se todos os ficheiros tem o tamanho correto
            $maxFileSize = MAX_FILE_SIZE * 1024 * 1024; // MAX_FILE MB em bytes
            if (
                $_FILES['motivacao']['size'] > $maxFileSize ||
                $_FILES['recomendacao']['size'] > $maxFileSize ||
                $_FILES['cv']['size'] > $maxFileSize ||
                $_FILES['fotografia']['size'] > $maxFileSize
            ) {
                //Se a verificação de tamanho do ficheiro no cliente falhar este erro será mostrado
                $msg = change_lang("admission-file-size-error") . "<br>";
                $error = true;
            }
        }
        //Mostrar a msg como erro se o occurreu algum erro na validação dos dados
        if ($error) {
            show_error($msg);
        }

        //Tentar conectar à BD
        try {
            $pdo = pdo_connect_mysql();
        } catch (Exception $e) {
            show_error(change_lang("admission-send-error"));
            $error = true;
        }

        //Se não ocurreram erros previamente, se todos os dados estão corretos e foi possivel conectar àBD
        //Preparar e correr o comando de Insert
        if (!$error) {
            $sql = "INSERT INTO admissoes (
                    `nome_completo`, `nome_profissional`, `ciencia_id`, 
                    `orcid` , `email`, `telefone` , 
                    `grau_academico`, `ano_conclusao_academico`, `area_academico`, `area_investigacao` , 
                    `instituicao_vinculo`, `percentagem_dedicacao`, `pertencer_outro` , 
                    `outro_texto`, `biografia`, `ficheiro_motivacao`, 
                    `ficheiro_recomendacao`, `ficheiro_cv`, `ficheiro_fotografia`) VALUES ( 
                    :dados_nome, :dados_nome_prof, :dados_ciencia_id,
                    :dados_orcid, :dados_email, :dados_telefone, 
                    :dados_grau_academico, :dados_ano_conclusao_academico, :dados_area_academico, 
                    :dados_area_investigacao, :dados_instituicao_vinculo, :dados_percentagem_dedicacao,
                    :dados_pertencer_outro, :dados_outro_texto, :dados_biografia, :f_motivacao,
                    :f_recomendacao, :f_cv, :f_fotografia
                    )";
            //Fazer o bind dos parametros $_POST
            $stmt = $pdo->prepare($sql);
            foreach ($_POST as $key => $value) {
                $param_name = 'dados_';
                if (substr($key, 0, strlen($param_name)) == $param_name) {
                    $valuetype = PDO::PARAM_STR;
                    //Verificar se os dados é o dados_pertencer_outro que usa bool não string
                    if ($key == "dados_pertencer_outro") {
                        //Utilizou-se PARAM_INT em vez de PARAM_BOOL para funcionar no servidor, com PARAM_BOOL o INSERT falhava
                        $valuetype =  PDO::PARAM_INT;
                        $value = $_POST['dados_pertencer_outro'] == 'true' ? true : false;
                    }
                    //Se o valor está vazio enviar como null
                    if ($value === '') $value = null;
                    $stmt->bindValue($key, $value, $valuetype);
                }
            }
            //Gerar nome para os ficheiros com a respetiva extenção
            $nome_motivacao = "motivacao" . time() . "." . pathinfo($_FILES["motivacao"]["name"], PATHINFO_EXTENSION);
            $nome_recomendacao = "recomendacao" . time() . "." . pathinfo($_FILES["recomendacao"]["name"], PATHINFO_EXTENSION);
            $nome_cv = "cv" . time() . "." . pathinfo($_FILES["cv"]["name"], PATHINFO_EXTENSION);
            $nome_fotografia = "fotografia" . time() . "." . pathinfo($_FILES["fotografia"]["name"], PATHINFO_EXTENSION);

            //Colocar os novos nomes no comando insert
            $stmt->bindParam("f_motivacao", $nome_motivacao, PDO::PARAM_STR);
            $stmt->bindParam("f_recomendacao", $nome_recomendacao, PDO::PARAM_STR);
            $stmt->bindParam("f_cv", $nome_cv, PDO::PARAM_STR);
            $stmt->bindParam("f_fotografia", $nome_fotografia, PDO::PARAM_STR);

            $pdo->beginTransaction();
            try {
                //Correr comando insert
                if (!$stmt->execute()) {
                    show_error(change_lang("admission-send-error"));
                } else {
                    $id = $pdo->lastInsertId();
                    //Guardar os ficheiros
                    if (
                        save_file($id, $nome_motivacao, "motivacao") &&
                        save_file($id, $nome_recomendacao, "recomendacao") &&
                        save_file($id, $nome_cv, "cv") &&
                        save_file($id, $nome_fotografia, "fotografia")
                    ) {
                        $pdo->commit();
                        alert_redirect(change_lang("admission-successful"), "index.php");
                    } else {
                        $pdo->rollBack();
                        show_error(change_lang("admission-send-error"));
                    }
                }
            } catch (Exception $e) {
                $pdo->rollBack();
                show_error(change_lang("admission-send-error"));
            }
        }
    }
}
?>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title><?= change_lang("admission-title") ?></title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</head>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</link>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
<script type="module" src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/esm/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style>
    .container {
        max-width: 850px;
    }

    .has-error label,
    .has-error input,
    .has-error textarea {
        color: red;
        border-color: red;
    }

    .form-group {
        margin-bottom: 40px;
    }

    .list-unstyled li {
        font-size: 13px;
        padding: 4px 0 0;
        color: red;
    }

    .message {
        padding: 10px 20px;
    }

    a {
        color: #212529;
    }

    a:hover {
        color: #212529;
    }

    textarea {
        min-height: 100px;
    }

    .align-option {
        margin-top: 10px;
        display: flex;
        justify-content: end;
        height: 25px;
    }
</style>
<div class="container mt-3">
    <div class="align-option w-100 mb-3">
        <a type="button" class="text-decoration-none pr-2" style="font-weight:<?= $_SESSION["lang"] == "pt" ? "bold" : "normal" ?>;" onclick="confirmChange('pt')">PT</a>
        <a type="button" class="text-decoration-none" style="font-weight: <?= $_SESSION["lang"] == "en" ? "bold" : "normal" ?>;" onclick="confirmChange('en')">EN</a>

    </div>
    <div class="card">
        <div class="card-header">
            <h5 class="mt-2 text-center"><?= change_lang("admission-title") ?></h5>
            <div class="message">
                <span class="text-format-content ">
                    <?= change_lang("admission-msg-1") ?>
                    <br><?= change_lang("admission-msg-2") ?>
                    <br><?= change_lang("admission-msg-3") ?>
                    <span><a href="mailto:sec.techneart@ipt.pt" class="linkified">sec.techneart@ipt.pt</a></span>
            </div>
        </div>
        <div class="card-body">
            <form role="form" data-toggle="validator" action="admissao.php" method="post" enctype="multipart/form-data">
                <?php

                //Colocar os campos de input baseados no array dados
                foreach ($dados as $id => $name) {
                    $placeholder = change_lang("admission-placeholder");
                    $type = "text";
                    if ($id == "dados_email") $type = "email";

                    $value = '';
                    // Verifica se existe um valor POST para colocar no input
                    if (isset($_POST[$id])) {
                        $value = $_POST[$id];
                    }
                    echo "<div class='form-group'>
                    <label>$name</label>
                    <input value='$value' type='$type' id='$id' placeholder='$placeholder' name='$id' minlength='1' required maxlength='255' class='form-control'>
                    <!-- Error -->
                    <div class='help-block with-errors'></div>
                    </div>";
                }
                ?>
                <div class='form-group'>
                    <label><?= change_lang("admission-member-another") ?> </label>
                    <div class="form-check">
                        <input required value="true" class="form-check-input" type="radio" name="dados_pertencer_outro" id="dados_pertencer_outro1" <?php if (isset($_POST['dados_pertencer_outro']) && $_POST['dados_pertencer_outro'] == 'true') {
                                                                                                                                                        echo ' checked';
                                                                                                                                                    } ?>>
                        <label class="form-check-label" for="dados_pertencer_outro1">
                            <?= change_lang("admission-member-yes") ?>
                        </label>
                    </div>
                    <div class="form-check">
                        <input required value="false" class="form-check-input" type="radio" name="dados_pertencer_outro" id="dados_pertencer_outro2" <?php if (isset($_POST['dados_pertencer_outro']) && $_POST['dados_pertencer_outro'] == 'false') {
                                                                                                                                                            echo ' checked';
                                                                                                                                                        } ?>>
                        <label class="form-check-label" for="dados_pertencer_outro2">
                            <?= change_lang("admission-member-no") ?>
                        </label>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>

                <div class='form-group'>
                    <label><?= change_lang("admission-another-centre-info") ?></label>
                    <input type='text' id='dados_outro_texto' placeholder="<?= change_lang("admission-placeholder") ?>" name='dados_outro_texto' minlength='1' class='form-control' value="<?= isset($_POST['dados_outro_texto']) ? $_POST['dados_outro_texto'] : '' ?>">
                    <!-- Error -->
                    <div class='help-block with-errors'></div>
                </div>

                <div class='form-group'>
                    <label><?= change_lang("admission-biography") ?></label>
                    <textarea id='dados_biografia' placeholder="<?= change_lang("admission-placeholder") ?>" name='dados_biografia' required class='form-control'><?= isset($_POST['dados_biografia']) ? $_POST['dados_biografia'] : '' ?></textarea>
                    <!-- Error -->
                    <div class='help-block with-errors'></div>
                </div>

                <?php
                //Colocar os campos files baseados no array dados
                foreach ($files as $id => $name) {
                    echo "<div class='form-group'>
                            <label>$name</label>
                            <input class='form-control' onchange='validateFileSize(this)' type='file' id='$id' name='$id' required >
                            <!-- Error -->
                            <div class='help-block with-errors'></div>
                        </div>";
                }

                ?>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block mb-3"><?= change_lang("admission-submit") ?></button>
                    <button type="button" onclick="window.location.href = 'index.php'" class="btn btn-danger btn-block"><?= change_lang("admission-cancel") ?></button>
                </div>

            </form>
        </div>
    </div>
</div>

<script>
    function confirmChange(language) {
        const confirmed = confirm('Warning: Changing the language will reset all your input. Any unsaved progress will be lost. Are you sure you want to proceed?');
        console.log('Current session language:', <?php echo json_encode($_SESSION["lang"]); ?>);
        fetch(`session_language.php`, {
    	method: "POST",
		headers: {
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        },
		body: `newLanguage=${language}`,
    }).then(async function(response) {
        return response.text().then(async function(text) {
			location.replace(location.href);
        });
    });

        if (!confirmed) {
            event.preventDefault(); // prevent the form from submitting if the user doesn't confirm
        }
    }

    function validateFileSize(input) {
        const fileSize = input.files[0].size;
        const maxFileSize = <?= MAX_FILE_SIZE ?> * 1024 * 1024;
        if (fileSize > maxFileSize) {
            input.setCustomValidity('<?= change_lang("admission-file-size-error") ?>');
        } else {
            input.setCustomValidity('');
        }
    }
</script>