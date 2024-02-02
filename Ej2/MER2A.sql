-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2A
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2A
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2A` ;
USE `MER2A` ;

-- -----------------------------------------------------
-- Table `MER2A`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2A`.`Pacient` (
  `nom` VARCHAR(20) NOT NULL,
  `cognom` VARCHAR(50) NOT NULL,
  `telefon` INT(9) NOT NULL,
  `adreca` VARCHAR(200) NOT NULL,
  `nº_ss` INT(10) NOT NULL,
  `id` INT(100) NOT NULL,
  `dni` INT(9) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `MER2A`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2A`.`Metge` (
  `nº_colegial` INT(10) NOT NULL,
  `nom` VARCHAR(20) NOT NULL,
  `cognom` VARCHAR(50) NOT NULL,
  `telefon` INT(9) NOT NULL,
  `dni` INT(9) NOT NULL,
  `carrec` VARCHAR(100) NOT NULL,
  `id` INT(100) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `MER2A`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2A`.`Consulta` (
  `data` DATE NOT NULL,
  `ubicacio` VARCHAR(100) NOT NULL,
  `edifici` VARCHAR(100) NOT NULL,
  `diagnostic` TEXT(500) NOT NULL,
  `id` INT(100) NOT NULL,
  `Pacient_id` INT(100) NOT NULL,
  `Metge_id` INT(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_id` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_id` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_id`)
    REFERENCES `MER2A`.`Pacient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_id`)
    REFERENCES `MER2A`.`Metge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
