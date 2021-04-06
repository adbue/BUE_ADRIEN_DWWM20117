<?php

class Agence
{
    private $_nom;
    private $_adresse;
    private $_codePostal;
    private $_ville;
    private $_modeRestauration;
    
    //Getters et setters
    
    public function getNom()
    {
        return $this->_nom;
    }
    public function setNom($nom)
    {
        $this->_nom = $nom;

        return $this;
    } 

    public function getAdresse()
    {
        return $this->_adresse;
    }
    public function setAdresse($adresse)
    {
        $this->_adresse = $adresse;

        return $this;
    }
    
    public function getCodePostal()
    {
        return $this->_codePostal;
    }
    public function setCodePostal($codePostal)
    {
        $this->_codePostal = $codePostal;

        return $this;
    }
    
    public function getVille()
    {
        return $this->_ville;
    }
    public function setVille($ville)
    {
        $this->_ville = $ville;

        return $this;
    }
    
    public function getModeRestauration()
    {
        return $this->_modeRestauration;
    }
    public function setModeRestauration($modeRestauration)
    {
        $this->_modeRestauration = $modeRestauration;

        return $this;
    }
}

