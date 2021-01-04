<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>PHP AVANCE -- PHASE 08 -- Les dates et les heures</title>
</head>
<body>

  <h1>PHP AVANCE -- PHASE 08 -- Les dates et les heures</h1><br>

  <h2>Exercices</h2>
  <p>Utilisez l'objet <i>DateTime</i>, sauf mention contraire.</p><br>


  <h3>Exercice 1</h3>
  <p>Affichez la date du jour au format <i>mardi 2 juillet 2019</i>.</p><br>
  <?php


  // Avec date() :

  setlocale(LC_TIME, "fr_FR", "French");
  $today = date('d-m-Y');
  $date = strftime("%A %d %B %Y", strtotime($today));
  echo $date;


  // Avec time() :

    # setlocale(LC_TIME, "fr_FR", "French");
    # $date = strftime("%A %d %B %Y", time());
    # echo $date;

    
  ?>

  <h3>Exercice 2</h3>
  <p>Trouvez le numéro de semaine de la date suivante : <i>14/07/2019</i>.</p><br>
  <?php

  // Variable $date avec valeur fixe "14/07/2019":

    $date = "2019-07-14";

  //  Convresion string to time :

    $date_format_h = strtotime ($date);

  /*
  * Affichage résultat avec fonction date() + argument 'W' pour numéro de la semaine 
  * et la variable $date_format_h comme indice
  */

    echo "Le numéro de la semaine de la date 14/07/2019 est ".date('W',$date_format_h );


  ?>

  <h3>Exercice 3</h3>
  <p>Combien reste-t-il de jours avant la fin de votre formation.</p><br>
  <?php


  // Fin de formation le 09/07/2021 

  // Aujourd'hui :

    $today = date('d-m-Y');

  // date de fin :

    $fin = '09-07-2021';

  // Calcul de la difference en convertissant des chaines de caractères au format horraire :

    $calcul = (strtotime($fin) - strtotime($today));

  // Affichage résultat :

  echo "Il reste ",round($calcul/3600/24)," jour(s) avant la fin de la formation";


  ?>

  <h3>Exercice 4</h3>
  <p>Reprenez l'exercice 3, mais traitez le problème avec les fonctions de gestion du timestamp, <code>time()</code> et <code>mktime()</code>.</p><br>
  <?php


  // Fin de formation le 09/07/2021 

  // Timestamp de l'instant présent :

    $jour_actuel = time();

  // Timestamp du 09/07/2021 00:00:00 :

    $jour_futur = mktime(0,0,0,7,9,2021);

  //  Calcul de la différence entre notre jour futur et maintenant -> résultat en seconde :

    $calcul = $jour_futur - $jour_actuel;

  //  Affichage résultat avec une conversion secondes en journée :

    echo "Il reste ",round($calcul/3600/24)," jour(s) avant la fin de la formation";


  ?>

  <h3>Exercice 5</h3>
  <p>Quelle sera la prochaine année bissextile ?</p><br>
  <?php


// $bis = date('L)'; -> 0 si l'année n'est pas bissextile et 1 si l'année est bissextile :
$bis = date('L');

//$annee = date('Y'); affiche l'annee avec 4 chiffres :
$annee = date ('Y');

// Boucle for $i = 1 jusqu'a < 4 au minimum :

for ($i=1; $i<7; $i++) { 

  // Ajout d'années suplémentaires avec strtotime +  $i années :

  $bis = date('L', strtotime('+ '.$i.' year'));
  $annee = date ('Y', strtotime('+ '.$i.' year'));

  //  Si $bis vaut 1 alors ecrire l'année bissextile et stopper la boucle avec break sinon continuer :

    if ($bis == 1) {
      echo "La prochaine année bissextile sera en ", $annee;
      break;
    } else {
      continue;
    }
}


  ?>

  <h3>Exercice 6</h3>
  <p>Montrez que la date du <i>17/17/2019</i> est erronée.</p><br>
  <?php


  //  Affichage false avec var_dump :

    var_dump(checkdate(17, 17, 2019));

  ?>


  <h3>Exercice 7</h3>
  <p>Affichez l'heure courante sous cette forme : <i>11h25</i>.</p><br>
  <?php


  // Configuration date_timezone

    date_default_timezone_set("Europe/Paris");

  //Affichage résultat :

    echo "Heure actuelle : ", date("H\hi");


  ?>

  <h3>Exercice 8</h3>
  <p>Ajoutez 1 mois à la date courante. </p><br>
  <?php


  //  Affichage résultat avec date() et conversion string to time + 1 mois :

    echo " Date actuelle +1 mois : ", date('d/m/Y', strtotime('+1 month'));


  ?>

</body>
</html>
