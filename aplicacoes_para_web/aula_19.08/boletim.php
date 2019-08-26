<?php
	$a1 = $_POST["a1"];
	$a2 = $_POST["a2"];
	$extra = $_POST["extra"];
	
	if (!isset($a1)) $a1 = 0;
	if (!isset($a2)) $a2 = 0;
	if (!isset($extra)) $extra = 0;
	
	if (Boletim::valida($a1, $a2, $extra)) {
		if (!Boletim::validaNotas($a1, $a2)) {
			echo "<strong>Erro!</strong> Notas inválidas! Somente valores entre <strong>0</strong> a <strong>10</strong> serão permitidos.";
			return;
		}
		if (!Boletim::validaExtra($extra)) {
			echo "<strong>Erro!</strong> Adicional inválido! Somente valores entre <strong>0</strong> a <strong>2</strong> serão permitidos.";
			return;
		}
		
		$boletim = new Boletim();
		$boletim->a1 = $a1;
		$boletim->a2 = $a2;
		$boletim->extra = $extra;
		
		echo "<center><h1>Situação:</h1>" . $boletim->situacao() . "<br /><br /><button onClick=\"window.history.back()\">Voltar</button></center>";
	} else echo "<strong>Erro!</strong> Valores inválidos!";

	class Boletim {
		private static $media = 5;
		public $a1;
		public $a2;
		public $extra;
		
		public static function valida($a1, $a2, $extra) {
			return is_numeric($a1) && is_numeric($a2) && is_numeric($extra);
		}
		
		public static function validaNotas($a1, $a2) {
			return $a1 >= 0 && $a1 <= 10 && $a2 >= 0 && $a2 <= 10;
		}
		
		public static function validaExtra($extra) {
			return $extra >= 0 && $extra <= 2;
		}
		
		private function media() {
			return (($this->a1 + $this->a2) / 2) + $this->extra;
		}
		
		public function situacao() {
			$media = $this->media();
			return "<h3><strong><font color=" . ($media >= self::$media ? "='green'>Aprovado" : "'red'>Reprovado") . "!</font></strong></h3><br />Média final: " . number_format($media, 2, '.', '');
		}
	}