<?php
    include("utils.php");

    class Lib {
        private static $StringsDictionary = array(
            "resultado" => "{RESULTADO}"
        );

        public static function ShowResult($template, $nomeVendedor, $salario, $totalVendas) {
            $html = "<strong>Vendedor:</strong> " . $nomeVendedor . "<br />"
            . "<strong>Salário</strong> <small>(fixo)</small><strong>:</strong> R$" . number_format($salario, 2) . "<br />"
            . "<strong>Comissão:</strong> R$" . number_format($salario * 0.15, 2) . "<br /><br />"
            . "<p class=\"text-primary\"><strong>Salário:</strong> R$" . number_format($salario * 1.15, 2) . "</p>";
            $template = Utils::OverrideTemplate(self::$StringsDictionary["resultado"], $html, $template);

            Utils::ShowPage($template);
        }

        public static function IsValid($arg) {
            return isset($arg) && !empty($arg);
        }
    }