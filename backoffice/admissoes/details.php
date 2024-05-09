<?php
require "../verifica.php";
require "../config/basedados.php";
require "bloqueador.php";

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
            <div class="form-group">
                <label for="nome_completo">Data Submissão:</label>
                <input type="text" class="form-control" id="nome_completo" value="<?= date("d-m-Y H:i", strtotime($row['data_criacao'])) ?>" readonly>
            </div>
            <div class="form-group">
                <label for="nome_completo">Nome Completo:</label>
                <input type="text" class="form-control" id="nome_completo" value="<?= $row['nome_completo']; ?>" readonly>
            </div>

            <div class="form-group">
                <label for="nome_profissional">Nome Profissional:</label>
                <input type="text" class="form-control" id="nome_profissional" value="<?= $row['nome_profissional']; ?>" readonly>
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
                <input type="text" class="form-control" id="grau_academico" value="<?= $row['grau_academico']; ?>" readonly>
            </div>

            <div class="form-group">
                <label for="ano_conclusao_academico">Ano de conclusão do grau académico:</label>
                <input type="text" class="form-control" id="ano_conclusao_academico" value="<?= $row['ano_conclusao_academico']; ?>" readonly>
            </div>

            <div class="form-group">
                <label for="area_academico">Área de especialização do Grau Académico:</label>
                <input type="text" class="form-control" id="area_academico" value="<?= $row['area_academico']; ?>" readonly>
            </div>

            <div class="form-group">
                <label for="area_investigacao">Principais áreas de Investigação:</label>
                <input type="text" class="form-control" id="area_investigacao" value="<?= $row['area_investigacao']; ?>" readonly>
            </div>
            <div class="form-group">
                <label for="instituicao_vinculo">Instituição de vínculo (data de início e fim, se aplicável [dd/mm/aaaa]):</label>
                <input type="text" class="form-control" id="instituicao_vinculo" name="instituicao_vinculo" value="<?= $row['instituicao_vinculo']; ?>" readonly>
            </div>
            <div class="form-group">
                <label for="percentagem_dedicacao">Percentagem de dedicação ao TECHN&ART:</label>
                <input type="text" class="form-control" id="percentagem_dedicacao" name="percentagem_dedicacao" value="<?= $row['percentagem_dedicacao']; ?>" readonly>
            </div>
            <div class="form-group">
                <label for="pertencer_outro">Pertence a outro centro de investigação e desenvolvimento?</label>
                <input type="text" class="form-control" id="pertencer_outro" name="pertencer_outro" value="<?= $row['pertencer_outro'] ? 'Sim' : 'Não'; ?>" readonly>
            </div>
            <div class="form-group">
                <label for="outro_texto">Se sim, indique qual:</label>
                <input type="text" class="form-control" id="outro_texto" name="outro_texto" value="<?= $row['outro_texto']; ?>" readonly>
            </div>
            <div class="form-group">
                <label for="biografia">Biografia:</label>
                <textarea class="form-control" id="biografia" name="biografia" rows="5" readonly><?= $row['biografia']; ?></textarea>
            </div>
            <div class="form-group">
                <form action="download.php" method="post">
                    <label for="ficheiro">Ficheiro de motivação:</label>
                    <input type="hidden" class="form-control" id="path" name="path" value="<?= $file_path ?>">
                    <input type="hidden" class="form-control" id="ficheiro" name="ficheiro" value="<?= $row['ficheiro_motivacao']; ?>"><br>
                    <a target="_blank" class="mr-2 btn btn-primary" href="<?= $file_path . $row['ficheiro_motivacao']; ?>">Abrir</a>
                    <button class="btn btn-primary" type="submit">Download</button>
                </form>
            </div>
            <div class="form-group">
                <form action="download.php" method="post">
                    <label for="ficheiro">Ficheiro de recomendação:</label>
                    <input type="hidden" class="form-control" id="path" name="path" value="<?= $file_path ?>">
                    <input type="hidden" class="form-control" id="ficheiro" name="ficheiro" value="<?= $row['ficheiro_recomendacao']; ?>"><br>
                    <a target="_blank" class="mr-2 btn btn-primary" href="<?= $file_path . $row['ficheiro_recomendacao']; ?>">Abrir</a>
                    <button class="btn btn-primary" type="submit">Download</button>
                </form>
            </div>
            <div class="form-group">
                <form action="download.php" method="post">
                    <label for="ficheiro">Ficheiro CV:</label>
                    <input type="hidden" class="form-control" id="path" name="path" value="<?= $file_path ?>">
                    <input type="hidden" class="form-control" id="ficheiro" name="ficheiro" value="<?= $row['ficheiro_cv']; ?>"><br>
                    <a target="_blank" class="mr-2 btn btn-primary" href="<?= $file_path . $row['ficheiro_cv']; ?>">Abrir</a>
                    <button class="btn btn-primary" type="submit">Download</button>
                </form>
            </div>

            <div class="form-group">
                <form action="download.php" method="post">
                    <label for="ficheiro">Ficheiro Fotografia:</label>
                    <input type="hidden" class="form-control" id="path" name="path" value="<?= $file_path ?>">
                    <input type="hidden" class="form-control" id="ficheiro" name="ficheiro" value="<?= $row['ficheiro_fotografia']; ?>"><br>
                    <a target="_blank" class="mr-2 btn btn-primary" href="<?= $file_path . $row['ficheiro_fotografia']; ?>">Abrir</a>
                    <button class="btn btn-primary" type="submit">Download</button>
                </form>
            </div>
        </div>
    </div>
</div>
<?php
mysqli_close($conn);
?>