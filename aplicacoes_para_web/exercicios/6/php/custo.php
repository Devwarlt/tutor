<?php
    $custo;

    if (isset($_REQUEST['custo'])) $custo = $_REQUEST['custo']; else echo "<font style='color: red'><strong>Custo</strong> inválido!</font><br />";

    if (!is_null($valor, $data) && is_numeric($valor)) {
        $custoDeFabrica = new CustoDeFabrica($custo);
        $custoDeFabrica->mostra();
    }

    class CustoDeFabrica {
        $custo;

        function __construct($custo) {
            $this->$custo = $custo;
        }

        function mostra() {
            echo "
                <table>
                    <tbody>
                        <tr><td><label>Valor total:</label> R$ $this->$custo</td></tr>
                        <tr><td><label>Distribuidor:</label> R$ $this->sob_valor(0.28)</td></tr>
                        <tr><td><label>Impostos:</label> R$ $this->sob_valor(0.45)</td></tr>
                        <tr><td><label>Valor de fábrica:</label> R$ $this->sob_valor(0.27)</td></tr>
                    </tbody>
                </table>
            ";
        }

        private function sob_valor($porcentagem) {
            return number_format($this->$custo * $porcentagem, 2);
        }
    }