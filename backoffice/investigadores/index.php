<?php
require "../verifica.php";
require "../config/basedados.php";

$find = "";


$sql = "SELECT id, nome, email, ciencia_id, sobre, tipo, fotografia, areasdeinteresse, orcid, scholar FROM investigadores 
ORDER BY CASE WHEN tipo = 'Externo' THEN 1 ELSE 0 END, tipo DESC, nome;";
$result = mysqli_query($conn, $sql);

if (isset($_POST["anoRelatorio"])) {
	$_SESSION["anoRelatorio"] = $_POST["anoRelatorio"];
}

?>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</link>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Round">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="../assets/js/citation-js-0.6.8.js"></script>

<style type="text/css">
	<?php
	$css = file_get_contents('../styleBackoffices.css');
	echo $css;
	?>
</style>
<?php
if (@$_SESSION["anoRelatorio"] != "") {
	$anoAtual = $_SESSION["anoRelatorio"];
} else {
	$anoAtual = date("Y");
}
?>
<div class="container mt-3">
	<form id="formAnoRelatorio">

		<input required name="anoRelatorio" type="number" class="form-control mr-2" placeholder="Ano do relatório" min="1950" max="2999" step="1" pattern="\d{4}" data-error="Por favor insira um ano válido" style="max-width: 200px; min-width: 160px; display: inline-block;" value="<?= $anoAtual ?>" />
		<input type="submit" value="Selecionar Ano" class="btn btn-success" />
		<!-- Barra de Pesquisa -->
        <input id="searchInput" type="text" class="form-control ml-2" placeholder="Pesquisar Investigadores" style="max-width: 300px; display: inline-block;">

		<?php
		if (isset($_SESSION["anoRelatorio"])) {
			if (@$_SESSION["anoRelatorio"] != "") {
			} else {
				$_SESSION["anoRelatorio"] = date("Y");
			}
		} else {
			$msg = "Ano Atual: " . date("Y");
		}
		?>
	</form>

</div>


<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Investigadores/as</h2>
					</div>
					<?php if ($_SESSION["autenticado"] == 'administrador') { ?>
						<div class="col-sm-6">
							<a href="create.php" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Adicionar Novo Perfil</span></a>
						</div>
					<?php } ?>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Tipo</th>
						<th>Nome</th>
						<th>Email</th>
						<th>CiênciaVitae ID</th>
						<!--<th>Sobre</th>
						<th>Áreas de interesse</th>
						<th>Orcid</th>
						<th>Scholar</th> -->
						<th>Fotografia</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
					<?php
					if (mysqli_num_rows($result) > 0) {
						while ($row = mysqli_fetch_assoc($result)) {
							if ($_SESSION["autenticado"] == 'administrador' || $_SESSION["autenticado"] == $row["id"]) {
								echo "<tr>";
								echo "<td>" . $row["tipo"] . "</td>";
								echo "<td>" . $row["nome"] . "</td>";
								echo "<td>" . $row["email"] . "</td>";
								echo "<td>" . $row["ciencia_id"] . "</td>";
								/*                         echo "<td>".$row["sobre"]."</td>";
								echo "<td>".$row["tipo"]."</td>";
								echo "<td>".$row["areasdeinteresse"]."</td>";
								echo "<td>".$row["orcid"]."</td>";
								echo "<td>".$row["scholar"]."</td>";
								*/
								echo "<td><img src='../assets/investigadores/$row[fotografia]' width = '100px' height = '100px'></td>";
								echo "<td style='min-width:250px;'><a href='edit.php?id=" . $row["id"] . "' class='w-100 mb-1 btn btn-primary'><span>Alterar</span></a>";
								if ($_SESSION["autenticado"] == 'administrador') {
									echo "<a href='remove.php?id=" . $row["id"] . "' class='w-100 mb-1 btn btn-danger'><span>Apagar</span></a><br>";
								}
								if ($row["tipo"] != "Externo") {
									echo "<a href='resetpassword.php?id=" . $row["id"] . "' class='w-100 mb-1 btn btn-warning'><span>Alterar Password</span></a><br>";
									echo "<a data-id='" . $row["id"] . "' class='gerarRelatorio w-100 mb-1 btn btn-info'><span>Gerar Relatório</span></a><br>";
									echo "<a href='publicacoes.php?id=" . $row["id"] . "' class='w-100 mb-1 btn btn-secondary'><span>Selecionar Publicações</span></a><br>";
								}
								echo "</td>";
								echo "</tr>";
							}
						}
					}
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
    // Quando o documento estiver totalmente carregado
    $(document).ready(function() {
        // Filtragem feita de acordo com cada letra escrita
        $('#searchInput').on('input', function() {
            searchTable($(this).val().toLowerCase());
        });

        // Função para filtrar a tabela de investigadores com base no nome
        function searchTable(input) {
            $('tbody tr').each(function() {
                var nome = $(this).find('td:eq(1)').text().toLowerCase(); // Pega o texto na coluna de nome
                if (nome.includes(input)) { // Verifica se o nome contém o texto de entrada
                    $(this).show(); // Exibe a linha se corresponder
                } else {
                    $(this).hide(); // Oculta a linha se não corresponder
                }
            });
        }
    });
</script>
<script>$(document).ready(function() {
    // Filtragem feita de acordo com cada letra escrita
    $('#searchInput').on('input', function() {
        searchTable($(this).val().toLowerCase());
    });

    // Função para filtrar a tabela de investigadores com base no nome
    function searchTable(input) {
        $('tbody tr').each(function() {
            var nome = $(this).find('td:eq(1)').text().toLowerCase(); // Pega o texto na coluna de nome
            if (nome.includes(input)) { // Verifica se o nome contém o texto de entrada
                $(this).show(); // Exibe a linha se corresponder
            } else {
                $(this).hide(); // Oculta a linha se não corresponder
            }
        });
    }
});
</script>

<script>
	const Cite = require('citation-js');
	// Quando o documento estiver totalmente carregado
	$(document).ready(function() {
		// Quando um elemento com o id 'formAnoRelatorio' for submetido
		$("#formAnoRelatorio").submit(function(event) {
			// Prevenir a submissão 
			event.preventDefault();
			//Verificar se o formulário é valido
			if (this.checkValidity() === true) {
				//Obter o ano colocado no input
				var anoRelatorio = $("input[name='anoRelatorio']").val();
				//Actualizar a variavel de sessão usando AJAX
				$.ajax({
					type: "POST",
					url: "ajax.php",
					data: {
						anoRelatorio: anoRelatorio
					},
					success: function(response) {
						$("input[name='anoRelatorio']").val(response.ano);

						var anoSpan = document.getElementById("anoSpan");
						if (anoSpan.className = "text-info") {
							// Update the class and content
							anoSpan.className = "text-danger"; // Change the class
							$("#anoSymbol").html("&#xE002;");

						}

						$("#anoSubmit").html(response.msg);

					},
					error: function(xhr, status, error) {
						console.error(xhr, status, error);
					}
				});
			}
		});

		// Quando um elemento com a classe 'gerarRelatorio' for clicado
		$('.gerarRelatorio').on('click', function(e) {

			e.preventDefault(); // Impede o comportamento padrão do link

			// Obter o ID do investigador a partir do atributo de dados
			var investigatorId = $(this).data('id');

			// Fazer um pedido AJAX para iniciar a geração do relatório
			$.ajax({
				type: 'POST',
				url: 'ajax.php',
				data: {
					idGerar: investigatorId
				},
				success: function(response) {

					var reportData = response;
					// Aceder aos dados 'publicacoes' e 'patents' de reportData
					var publications = reportData.publicacoes;
					var patents = reportData.patents;

					// Obter a referência APA das publicações
					for (var i = 0; i < publications.length; i++) {
						var APAreference = processarAPA(publications[i].dados);
						publications[i].dados = APAreference;
					}

					// Obter a referência APA das patentes
					for (var i = 0; i < patents.length; i++) {
						var APAreference = processarAPA(patents[i].dados);
						patents[i].dados = APAreference;
					}

					function processarAPA(data) {
						// Lógica de processamento do "citation.js"
						var htmlContent = new Cite(data).format('bibliography', {
							format: 'html',
							template: 'apa',
							lang: 'en-US'
						});
						return htmlContent;
					}

					// Criar um elemento de formulário
					var form = document.createElement('form');
					form.method = 'POST';
					form.action = 'autoEscreveRelatorio.php?id=' + investigatorId;

					// Criar um elemento de input para armazenar as publicações
					var input = document.createElement('input');
					input.type = 'hidden';
					input.name = 'publicacoes';
					input.value = JSON.stringify(publications);

					// Anexar o input 'publicacoes' ao formulário
					form.appendChild(input);

					var inputPat = document.createElement('input');
					inputPat.type = 'hidden';
					inputPat.name = 'patentes';
					inputPat.value = JSON.stringify(patents);

					// Anexar o input 'patentes' ao formulário
					form.appendChild(inputPat);

					// Anexar o formulário ao corpo do documento
					document.body.appendChild(form);

					// Submeter o formulário
					form.submit();
				},
				error: function(xhr, status, error) {
					console.error(xhr.responseText);
				}
			});
		});
	});
</script>