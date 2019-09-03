<?php
    include("utils.php");

    class Lib {
        private static $StringsDictionary = array(
            "resultado" => "{RESULTADO}"
        );

        public static function ShowResult($template, $nome, $nota1, $nota2, $nota3, $nota4) {
            $html = "<strong>Aluno:</strong> " . $nome . "<br />"
            . "<p class=\"text-primary\"><strong>Média:</strong> " . number_format(($nota1 + $nota2 + $nota3 + $nota4) / 4, 2) . "</p>";
            $template = Utils::OverrideTemplate(self::$StringsDictionary["resultado"], $html, $template);

            Utils::ShowPage($template);
        }

        public static function IsValid($arg) {
            return isset($arg) && !empty($arg);
        }

        public static function IsValidAndNumeric($arg) {
            return self::IsValid($arg) && is_numeric($arg);
        }
    }