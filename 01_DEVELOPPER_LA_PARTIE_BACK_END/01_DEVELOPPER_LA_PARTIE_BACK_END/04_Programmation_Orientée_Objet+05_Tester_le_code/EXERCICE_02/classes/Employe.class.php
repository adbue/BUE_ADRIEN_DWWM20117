<?php

class Employe {

    private $_nom;
    private $_prenom;
    private $_dateEmbauche;
    private $_fonction;
    private $_salaire;
    private $_service;
    private $_agence;

    public static $nbrEmploye = 0;
    private $_enfant;
    private $_chequeNoel;


    public function __construct()
    {
        self::$nbrEmploye++;
    }
    
    
        // Accesseurs et Mutateurs :

    
    // Nom :
    public function getNom()
    {
        return $this->_nom;
    }
    public function setNom($nom)
    {
        $this->_nom = $nom;

        return $this;
    }


    // Prénom :
    public function getPrenom()
    {
        return $this->_prenom;
    }
    public function setPrenom($prenom)
    {
        $this->_prenom = $prenom;

        return $this;
    }


    // Date d'embauche :
    public function getDateEmbauche()
    {
        return $this->_dateEmbauche;
    }
    public function setDateEmbauche($dateEmbauche)
    {
        $this->_dateEmbauche = DateTime::createFromFormat('d/m/Y', $dateEmbauche);

        return $this;
    }


    // Fonction :
    public function getFonction()
    {
        return $this->_fonction;
    }
    public function setFonction($fonction)
    {
        $this->_fonction = $fonction;

        return $this;
    }


    // Salaire :
    public function getSalaire()
    {
        return $this->_salaire;
    }
    public function setSalaire($salaire)
    {
        $this->_salaire = $salaire;

        return $this;
    }


    // Service:
    public function getService()
    {
        return $this->_service;
    }
    public function setService($service)
    {
        $this->_service = $service;

        return $this;
    }
    
        // EXERCICE 02


    public function getAnciennete()
    {
        $today = new DateTime('now'); 
        $dEmbauche = $this->getDateEmbauche(); 

        $anciennete = $dEmbauche->diff($today); 

        return $anciennete->format("%y");

    }


    // EXERCICE 03


    public function calculerPrime()
    {
        $bonus = $this->getSalaire() * (5/100);
        $seniority = $this->getSalaire() * ((2/100) * $this->getAnciennete());
        $prime = $bonus + $seniority;
        
        return $prime;
    }
    
    public function versementPrime()
    {
        $today = date('30/11');
        $dateVersement = date('30/11');
        
        if($today == $dateVersement){
            return "Demande de versement au profit de Mr/Mme".$this->getNom()." ".$this->getPrenom()." Pour un montant de ".$this->calculerPrime()."€.";
        } else {
            return "Aucun versement à effectuer";
        }
    }


    // EXERCICE 04
    
    
    
    // EXERCICE 05
    
        // Voir Agence.class.php
        
        // Agence:
    public function getAgence()
    {
        return $this->_agence;
    }
    public function setAgence($agence)
    {
        $this->_agence = $agence;

        return $this;
    }
    
    // EXERCICE 06    
        
        // Voir Agence.class.php
    
    // EXERCICE 07
    
    
    public function isChequeVacance() 
    {
        if ($this->getAnciennete() >= 1) {
            return $this->chequeVacance = true;
        } else {
            return $this->chequeVacance = false;
        }
    }


    // EXERCICE 08
    
    // Pour le moment, j'ai cette méthode:

    // enfant(s):


public function getEnfant() 
{
    return $this->_enfant;
}
public function setEnfant($enfant) 
{
    return $this->_enfant = $enfant;
}


    // Chèque(s) Noel :


public function getChequeNoel() 
{
    return $this->_chequeNoel;
}
public function setChequeNoel($chequeNoel)
{
    return $this->_chequeNoel = $chequeNoel;
}


    
public function arrayTrans() 
{
    if(is_array($this->getEnfant()))
    {
        return count(array_keys($this->getEnfant()))." \n(".implode(array_keys($this->getEnfant()),", ")."),\n(".implode($this->getEnfant(),", ")." ans)";
    } else
    {
        return $this->getEnfant();
    }
}


    public function isChequeNoel()
{

    if(is_array($this->getEnfant()))
    {
        $cpt =0;

        foreach ($this->getEnfant() as $key => &$value) 
        {
            if($value<=10)
            {
                $cpt+=20;
            }
            if($value>=11 && $value <=15)
            {
                $cpt+=30;
            }
            if($value>=16 && $value <=18)
            {
                $cpt+=50;
            }
            if($value>=19)
            {
                $cpt+=0;
            }
        }

        $this->setChequeNoel($cpt);

        if($this->getChequeNoel() == 0){
            $this->setChequeNoel("Non");
            return $this->getChequeNoel();
        }

        return "Oui (Total = ".$this->getChequeNoel()."€ )";
    } 
    else 
    {
        $this->setChequeNoel("Non");
        return $this->getChequeNoel();
    }
    
}  
    // EXERCICE 09
    
        // Voir Directeur.class.php   
}
// $fab = new Employe();
// $fab->setNom("Blanchard");
// $fab->setPrenom("Fabien");
// $fab->setFonction("Aide-Comptable");
// $fab->setService("Comptabilité");
// $fab->setSalaire(27600);
// $fab->setDateEmbauche('14/10/2010');
// $fab->getAnciennete();
// echo $fab->calculerPrime();
// $fab->versementPrime();
 
// var_dump($fab);
// 
 