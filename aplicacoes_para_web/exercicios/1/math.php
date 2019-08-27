<?php
    echo '<html><head><meta charset="utf-8" /></head><body><center>';

    $numero1 = $_POST["numero1"];
    $numero2 = $_POST["numero2"];
    $operador = $_POST["operador"];

    if (!isset($numero1)) $numero1 = "invalido";
    if (!isset($numero2)) $numero2 = "invalido";
    if (!isset($operador)) $operador = "invalido";
    
    if ($numero1 == "invalido" || $numero2 == "invalido" || $operador == "invalido"
        || !Matematica::validaNumero($numero1, $numero2) || !Matematica::validaOperador($operador)) {
        echo "Argumentos inválidos!";
    }
    else {
        $math = new Matematica();
        $math->$numero1 = $numero1;
        $math->$numero2 = $numero2;
        
        $ops = Matematica::$operadores;
        $result = "";
    
        switch ($operador) {
            case $ops["maior"]: $result = $math->maiorNumero($math->$numero1, $math->$numero2); break;
            case $ops["raiz"]: $result = $math->raizQuadrada($math->$numero1) . "<br />" . $math->raizQuadrada($math->$numero2); break;
            case $ops["soma"]: $result = $math->soma($math->$numero1, $math->$numero2); break;
            case $ops["multi"]: $result = $math->multiplicacao($math->$numero1, $math->$numero2); break;
            default: break;
        }
    }

    echo "$result<br/><hr /><br /><button onClick=\"window.history.back()\">Voltar</button></center></body></html>";

    class Matematica {
        public static $operadores = array(
            "maior" => "maiorNumero",
            "raiz" => "raizQuadrada",
            "soma" => "somar",
            "multi" => "multiplicar");

        public $numero1;
        public $numero2;

        public static function validaNumero($numero1, $numero2) { return is_numeric($numero1) && is_numeric($numero2); }

        public static function validaOperador($operador) { return in_array($operador, self::$operadores); }

        function maiorNumero($a, $b) {
            if ($a == $b) return "O número $a é igual a $b.";
            
            $maior = $a > $b ? $a : $b;
            $menor = $maior == $a ? $b : $a;
            
            return "O número $maior é maior que $menor.";
        }

        function raizQuadrada($x) { return "A raiz quadrada de $x é " + number_format(sqrt($x), 2) + "."; }

        function soma($a, $b) { return "A soma dos números é " . number_format($a + $b) . "."; }

        function multiplicacao($a, $b) { return "A multiplicação dos números é " . number_format($a * $b, 2) . "."; }
    }