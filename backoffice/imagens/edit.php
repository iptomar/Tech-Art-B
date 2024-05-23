<?php
require "../verifica.php";
require "../config/basedados.php";

$filesDir = "./uploads/";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Handle file upload
    if (isset($_FILES["imagem"])) {
        // Check for upload errors
        if ($_FILES["imagem"]["error"] !== UPLOAD_ERR_OK) {
            echo "Erro ao fazer o upload do arquivo.";
            exit();
        }

        // Validate file type
        $allowedTypes = ['image/jpeg'];
        if (!in_array($_FILES["imagem"]["type"], $allowedTypes)) {
            echo "Erro: Apenas arquivos JPG são permitidos.";
            exit();
        }

        // Validate file extension
        $fileExtension = pathinfo($_FILES["imagem"]["name"], PATHINFO_EXTENSION);
        if (strtolower($fileExtension) !== 'jpg') {
            echo "Erro: Apenas arquivos com extensão .jpg  ou .jpeg são permitidos.";
            exit();
        }

        // Check if the title matches any of Imagem1, Imagem2, or Imagem3
        $id = $_POST["id"];
        $titulo = $_POST["titulo"];
        $fileName = '';

        if ($titulo === 'Imagem1') {
            $fileName = 'Imagem1';
        } elseif ($titulo === 'Imagem2') {
            $fileName = 'Imagem2';
        } elseif ($titulo === 'Imagem3') {
            $fileName = 'Imagem3';
        }

        // Create the complete file path
        $targetFilePath = $filesDir . $fileName . '.' . $fileExtension;

        // Move the uploaded file to the uploads directory
        if (move_uploaded_file($_FILES["imagem"]["tmp_name"], $targetFilePath)) {
            // Prepare the SQL statement to update the image path and uploaded_on timestamp
            $sql = "UPDATE imagens_home SET imagem = ?, uploaded_on = NOW() WHERE id = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, 'si', $targetFilePath, $id);

            if (mysqli_stmt_execute($stmt)) {
                echo "Imagem carregada com sucesso: $fileName<br>";
                header('Location: index.php');
                exit();
            } else {
                echo "Erro ao carregar imagem: $fileName<br>";
            }
        } else {
            echo "Erro ao mover o arquivo para o diretório de uploads.";
        }
    }
} else {
    $sql = "SELECT titulo, imagem FROM imagens_home WHERE id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);
    $id = $_GET["id"];

    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $row = mysqli_fetch_assoc($result);
    $titulo = $row["titulo"];
    $imagem = $row["imagem"];
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

<div class="container-xl mt-5">
    <div class="card">
        <h5 class="card-header text-center">Editar Imagem</h5>
        <div class="card-body">
            <form role="form" data-toggle="validator" action="edit.php" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="<?php echo $id; ?>">
                <input type="hidden" name="current_image" value="<?php echo $imagem; ?>">
                <input type="hidden" name="titulo" value="<?php echo $titulo; ?>">

                <div class="form-group">
                    <label>Título</label>
                    <input type="text" readonly name="titulo_display" class="form-control" value="<?php echo $titulo; ?>">
                </div>

                <div class="form-group">
                    <label>Imagem Atual</label>
                    <div><img src="<?php echo $imagem; ?>" width="100px" height="100px"></div>
                </div>

                <div class="form-group">
                    <label>Nova Imagem(formato .jpg)</label>
                    <input type="file" name="imagem" class="form-control" accept=".jpg,image/jpeg">
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Gravar</button>
                </div>

                <div class="form-group">
                    <button type="button" onclick="window.location.href = 'index.php'" class="btn btn-danger btn-block">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php
mysqli_close($conn);
?>
