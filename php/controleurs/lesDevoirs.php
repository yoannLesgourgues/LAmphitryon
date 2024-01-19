<?php
require_once '../model/dao/DevoirDao.php';


print(json_encode(DevoirDAO::lesDevoirs()));
