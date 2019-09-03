<?php
    include_once("resources/lib.php");
    include_once("resources/utils.php");

    Utils::GetPageWithTemplate("Salário Vendedor", Utils::GetPageContents("../assets/salario_vendedor.html"));

    $nomeVendedor = null;
    $salario = null;
    $totalVendas = null;

    if (isset($_POST["nomeVendedor"])) $nomeVendedor = $_POST["nomeVendedor"];
    if (isset($_POST["salario"])) $salario = $_POST["salario"];
    if (isset($_POST["totalVendas"])) $totalVendas = $_POST["totalVendas"];
    
    if (Lib::IsValid($nomeVendedor) && Lib::IsValid($salario) && Lib::IsValid($totalVendas))
        Lib::ShowResult(Utils::GetPageContents("../assets/resultado.html"), $nomeVendedor, $salario, $totalVendas);