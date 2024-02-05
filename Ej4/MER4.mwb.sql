-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER4` ;
USE `MER4` ;

-- -----------------------------------------------------
-- Table `MER4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Client` (
  `DNI` VARCHAR(9) NOT NULL,
  `nom` VARCHAR(20) NOT NULL,
  `cognom` VARCHAR(50) NOT NULL,
  `adreca` VARCHAR(200) NOT NULL,
  `telefon` INT(9) NOT NULL,
  `VIP` TINYINT NOT NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `MER4`.`Tipus_Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Tipus_Polissa` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(20) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Venedor` (
  `DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `MER4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Polissa` (
  `num_polissa` VARCHAR(16) NOT NULL,
  `preu_anual` VARCHAR(32) NOT NULL,
  `tipus_pagament` VARCHAR(45) NOT NULL,
  `data_contractacio` VARCHAR(45) NOT NULL,
  `Client_DNI` VARCHAR(16) NOT NULL,
  `Tipus_Polissa_ID` VARCHAR(4) NOT NULL,
  `Venedor_DNI` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`num_polissa`),
  INDEX `fk_Polissa_Client_idx` (`Client_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Tipus_Polissa1_idx` (`Tipus_Polissa_ID` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedor1_idx` (`Venedor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Client`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `MER4`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Tipus_Polissa1`
    FOREIGN KEY (`Tipus_Polissa_ID`)
    REFERENCES `MER4`.`Tipus_Polissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedor1`
    FOREIGN KEY (`Venedor_DNI`)
    REFERENCES `MER4`.`Venedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
