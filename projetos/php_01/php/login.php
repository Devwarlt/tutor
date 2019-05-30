<?php
    $usr = $_POST["username"];
    $psw = $_POST["password"];

    if (!isset($usr, $psw))
        header("location:../index.html?err=1");

    echo "Success!<br />
        Username: $usr<br />
        Password: $psw";