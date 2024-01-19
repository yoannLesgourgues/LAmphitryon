# -----------------------------------------------------------------------------
#       TABLE : TABLE_RESTO
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TABLE_RESTO
 (
   IDSERVICE CHAR(5) NOT NULL  ,
   DATE_SERVICE DATE NOT NULL  ,
   NUMTABLE CHAR(5) NOT NULL  ,
   IDUTILISATEUR CHAR(5) NOT NULL  ,
   NOMBREPLACE INTEGER NULL  
   , PRIMARY KEY (IDSERVICE,DATE_SERVICE,NUMTABLE) 
 ) engine = innodb default charset = latin1;


# -----------------------------------------------------------------------------
#       TABLE : UTILISATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS UTILISATEUR
 (
   IDUTILISATEUR CHAR(5) NOT NULL  ,
   IDSTATUT CHAR(5) NOT NULL  ,
   LOGIN CHAR(32) NULL  ,
   MDP CHAR(32) NULL  
   , PRIMARY KEY (IDUTILISATEUR) 
 ) engine = innodb default charset = latin1;


# -----------------------------------------------------------------------------
#       TABLE : CATÉGORIEPLAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGORIEPLAT
 (
   IDCATEG CHAR(5) NOT NULL  ,
   NOMCATEG CHAR(32) NULL  
   , PRIMARY KEY (IDCATEG) 
 ) engine = innodb default charset = latin1;


# -----------------------------------------------------------------------------
#       TABLE : COMMANDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMMANDE
 (
   IDCOMMANDE CHAR(5) NOT NULL  ,
   DATE_SERVICE DATE NOT NULL  ,
   NUMTABLE CHAR(5) NOT NULL  ,
   IDSERVICE CHAR(5) NOT NULL  ,
   HEURECOMMANDE TIME NULL  ,
   ETATCOMMANDE CHAR(32) NULL  
   , PRIMARY KEY (IDCOMMANDE) 
 ) engine = innodb default charset = latin1;


# -----------------------------------------------------------------------------
#       TABLE : PLAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PLAT
 (
   IDPLAT CHAR(5) NOT NULL  ,
   IDCATEG CHAR(5) NOT NULL  ,
   NOMPLAT CHAR(32) NULL  ,
   DESCRIPTIF CHAR(32) NULL  
   , PRIMARY KEY (IDPLAT) 
 ) engine = innodb default charset = latin1;


# -----------------------------------------------------------------------------
#       TABLE : SERVICE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SERVICE
 (
   IDSERVICE CHAR(5) NOT NULL  
   , PRIMARY KEY (IDSERVICE) 
 ) engine = innodb default charset = latin1;


# -----------------------------------------------------------------------------
#       TABLE : STATUTUTILISATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STATUTUTILISATEUR
 (
   IDSTATUT CHAR(5) NOT NULL  ,
   NOMSTATUT CHAR(32) NULL  
   , PRIMARY KEY (IDSTATUT) 
 ) engine = innodb default charset = latin1;


# -----------------------------------------------------------------------------
#       TABLE : DATE_SERVICE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DATE_SERVICE
 (
   DATE_SERVICE DATE NOT NULL  
   , PRIMARY KEY (DATE_SERVICE) 
 ) engine = innodb default charset = latin1;


# -----------------------------------------------------------------------------
#       TABLE : COMMANDER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMMANDER
 (
   IDPLAT CHAR(5) NOT NULL  ,
   IDCOMMANDE CHAR(5) NOT NULL  ,
   ETATPLAT CHAR(32) NULL  ,
   INFOSCOMPLEMENTAIRES CHAR(32) NULL  ,
   QUANTITE INTEGER NULL  
   , PRIMARY KEY (IDPLAT,IDCOMMANDE) 
 ) engine = innodb default charset = latin1;


# -----------------------------------------------------------------------------
#       TABLE : PROPOSERPLAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PROPOSERPLAT
 (
   IDSERVICE CHAR(5) NOT NULL  ,
   IDPLAT CHAR(5) NOT NULL  ,
   DATE_SERVICE DATE NOT NULL  ,
   QUANTITEPROPOSEE INTEGER NULL  ,
   PRIXVENTE DECIMAL(5,2) NULL  ,
   QUANTITEVENDUE INTEGER NULL  
   , PRIMARY KEY (IDSERVICE,IDPLAT,DATE_SERVICE) 
 ) engine = innodb default charset = latin1;


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE TABLE_RESTO 
  ADD FOREIGN KEY FK_TABLE_RESTO_DATE_SERVICE (DATE_SERVICE)
      REFERENCES DATE_SERVICE (DATE_SERVICE) ;


ALTER TABLE TABLE_RESTO 
  ADD FOREIGN KEY FK_TABLE_RESTO_UTILISATEUR (IDUTILISATEUR)
      REFERENCES UTILISATEUR (IDUTILISATEUR) ;


ALTER TABLE TABLE_RESTO 
  ADD FOREIGN KEY FK_TABLE_RESTO_SERVICE (IDSERVICE)
      REFERENCES SERVICE (IDSERVICE) ;


ALTER TABLE UTILISATEUR 
  ADD FOREIGN KEY FK_UTILISATEUR_STATUTUTILISATEUR (IDSTATUT)
      REFERENCES STATUTUTILISATEUR (IDSTATUT) ;


ALTER TABLE COMMANDE 
  ADD FOREIGN KEY FK_COMMANDE_TABLE_RESTO (IDSERVICE,DATE_SERVICE,NUMTABLE)
      REFERENCES TABLE_RESTO (IDSERVICE,DATE_SERVICE,NUMTABLE) ;


ALTER TABLE PLAT 
  ADD FOREIGN KEY FK_PLAT_CATEGORIEPLAT (IDCATEG)
      REFERENCES CATEGORIEPLAT (IDCATEG) ;


ALTER TABLE COMMANDER 
  ADD FOREIGN KEY FK_COMMANDER_PLAT (IDPLAT)
      REFERENCES PLAT (IDPLAT) ;


ALTER TABLE COMMANDER 
  ADD FOREIGN KEY FK_COMMANDER_COMMANDE (IDCOMMANDE)
      REFERENCES COMMANDE (IDCOMMANDE) ;


ALTER TABLE PROPOSERPLAT 
  ADD FOREIGN KEY FK_PROPOSERPLAT_SERVICE (IDSERVICE)
      REFERENCES SERVICE (IDSERVICE) ;


ALTER TABLE PROPOSERPLAT 
  ADD FOREIGN KEY FK_PROPOSERPLAT_PLAT (IDPLAT)
      REFERENCES PLAT (IDPLAT) ;


ALTER TABLE PROPOSERPLAT 
  ADD FOREIGN KEY FK_PROPOSERPLAT_DATE_SERVICE (DATE_SERVICE)
      REFERENCES DATE_SERVICE (DATE_SERVICE) ;

