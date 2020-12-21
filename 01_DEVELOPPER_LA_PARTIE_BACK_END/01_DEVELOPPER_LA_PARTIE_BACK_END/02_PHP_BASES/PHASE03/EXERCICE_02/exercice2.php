<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP BASES = PHASE 03 - EXERCICE 02</title>
</head>
<body>
    <h1>Exercice 2</h1>
    <p><i>Écrire un programme qui écrit 500 fois la phrase Je dois faire des sauvegardes régulières de mes fichiers.</i></p><br>
    <?php

    // Déclaration constante

    define("phrase","<i>Je dois faire des sauvegardes régulières de mes fichiers.</i>");
    
    // $n ne me sert qu'à compter le nombre de répétitions sur la page
    $n = 0;

    // Boucle for pour répéter 500 fois la constante

    for ($i=0; $i <500 ; $i++) { 
        $n++;
        echo $n.".\t".phrase."<br>";
    }
    

    ?>
</body>
</html>