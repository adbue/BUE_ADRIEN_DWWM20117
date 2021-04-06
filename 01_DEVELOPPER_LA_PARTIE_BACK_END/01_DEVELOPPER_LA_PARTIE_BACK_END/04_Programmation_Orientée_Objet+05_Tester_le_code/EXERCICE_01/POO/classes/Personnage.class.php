<?php

class Personnage {
    // Attributs en privé :
    private $_nom;
    private $_prenom;
    private $_age;
    private $_sexe;

    // Méthodes en publiques :
    // En privé (private), on ne peut pas accéder directement à l'attribut.
    // Pour cela nous allons utiliser deux méthodes un accesseur (get) qui renvoie la valeur d'un attribut et un mutateur (set) qui définit ou modifie la valeur d'un attribut :

    // Nom :

    public function getNom() {
        return $this->_nom;
    }
    public function setNom($nom) {
        return $this->_nom = $nom;
    }

    // Prénom :

    public function getPrenom() {
        return $this->_prenom;
    }
    public function setPrenom($prenom) {
        return $this->_prenom = $prenom;
    }

    // Age :

    public function getAge() {
        return $this->_age;
    }
    public function setAge($age) {
        return $this->_age = $age;
    }

    // Sexe :

    public function getSexe() {
        return $this->_sexe;
    }
    public function setSexe($sexe) {
        return $this->_sexe = $sexe;
    }


}
