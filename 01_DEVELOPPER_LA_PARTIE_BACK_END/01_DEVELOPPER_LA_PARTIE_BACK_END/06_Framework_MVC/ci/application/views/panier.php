<?php

$title = "Jarditou - Panier";

?>
<h1>Mon panier</h1>

<?php 
// Si le panier n'existe pas encore  
if ($this->session->panier != null) 
{ 
?>
    <div class="row">
    <div class="col-12"> 
    <table class="table table-hover table-striped table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>Produit</th>
                <th>Prix</th>
                <th>Quantité</th>
                <th>Prix total</th>
                <th>&nbsp;</th> 
            </tr>   
        </thead>
        <tbody>
        <?php 

        $panier = $this->session->panier;
        $iTotal = 0;
        ?>

        <?php foreach($panier as $row): ?>

            <td><?php $row['pro_libelle']; ?></td>
            <td><?php $row['pro_prix']; ?></td>
            <td><?php $row['pro_qte']; ?></td>
            <td><?php $total = $row['pro_qte'] * $row['pro_prix']; ?></td>
            <?php $iTotal += $total; ?>

        <?php endforeach; ?>
        </tbody>
    </table>
    </div>
    <div>
        <div>
            <h3>Récapitulatif</h3>
            <div>
                <p>TOTAL : <?= str_replace('.', ',' , $iTotal); ?> &euro;</p>
                <p href="<?= site_url("panier/supprimerPanier"); ?>" >Supprimer le panier</a></p> 
                <p><a href="<?= site_url("produits/liste"); ?>">Retour liste des produits</a></p>
            </div>
        </div>
    </div>
    </div>
    <?php 
    } 
    else 
    { 

        ?>
        <div class="alert alert-danger">Votre panier est vide. Pour le remplir, vous pouvez consulter <a href="<?= site_url("produits/liste"); ?>">la liste des produits</a>.</div>
        <?php 
    } 