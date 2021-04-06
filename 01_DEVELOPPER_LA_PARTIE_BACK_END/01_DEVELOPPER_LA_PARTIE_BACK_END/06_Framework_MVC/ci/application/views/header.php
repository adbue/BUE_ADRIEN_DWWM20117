<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta description= "Jarditou site numéro un de vente de produits dédiés au jardinage en France">

    <!-- CSS -->
    <link rel="stylesheet" href="assets\css\style.css">
    <!-- BOOTSTRAP -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

    <title><?php $title ?></title>
</head>
<body>

<!-- Header -->

<div class="container">
    <div class="row">
        <div class ="col-12 my-2">	
            <header class="d-none d-lg-block">
                <div class="row justify-content-between">  
                    <div class="col-md-2">
                        <img src="<?php echo base_url("assets/img/jarditou_logo.jpg"); ?>" alt="Logo jarditou" Title="Logo Jarditou" width="200px">
                    </div>
                    <div class="col-md-4 mt-2">
                        <h2 class="text-center">Tout le jardin</h2>
                    </div>
                </div>
            </header>
        </div>
    </div>

<!-- Barre de navigation -->

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.html">Jarditou.com</a>   
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>   

        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="<?php echo site_url('produits/accueil'); ?>" title="Aller à la page Accueil">Accueil <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<?php echo site_url('produits/liste'); ?>">Produits</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href ="login.php" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Mon compte
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item text-center" href="<?php echo site_url('users/inscription'); ?>">Inscription</a>
                    <a class="dropdown-item text-center" href="<?php echo site_url('users/connexion'); ?>">Connexion</a>
                </div>
            </li>
            <?php
            if(isset($_SESSION["prenom"])){
            echo '<li>';
                echo '<a class="nav-link" href="'.site_url("users/deconnexion").'">Deconnexion</a>';
            echo '</li>';

            echo '<li>';
                echo '<a class="nav-link" href="'.site_url('panier/afficherPanier').'" title="Accéder à votre panier"><i class="fas fa-shopping-cart"></i><span class="badge badge-succes">0</span></a>';
            echo '</li>';
            }
            ?>
            </ul>

            <form class="form-inline">
                <input class="form-control mr-sm-2" type="Search" placeholder="Votre promotion" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Rechercher</button>
            </form>
        </div>
        </nav>

<!-- Bandeau promotion -->

        <div>
            <img src="<?php echo base_url("assets/img/promotion.jpg"); ?>" class="img-fluid" alt="Bandeau Promotion lames de terasse">
        </div>