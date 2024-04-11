<?php
require "../verifica.php";
require "../config/basedados.php";
require "bloqueador.php";

$mainDir = "../assets/projetos/";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST["id"];
    $sql = "DELETE FROM investigadores_projetos WHERE projetos_id = " . $id;
    mysqli_query($conn, $sql);
    $sql = "delete from projetos where id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);
    if (mysqli_stmt_execute($stmt)) {
        header('Location: index.php');
        exit;
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
} else {
    $sql = "SELECT p.*, i.nome as gestor
            FROM projetos p 
            INNER JOIN investigadores i ON p.gestor = i.id
            WHERE p.id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);
    $id = $_GET["id"];
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $row = mysqli_fetch_assoc($result);
    $nome = $row["nome"];
    $descricao = $row["descricao"];
    $sobreprojeto = $row["sobreprojeto"];
    $referencia = $row["referencia"];
    $fotografia = $row["fotografia"];
    $areapreferencial = $row["areapreferencial"];
    $financiamento = $row["financiamento"];
    $ambito = $row["ambito"];
    $concluido = $row["concluido"] ? "checked" : "";
    $site = $row["site"];
    $facebook = $row["facebook"];
    $nome_en = $row["nome_en"];
    $descricao_en = $row["descricao_en"];
    $sobreprojeto_en = $row["sobreprojeto_en"];
    $referencia_en = $row["referencia_en"];
    $areapreferencial_en = $row["areapreferencial_en"];
    $financiamento_en = $row["financiamento_en"];
    $ambito_en = $row["ambito_en"];
    $site_en = $row["site_en"];
    $facebook_en = $row["facebook_en"];
    $gestor = $row["gestor"];
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

    .ck-content {
        overflow: auto;
    }

    .ck-content .image {
        clear: both;
        display: table;
        margin: 0.9em auto;
        min-width: 50px;
        text-align: center;
    }

    .ck-content .image-style-side {
        margin-top: 0;
        float: right;
        max-width: 50%;
    }

    .ck-content img {
        max-width: 100%;
        max-height: 100%;
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
        <h5 class="card-header text-center">Remover Projeto</h5>
        <div class="card-body">
            <form role="form" data-toggle="validator" action="remove.php?id=<?php echo $id; ?>" method="post">

                <input type="hidden" name="id" value=<?php echo $id; ?>>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="1" id="concluido" name="concluido"
                            <?= $concluido ?> disabled>
                        <label class="form-check-label" for="concluido">
                            Concluído
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Nome</label>
                            <input type="text" name="nome" class="form-control" id="inputName"
                                value="<?php echo $nome; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Nome (Inglês)</label>
                            <input type="text" name="nome_en" class="form-control" id="inputNameEn"
                                value="<?php echo $nome_en; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Descrição</label>
                            <textarea class="form-control" id="inputDescricao" name="descricao"
                                readonly><?php echo $descricao; ?></textarea>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Descrição (Inglês)</label>
                            <textarea class="form-control" id="inputDescricaoEn" name="descricao_en"
                                readonly><?php echo $descricao_en; ?></textarea>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col halfCol">
                        <div class="form-group">
                            <label>Sobre Projeto</label>
                            <div readonly class="form-control ck-content" style="width:100%; height:100%;">
                                <?php echo $sobreprojeto; ?>
                            </div>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col halfCol">
                        <div class="form-group">
                            <label>Sobre Projeto (Inglês)</label>
                            <div readonly class="form-control ck-content" style="width:100%; height:100%;">
                                <?php echo $sobreprojeto_en; ?>
                            </div>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Referência</label>
                            <input type="text" class="form-control" id="inputReferencia" name="referencia"
                                value="<?php echo $referencia; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Referência (Inglês)</label>
                            <input type="text" class="form-control" id="inputReferenciaEn" name="referencia_en"
                                value="<?php echo $referencia_en; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>TECHN&ART área preferencial</label>
                            <input type="text" class="form-control" id="inputAreaPreferencial" name="areapreferencial"
                                value="<?php echo $areapreferencial; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>TECHN&ART área preferencial (Inglês)</label>
                            <input type="text" class="form-control" id="inputAreaPreferencialEn"
                                name="areapreferencial_en" value="<?php echo $areapreferencial_en; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Financiamento</label>
                            <input type="text" class="form-control" id="inputFinanciamento" name="financiamento"
                                value="<?php echo $financiamento; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Financiamento (Inglês)</label>
                            <input type="text" class="form-control" id="inputFinanciamentoEn" name="financiamento_en"
                                value="<?php echo $financiamento_en; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Âmbito</label>
                            <input type="text" class="form-control" id="inputAmbito" name="ambito"
                                value="<?php echo $ambito; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Âmbito (Inglês)</label>
                            <input type="text" class="form-control" id="inputAmbitoEn" name="ambito_en"
                                value="<?php echo $ambito_en; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Site</label>
                            <input type="text" class="form-control" id="inputSite" name="site"
                                value="<?php echo $site; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Site (Inglês)</label>
                            <input type="text" class="form-control" id="inputSiteEn" name="site_en"
                                value="<?php echo $site_en; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Facebook</label>
                            <input type="text" class="form-control" id="inputFace" name="facebook"
                                value="<?php echo $facebook; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Facebook (Inglês)</label>
                            <input type="text" class="form-control" id="inputFaceEn" name="facebook_en"
                                value="<?php echo $facebook_en; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Gestor do Projeto</label>
                            <input type="text" class="form-control" value="<?php echo $gestor; ?>" readonly>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                        </div>
                    </div>
                </div>

                <img id="preview" src="<?php echo $mainDir . $fotografia; ?>" width='100px' height='100px'
                    class="mb-2 mt-3" /><br>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Confirmar</button>
                </div>

                <div class="form-group">
                    <button type="button" onclick="window.location.href = 'index.php'"
                        class="btn btn-danger btn-block">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php
mysqli_close($conn);
?>