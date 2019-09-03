<?php
    class Utils {
        // Boostrap Framework - resources: CSS + JS
        private static $Bootstrap = array(
            "css" => '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">',
            "js" => '<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>'
        );

        private static $StringsDictionary = array(
            "title" => "{TITLE}",
            "css" => "{CSS}",
            "js" => "{JS}",
            "content" => "{CONTENT}"
        );

        public static function GetPageWithTemplate($title, $content) {
            $template = self::GetPageContents("template.html");
            $keys = array($title, self::$Bootstrap["css"], self::$Bootstrap["js"], $content);
            
            for ($i = 0; $i < count($keys); $i++)
                $template = self::OverrideTemplate(array_values(self::$StringsDictionary)[$i], $keys[$i], $template);
            
            self::ShowPage($template);
        }

        public static function ShowPage($content) { echo $content; }

        public static function GetPageContents($path) { return file_get_contents(dirname(__FILE__) . "/$path"); }

        public static function OverrideTemplate($key, $value, $template) {
            return str_replace($key, $value, $template);
        }
    }