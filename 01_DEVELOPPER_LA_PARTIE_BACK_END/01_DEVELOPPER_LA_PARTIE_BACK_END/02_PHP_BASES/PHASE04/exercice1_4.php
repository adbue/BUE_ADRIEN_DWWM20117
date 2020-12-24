<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP BASES = PHASE 4 - EXERCICES 1 à 4</title>
</head>
<body>
    <h1>PHP BASES = PHASE 4 - EXERCICES 1 à 4</h1>
    <p>Exercices de la partie Tableau</p><br>
    <?php

        // Tableau exercice

        $a = array("19001" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "", "", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", "Validation"), 
        "19002" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", ""), 
        "19003" => array("", "", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "", "", "Validation") 
        );


        // EXERCICE 01


        echo "<h2>Exercice 1</h2>";
        echo "<p>Quelle semaine a lieu la validation du groupe 19002 ?</p>"."<br>";

        // Boucle foreach = variable = $a["19XXX"]; $key = clé et $value = la valeur affectée à la clé.

        foreach ($a["19002"] as $key => $value) {

            if ($value == "Validation") {

                echo "<i>La validation pour le groupe 19002 a lieu durant la semaine </i>".($key+1);
            }
        }


        // EXERCICE 02


        echo "<h2>Exercice 2</h2>";
        echo "<p>Trouver la position de la dernière occurrence de Stage pour le groupe 19001. </p>"."<br>";

        // Déclaration variable $invert+ fonction array_reverse() pour inverser le tableau
            // //!\\ Important d'ajouter dans la fonction (preserve_keys = true) -> noté ici simplement ", true". 
            // |_> Pour préserver le couple clé=>valeur du début.

        $invert = array_reverse($a["19001"], true);
        
        // Fonction array_search(), pour trouver la première occurrence de "Stage" dans le tableau inversé (son index = 21). 
        $pos = array_search("Stage", $invert);

        echo "Dans le tableau 19001, la dernière occurrence de \"Stage\" se trouve en position ".$pos.". Mais comme l'index commence par 0, Les membres du groupe \"19001\" effectueront leur dernière semaine de stage la semaine numéro ".($pos+1).".";


        // EXERCICE 03


        echo "<h2>Exercice 3</h2>";
        echo "<p>Extraire, dans un nouveau tableau, les codes des groupes.</p>"."<br>";

        // Copie du tableau $a,
        $new_a=$a;

        // Nouveau tableau $b avec la fonction array_keys pour récupérer les codes groupes.
        $b []= array_keys($new_a);

        // Impression du tableau 
        print_r($b);


        // EXERCICE 04


        echo "<h2>Exercice 4</h2>";
        echo "<p>Combien de semaines dure le stage du groupe 19003 ?</p>"."<br>";

        // Variable $duree pour compter le nombre d'occurrences du mot "Stage" dans le tableau du groupe 19003.
        
        $duree = 0;

        foreach ($a["19003"] as $key => $value) {

            if ($value == "Stage") {

                $duree++;
            }
        }
        echo "Pour le groupe 19003, la durée du stage est de ".$duree." semaines.";


    ?> 
</body>
</html>