<?php

$pdo = new PDO('mysql:host=localhost;dbname=p3simplon', 'root', '');

if (isset($_POST['search'])) {

    $apprenants = $pdo->query("SELECT * FROM apprenant WHERE prenom LIKE '%".$_POST['q']."%' OR nom LIKE '%".$_POST['q']."%'")->fetchAll();
    $tab = [];
    foreach ($apprenants as $apprenant) {
        $tab[] = $apprenant['prenom'].' '.$apprenant['nom'];
    }
    echo json_encode($tab);
}
