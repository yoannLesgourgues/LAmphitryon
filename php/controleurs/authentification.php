<?php

require_once '../model/dao/Param.php';
require_once '../model/dao/DBConnex.php';
require_once '../model/dao/UtilisateurDAO.php';

$_POST['login'] = 'corentin.lartigue@gmail.com';
$_POST['mdp']='corentin';



print(json_encode(UtilisateurDAO::authentification($_POST['login'], $_POST['mdp'])));


?>