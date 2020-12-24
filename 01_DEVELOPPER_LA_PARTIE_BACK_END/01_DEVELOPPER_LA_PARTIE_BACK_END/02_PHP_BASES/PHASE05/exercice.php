<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>06_FONCTIONS - EXERCICE</title>
</head>
<body>
    <h1>CHAPITRE 06 - LES FONCTIONS</h1>
    <p>Ecrivez la fonction <i>calculator()</i> traitant les opérations d'addition, de soustraction, de multiplication et de division.</p><br>

    <!-- Formulaire pour la saisie des valeurs de l'utilisateur/trice  -->

    <form method="POST">
        <input type="number" name="n1">
        <input type="number" name="n2"><br>
        <button type="submit" name="res" value="ok">Résultat</button>
        <button type="reset" name="anl" value="reset">Annuler</button>
    </form><br>

    <?php

        // Ici, deux variables. Les valeurs affectées correspondent aux valeurs de nos deux "input" dans le formumlaire HTML.

        $n1=$_POST["n1"];
        
        $n2=$_POST["n2"];

        function Calculator($n1,$n2) // Déclaration de notre fonction+arguments($n1,$n2).
        {


            if($n1 != NULL && $n2 != NULL) // condition 1 = La fonction s'exécute si les deux champs "input" sont remplis.
            {
                // Ici nos différents calculs :

                    # Addition = $add
                    # Soustraction = $sous
                    # Multiplication = $mult
                    # Division = $div

                $add=$n1+$n2; 
                echo "** RÉSULTAT **<br>Le résultat de l'addition entre ".$n1." et ".$n2." vaut ".$add;

                $sous=$n1-$n2;
                echo "<br>"."Le résultat de la soustraction entre ".$n1." et ".$n2." vaut ".$sous;

                $mult=$n1*$n2;
                echo "<br>"."Le résultat de la multiiplication entre ".$n1." et ".$n2." vaut ".$mult;

                if ($n2 != 0) // condition 1-1 = Le calcul de la division se fait si le champ du nombre 2 ($n2) est différent de 0.
                {
                    $div=$n1/$n2;
                    echo "<br>"."Le résultat de la division entre ".$n1." et ".$n2." vaut ".$div;
                }
                else // condition 1-2 = Message d'erreur si $n2 vaut 0. 
                {
                    echo "<br>"."** ERREUR**<br>Je ne peux pas diviser par 0";
                }
            }
            else // condition 2 = Message d'erreur si un ou aucun des champs n'est rempli.
            {
                echo "** ERREUR**<br>Vous n'avez pas rempli tous les champs.";
            }
        }

        // Invocation de la fonction
        
        Calculator($n1,$n2); 

    ?>
</body>
</html>