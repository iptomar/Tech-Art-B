<?php
require "../verifica.php";
require "../config/basedados.php";
//Selecionar os dados das noticias da base de dados
$sql = "SELECT id, titulo, conteudo, data, imagem FROM noticias ORDER BY DATA DESC, titulo";
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
						<h2>Notícias</h2>
					</div>
					<div class="col-sm-6">
						<?php
						if ($_SESSION["autenticado"] == "administrador") {
							echo '<a href="create.php" class="btn btn-success"><i class="material-icons">&#xE147;</i>';
							echo '<span>Adicionar Nova Notícia</span></a>';
							echo '<a href="newsletter.php" class="btn btn-success"><i class="material-icons">&#xE0E1;</i>';
							echo '<span>Enviar Newsletter</span></a>';
						}else{
							
						}
						?>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Título</th>
						<th>Conteúdo</th>
						<th>Data</th>
						<th>Imagem</th>
					</tr>
				</thead>

				<tbody>
					<?php
					if (mysqli_num_rows($result) > 0) {
						while ($row = mysqli_fetch_assoc($result)) {
							echo "<tr>";
							echo "<td style='width:250px;'>" . $row["titulo"] . "</td>";
							echo "<td style='width:500px; height:100px;'>" . "<div class='div-textarea' style='width:100%; height:100%;'>" . $row["conteudo"] . "</div>" . "</td>";
							echo "<td style='width:250px;'>" . $row["data"] . "</td>";
							echo "<td><img src='../assets/noticias/$row[imagem]' width = '100px' height = '100px'></td>";
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