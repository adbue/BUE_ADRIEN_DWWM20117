<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP AVANCÉ -- PHASE 09 -- LES FICHIERS</title>
</head>
<body>
    <h1>PHP AVANCÉ -- PHASE 09 -- LES FICHIERS</h1>
    <h2>Exercices</h2>
    <p>Téléchargez le fichier ListeLiens.zip contenant des adresses web et écrire un programme qui lit ce fichier pour construire \
    une page web contenant une liste de liens hypertextes.</p><br>
    <h2>Voici la liste de liens utiles :</h2>
    <?php


$list = fopen("rsrc\ListeLiens.txt","r");


print("<a href=".fgets($list).">http://www.python.org/</a><br>");
print("<a href=".fgets($list).">http://www.afpa.fr/</a><br>");
print("<a href=".fgets($list).">http://fr.wikipedia.org/wiki/Sp%C4%B1n%CC%88al_Tap</a><br>");
print("<a href=".fgets($list).">http://www.gallien-krueger.com/</a><br>");
print("<a href=".fgets($list).">http://www.ampeg.com/</a><br>");

fclose($list);


    ?>

</body>
</html>