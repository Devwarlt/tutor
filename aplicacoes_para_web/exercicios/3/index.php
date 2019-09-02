<?php
    include_once("resources/lib.php");
    include_once("resources/utils.php");

    Utils::GetPageWithTemplate("Consumo Médio", Utils::GetPageContents("../assets/consumo_medio.html"));

    $distancia = null;
    $combustivel = null;

    if (isset($_POST["distancia"])) $distancia = $_POST["distancia"];
    if (isset($_POST["combustivel"])) $combustivel = $_POST["combustivel"];

    if (Lib::IsValidAndNumeric($distancia) && Lib::IsValidAndNumeric($combustivel)) {
        Lib::ShowResult(Utils::GetPageContents("../assets/resultado.html"), $distancia, $combustivel);
    }