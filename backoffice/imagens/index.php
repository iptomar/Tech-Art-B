<?php
require "../verifica.php";
require "../config/basedados.php";

// Selecionar os dados das imagens da base de dados
$sql = "SELECT id, titulo, imagem FROM imagens_home";
$result = mysqli_query($conn, $sql);
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
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Título</th>
                        <th>Imagem</th>
                    </tr>
                </thead>

                <tbody>
                    <?php
                    if (mysqli_num_rows($result) > 0) {
                        while ($row = mysqli_fetch_assoc($result)) {
                            echo "<tr>";
                            echo "<td style='width:250px;'>" . $row["titulo"] . "</td>";
                            echo "<td><img src='" . $row["imagem"] . "' width='100px' height='100px'></td>";
                            if ($_SESSION["autenticado"] == "administrador") {
                                echo "<td><a href='edit.php?id=" . $row["id"] . "' class='btn btn-primary'><span>Alterar</span></a></td>";
                                echo "<td><a href='remove.php?id=" . $row["id"] . "' class='btn btn-danger'><span>Apagar</span></a></td>";
                            }
                            echo "</tr>";
                        }
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<?php
mysqli_close($conn);
?>
