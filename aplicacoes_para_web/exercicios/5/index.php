<?php
    include_once("resources/lib.php");
    include_once("resources/utils.php");

    Utils::GetPageWithTemplate("Notas do Semestre", Utils::GetPageContents("../assets/notas_do_semestre.html"));

    $nome = null;
    $nota1 = null;
    $nota2 = null;
    $nota3 = null;
    $nota4 = null;

    if (isset($_POST["nome"])) $nome = $_POST["nome"];
    if (isset($_POST["nota1"])) $nota1 = $_POST["nota1"];
    if (isset($_POST["nota2"])) $nota2 = $_POST["nota2"];
    if (isset($_POST["nota3"])) $nota3 = $_POST["nota3"];
    if (isset($_POST["nota4"])) $nota4 = $_POST["nota4"];
    
    if (Lib::IsValid($nome) && Lib::IsValidAndNumeric($nota1) && Lib::IsValidAndNumeric($nota2)
        && Lib::IsValidAndNumeric($nota3) && Lib::IsValidAndNumeric($nota4))
        Lib::ShowResult(Utils::GetPageContents("../assets/resultado.html"), $nome, $nota1, $nota2, $nota3, $nota4);