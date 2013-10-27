SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Section` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Section` (
  `idSection` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`idSection`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Category` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Category` (
  `idCategory` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`idCategory`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Product` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Product` (
  `idProduct` INT NOT NULL ,
  `Price` DECIMAL(4) NULL ,
  `Type` VARCHAR(45) NULL ,
  `Section_idSection` VARCHAR(40) NOT NULL ,
  `Category_idCategory` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`idProduct`) ,
  INDEX `fk_Product_Section1` (`Section_idSection` ASC) ,
  INDEX `fk_Product_Category1` (`Category_idCategory` ASC) ,
  CONSTRAINT `fk_Product_Section1`
    FOREIGN KEY (`Section_idSection` )
    REFERENCES `mydb`.`Section` (`idSection` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Category1`
    FOREIGN KEY (`Category_idCategory` )
    REFERENCES `mydb`.`Category` (`idCategory` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NULL ,
  `name` VARCHAR(45) NULL ,
  `surname1` VARCHAR(45) NULL ,
  `surname2` VARCHAR(45) NULL ,
  `phone` VARCHAR(45) NULL ,
  `adminRights` TINYINT(1) NULL ,
  `Session_idSession` INT NOT NULL ,
  PRIMARY KEY (`idUser`) ,
  INDEX `fk_User_Session1` (`Session_idSession` ASC) ,
  CONSTRAINT `fk_User_Session1`
    FOREIGN KEY (`Session_idSession` )
    REFERENCES `mydb`.`Session` (`idSession` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Session`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Session` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Session` (
  `idSession` INT NOT NULL ,
  `time` TIME NULL ,
  `Product_idProduct` INT NOT NULL ,
  `User_idUser` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idSession`) ,
  INDEX `fk_Session_Product1` (`Product_idProduct` ASC) ,
  INDEX `fk_Session_User1` (`User_idUser` ASC) ,
  CONSTRAINT `fk_Session_Product1`
    FOREIGN KEY (`Product_idProduct` )
    REFERENCES `mydb`.`Product` (`idProduct` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Session_User1`
    FOREIGN KEY (`User_idUser` )
    REFERENCES `mydb`.`User` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PaymentMethod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PaymentMethod` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`PaymentMethod` (
  `idPaymentMethod` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idPaymentMethod`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Payment` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Payment` (
  `idPayment` INT NOT NULL ,
  `PaymentMethod_idPaymentMethod` VARCHAR(45) NOT NULL ,
  `Session_idSession` INT NOT NULL ,
  PRIMARY KEY (`idPayment`) ,
  INDEX `fk_Payment_PaymentMethod` (`PaymentMethod_idPaymentMethod` ASC) ,
  INDEX `fk_Payment_Session1` (`Session_idSession` ASC) ,
  CONSTRAINT `fk_Payment_PaymentMethod`
    FOREIGN KEY (`PaymentMethod_idPaymentMethod` )
    REFERENCES `mydb`.`PaymentMethod` (`idPaymentMethod` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_Session1`
    FOREIGN KEY (`Session_idSession` )
    REFERENCES `mydb`.`Session` (`idSession` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
