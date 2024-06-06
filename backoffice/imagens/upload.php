<?php
require "../verifica.php";
require "../config/basedados.php";

$filesDir = "./uploads/";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES["fotografia"])) {
    // Verificar se ocorreu algum erro durante o upload
    if ($_FILES["fotografia"]["error"] !== UPLOAD_ERR_OK) {
        echo "Erro ao fazer o upload do arquivo.";
        exit();
    }

    // Definir o nome da imagem como "Imagem1"
    $fileName = "Imagem3";

    // Obter a extensão do arquivo
    $fileExtension = pathinfo($_FILES["fotografia"]["name"], PATHINFO_EXTENSION);

    // Criar o caminho completo para a imagem
    $targetFilePath = $filesDir . $fileName . '.' . $fileExtension;

    // Mover o arquivo para o diretório de uploads
    if (move_uploaded_file($_FILES["fotografia"]["tmp_name"], $targetFilePath)) {
        // Prepare a declaração SQL
        $sql = "INSERT INTO imagens_home (titulo, imagem, uploaded_on) VALUES (?, ?, NOW())";
        $stmt = mysqli_prepare($conn, $sql);

        // Vincular parâmetros
        mysqli_stmt_bind_param($stmt, "ss", $fileName, $targetFilePath);

        // Executar a declaração
        if (mysqli_stmt_execute($stmt)) {
            echo "Imagem carregada com sucesso: $fileName<br>";
        } else {
            echo "Erro ao carregar imagem: $fileName<br>";
        }
    } else {
        echo "Erro ao mover o arquivo para o diretório de uploads.";
    }
}
?>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style type="text/css">
    <?php
    $css = file_get_contents('../styleBackoffices.css');
    echo $css;
    ?>.div-textarea {
        display: block;
        padding: 5px 10px;
        border: 1px solid lightgray;
        resize: vertical;
        overflow: auto;
        resize: vertical;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        color: #495057;
    }
</style>

<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Imagens Home Page</h2>
                    </div>
                </div>
            </div>
            <!-- Formulário para fazer upload de imagem -->
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="fotografia">Escolher imagem:</label>
                    <input type="file" class="form-control-file" id="fotografia" name="fotografia">
                </div>
                <button type="submit" class="btn btn-primary" name="upload_image">Enviar</button>
            </form>
            <?php if (isset($message)) { ?>
                <div class="alert alert-success" role="alert">
                    <?php echo $message; ?>
                </div>
            <?php } ?>
            <?php if (isset($error)) { ?>
                <div class="alert alert-danger" role="alert">
                    <?php echo $error; ?>
                </div>
            <?php } ?>
        </div>
    </div>
</div>

<?php
mysqli_close($conn);
?>
