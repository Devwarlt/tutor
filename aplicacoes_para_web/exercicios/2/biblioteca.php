<?php
    include_once("livros.php");

    echo '<html><head><meta charset="utf-8" /></head><body><center>';

    $nomeLivro = "";
    $tipoUsuario = "";

    if (isset($_POST["livro"])) $nomeLivro = $_POST["livro"];
    if (isset($_POST["usuario"])) $tipoUsuario = $_POST["usuario"];

    $result = "";

    if (!Biblioteca::validaLivro($nomeLivro) || !Biblioteca::validaUsuario($tipoUsuario)) $result = "<strong>Livro</strong> ou <strong>Tipo de usuário</strong> inválidos!";
    else {
        $emprestimo = new EmprestimoLivro();
        $emprestimo->nomeLivro = $nomeLivro;
        $emprestimo->tipoUsuario = $tipoUsuario;
        $emprestimo->dataEmprestimo = $emprestimo->emprestimo($emprestimo->tipoUsuario);
        $result = $emprestimo->imprimir($emprestimo->nomeLivro, $emprestimo->tipoUsuario, $emprestimo->dataEmprestimo);
    }

    echo "$result<br/><hr /><br /><button onClick=\"window.history.back()\">Voltar</button></center></body></html>";

    class EmprestimoLivro {
        public $nomeLivro;
        public $tipoUsuario;
        public $dataEmprestimo;

        function emprestimo($usuario) {
            return date('d/m/Y', strtotime('+' . Biblioteca::$usuarios[$usuario] == Biblioteca::$usuarios["professor"] ? '10' : '3' . ' days'));
        }
        
        function imprimir($livro, $usuario, $emprestimo) {
            return "<strong>Nome do livro:</strong> " . Biblioteca::$livros[$livro] . "<br /><strong>Tipo de usuário:</strong> " . Biblioteca::$usuarios[$usuario] . "<br /><strong>Devolução:</strong> $emprestimo<br />";
        }
    }