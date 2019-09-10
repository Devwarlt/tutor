<?php
    $valor, $mes;

    if (isset($_REQUEST['valor'])) $valor = $_REQUEST['valor']; else echo "<font style='color: red'><strong>Valor</strong> inválido!</font><br />";
    if (isset($_REQUEST['data'])) $data = $_REQUEST['data']; else echo "<font style='color: red'><strong>Data</strong> inválida!</font><br />";

    if (!is_null($valor, $data) && is_numeric($valor)) {
        $poupanca = new Poupanca($valor, $data);
        $poupanca->mostra();
    }

    class Poupanca {
        $valor, $data;

        function __construct($valor, $data) {
            $this->$valor = $valor;
            $this->$data = $data;
        }

        function mostra() {
            echo "
                <table>
                    <tbody>
                        <tr><td><label>Poupança:</label> $this->$valor</td></tr>
                        <tr><td><label>Previsão (em '$this->$data'):</label> $this->rendimento()</td></tr>
                    </tbody>
                </table>
            ";
        }

        private function rendimento() {
            $hoje = date('Y-m-d');
            $data = date('Y-m-d', strtotime($this->$data));
            $meses = var_dump($hoje->diff($data)->m + $hoje->diff($data)->y*12);
            return number_format($meses > 0 ? $meses * 1.007 * $this->$valor : $this->valor, 2);
        }
    }