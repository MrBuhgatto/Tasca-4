-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER 2b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER 2b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER 2b` ;
USE `MER 2b` ;

-- -----------------------------------------------------
-- Table `MER 2b`.`Cinema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER 2b`.`Cinema` (
  `NIF` INT(9) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `horari` VARCHAR(32) NULL,
  `num_sales` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `ubicacio` VARCHAR(45) NULL,
  PRIMARY KEY (`NIF`));


-- -----------------------------------------------------
-- Table `MER 2b`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER 2b`.`Tarifa` (
  `ID` VARCHAR(45) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `preu` VARCHAR(32) NULL,
  `descripcio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER 2b`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER 2b`.`Pelicula` (
  `ISBN` INT(25) NOT NULL,
  `classificacio` VARCHAR(45) NULL,
  `genere` VARCHAR(32) NULL,
  `director` VARCHAR(45) NULL,
  `durada` TIME NULL,
  PRIMARY KEY (`ISBN`));


-- -----------------------------------------------------
-- Table `MER 2b`.`Projeccio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER 2b`.`Projeccio` (
  `ID` VARCHAR(45) NOT NULL,
  `sala` VARCHAR(45) NULL,
  `hora_inici` TIME NULL,
  `hora_final` TIME NULL,
  `Cinema_NIF` INT(9) NULL,
  `Tarifa_ID` VARCHAR(45) NULL,
  `Pelicula_ISBN` INT(25) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Projeccio_Cinema_idx` (`Cinema_NIF` ASC) VISIBLE,
  INDEX `fk_Projeccio_Tarifa1_idx` (`Tarifa_ID` ASC) VISIBLE,
  INDEX `fk_Projeccio_Pelicula1_idx` (`Pelicula_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Projeccio_Cinema`
    FOREIGN KEY (`Cinema_NIF`)
    REFERENCES `MER 2b`.`Cinema` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Tarifa1`
    FOREIGN KEY (`Tarifa_ID`)
    REFERENCES `MER 2b`.`Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Pelicula1`
    FOREIGN KEY (`Pelicula_ISBN`)
    REFERENCES `MER 2b`.`Pelicula` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
