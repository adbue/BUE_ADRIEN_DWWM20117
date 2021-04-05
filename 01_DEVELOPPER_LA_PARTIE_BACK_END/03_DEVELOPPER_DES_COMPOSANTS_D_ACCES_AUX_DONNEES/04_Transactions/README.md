# Exercice 1

Sous PhpMyAdmin, après avoir sélectionné votre base Papyrus, codez le script suivant et exécutez-le : 

```
START TRANSACTION;
SELECT nomfou FROM fournis WHERE numfou = 120;    
UPDATE fournis SET nomfou = 'GROSBRIGAND' WHERE numfou = 120;
SELECT nomfou FROM fournis WHERE numfou = 120; 
```
>Executez ces instructions ligne par ligne !

L'instruction ```START TRANSACTION```est suivie d'une instruction ```UPDATE```, mais aucune instruction ```COMMIT``` ou ```ROLLBACK``` correspondante n'est présente. 

## Que concluez-vous ? 

La transaction ne s'éxécute pas.

## Les données sont-elles modifiables par d'autres utilisateurs (ouvrez une nouvelle fenêtre de requête pour interroger le fournisseur 120 par une instruction ```SELECT```) ? 

Non, elles restent bloqués.

## La transaction est-elle terminée ? 

Non

## Comment rendre la modification permanente ? 

En ajoutant ```COMMIT``` à la fin.

## Comment annuler la transaction ? 

En ajoutant ```ROLLBACK``` à la fin.