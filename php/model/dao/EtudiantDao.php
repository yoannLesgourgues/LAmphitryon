<?php
class EtudiantDAO{
    
	public static function authentification($login , $mdp){
		try{
			$sql = "select numEtudiant, nomEtudiant , prenomEtudiant , mailEtudiant ,
			bacEtudiant , statut from etudiant 
			where mailEtudiant= :login and mdpEtudiant = :mdp " ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$mdp =  md5($mdp);
			$requetePrepa->bindParam("login", $login);
			$requetePrepa->bindParam("mdp", $mdp);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetch(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = "";
		}
		return $reponse;
	}
}

?>