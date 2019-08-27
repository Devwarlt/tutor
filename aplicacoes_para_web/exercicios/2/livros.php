<?php
    class Biblioteca {
        public static $livros = array(
            "livro1" => "Livro 1",
            "livro2" => "Livro 2",
            "livro3" => "Livro 3"
        );

        public static $usuarios = array(
            "professor" => "Professor",
            "aluno" => "Aluno"
        );

        public static function validaLivro($livro) { return in_array($livro, self::$livros) || array_key_exists($livro, self::$livros); }

        public static function validaUsuario($usuario) { return in_array($usuario, self::$usuarios) || array_key_exists($usuario, self::$usuarios); }
    }