<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP BASES = PHASE 03 - EXERCICE 01</title>
</head>
<body>
    <h1>Exercice 1</h1>
    <p><i>Ecrire un script PHP qui affiche tous les nombres impairs entre 0 et 150, par ordre croissant : 1 3 5 7...</i></p><br>

    <?php

    $a = 0;

    while ($a <= 149) {
        $a++;
        if ($a%2 != 0) 
        {
            echo "$a"."<br>";
        }
        else 
        {
            continue;
        }
        $a++;
    }

    ?>
    
</body>
</html>