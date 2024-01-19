<?php
class DevoirDAO{

    public static function lesDevoirs(){
        
        try{
            $sql = "select *  from devoir " ;
            
            $requetePrepa = DBConnex::getInstance()->prepare($sql);
            $requetePrepa->execute();
            $liste = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            $liste = "";
        }
        return $liste;
    }

}

