<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Aula 19/08/2019</title>
	</head>
	<body>
		<center>
			<h1>Boletim</h1>
			<form action="boletim.php" method="post">
				<label>Nota A1:</label><br />
				<input type="number" name="a1" min="0" max="10" value="0" step="0.01" /><br /><br />
				<label>Nota A2:</label><br />
				<input type="number" name="a2" min="0" max="10" value="0" step="0.01" /><br /><br />
				<br />
				<label>Adicional (até 2 pontos):</label><br />
				<input type="number" name="extra" min="0" max="2" value="0" step="0.01" /><br /><br />
				<button type="submit">Verificar</button> <button type="reset">Resetar</button>
			</form>
		</center>
	</body>
</html>