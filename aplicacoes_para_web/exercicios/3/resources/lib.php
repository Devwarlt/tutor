<?php
    include("utils.php");

    class Lib {
        private static $StringsDictionary = array(
            "resultado" => "{RESULTADO}"
        );

        public static function ShowResult($template, $distancia, $combustivel) {
            $template = Utils::OverrideTemplate(self::$StringsDictionary["resultado"],
                '<strong class="text-primary">'. number_format($distancia / $combustivel, 2)
                . " km/L</strong><br /><br /><strong>distância:</strong><br />$distancia km<br /><br />"
                . "<strong>combustível:</strong><br />$combustivel Litro", $template);

            Utils::ShowPage($template);
        }

        public static function IsValidAndNumeric($arg) {
            return isset($arg) && !empty($arg) && is_numeric($arg) && $arg > 0;
        }
    }