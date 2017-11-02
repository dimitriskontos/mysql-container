-- =============================================================================
-- Diagram Name: ogeka
-- Created on: 22/7/2016 11:16:58 πμ
-- Diagram Version: 
-- =============================================================================
DROP DATABASE IF EXISTS `elgo`;

CREATE DATABASE IF NOT EXISTS `elgo` 
CHARACTER SET utf8 
COLLATE utf8_unicode_ci;

USE `elgo`;

SET FOREIGN_KEY_CHECKS=0;

-- Drop table ipalliloi
DROP TABLE IF EXISTS `ipalliloi`;

CREATE TABLE `ipalliloi` (
  `id_name` int(4) NOT NULL AUTO_INCREMENT,
  `onoma` varchar(40) NOT NULL,
  `epwnymo` varchar(40) NOT NULL,
  `psd` varchar(10),
  `id_ekpaideyseis` int(4) DEFAULT '0',
  `id_eidikotita` INT(4),
  `afm` varchar(15),
  `address` varchar(60),
  `tilefono` varchar(10),
  `poli` varchar(30),
  `email` varchar(30),
  `birth` date,
  `sex` enum('1','2') default '1',
  `id_nomos` int(4) DEFAULT '0',
  `patrwnymo` varchar(40),
  `zip` varchar(6),
  `ar_taytotitas` varchar(20),
  `msc` enum('1','2') default '1',
  `phd` enum('1','2') default '1',
  `logariasmos` varchar(25),
  PRIMARY KEY(`id_name`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table ekpedeytes
DROP TABLE IF EXISTS `ekpedeytes`;
CREATE TABLE `ekpedeytes` (
  `id_ekpaideyti` int(4) NOT NULL AUTO_INCREMENT,
  `ar_taytotitas` varchar(20) not null,
  `epwnymo` varchar(25) NOT NULL,
  `onoma` varchar(25) NOT NULL,
  `email` varchar(30),
  `patrwnymo` varchar(25),
  `logariasmos` varchar(25),
  `id_ekpaideyseis` int(4),
  `msc` enum('1','2') default '1',
  `phd` enum('1','2') default '1',
  `tilefono` varchar(10),
  `address` varchar(60),
  `id_eidikotita` INT(4),
  `sex` enum('1','2') default '1',
  `afm` varchar(15),
  `zip` varchar(6),
  `poli` varchar(30),
  PRIMARY KEY(`id_ekpaideyti`),
  CONSTRAINT `ypoxr_tayt` UNIQUE(`ar_taytotitas`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;


-- Drop table perifereies
DROP TABLE IF EXISTS `perifereies`;

CREATE TABLE `perifereies` (
  `id_perifereia` int(4) NOT NULL AUTO_INCREMENT,
  `onoma` varchar(50),
  PRIMARY KEY(`id_perifereia`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table nomoi
DROP TABLE IF EXISTS `nomoi`;

CREATE TABLE `nomoi` (
  `id_nomos` int(4) NOT NULL AUTO_INCREMENT,
  `onoma` varchar(50) NOT NULL,
  `id_perifereia` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY(`id_nomos`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table thematiki_enotita
DROP TABLE IF EXISTS `thematiki_enotita`;

CREATE TABLE `thematiki_enotita` (
  `id_enotita` int(11) NOT NULL AUTO_INCREMENT,
  `perigrafi` varchar(100) NOT NULL,
  PRIMARY KEY(`id_enotita`),
  CONSTRAINT yp_enotita UNIQUE (`perigrafi`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table mathimata
DROP TABLE IF EXISTS `mathimata`;

CREATE TABLE `mathimata` (
  `id_mathima` int(11) NOT NULL AUTO_INCREMENT,
  `perigrafi` varchar(50),
  PRIMARY KEY(`id_mathima`),
  CONSTRAINT yp_mathima UNIQUE (`perigrafi`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table foreis_ipalliloi
DROP TABLE IF EXISTS `foreis_ipalliloi`;

CREATE TABLE `foreis_ipalliloi` (
  `id_kentro_ypal` int(11) NOT NULL AUTO_INCREMENT,
  `id_kentro` int(11) NOT NULL DEFAULT '0',
  `id_name` int(11) NOT NULL DEFAULT '0',
  `id_thesi` int(4),
  `apo` datetime,
  `ews` datetime,
  PRIMARY KEY(`id_kentro_ypal`)
)
ENGINE=INNODB;
-- Drop table parametroi
DROP TABLE IF EXISTS `parametroi`;

CREATE TABLE `parametroi` (
  `id_param` int(5) NOT NULL AUTO_INCREMENT,
  `onoma` varchar(50),
  `pinakas` varchar(15),
  `pedio` varchar(15),
  `epilogi` binary(1) NOT NULL DEFAULT '0',
  `value` varchar(10),
  PRIMARY KEY(`id_param`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table kat_foreon
DROP TABLE IF EXISTS `kat_foreon`;

CREATE TABLE `kat_foreon` (
  `id_katigorias` int(4) NOT NULL AUTO_INCREMENT,
  `onoma` varchar(50),
  PRIMARY KEY(`id_katigorias`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table ypiresiakes_theseis
DROP TABLE IF EXISTS `ypiresiakes_theseis`;

CREATE TABLE `ypiresiakes_theseis` (
  `id_thesi` int(4) NOT NULL AUTO_INCREMENT,
  `onoma` varchar(50) NOT NULL,
  PRIMARY KEY(`id_thesi`)
)
ENGINE=INNODB;

-- Drop table kat_ekpedeyseis
DROP TABLE IF EXISTS `kat_ekpedeyseis`;

CREATE TABLE `kat_ekpedeyseis` (
  `id_ekpaideyseis` int(4) NOT NULL AUTO_INCREMENT,
  `akrwnymio` varchar(5),
  `onoma` varchar(50),
  PRIMARY KEY(`id_ekpaideyseis`),
  CONSTRAINT `yp_kat_ekped` UNIQUE(`onoma`,`akrwnymio`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table actions
DROP TABLE IF EXISTS `actions`;

CREATE TABLE `actions` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `onoma` varchar(50),
  `label` varchar(50),
  PRIMARY KEY(`id_action`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table parametroi_acton
DROP TABLE IF EXISTS `parametroi_acton`;

CREATE TABLE `parametroi_acton` (
  `id_par_action` int(11) NOT NULL AUTO_INCREMENT,
  `id_param` int(5) NOT NULL DEFAULT '0',
  `id_action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY(`id_par_action`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table view_epilogi
DROP TABLE IF EXISTS `view_epilogi`;

CREATE TABLE `view_epilogi` (
  `id_epilogi` int(11) NOT NULL AUTO_INCREMENT,
  `pinakas` varchar(50),
  `pedio` varchar(50),
  `id_pediu` int(11),
  `value` varchar(50),
  `ypagete` int(11),
  PRIMARY KEY(`id_epilogi`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table view_epilogi_ypal
DROP TABLE IF EXISTS `view_epilogi_ypal`;

CREATE TABLE `view_epilogi_ypal` (
  `id_name` int(11) NOT NULL DEFAULT '0',
  `id_epilogi` int(11) NOT NULL DEFAULT '0',
   PRIMARY KEY(`id_name`, `id_epilogi`)
)
ENGINE=INNODB;

-- Drop table view_epilogi_ypal_action
DROP TABLE IF EXISTS `view_epilogi_ypal_action`;

CREATE TABLE `view_epilogi_ypal_action` (
  `id_name` int(11) NOT NULL DEFAULT '0',
  `id_epilogi` int(11) NOT NULL DEFAULT '0',
  `id_action_param` int(11) NOT NULL DEFAULT '0',
  `id_menu` int(4) NOT NULL DEFAULT '0',
  `perigrafi` varchar(100),
  `ypagete` int(11),
  PRIMARY KEY(`id_name`, `id_epilogi`, `id_action_param`, `id_menu`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table stoixeia_forea
DROP TABLE IF EXISTS `stoixeia_forea`;

CREATE TABLE `stoixeia_forea` (
  `id_stoixeio` int(6) NOT NULL AUTO_INCREMENT,
  `onoma` varchar(40) NOT NULL,
  `ypagete` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY(`id_stoixeio`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table katagrafi_stoixeia_forea
DROP TABLE IF EXISTS `katagrafi_stoixeia_forea`;

CREATE TABLE `katagrafi_stoixeia_forea` (
  `NMID` int(11) NOT NULL AUTO_INCREMENT,
  `id_kentro` int(11) NOT NULL DEFAULT '0',
  `id_stoixeio` int(6) NOT NULL DEFAULT '0',
  `katastasi` int(3),
  `sxolia` varchar(50),
  PRIMARY KEY(`NMID`)
)
ENGINE=INNODB;

-- Drop table menu
DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id_menu` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50),
  `label` varchar(50),
  PRIMARY KEY(`id_menu`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table dummies
DROP TABLE IF EXISTS `dummies`;
CREATE TABLE `dummies` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `perigrafi` varchar(100),
  `sxolia` text,
  PRIMARY KEY(`id`)
)
ENGINE=MYISAM
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;

-- Drop table foreis
DROP TABLE IF EXISTS `foreis`;
CREATE TABLE `foreis` (
  `id_kentro` int(11) NOT NULL AUTO_INCREMENT,
  `onoma` varchar(50) NOT NULL,
  `tilefono` varchar(15),
  `fax` varchar(15),
  `email` varchar(40),
  `address` varchar(50),
  `zip` varchar(6),
  `poli` varchar(30),
  `id_nomos` int(4) DEFAULT '0',
  `id_katigorias` int(4) DEFAULT '0',
  `pistopoiisi` int(2) DEFAULT '0',
  `perigrafi` varchar(100),
  `ypagete` int(11),
  PRIMARY KEY(`id_kentro`)
)
ENGINE=INNODB
CHARACTER SET utf8 
COLLATE utf8_unicode_ci ;
-- eidikotites sxolon
drop table if exists `eidikotites`;
create table `eidikotites` (
	`id_eidikotita` INT(4) not null AUTO_INCREMENT,
	`perigrafi` VARCHAR(100),
	PRIMARY KEY(`id_eidikotita`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;

-- etisia sxolika eti
drop table if exists `sxol_etos`;
create table `sxol_etos` (
	`sxol_etos` VARCHAR(10),
	`id_sxol_etos` int(4) not null AUTO_INCREMENT,
	PRIMARY KEY(`id_sxol_etos`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;

-- sxoliko etos stin epas
DROP TABLE IF EXISTS `epas_sxol_etos`;
create table `epas_sxol_etos` (
	`id_kentro` int(11),
	`id_sxol_etos` int(4),
	`id_epas_sxol_etos` int(4) not null AUTO_INCREMENT,
	`perigrafi` varchar(100) NOT NULL,
	`id_name` int(11),
	PRIMARY KEY(`id_epas_sxol_etos`),
	CONSTRAINT `mon_etos` UNIQUE(`id_kentro`, `id_sxol_etos`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci;

-- sxol. etos & eidikotita epas 
DROP TABLE IF EXISTS `epas_sxol_etos_eidik`;
create table `epas_sxol_etos_eidik` (
	`id_epas_sxol_etos` int(4),
	`id_epas_sxol_etos_eidik` int(4) not null AUTO_INCREMENT,
	`eidikotita` INT(4),
	`enarxi` date,
	`lixi` date,
	`perigrafi` varchar(100) NOT NULL,
	`id_name` int(11),
	PRIMARY KEY(`id_epas_sxol_etos_eidik`),
	CONSTRAINT `mon_eid` UNIQUE(`id_epas_sxol_etos`,`eidikotita`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci;

-- sxol. etos kai taxi eidikotitas
DROP TABLE IF EXISTS `epas_sxol_etos_eidik_tax`;
create table `epas_sxol_etos_eidik_tax` (
	`id_epas_sxol_etos_eidik` int(4),
	`id_epas_sxol_etos_eidik_tax` int(4) not null AUTO_INCREMENT,
	`taxi` varchar(20),
	PRIMARY KEY(`id_epas_sxol_etos_eidik_tax`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci;


-- sxol. etos kai tmima taxis eidikotitas
DROP TABLE IF EXISTS `epas_sxol_etos_eidik_tax_tmima`;
create table `epas_sxol_etos_eidik_tax_tmima` (
	`id_epas_sxol_etos_eidik_tax` int(4),
	`id_epas_sxol_etos_eidik_tax_tmima` int(4) not null AUTO_INCREMENT,
	`perigrafi` varchar(100) NOT NULL,
	PRIMARY KEY(`id_epas_sxol_etos_eidik_tax_tmima`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci;


-- mathimata stin taxi tu tmimatos
DROP TABLE IF EXISTS `epas_sxol_etos_eidik_tax_mathimata`;
create table `epas_sxol_etos_eidik_tax_mathimata` (
	`id_mathima` int(11) not null,
	`id_epas_sxol_etos_eidik_tax` int(4) not null,
	`type` enum('ergastirio','theoria') not null,
	`ores` int(2) not null,
	`id_epas_sxol_etos_eidik_tax_mathimata` int(4) not null AUTO_INCREMENT,
	PRIMARY KEY(`id_epas_sxol_etos_eidik_tax_mathimata`),
	CONSTRAINT `ypoxreotiko` UNIQUE(`id_mathima`,`type`,`id_epas_sxol_etos_eidik_tax`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci;

-- tropoi proslipseis
DROP TABLE IF EXISTS `pros_kathig_epas`;
create table `pros_kathig_epas` (
	`id_proslipsis` int(4) not null AUTO_INCREMENT,
	`perigrafi` varchar(50),
	PRIMARY KEY(`id_proslipsis`),
	CONSTRAINT YP_PROSLIPSI UNIQUE (`perigrafi`)	
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci;



-- kathigites gia tin epas to sxoliko_etos
DROP TABLE IF EXISTS `kathigites_epas_sxol_etos`;
create table `kathigites_epas_sxol_etos` (
	`id_epas_sxol_etos` int(4),
	`id_ekpaideyti` int(5),
	`is_ypal` int(1),
	`id_kathigites_epas_sxol_etos` int(4) not null AUTO_INCREMENT,
	`enarxi` date,
	`lixi` date,
	`id_proslipsis` int(4),
	`perigrafi` varchar(100),
	PRIMARY KEY(`id_kathigites_epas_sxol_etos`),
	CONSTRAINT YP_epas_kathigiti UNIQUE (`id_epas_sxol_etos`,`id_ekpaideyti`,`is_ypal`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci;




-- syndesi kathigiton me mathimata gia kapoio diastima
DROP TABLE IF EXISTS `kathigites_epas_sxol_etos_mathima`;
create table `kathigites_epas_sxol_etos_mathima` 
(
	`id_kathigites_epas_sxol_etos` int(4),
	`id_epas_sxol_etos_eidik_tax_mathimata` int(4),
	`id_kathigites_epas_sxol_etos_mathima` int(4) not null AUTO_INCREMENT,
	`apo` date,
	`eos` date,
	PRIMARY KEY(`id_kathigites_epas_sxol_etos_mathima`),
	CONSTRAINT yp_kathigiti_yp UNIQUE(`id_kathigites_epas_sxol_etos`,`id_epas_sxol_etos_eidik_tax_mathimata`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci;



-- EBDOMADIAIO PROGRAMMA tmimatos
drop table if exists `orologio_tmima`;
CREATE TABLE `orologio_tmima` (
 `id_orol_tmima` int(4) not null AUTO_INCREMENT,
 `id_epas_sxol_etos_eidik_tax_mathimata` int(4) NOT NULL,
 `id_epas_sxol_etos_eidik_tax_tmima` int(4) NOT NULL,
 `imera` enum('Monday','Tuesday','Wednesday', 'Thursday', 'Friday','Saturday','Sunday')  NOT NULL,
 `ora` enum('1h','2h','3h','4h','5h') NOT NULL,
 `id_kathigites_epas_sxol_etos` int(4),
  CONSTRAINT YP_OROLOGI UNIQUE (`imera`,`ora`,`id_epas_sxol_etos_eidik_tax_tmima`),
 PRIMARY KEY(`id_orol_tmima`)
 )
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;

-- Triskeyma
drop table if exists `thriskeyma`;
create table `thriskeyma` (
	`id_thriskeyma` int(4) not null AUTO_INCREMENT,
	`perigrafi` varchar(100),
	PRIMARY KEY(`id_thriskeyma`),
	CONSTRAINT YP_OROLOGI UNIQUE (`perigrafi`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;

-- ypikootita
drop table if exists `ypikootita`;
create table `ypikootita` (
	`id_ypikootita` int(4) not null AUTO_INCREMENT,
	`perigrafi` varchar(100),
	PRIMARY KEY(`id_ypikootita`),
	CONSTRAINT YP_OROLOGI UNIQUE (`perigrafi`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;

-- epaggelmata
drop table if exists `epaggelmata`;
create table `epaggelmata` (
	`id_epaggelmata` int(4) not null AUTO_INCREMENT,
	`perigrafi` varchar(100),
	PRIMARY KEY(`id_epaggelmata`),
	CONSTRAINT YP_OROLOGI UNIQUE (`perigrafi`)
	
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;



-- oi mathites
drop table if exists `mathiti`;
CREATE TABLE `mathiti` (
 `id_mathiti` int(5) not null AUTO_INCREMENT,
 `onoma` VARCHAR(40) NOT NULL,
 `epwnymo` VARCHAR(40) NOT NULL,
 `topos_gennisis` VARCHAR(60),
 `birthday` date,
 `onoma_patera` VARCHAR(40),
 `onoma_miteras` VARCHAR(40),
 `epwnymo_patera` VARCHAR(40),
 `epwnymo_miteras` VARCHAR(40),
 `genos` VARCHAR(40),
 `dimos` VARCHAR(40),
 `am` VARCHAR(5),
 `sex` enum('1','2') default '1',
 `id_thriskeyma` int(4),
 `id_ypikootita` int(4),
 `id_epaggelma_patera` int(4),
 `epwnymo_kidemona` VARCHAR(40),
 `onoma_kidemona` VARCHAR(40),
 `address` VARCHAR(40),
 `zip` VARCHAR(5),
 `id_poli_diamoni` VARCHAR(40),
 `tilefono` VARCHAR(10),
 `mobile` VARCHAR(10),
 `id_nomos` int(4),
  PRIMARY KEY(`id_mathiti`),
  CONSTRAINT yp_math UNIQUE (`onoma`,`epwnymo`,`onoma_patera`)
 )
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;

-- mathites se taxi
drop table if exists `mathites_taxi`;
CREATE TABLE `mathites_taxi` (
 `id_mathiti` int(5),
 `id_epas_sxol_etos_eidik_tax` int(4),
 `id_mathiti_taxi` int(5) not null AUTO_INCREMENT,
  PRIMARY KEY(`id_mathiti_taxi`),
  CONSTRAINT yp_mt UNIQUE (`id_epas_sxol_etos_eidik_tax`, `id_mathiti`)
 )
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;

-- mathites se tmimata an tyxei na allaksi
drop table if exists `mathites_tmima`;
CREATE TABLE `mathites_tmima` (
 `id_mathiti_taxi` int(5),
 `id_epas_sxol_etos_eidik_tax_tmima` int(4),
 `apo` date,
 `eos` date,
 `perigrafi` VARCHAR(100),
 `id_mathiti_tmima` int(5) not null AUTO_INCREMENT,
  PRIMARY KEY(`id_mathiti_tmima`)
 )
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci;

-- epidoseis mathiti epipedo taxis
drop table if exists `math_proodos`;
CREATE TABLE `math_proodos` (
 `id_mathiti_taxi` int(5) not null,
 `id_epas_sxol_etos_eidik_tax_mathimata` int(4),
 `a_tetr` int(2),
 `b_tetr` int(2),
 `grapta` int(2),
 `id_math_proodos` int(5) AUTO_INCREMENT,
  PRIMARY KEY(`id_math_proodos`)
 )
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;

-- kathigitis parusiologio
drop table if exists `parusiol_kathig`;
CREATE TABLE `parusiol_kathig` (
 `id_kathigites_epas_sxol_etos` int(4),
 `imera` DATE  not null,
 `id_orol_tmima` int(4) not null, 
 `id_parusiol_kathig` int(5) AUTO_INCREMENT not null, 
  PRIMARY KEY(`id_parusiol_kathig`),
  CONSTRAINT YP_PARUS UNIQUE (`imera`,`id_orol_tmima`)
 )
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;

-- imerisio pausiologio tmimatos
drop table if exists `epas_parusiologio`;
CREATE TABLE `epas_parusiologio` (
 `id_mathiti_tmima` int(5) not null,
 `parusia` enum('0','1') not null,
 `id_parusiol_kathig` int(5)  not null, 
  PRIMARY KEY(`id_mathiti_tmima`,`id_parusiol_kathig`)
 )
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_unicode_ci ;

ALTER TABLE `epas_sxol_etos_eidik` ADD 
	CONSTRAINT `esee` FOREIGN KEY(`id_epas_sxol_etos`)  
		REFERENCES `epas_sxol_etos`(`id_epas_sxol_etos`) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `epas_sxol_etos_eidik_tax` ADD 
	CONSTRAINT `eseet` FOREIGN KEY(`id_epas_sxol_etos_eidik`)  
		REFERENCES `epas_sxol_etos_eidik`(`id_epas_sxol_etos_eidik`) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `epas_sxol_etos_eidik_tax_tmima` ADD 
	CONSTRAINT `eseett` FOREIGN KEY(`id_epas_sxol_etos_eidik_tax`)  
		REFERENCES `epas_sxol_etos_eidik_tax`(`id_epas_sxol_etos_eidik_tax`) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `epas_sxol_etos_eidik_tax_mathimata` ADD
	CONSTRAINT `mathpro` FOREIGN KEY(`id_mathima`)
		REFERENCES `mathimata`(`id_mathima`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `epas_sxol_etos_eidik_tax_mathimata` ADD
	CONSTRAINT `taxma` FOREIGN KEY(`id_epas_sxol_etos_eidik_tax`)
		REFERENCES `epas_sxol_etos_eidik_tax`(`id_epas_sxol_etos_eidik_tax`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;		

ALTER TABLE `mathites_tmima` ADD 
	CONSTRAINT `mathtm` FOREIGN KEY(`id_mathiti_taxi`)  
		REFERENCES `mathites_taxi`(`id_mathiti_taxi`) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

	

ALTER TABLE `nomoi` ADD
  CONSTRAINT `Ref_01` FOREIGN KEY (`id_perifereia`)
    REFERENCES `perifereies`(`id_perifereia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;




ALTER TABLE `parametroi_acton` ADD
  CONSTRAINT `Ref_47` FOREIGN KEY (`id_param`)
    REFERENCES `parametroi`(`id_param`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE `parametroi_acton` ADD
  CONSTRAINT `Ref_48` FOREIGN KEY (`id_action`)
    REFERENCES `actions`(`id_action`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE `view_epilogi` ADD
  CONSTRAINT `Ref_45` FOREIGN KEY (`ypagete`)
    REFERENCES `view_epilogi`(`id_epilogi`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE `view_epilogi_ypal_action` ADD
  CONSTRAINT `Ref_vey` FOREIGN KEY (`ypagete`)
    REFERENCES `view_epilogi_ypal_action`(`id_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
	
ALTER TABLE `view_epilogi_ypal` ADD
  CONSTRAINT `Ref_51` FOREIGN KEY (`id_name`)
    REFERENCES `ipalliloi`(`id_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE `view_epilogi_ypal` ADD
  CONSTRAINT `Ref_52` FOREIGN KEY (`id_epilogi`)
    REFERENCES `view_epilogi`(`id_epilogi`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE `view_epilogi_ypal_action` ADD
  CONSTRAINT `Ref_54` FOREIGN KEY (`id_name`, `id_epilogi`)
    REFERENCES `view_epilogi_ypal`(`id_name`, `id_epilogi`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE `view_epilogi_ypal_action` ADD
  CONSTRAINT `Ref_53` FOREIGN KEY (`id_action_param`)
    REFERENCES `parametroi_acton`(`id_par_action`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE `view_epilogi_ypal_action` ADD
  CONSTRAINT `Ref_59` FOREIGN KEY (`id_menu`)
    REFERENCES `menu`(`id_menu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE `stoixeia_forea` ADD
  CONSTRAINT `Ref_55` FOREIGN KEY (`ypagete`)
    REFERENCES `stoixeia_forea`(`id_stoixeio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE `katagrafi_stoixeia_forea` ADD
  CONSTRAINT `Ref_57` FOREIGN KEY (`id_stoixeio`)
    REFERENCES `stoixeia_forea`(`id_stoixeio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
	
ALTER TABLE `orologio_tmima` ADD
  CONSTRAINT `del_math` FOREIGN KEY (`id_epas_sxol_etos_eidik_tax_mathimata`)
    REFERENCES `epas_sxol_etos_eidik_tax_mathimata`(`id_epas_sxol_etos_eidik_tax_mathimata`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;


ALTER TABLE `katagrafi_stoixeia_forea` ADD
  CONSTRAINT `Ref_56` FOREIGN KEY (`id_kentro`)
    REFERENCES `foreis`(`id_kentro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE `foreis` ADD
  CONSTRAINT `Ref_36` FOREIGN KEY (`id_katigorias`)
    REFERENCES `kat_foreon`(`id_katigorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE `foreis` ADD
  CONSTRAINT `Ref_02` FOREIGN KEY (`id_nomos`)
    REFERENCES `nomoi`(`id_nomos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;




-- Drop Stored Proc progonoi
DROP FUNCTION IF EXISTS `progonoi`;

DELIMITER ||
CREATE FUNCTION `progonoi` (`project` INT)
RETURNS VARCHAR(256)
LANGUAGE SQL
DETERMINISTIC
SQL SECURITY DEFINER
BEGIN
  DECLARE ch INT;
    DECLARE rv VARCHAR(256);
    DECLARE onom VARCHAR(40);
    DECLARE cm CHAR(1);
    SET rv='';
    SET ch=project;
    SET cm='';
    SET onom='';
    while ch>0 DO
        select IFNULL(ypagete,-1) into ch from (select ypagete from view_epilogi where id_epilogi=ch) A;
        IF ch>0 then
            select id_epilogi into onom from view_epilogi where id_epilogi=ch;
            SET rv=CONCAT(rv,cm,onom);
            SET cm=',';
        end if;
    end while;
    return rv;
END; ||
DELIMITER ;


-- Drop Stored Proc getPriority
DROP FUNCTION IF EXISTS `getPriority`;


DELIMITER ||
CREATE FUNCTION `getPriority` (`inID` INT)
RETURNS VARCHAR(255)
LANGUAGE SQL
DETERMINISTIC
SQL SECURITY DEFINER
BEGIN
  DECLARE gParentID INT DEFAULT 0;
    DECLARE gPriority VARCHAR(255) DEFAULT '';
    SET gPriority = inID;
    SELECT ypagete INTO gParentID FROM view_epilogi WHERE id_epilogi = inID;
    WHILE gParentID > 0 DO
      SET gPriority = CONCAT(gParentID, '.', gPriority);
      SELECT ypagete INTO gParentID FROM view_epilogi WHERE id_epilogi = gParentID;
    END WHILE;
    RETURN gPriority;
END; ||
DELIMITER ;


-- Drop Stored Proc initialize_project
DROP PROCEDURE IF EXISTS `initialize_project_ekpaideysis`;
DELIMITER ||

CREATE PROCEDURE `initialize_project_ekpaideysis` ()
LANGUAGE SQL
SQL SECURITY DEFINER
BEGIN
  declare builderID int DEFAULT 0;
  SET builderID=boss_ekp_sig();
  insert into view_epilogi_ypal(id_name,id_epilogi) values(builderID,1);
  insert into view_epilogi_ypal_action(id_action_param, id_epilogi, id_name, id_menu) values(2, 1, builderID, 14);
END; ||
DELIMITER ;


-- Drop Stored Proc boss
DROP FUNCTION IF EXISTS `boss`;


DELIMITER ||
CREATE FUNCTION `boss` ()
RETURNS INT
LANGUAGE SQL
SQL SECURITY DEFINER
BEGIN
  DECLARE DieythintisID INT DEFAULT 0;
  DECLARE katartisisid int DEFAULT 0;
  declare builderID int DEFAULT 0;
  SELECT id_thesi INTO DieythintisID FROM ypiresiakes_theseis WHERE onoma = 'Διευθυντής';
  SELECT id_kentro INTO katartisisid FROM foreis where onoma='Κ.Υ.-Διεύθυνσης Κατάρτισης';
  select id_name INTO builderID from foreis_ipalliloi where id_thesi= DieythintisID and id_kentro=katartisisid and ews IS NULL;
  return builderID;
END; ||
DELIMITER ;


-- Drop Stored Proc boss
DROP FUNCTION IF EXISTS `boss_ekp_sig`;
DELIMITER ||
CREATE FUNCTION `boss_ekp_sig` ()
RETURNS INT
LANGUAGE SQL
SQL SECURITY DEFINER
BEGIN
  DECLARE DieythintisID INT DEFAULT 0;
  DECLARE katartisisid int DEFAULT 0;
  declare builderID int DEFAULT 0;
  SELECT id_thesi INTO DieythintisID FROM ypiresiakes_theseis WHERE onoma = 'Διευθυντής';
  SELECT id_kentro INTO katartisisid FROM foreis where onoma='Συγγρού';
  select id_name INTO builderID from foreis_ipalliloi where id_thesi= DieythintisID and id_kentro=katartisisid and ews IS NULL;
  return builderID;
END; ||
DELIMITER ;

insert kat_foreon(onoma) values("ΚΕΝΤΡΙΚΗ ΥΠΗΡΕΣΙΑ");
insert kat_foreon(onoma) values("ΚΕΝΤΡΑ ΔΗΜΗΤΡΑ");
insert kat_foreon(onoma) values("ΕΠΑ.Σ.");
insert kat_foreon(onoma) values("ΙΝΣΤΙΤΟΥΤΑ ΕΡΕΥΝΑΣ");

insert into perifereies(onoma) values("ΑΝΑΤΟΛΙΚΗΣ ΜΑΚΕΔΟΝΙΑΣ ΚΑΙ ΘΡΑΚΗΣ");
insert into perifereies(onoma) values("ΚΕΝΤΡΙΚΗΣ ΜΑΚΕΔΟΝΙΑΣ");
insert into perifereies(onoma) values("ΔΥΤΙΚΗΣ ΜΑΚΕΔΟΝΙΑΣ");
insert into perifereies(onoma) values("ΗΠΕΙΡΟΥ");
insert into perifereies(onoma) values("ΘΕΣΣΑΛΙΑΣ");
insert into perifereies(onoma) values("ΙΟΝΙΩΝ ΝΗΣΩΝ");
insert into perifereies(onoma) values("ΔΥΤΙΚΗΣ ΕΛΛΑΔΑΣ");
insert into perifereies(onoma) values("ΣΤΕΡΕΑΣ ΕΛΛΑΔΑΣ");
insert into perifereies(onoma) values("ΑΤΤΙΚΗΣ");
insert into perifereies(onoma) values("ΠΕΛΟΠΟΝΝΗΣΟΥ");
insert into perifereies(onoma) values("ΒΟΡΕΙΟΥ ΑΙΓΑΙΟΥ");
insert into perifereies(onoma) values("ΝΟΤΙΟΥ ΑΙΓΑΙΟΥ");
insert into perifereies(onoma) values("ΚΡΗΤΗΣ");

insert into nomoi(onoma,id_perifereia) values("ΛΕΣΒΟΥ",11);
insert into nomoi(onoma,id_perifereia) values("ΣΑΜΟΥ",11);
insert into nomoi(onoma,id_perifereia) values("ΧΙΟΥ",11);

insert into nomoi(onoma,id_perifereia) values("ΔΩΔΕΚΑΝΗΣΟΥ",12);
insert into nomoi(onoma,id_perifereia) values("ΚΥΚΛΑΔΩΝ",12);

insert into nomoi(onoma,id_perifereia) values("ΑΤΤΙΚΗΣ",9);

insert into nomoi(onoma,id_perifereia) values("ΓΡΕΒΕΝΩΝ",3);
insert into nomoi(onoma,id_perifereia) values("ΚΑΣΤΟΡΙΑΣ",3);
insert into nomoi(onoma,id_perifereia) values("ΚΟΖΑΝΗΣ",3);
insert into nomoi(onoma,id_perifereia) values("ΦΛΩΡΙΝΑΣ",3);

insert into nomoi(onoma,id_perifereia) values("ΑΡΤΑΣ",4);
insert into nomoi(onoma,id_perifereia) values("ΘΕΣΠΡΩΤΙΑΣ",4);
insert into nomoi(onoma,id_perifereia) values("ΙΩΑΝΝΙΝΩΝ",4);
insert into nomoi(onoma,id_perifereia) values("ΠΡΕΒΕΖΑΣ",4);

insert into nomoi(onoma,id_perifereia) values("ΚΑΡΔΙΤΣΑΣ",5);
insert into nomoi(onoma,id_perifereia) values("ΛΑΡΙΣΑΣ",5);
insert into nomoi(onoma,id_perifereia) values("ΜΑΓΝΗΣΙΑΣ",5);
insert into nomoi(onoma,id_perifereia) values("ΤΡΙΚΑΛΩΝ",5);

insert into nomoi(onoma,id_perifereia) values("ΒΟΙΩΤΙΑΣ",8);
insert into nomoi(onoma,id_perifereia) values("ΕΥΒΟΙΑΣ",8);
insert into nomoi(onoma,id_perifereia) values("ΕΥΡΥΤΑΝΙΑΣ",8);
insert into nomoi(onoma,id_perifereia) values("ΦΘΙΩΤΙΔΟΣ",8);
insert into nomoi(onoma,id_perifereia) values("ΦΩΚΙΔΟΣ",8);

insert into nomoi(onoma,id_perifereia) values("ΗΡΑΚΛΕΙΟΥ",13);
insert into nomoi(onoma,id_perifereia) values("ΛΑΣΙΘΙΟΥ",13);
insert into nomoi(onoma,id_perifereia) values("ΡΕΘΥΜΝΟΥ",13);
insert into nomoi(onoma,id_perifereia) values("ΧΑΝΙΩΝ",13);

insert into nomoi(onoma,id_perifereia) values("ΔΡΑΜΑΣ",1);
insert into nomoi(onoma,id_perifereia) values("ΕΒΡΟΥ",1);
insert into nomoi(onoma,id_perifereia) values("ΚΑΒΑΛΑΣ",1);
insert into nomoi(onoma,id_perifereia) values("ΞΑΝΘΗΣ",1);
insert into nomoi(onoma,id_perifereia) values("ΡΟΔΟΠΗΣ",1);

insert into nomoi(onoma,id_perifereia) values("ΗΜΑΘΙΑΣ",2);
insert into nomoi(onoma,id_perifereia) values("ΘΕΣΣΑΛΟΝΙΚΗΣ",2);
insert into nomoi(onoma,id_perifereia) values("ΚΙΛΚΙΣ",2);
insert into nomoi(onoma,id_perifereia) values("ΠΕΛΛΑΣ",2);
insert into nomoi(onoma,id_perifereia) values("ΠΙΕΡΙΑΣ",2);
insert into nomoi(onoma,id_perifereia) values("ΣΕΡΡΩΝ",2);
insert into nomoi(onoma,id_perifereia) values("ΧΑΛΚΙΔΙΚΗΣ",2);

insert into nomoi(onoma,id_perifereia) values("ΑΙΤΩΛΟΑΚΑΡΝΑΝΙΑΣ",7);
insert into nomoi(onoma,id_perifereia) values("ΑΧΑΪΑΣ",7);
insert into nomoi(onoma,id_perifereia) values("ΗΛΕΙΑΣ",7);

insert into nomoi(onoma,id_perifereia) values("ΖΑΚΥΝΘΟΥ",6);
insert into nomoi(onoma,id_perifereia) values("ΚΕΡΚΥΡΑΣ",6);
insert into nomoi(onoma,id_perifereia) values("ΚΕΦΑΛΛΗΝΙΑΣ ΚΑΙ ΙΘΑΚΗΣ",6);
insert into nomoi(onoma,id_perifereia) values("ΛΕΥΚΑΔΑΣ",6);

insert into nomoi(onoma,id_perifereia) values("ΑΡΓΟΛΙΔΑΣ",10);
insert into nomoi(onoma,id_perifereia) values("ΑΡΚΑΔΙΑΣ",10);
insert into nomoi(onoma,id_perifereia) values("ΚΟΡΙΝΘΙΑΣ",10);
insert into nomoi(onoma,id_perifereia) values("ΛΑΚΩΝΙΑΣ",10);
insert into nomoi(onoma,id_perifereia) values("ΜΕΣΣΗΝΙΑΣ",10);

insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Φώτης","Παπαδόπουλος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Γρηγόρης","Τσιανόπουλος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Κυριάκος","Δογάνης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Μάγδα","Οικονόμου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Μιχάλης","Σιδηρόπουλος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Μαρία","Τσιλιοπουλου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ιωάννα","Αντωνιάδου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Αθανάσιος","Δεμίρης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Αναστασία","Παπαχρήστου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Κων/νος","Μπούντας","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Βαλάντης","Μαρκογιαννίδης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Αβραάμ","Νικολαϊδης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ανθιμος ","Αναστασιάδης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Αντώνης","Μπρέσκας","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Παναγιώτης","Σκοτειδάκης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Κων/νος","Μάντζαρης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Νικόλαος","Βάγιας","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Παναγιώτης","Παπαφωτίου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Σπυρίδων","Στάχτιαρης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Χαρίκλεια","Τσουγκριάνη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Μαρία","Χαλκιαδάκη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Σταυρούλα","Ζιώγου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Χρήστος","Βίλλης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Δημήτρης","Κοντός","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ανδρέας","Τσούρος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Κατερίνα","Μάλλη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Παναγιώτης","Παπαβασιλείου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ιωσήφ","Παπαναστασίου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Εριφύλλη","Ρωινιώτη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Λεμονιά","Σουγλέ","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Γώργιος","Μπάσδρας","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ελευθερία","Μαρκούτη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Γώργιος","Κορομπίλιας","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Κώστας","Θέος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Σωτηριος","Ζάμπουρας","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ζωή","Καραμαλίγκα","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Γώργιος","Μολόχας","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Παναγιώτης","Μιχαλακόπουλος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Σωσώ","Δημητρίου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ασημάκης","Βουρλιάς","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Στέλιος","Πέτρος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Σταύρος","Πάσχος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Σπύρος","Κοτρότσος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Νικολέτα","Γιαννοπούλου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("¶γγελος","Κεφαλληνός","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Θεοδώρα","Γώγωλου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Θεοδώρα","Ψευτογκά","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Λάμπρος","Στέφος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Νικόλαος","Καραβασίλης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Πηνελόπη","Μπάλτζωη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Βασίλης","Ντερμάρης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ανατολή","Σιδηροπούλου-Μαργαρίτη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Στάθης","Κοκελίδης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ανδριάνα","Βασιλοπούλου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Βασιλική","Κίτσιου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Παναγιώτης","Βαρσάμης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ιφιγένεια","Καβακλιώτου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Μαρία","Τοσουνίδου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ασημίνα","Αραπατσάκου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ελενη","Πινακούλα","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Αγγελίκη","Τσούτα","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Δήμητρα","Τσαπάρα","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Βασιλική","Γραμματίκα","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ελένη","Ράπτη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ιωάννης","Σκορδάς","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Γιώργος","Τσουμάνης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Κων/νος","Γώγος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Στέφανος","Γιαννήλος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Κων/να","Θανοπούλου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ευθύμιος","Ζάββος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Μαργαρίτα","Πλαγάκη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ηλίας","Ανδρικόπουλος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Φώτιος","Φράγκος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ιωάννης","Θεοχαρόπουλος","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Αντώνιος","Παπαδημητράκης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Μαρία","Ζωγραφάκη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Μανώλης","Καλομοίρης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ιωάννα","Καλαϊτζίδου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Μαρία","Μαρικάκη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Στέλλα","Χατζηγεωργίου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ζηνοβία","Μουντράκη","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Ειρήνη","Μεθενίτου","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Γεώργιος","Νικολουδάκης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Νικόλαος","Καμπουράκης","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Αλεξάνδρα","Μέγα","123",null,null);
insert into ipalliloi(onoma,epwnymo,psd,id_ekpaideyseis,id_nomos) values("Αθανάσιος","Μπουρλέτσικας","123",null,null);
insert into ypiresiakes_theseis(onoma) values("Διευθύνων Σύμβουλος");
insert into ypiresiakes_theseis(onoma) values("Διευθυντής");
insert into ypiresiakes_theseis(onoma) values("Προϊστάμενος");
insert into ypiresiakes_theseis(onoma) values("Επιστημονικό Προσωπικό");
insert into ypiresiakes_theseis(onoma) values("Γενικός Διευθυντής");
insert into ypiresiakes_theseis(onoma) values("Τμημάρχης");
insert into ypiresiakes_theseis(onoma) values("Καθηγητής");

insert into foreis(onoma,perigrafi,id_nomos,id_katigorias,ypagete) values("Κ.Υ.-Διεύθυνσης Εκπαίδευσης","Κ.Υ.-Διεύθυνσης Εκπαίδευσης",6,1,24);
insert into foreis(onoma,perigrafi,id_nomos,id_katigorias,ypagete) values("Κ.Υ.-Διεύθυνσης Κατάρτισης","Κ.Υ.-Διεύθυνσης Κατάρτισης",6,1,24);
insert into foreis(onoma,perigrafi,poli,id_nomos,id_katigorias,ypagete) values("Αβερώφειος","Αβερώφειος","Λάρισα",16,3,24);
insert into foreis(onoma,perigrafi,poli,id_nomos,id_katigorias,ypagete) values("Συγγρού","Συγγρού","Αμαρούσιο",6,3,24);
insert into foreis(onoma,perigrafi,poli,id_nomos,id_katigorias,ypagete) values("Γαλακτοκομική","Γαλακτοκομική","Ιωάννινα",13,3,24);
insert into foreis(onoma,perigrafi,poli,id_nomos,id_katigorias,ypagete) values("Γεωργική Νεμέας","Γεωργική Νεμέας","Νεμέα",49,3,24);
insert into foreis(onoma,perigrafi,poli,id_nomos,id_katigorias,ypagete) values("Καλαμπάκας","Καλαμπάκας","Καλαμπάκα",18,3,24);
insert into foreis(onoma,perigrafi,poli,id_nomos,id_katigorias,ypagete) values("Κρήτης","Κρήτης","Μεσσαρά",24,3,24);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Σερρών","Σερρών","1ο χλμ Σερρών-Νιγρίτας", "62111", "Σέρρες","23210-59913","23210-59913","ogeka0@otenet.gr",38,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Σιδηροκάστρου","Σιδηροκάστρου","Αλεξίδη 1","62300", "Σιδηρόκαστρο","23230-23597","23230-23597",38,2,2);
insert into foreis(ONOMA, perigrafi,zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Αρναίας Χαλκιδικής","Αρναίας Χαλκιδικής","63200", "Αρναία","23730-91423","23730-91423",39,2,2);
insert into foreis(ONOMA, perigrafi,zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Αγίου Μάμα","Αγίου Μάμα","63200", "¶γιος Μάμας","23730-91423","23730-91423","kdagiosmamas@yahoo.gr",39,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Θεσσαλονίκης","Θεσσαλονίκης","Αμερικάνικης Γεωργικής Σχολής ΤΘ 23", "55102", "Φοίνικας Θεσσαλονίκης","2310-472300","2310-473213","ogeekath@otenet.gr",34,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Κιλκίς","Κιλκίς","Γ.Αργυρίου 12", "61100", "Κιλκίς","23410-22673","23410-75382",35,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Σκύδρας","Σκύδρας","2 ΧΛΜ ΜΑΥΡΟΒΟΥΝΙ ΕΔΕΣΣΑΣ ΤΘ 3344", "58500","Σκύδρα","23810-89483","23810-83143",36,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Μακροχωρίου","Μακροχωρίου","Αριστοτέλους 2", "59033", "Μακροχώρι","23310-41202","23310-41202",33,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Κατερίνης","Κατερίνης","Εθνικού Σταδίου 1", "60100", "Κατερίνη","23510-29845","23510-28059",37,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Αλεξανδρούπολης","Αλεξανδρούπολης","Λεωφόρος Δημοκρατίας 4", "68100", "Αλεξανδρούπολη","25510-28375","25510-28375",29,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Ορεστιάδας","Ορεστιάδας","Ευριπίδου 15 ΤΘ 64", "68200", "Ορεστιάδα","25520-22433","25520-22720",29,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Κομοτηνής","Κομοτηνής","Ν.Πλαστήρα 20", "69100", "Κομοτηνή","25310-82019","25310-22121","kdkom@otenet.gr",32,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Ξάνθης","Ξάνθης","1ο χλμ Ξάνθης -Λάγος", "67100", "Ξάνθη","25410-22386","25410-20095","ogeekaxa@otenet.gr",31,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Δράμας","Δράμας","5ο χλμ.Δράμας-Θεσ/κης", "66100", "Δράμα","25210-58175","25210-58175","drogeeka@otenet.gr",28,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Χρυσούπολης","Χρυσούπολης","Βενιζέλου 1", "64200", "Χρυσούπολη","25910-22395","25910-22395","drogeeka@otenet.gr",30,2,2);
insert into foreis(onoma,perigrafi,id_nomos,id_katigorias,ypagete) values("Κ.Υ.-Γενική Διεύθυνση Εκπαίδευσης και Κατάρτισης","Κ.Υ.-Γενική Διεύθυνση Εκπαίδευσης και Κατάρτισης",6,1,null);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Καστοριάς","Καστοριάς","Δ/νση Αγροτικής Ανάπτυξης Διοικητήριο", "52100", "Καστοριά","24670-82425","24670-24460","ifi-kav@hotmail.com",8,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Πολυκάρπης","Πολυκάρπης","Δ/νση Αγροτικής Ανάπτυξης Διοικητήριο", "52100", "Καστοριά","24670-82425","24670-24460","ifi-kav@hotmail.com",8,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Φλώρινας","Φλώρινας","Διοικητήριο", "53100", "Φλώρινα","23850-54542","23850-54539",10,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Αμυνταίου","Αμυνταίου","Διοικητήριο", "53100", "Φλώρινα","23860-22478","23850-22478",10,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Γρεβενών","Γρεβενών","Τέρμα Κ. Ταλιαδούρη", "51100", "Γρεβενά","24620-84280","24620-84280","andrianavasilopoulou@yahoo.gr",7,2,2);
insert into foreis(ONOMA,  perigrafi,zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Δεσκάτης","Δεσκάτης","51200", "Δεσκάτη","24620-31372","24620-31372",7,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Κοζάνης","Κοζάνης","Λευκόβρυση ΤΘ:239", "50100", "Κοζάνη","24610-33400","24610-22663",9,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,id_nomos,id_katigorias,ypagete) values("Νεάπολης","Νεάπολης","Δ\νση Γεωργίας Κοζάνης-Διοικητήριο", "50100", "Κοζάνη","24610-33400","24610-22663",9,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,id_nomos,id_katigorias,ypagete) values("Κωστακίων","Κωστακίων","ΤΘ:72", "47100", "Κωστάκιοι","26810-26855","26810-26855",11,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,id_nomos,id_katigorias,ypagete) values("Αγνάντων","Αγνάντων","ΤΘ:72", "47100", "Κωστάκιοι","26810-70488","26810-27955",11,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,id_nomos,id_katigorias,ypagete) values("Καλεντίνης","Καλεντίνης","ΤΘ:72", "47100", "Κωστάκιοι","26810-70488","26810-27955",11,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Ιωαννίνων","Ιωαννίνων","Εθνικής Αντιστάσεως 3", "45500", "Κατσικάς","26510-92218","26510-92218","kegeioan@otenet.gr",13,2,2);
insert into foreis(ONOMA, perigrafi,zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Παραμυθιάς", "Παραμυθιάς","46200", "Παραμυθιά","26660-22455","26660-22455",12,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Γραικοχωρίου","Γραικοχωρίου","Διοικητήριο", "46200", "Ηγουμενίτσα","26660-22455","26660-224558",12,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Πρέβεζας","Πρέβεζας","Διοικητήριο", "46100", "Πρέβεζα","26820-22062","26820-22062",14,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Θεσπρωτικού","Θεσπρωτικού","Διοικητήριο", "46100", "Πρέβεζα","26820-22062","26820-22062",14,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Σκεπαστό","Σκεπαστό","Διοικητήριο", "46100", "Πρέβεζα","26820-22062","26820-22062",14,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Κέρκυρας","Κέρκυρας","Κολοκοτρώνη 23", "49100", "Κέρκυρα","26610-38188","26610-38188","ogeekacorfu@gmail.com",44,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Λευκάδας","Λευκάδας","Κολοκοτρώνη 23", "49100", "Κέρκυρα","26450-21733","26450-21736","ogeekacorfu@gmail.com",46,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono, id_nomos,id_katigorias,ypagete) values("Ζάκυνθος","Ζάκυνθος","Κολοκοτρώνη 23", "49100", "Κέρκυρα","26950-23590",43,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono, id_nomos,id_katigorias,ypagete) values("Κεφαλλονιάς","Κεφαλλονιάς","Κολοκοτρώνη 23", "49100", "Κέρκυρα","26710-24032",45,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Μεσολογγίου","Μεσολογγίου","Αγίου Αθανασίου 6", "30200", "Μεσολόγγι","26310-27576","26310-27574","nicol_gian@hotmail.com",40,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Αγρινίου","Αγρινίου","Περιοχή Εθνικού Σταδίου", "30100", "Αγρίνιο","26410-59196","26410-59196","spiroskotrotsos@gmail.com",40,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Πύργου","Πύργου","Τάκη Πετρόπουλου 15", "27100", "Πύργος","26210-36564","26210-36564",42,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("ΠΓΣ Πατρών","ΠΓΣ Πατρών","Πανεπιστημίου 171", "26110", "Πάτρα","2610-422125 ","2610-452259","petros_messol@yahoo.gr",41,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Βόλου","Βόλου","Φυτόκου ΤΘ:1350", "38001", "Βόλος","24210-60409","24210-91043","ogeekvol@otenet.gr",17,2,2);
insert into foreis(ONOMA, perigrafi,zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Αλμυρού","Αλμυρού","37100", "Αλμυρός","24220-21473 ","24220-21473","ogeekad@otenet.gr",17,2,2);
insert into foreis(ONOMA, perigrafi, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Αργαλαστής","Αργαλαστής", "37006", "Αργαλαστή","24230-54229","24230-54229",17,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Καλαμπάκας","Καλαμπάκας","ΤΘ:6851 Τέρμα Λεοτσάκου", "42200", "Καλαμπάκα","24320-22459","24320-22459","sotzamp@hotmail.com",18,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Καρδίτσας","Καρδίτσας","Ταυρωπού 77", "43100", "Καρδίτσα","24410-23943","24410-23943","korobilias@agroeco.gr",15,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Παλαμά Καρδίτσας","Παλαμά Καρδίτσας","Βουλγαροκτόνου 3", "43200", "Παλαμάς","24440-22953","24440-29087",15,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Λάρισας","Λάρισας","5ο χλμ Εθνικής Οδού Λάρισας-Τρικάλων", "41500", "Λάρισα","2410-620052","2410-613006","kege22@otenet.gr",16,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Στεφανόβουνου","Στεφανόβουνου","5ο χλμ Εθνικής Οδού Λάρισας-Τρικάλων", "41500", "Λάρισα","2410-620052","2410-613006","kege22@otenet.gr",16,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("θηβών","θηβών","2ο χλμ. Παλ.Εθν.Οδού Θηβών-Ερυθρών", "32200", "Θήβα","22620-22158","22620-29012","kdthiva@yahoo.gr",19,2,2);
insert into foreis(ONOMA,  perigrafi,zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Ν. Αρτάκης","Ν. Αρτάκης", "34600", "Νέα Αρτάκη","22210-42124","22210-42124","kdnartaki@yahoo.gr",20,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Βαρδατών","Βαρδατών","8ο χλμ Λαμίας-Αθηνών Νέο Κρίκελο", "35100", "Λαμία","22310-81500","22310-82455","kdvardat@otenet.gr",22,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Δομοκού","Δομοκού","8ο χλμ Λαμίας-Αθηνών Νέο Κρίκελο", "35100", "Λαμία","22320-22246","22320-22246","ogee59@otenet.gr",22,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Καρπενησίου","Καρπενησίου","Εγκαταστάσεις Ευρυτανία ΑΕ", "36100", "Καρπενήσι","22370-80490","22370-80490",21,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,id_nomos,id_katigorias,ypagete) values("Ευπαλίου","Ευπαλίου","Ν.Α. Φωκίδας Δ/νση Αγροτικής Ανάπτυξης Διοικητήριο", "33100", "¶μφισσα","22650-28287","22650-29997",23,2,2);
insert into foreis(ONOMA,  perigrafi,zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Κυπαρισσίας", "Κυπαρισσίας","24500", "Κυπαρισσία","27610-22116","27610-62203","kdkyp@otenet.gr",51,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Φιλιατρών","Φιλιατρών","Τριφυλία", "24300", "Φιλιατρά","27610-32497","27610-62803","kdfil@otenet.gr",51,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Καλαμάτας","Καλαμάτας","Λακωνικής 87", "24100", "Καλαμάτα","27210-44214 ","27210-93088",51,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Κερασίτσα","Κερασίτσα","Δεληγιάννη 9", "22100", "Κερασίτσα","2710-556267","2710-226938","fotisfrangos@hotmail.com",48,2,2);
insert into foreis(ONOMA, perigrafi, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Μεγαλόπολης","Μεγαλόπολης", "22200", "Μεγαλόπολη","2710-222617","2710-226938",48,2,2);
insert into foreis(ONOMA,  perigrafi,zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Τροπαίων", "Τροπαίων","22300", "Τρόπαια","2710-222617","27570-22221",48,2,2);
insert into foreis(ONOMA,  perigrafi,zip,poli,tilefono, id_nomos,id_katigorias,ypagete) values("Λεωνιδίου", "Λεωνιδίου","22300", "Λεωνίδιο","2710-222617",48,2,2);
insert into foreis(ONOMA, perigrafi,zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Νέας Κίου","Νέας Κίου","21053", "Νέα Κίος 'Αργους","27510-51365","27510-51365","ogee86@otenet.gr",47,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Γυθείου","Γυθείου","Κέντρο Γεωργικής Ανάπτυξης", "23200", "Γύθειο","27330-23138","27330-23138","ogee91@otenet.gr",50,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("ΠΓΣ Βέλου","ΠΓΣ Βέλου","Κέντρο Γεωργικής Ανάπτυξης", "20002", "Βέλος","27420-32205","27420-30046","ogee66@otenet.gr",49,2,2);
insert into foreis(ONOMA,  perigrafi,zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Νάξου", "Νάξου","84300", "Νάξος","22850-22224","22850-22428",5,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Ρόδου","Ρόδου","Λεωφ.Καλλιθέας 1", "85100", "Ρόδος","22410-62706","22410-61225",4,2,2);
insert into foreis(ONOMA,  perigrafi,zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Σάμου", "Σάμου","83200", "Καρλόβασι","22730-80401","22730-80406",2,2,2);
insert into foreis(ONOMA,  perigrafi,zip,poli,tilefono,fax, id_nomos,id_katigorias,ypagete) values("Λέσβου", "Λέσβου","81200", "Πλωμάρι","22520-33693","22520-33693",1,2,2);
insert into foreis(ONOMA, perigrafi, poli, id_nomos,id_katigorias,ypagete) values("Χίου","Χίου", "Χίος",3,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Χανίων","Χανίων","Αγροκήπιο Σούδα", "73200", "Χανιά","28210-89322","28210-23516","kdchania@otenet.gr",26,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Ηρακλείου","Ηρακλείου","Θεμιστοκλέους Τέρμα, ΤΘ:2211 Πόρος", "71307", "Ηράκλειο","2810-229443","2810-335890","kdkdhrak@otenet.gr",23,2,2);
insert into foreis(ONOMA, perigrafi,zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Σητείας","Σητείας", "72300", "Σητεία","28430-28228","2843024895","emetheni@otenet.gr",24,2,2);
insert into foreis(ONOMA, perigrafi,address, zip,poli,tilefono,fax,email, id_nomos,id_katigorias,ypagete) values("Ρεθύμνου","Ρεθύμνου", "Μυσίργια","74100", "Ρέθυμνο","28310-25802","28310-21092","kegereth@otenet.gr",25,2,2);
insert into foreis(onoma,perigrafi,id_nomos,id_katigorias,ypagete) values("Κ.Υ.-Γενική Διεύθυνση Έρευνας","Κ.Υ.-Γενική Διεύθυνση Έρευνας",6,1,null);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(9,1,3);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(10,1,3);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(11,2,3);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(12,2,3);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(13,3,3);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(24,17,5);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(2,86,2);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(4,28,2);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(5,16,2);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(6,15,2);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(7,22,2);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(8,21,2);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(3,86,2);
insert into foreis_ipalliloi(id_kentro,id_name,id_thesi) values(1,15,2);
/*dummies */
insert into dummies(perigrafi) values("Εφαρμογές");
insert into dummies(perigrafi) values("Καθηγητές");
insert into dummies(perigrafi) values("Μαθητές");
insert into dummies(perigrafi) values("Ωρολόγιο");
insert into dummies(perigrafi) values("Παρουσιολόγιο");
insert into dummies(perigrafi) values("Τάξη Α'");
insert into dummies(perigrafi) values("Τάξη Β'");

/*view_epilοgi*/
insert into view_epilogi(pinakas,pedio,id_pediu) values("dummies","id",1);

/* actions*/
insert into actions(onoma,label) values("ypoprogramma","ypoprogramma.do");
insert into actions(onoma,label) values("organosi","organosi.do");
insert into actions(onoma,label) values("prosopiko","prosopiko.do");
insert into actions(onoma,label) values("pk","pk.do");
insert into actions(onoma,label) values("priviliges","priviliges.do");
insert into actions(onoma,label) values("project","project.do");
insert into actions(onoma,label) values("sxoliko","sxoliko.do");
insert into actions(onoma,label) values("karhigites","kathigites.do");
insert into actions(onoma,label) values("mathites","mathites.do");
insert into actions(onoma,label) values("orologio","ep_orologio.do");
insert into actions(onoma,label) values("programma_spudon","prog_spoudon.do");
insert into actions(onoma,label) values("epas_eidik","epas_eidik.do");
insert into actions(onoma,label) values("ep_parusiologio","ep_parusiologio.do");

/*parametroi*/
insert into parametroi(onoma,epilogi,value) values("action",0,"keni");
insert into parametroi(onoma,epilogi,value) values("action",0,"list");
insert into parametroi(onoma,epilogi,value) values("action",0,"delete");
insert into parametroi(onoma,epilogi,value) values("action",0,"edit");
insert into parametroi(onoma,epilogi,value) values("action",0,"view");
insert into parametroi(onoma,epilogi,value) values("action",0,"praxi_edit");
insert into parametroi(onoma,epilogi,value) values("action",0,"proodoi");
insert into parametroi(onoma,epilogi,value) values("action",0,"anath_math");
/*parametroi se action priviliges*/
insert into parametroi_acton(id_param,id_action) values(1,6);
insert into parametroi_acton(id_param,id_action) values(1,7);
insert into parametroi_acton(id_param,id_action) values(3,7);
insert into parametroi_acton(id_param,id_action) values(4,7);
insert into parametroi_acton(id_param,id_action) values(1,8);
insert into parametroi_acton(id_param,id_action) values(1,9);
insert into parametroi_acton(id_param,id_action) values(1,10);
insert into parametroi_acton(id_param,id_action) values(1,11);
insert into parametroi_acton(id_param,id_action) values(1,12);
insert into parametroi_acton(id_param,id_action) values(4,9);
insert into parametroi_acton(id_param,id_action) values(3,9);
insert into parametroi_acton(id_param,id_action) values(7,9);
insert into parametroi_acton(id_param,id_action) values(4,8);
insert into parametroi_acton(id_param,id_action) values(3,8);
insert into parametroi_acton(id_param,id_action) values(8,8);
insert into parametroi_acton(id_param,id_action) values(1,13);
/*menu*/
insert into menu(name,label) values("eisagogi_ypoprogrammatos","Εισαγωγή Υποπρογράμματος");
insert into menu(name,label) values("foreis","Επεξεργασία στοιχείων Φορέων");
insert into menu(name,label) values("prosopiko","Επεξεργασία στοιχείων Υπαλλήλων");
insert into menu(name,label) values("diag_ypoprog","Διαγραφή Υποπρογράμματος");
insert into menu(name,label) values("edit_ypoprog","Επεξεργασία Υποπρογράμματος");
insert into menu(name,label) values("eisagogi_pk","Εισαγωγή προγράμματος κατάρτισης");
insert into menu(name,label) values("diagrafi_pk","Διαγραφή προγράμματος κατάρτισης");
insert into menu(name,label) values("edit_pk","Επεξεργασία προγράμματος κατάρτισης");
insert into menu(name,label) values("view_pk","Εικόνα προγράμματος κατάρτισης");
insert into menu(name,label) values("project_create","Δημιουργία Εφαρμογής");
insert into menu(name,label) values("praxi_edit","Επεξεργασία Προγρ. Πλαισίου");
insert into menu(name,label) values("privilige_pk","Προγρ. Κατάρτισης σε Υπαλλήλους");
insert into menu(name,label) values("praxi_delete","Διαγραφή Προγρ. Πλαισίου");
insert into menu(name,label) values("sxoliko_etos","Δημιουργία Σχολικής Χρονιάς");
insert into menu(name,label) values("edit_sxoliko_etos","Ενημέρωση Σχολικής Χρονιάς");
insert into menu(name,label) values("diag_sxoliko_etos","Διαγραφή Σχολικής Χρονιάς");
insert into menu(name,label) values("eis_kathi","Εισαγωγή καθηγητών");
insert into menu(name,label) values("eis_mathiton","Εισαγωγή μαθητών");
insert into menu(name,label) values("eis_orol","Εισαγωγή ωρολογίου");
insert into menu(name,label) values("eis_etos","Εισαγωγή Πρόγραμματος Σπουδών");
insert into menu(name,label) values("eis_mat_eid","Εισαγωγή Μαθ. Ειδικότητας");
insert into menu(name,label) values("kart_proodu","Πρόοδος-βαθμοί");
insert into menu(name,label) values("kart_enim","Ενημ. στοιχείων μαθητή");
insert into menu(name,label) values("kart_diag","Διαγραφή μαθητή");
insert into menu(name,label) values("kath_enim","Ενημ. στοιχείων καθηγητή");
insert into menu(name,label) values("kath_diag","Διαγραφή καθηγητή");
insert into menu(name,label) values("math_kath","Ανάθεση μαθημάτων");
insert into menu(name,label) values("parusiologio","Παρουσιολόγιο");
/*thematiki enotita*/
insert into thematiki_enotita(perigrafi) values("Φυτική Παραγωγή - Θερμοκηπιακές Καλλιέργειες");
insert into thematiki_enotita(perigrafi) values("Φυτική Παραγωγή - (Αμπελουργία - Ελαιοκομία)");
insert into thematiki_enotita(perigrafi) values("Φυτική Παραγωγή (Θερμοκηπιακές & Υπαίθριες Καλλιέργειες)");
insert into thematiki_enotita(perigrafi) values("Ζωική Παραγωγή - Αιγοπροβατοτροφία");
/*katigories ekpaideyseis*/
insert into kat_ekpedeyseis(akrwnymio, onoma) values("ΠΕ" ,"Γεωπόνοι");
insert into kat_ekpedeyseis(akrwnymio, onoma) values("ΔΕ" ,"Διοικητικοί");
insert into kat_ekpedeyseis(akrwnymio, onoma) values("ΠΕ" ,"Οικονομικοί");
insert into kat_ekpedeyseis(akrwnymio, onoma) values("ΤΕ" ,"Λογιστικοί");
insert into kat_ekpedeyseis(akrwnymio, onoma) values("ΔΕ" ,"Οικονομικοί");
/*SXOLIKA ETI*/
insert into sxol_etos(sxol_etos) values("2015-2016");
insert into sxol_etos(sxol_etos) values("2016-2017");
insert into sxol_etos(sxol_etos) values("2017-2018");
/*eidikotites*/
insert into eidikotites(perigrafi) values("Φυτοτ. Επιχειρήσεων-Αρχιτεκτ. Τοπίου");
insert into eidikotites(perigrafi) values("Γαλακτοκομίας-Τυροκομίας"); 
insert into eidikotites(perigrafi) values("Θερμοκηπιακών Κατασκευών και Καλλιεργειών"); 
insert into eidikotites(perigrafi) values("Αμπελουργίας-Οινοτεχνίας"); 
insert into eidikotites(perigrafi) values("Τεχνιτών Ξυλογλυπτικής - Διακοσμητικής Επίπλου");
insert into eidikotites(perigrafi) values("Ζωοτεχνίας");
insert into eidikotites(perigrafi) values("Αγροτικών Μηχανημάτων");
/*Dimiurgia project ekpaideiseis*/
call initialize_project_ekpaideysis();