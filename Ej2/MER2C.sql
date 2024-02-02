-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER 2c
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER 2c
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER 2c` ;
USE `MER 2c` ;

-- -----------------------------------------------------
-- Table `MER 2c`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER 2c`.`Alumne` (
  `DNI` INT NOT NULL,
  `nom` VARCHAR(20) NULL,
  `cognom` VARCHAR(50) NOT NULL,
  `telefon` INT NULL,
  `adreca` VARCHAR(200) NULL,
  `email` VARCHAR(60) NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `MER 2c`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER 2c`.`Departament` (
  `nom` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`nom`));


-- -----------------------------------------------------
-- Table `MER 2c`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER 2c`.`Assignatura` (
  `nom` VARCHAR(20) NOT NULL,
  `credits` VARCHAR(30) NULL,
  `professor` VARCHAR(45) NULL,
  `departament` VARCHAR(45) NULL,
  PRIMARY KEY (`nom`));


-- -----------------------------------------------------
-- Table `MER 2c`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER 2c`.`Professor` (
  `DNI` INT NOT NULL,
  `nom` VARCHAR(20) NULL,
  `cognom` VARCHAR(50) NULL,
  `departament` VARCHAR(45) NULL,
  `EsCapDepartament` VARCHAR(45) NULL,
  `titulacio` VARCHAR(45) NULL,
  `Departament_nom` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_Professor_Departament1_idx` (`Departament_nom` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_nom`)
    REFERENCES `MER 2c`.`Departament` (`nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `MER 2c`.`Assignatura Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER 2c`.`Assignatura Matricula` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `aula` VARCHAR(45) NULL,
  `Assignatura_nom` VARCHAR(20) NOT NULL,
  `Professor_DNI` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Assignatura Matricula_Assignatura1_idx` (`Assignatura_nom` ASC) VISIBLE,
  INDEX `fk_Assignatura Matricula_Professor1_idx` (`Professor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Assignatura Matricula_Assignatura1`
    FOREIGN KEY (`Assignatura_nom`)
    REFERENCES `MER 2c`.`Assignatura` (`nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignatura Matricula_Professor1`
    FOREIGN KEY (`Professor_DNI`)
    REFERENCES `MER 2c`.`Professor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `MER 2c`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER 2c`.`Matricula` (
  `data` DATE NOT NULL,
  `alumne` VARCHAR(20) NULL,
  `curs` DATE NOT NULL,
  `grup` VARCHAR(10) NULL,
  `Assignatura Matricula_ID` INT NOT NULL,
  `Alumne_DNI` INT NOT NULL,
  INDEX `fk_Matricula_Assignatura Matricula1_idx` (`Assignatura Matricula_ID` ASC) VISIBLE,
  INDEX `fk_Matricula_Alumne1_idx` (`Alumne_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Assignatura Matricula1`
    FOREIGN KEY (`Assignatura Matricula_ID`)
    REFERENCES `MER 2c`.`Assignatura Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Alumne1`
    FOREIGN KEY (`Alumne_DNI`)
    REFERENCES `MER 2c`.`Alumne` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
