<?php


class Directeur extends Employe {
    
        public function calculerPrime()
    {
        $bonus = $this->getSalaire() * (7/100);
        $seniority = $this->getSalaire() * ((3/100) * $this->getAnciennete());
        $prime = $bonus + $seniority;
        
        return $prime;
    }
}
