<?php
    $nome, $nascimento, $sexo, $formacao, $profissao, $cpf;

    if (isset($_REQUEST['nome'])) $nome = $_REQUEST['nome']; else echo "<font style='color: red'><strong>Nome</strong> inválido!</font><br />";
    if (isset($_REQUEST['nascimento'])) $nascimento = $_REQUEST['nascimento']; else echo "<font style='color: red'><strong>Nascimento</strong> inválido!</font><br />";
    if (isset($_REQUEST['sexo'])) $sexo = $_REQUEST['sexo']; else echo "<font style='color: red'><strong>Sexo</strong> inválido!</font><br />";
    if (isset($_REQUEST['formacao'])) $formacao = $_REQUEST['formacao']; else echo "<font style='color: red'><strong>Formação</strong> inválida!</font><br />";
    if (isset($_REQUEST['profissao'])) $profissao = $_REQUEST['profissao']; else echo "<font style='color: red'><strong>Profissão</strong> inválida!</font><br />";
    if (isset($_REQUEST['cpf'])) $cpf = $_REQUEST['cpf']; else echo "<font style='color: red'><strong>CPF</strong> inválido!</font><br />";
    
    if (!is_null($nome, $nascimento, $sexo, $formacao, $profissao, $cpf) && in_array($sexo, array("masculino", "feminino"))) {
        $cadastro = new Cadastro($nome, $nascimento, $sexo, $formacao, $profissao, $cpf);
        $cadastro->mostra();
    }

    class Cadastro {
        $nome, $nascimento, $sexo, $formacao, $profissao, $cpf;

        function __construct($nome, $nascimento, $sexo, $formacao, $profissao, $cpf) {
            $this->$nome = $nome;
            $this->$nascimento = $nascimento;
            $this->$sexo = $sexo;
            $this->$formacao = $formacao;
            $this->$profissao = $profissao;
            $this->$cpf = $cpf;
        }

        function mostra() {
            echo "
                <table>
                    <tbody>
                        <tr><td><label>Nome:</label> $this->$nome</td></tr>
                        <tr><td><label>Nascimento:</label> $this->$nascimento</td></tr>
                        <tr><td><label>Formação:</label> $this->$formacao</td></tr>
                        <tr><td><label>Profissão:</label> $this->$profissao</td></tr>
                        <tr><td><label>CPF:</label> $this->$cpf</td></tr>
                        <tr><td><label>Sexo:</label> $this->$sexo</td></tr>
                        <tr><td><img src='$this->src()' width='96' height='96' alt='$this->alt()' /></td></tr>
                    </tbody>
                </table>
            ";
        }

        private function src() {
            return $sexo == "masculino" ? "boy.png" : "girl.png";
        }

        private function alt() {
            return $sexo == "masculino" ? "Homem" : "Mulher";
        }
    }