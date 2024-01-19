<?php
class ClasseDAO{
    
    public static function getLesClasses(){
        
        try{
            $sql = "select * from classe order by 1 desc " ;
            
            $requetePrepa = DBConnex::getInstance()->prepare($sql);
            $requetePrepa->execute();
            $liste = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            $liste = "";
        }
        return $liste;   
    }

    public static function getEtudiantsClasse($unIdClasse){
        
        try{
            $sql = "select numEtudiant, nomEtudiant , prenomEtudiant , mailEtudiant ,
			bacEtudiant from etudiant where idClasse = :idClasse order by nomEtudiant";
            
            $requetePrepa = DBConnex::getInstance()->prepare($sql);
            $requetePrepa->bindParam("idClasse", $unIdClasse);
            $requetePrepa->execute();
            $liste = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            $liste = "";
        }
        return $liste;
    }

}
