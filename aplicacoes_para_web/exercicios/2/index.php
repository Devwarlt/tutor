<?php include_once("livros.php"); ?>
<!doctype html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Exercício 1 - (2)</title>
</head>

<body>
    <center>
        <form method="POST" action="biblioteca.php">
            <label>Nome do livro:</label><br />
            <select name="livro">
                <option value="???" selected disabled>tipo de usuário</option>
                <?php foreach (Biblioteca::$livros as $livro => $nome) echo "<option value=\"" . $livro . "\">$nome</option>"; ?>
            </select>
            <br /><br />
            <label>Tipo de usuário:</label><br />
            <select name="usuario">
                <option value="???" selected disabled>tipo de usuário</option>
                <?php foreach (Biblioteca::$usuarios as $usuario => $nome) echo "<option value=\"" . $usuario . "\">$nome</option>"; ?>
            </select>
            <br /><br />
            <button type="submit">Dados</button>
            <button type="reset">Resetar</button>
        </form>
    </center>
</body>

</html>