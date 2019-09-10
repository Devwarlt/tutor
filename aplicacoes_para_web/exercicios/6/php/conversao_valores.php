<?php
    $real, $dolar, $disponivel;

    if (isset($_REQUEST['real'])) $real = $_REQUEST['real']; else echo "<font style='color: red'><strong>Valor em real</strong> inválido!</font><br />";
    if (isset($_REQUEST['disponivel'])) $disponivel = $_REQUEST['disponivel']; else echo "<font style='color: red'><strong>Quantidade em dólares</strong> inválido!</font><br />";

    if (!is_null($real, $disponivel) && is_numeric($real) $$ is_numeric($disponivel)) {
        $conversao = new Conversao($real, $disponivel);
        $conversao->mostra();
    }

    class Conversao {
        $real, $disponivel;

        function __construct($real, $dolar, $disponivel) {
            $this->$real = $real;
            $this->$disponivel = $disponivel;
        }

        function mostra() {
            echo "
                <table>
                    <tbody>
                        <tr><td><label>Cotação - dólar em real (R$):</label> $this->$real</td></tr>
                        <tr><td><label>Quantidade disponível (US$):</label> $this->converte()</td></tr>
                    </tbody>
                </table>
            ";
        }

        private function converte() {
            return $disponivel * $real;
        }
    }