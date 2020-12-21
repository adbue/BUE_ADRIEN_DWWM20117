<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP BASES = PHASE 03 - EXERCICE 03</title>
</head>
<body>
    <h1>Exercice 3</h1>
    <p><i>Ecrire un script qui affiche la table de multiplication totale de {1,...,12} par {1,...,12}, le résultat doit être le suivant :</i></p><br>
    <?php

    //Création du tableau en combinant php+html

    echo "<table border = '1'>"; // border = '1' pour la bordure ...

        echo "<thead>"; 
            echo "<tr>"; 
                echo "<th></th>"; // Première case vide
                // Boucle pour remplir la ligne en-tête horizontale au dessus
                for ($ligneHorizontale=0; $ligneHorizontale <=12 ; $ligneHorizontale++) { 
                    echo "<th>$ligneHorizontale</th>";
                }
            echo "</tr>";
        echo "</thead>";

        // Pour le corp du tableau. Deux boucles imbriquées. La première boucle remplie la première colonne sous la case vide.
        
        echo "<tbody>";
            for ($ligneVerticale=0; $ligneVerticale <=12 ; $ligneVerticale++) { 
                echo "<tr>"; 
                    echo"<th>$ligneVerticale</th>";

                // La deuxième boucle imbriquée met en relation les deux variables précédentes par le biais d'une multiplication. Le résultat peut se lire soit par colonne, soit par ligne.

                for ($ligneHorizontale=0; $ligneHorizontale <=12 ; $ligneHorizontale++) { 
                    echo "<td>"; 
                        echo $ligneHorizontale*$ligneVerticale;
                    echo "</td>";
                }
                echo "</tr>";
            }
        echo "</tbody>";

    echo "</table>";