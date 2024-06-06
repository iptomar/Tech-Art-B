<?php
require "../verifica.php";
require "../config/basedados.php";
require "bloqueador.php";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES["imagem"]) && $_FILES["imagem"]["error"] == UPLOAD_ERR_OK) {
    // Client ID do seu aplicativo do Imgur
    $IMGUR_CLIENT_ID = "";

    // Caminho da imagem a ser enviada
    $image_source = $_FILES["imagem"]["tmp_name"];

    // Iniciar sessão cURL
    $ch = curl_init();

    // Configurar a URL da API do Imgur
    curl_setopt($ch, CURLOPT_URL, 'https://api.imgur.com/3/image');

    // Configurar o método POST
    curl_setopt($ch, CURLOPT_POST, TRUE);

    // Retornar a resposta da solicitação
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);

    // Configurar os cabeçalhos da solicitação com o Client ID
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Authorization: Client-ID ' . $IMGUR_CLIENT_ID));

    // Configurar os campos da solicitação com a imagem codificada em base64
    curl_setopt($ch, CURLOPT_POSTFIELDS, array('image' => base64_encode(file_get_contents($image_source))));

    // Executar a solicitação cURL
    $response = curl_exec($ch);

    // Fechar a sessão cURL
    curl_close($ch);

    // Decodificar a resposta JSON
    $response = json_decode($response, true);

    // Verificar se o upload foi bem-sucedido e obter a URL da imagem
    if ($response && $response['success']) {
        $imageUrl = $response['data']['link'];

        // Inserir a notícia no banco de dados com a URL da imagem do Imgur
        $sql = "INSERT INTO noticias (titulo, titulo_en, conteudo, conteudo_en, imagem, data, ultimo_editor) " .
            "VALUES (?,?,?,?,?,?,?)";
        $stmt = mysqli_prepare($conn, $sql);
        $titulo = $_POST["titulo"];
        $titulo_en = $_POST["titulo_en"];
        $conteudo = $_POST["conteudo"];
        $conteudo_en = $_POST["conteudo_en"];
        $imagem = $imageUrl;
        $data = $_POST["data"];
        $ultimo_editor = $_SESSION["adminid"];

        mysqli_stmt_bind_param($stmt, 'ssssssi', $titulo, $titulo_en, $conteudo, $conteudo_en, $imagem, $data, $ultimo_editor);
        if (mysqli_stmt_execute($stmt)) {
            header('Location: index.php');
            exit;
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
    } else {
        // O upload falhou ou a resposta não foi a esperada
        echo "Erro ao enviar a imagem para o Imgur.";
    }
}
?>


<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</link>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
<script type="text/javascript">
    function previewImg(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#preview').attr('src', e.target.result);
                $('#preview').show();
            }
            reader.readAsDataURL(input.files[0]);
        } else {
            $('#preview').attr('src', '');
            $('#preview').hide();
        }
    }
</script>
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

    .ck-editor__editable {
        min-height: 200px;
    }

    .halfCol {
        max-width: 50%;
        display: inline-block;
        vertical-align: top;
        height: fit-content;
    }
</style>

<div class="container-xl mt-5">
    <div class="card">
        <h5 class="card-header text-center">Adicionar Notícia</h5>
        <div class="card-body">
            <form role="form" data-toggle="validator" action="create.php" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Data da notícia</label>
                    <input type="date" class="form-control" id="inputDate" required name="data" value="<?php echo date('Y-m-d'); ?>">
                    <!-- Error -->
                    <div class="help-block with-errors"></div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Titulo</label>
                            <input type="text" minlength="1" required maxlength="100" name="titulo" class="form-control" data-error="Por favor adicione um titulo válido" id="inputTitle" placeholder="Titulo">
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Titulo (Inglês)</label>
                            <input type="text" maxlength="100" name="titulo_en" class="form-control" placeholder="Titulo (Inglês)">
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col halfCol">
                        <div class="form-group">
                            <label>Conteúdo da notícia</label>
                            <textarea class="form-control ck_replace" cols="30" rows="5" data-error="Por favor adicione o conteudo da noticia" id="inputContent" name="conteudo"></textarea>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>

                    </div>
                    <div class="col halfCol">
                        <div class="form-group">
                            <label>Conteúdo (Inglês)</label>
                            <textarea class="form-control ck_replace" cols="30" rows="5" id="inputContentEn" name="conteudo_en"></textarea>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>

                    </div>
                </div>


                <div class="form-group">
                    <label>Imagem</label>
                    <input type="file" accept="image/*" onchange="previewImg(this);" data-error="Por favor adicione uma imagem" required class="form-control" id="inputImage" name="imagem">
                    <!-- Error -->
                    <div class="help-block with-errors"></div>
                </div>
                <img id="preview" style="display: none;" width='100px' height='100px' class="mb-3" />



                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Criar</button>
                </div>

                <div class="form-group">
                    <button type="button" onclick="window.location.href = 'index.php'" class="btn btn-danger btn-block">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!--Criar o CKEditor 5-->
<script src="../ckeditor5/build/ckeditor.js"></script>
<script>
    $(document).ready(function() {
        $('.ck_replace').each(function() {
            ClassicEditor.create(this, {
                licenseKey: '',
                simpleUpload: {
                    uploadUrl: '../ckeditor5/upload_image.php'
                }
            }).then(editor => {
                window.editor = editor;
            });
        });
    });

    $('#inputDate').on("change", function(e) {
        var inputDate = $(this).val();
        console.log("TESTING")
        // Check if the input value is a valid date
        if (!isValidDate(inputDate)) {
            console.log("NOT VALID")

            e.currentTarget.setCustomValidity('Por favor adicione uma data válida');
        } else {

            e.currentTarget.setCustomValidity('');
        }
    });

    function isValidDate(dateString) {
        var dateRegex = /^\d{4}-\d{2}-\d{2}$/;
        if (!dateRegex.test(dateString)) {
            return false;
        }
        var date = new Date(dateString);
        if (isNaN(date.getTime())) {
            return false;
        }
        return true;
    }
</script>

<?php
mysqli_close($conn);
?>
