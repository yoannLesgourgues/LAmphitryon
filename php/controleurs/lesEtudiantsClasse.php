<?php
require_once 'param.php';
require_once 'connexion.php';

//$_POST['idClasse'] = 3 ;

print(json_encode(ClasseDAO::getEtudiantsClasse($_POST['idClasse'])));
