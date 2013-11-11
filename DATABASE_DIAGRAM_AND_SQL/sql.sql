SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Section` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Section` (
  `idSection` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `url` VARCHAR(45) NULL ,
  PRIMARY KEY (`idSection`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Category` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Category` (
  `idCategory` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `url` VARCHAR(45) NULL ,
  `Section_idSection` INT NOT NULL ,
  PRIMARY KEY (`idCategory`) ,
  INDEX `fk_Category_Section1` (`Section_idSection` ASC) ,
  CONSTRAINT `fk_Category_Section1`
    FOREIGN KEY (`Section_idSection` )
    REFERENCES `mydb`.`Section` (`idSection` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Product` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `price` DECIMAL(5,2) NULL ,
  `description` VARCHAR(2000) NULL ,
  `stock` INT NULL ,
  `imageUrl` VARCHAR(100) NULL ,
  `highlighted` TINYINT(1) NULL DEFAULT false ,
  `Category_idCategory` INT NOT NULL ,
  PRIMARY KEY (`idProduct`) ,
  INDEX `fk_Product_Category1` (`Category_idCategory` ASC) ,
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
  `idUser` INT NOT NULL AUTO_INCREMENT ,
  `password` VARCHAR(45) NULL ,
  `name` VARCHAR(45) NULL ,
  `surname` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `phone` VARCHAR(45) NULL ,
  `address` VARCHAR(200) NULL ,
  `adminRights` TINYINT(1) NULL ,
  PRIMARY KEY (`idUser`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Order` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT ,
  `time` DATETIME NULL ,
  `User_idUser` INT NOT NULL ,
  `confirmed` TINYINT(1) NULL DEFAULT false ,
  `paid` TINYINT(1) NULL DEFAULT false ,
  PRIMARY KEY (`idOrder`) ,
  INDEX `fk_Session_User1` (`User_idUser` ASC) ,
  CONSTRAINT `fk_Session_User1`
    FOREIGN KEY (`User_idUser` )
    REFERENCES `mydb`.`User` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderProducts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OrderProducts` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`OrderProducts` (
  `idOrderProducts` INT NOT NULL ,
  `Order_idOrder` INT NOT NULL ,
  `Product_idProduct` INT NOT NULL ,
  `quantity` INT NULL ,
  INDEX `fk_OrderProducts_Order1` (`Order_idOrder` ASC) ,
  INDEX `fk_OrderProducts_Product1` (`Product_idProduct` ASC) ,
  PRIMARY KEY (`idOrderProducts`) ,
  CONSTRAINT `fk_OrderProducts_Order1`
    FOREIGN KEY (`Order_idOrder` )
    REFERENCES `mydb`.`Order` (`idOrder` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderProducts_Product1`
    FOREIGN KEY (`Product_idProduct` )
    REFERENCES `mydb`.`Product` (`idProduct` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Favourites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Favourites` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Favourites` (
  `idFavourites` INT NOT NULL ,
  `Product_idProduct` INT NOT NULL ,
  `User_idUser` INT NOT NULL ,
  PRIMARY KEY (`idFavourites`) ,
  INDEX `fk_Favourites_Product1` (`Product_idProduct` ASC) ,
  INDEX `fk_Favourites_User1` (`User_idUser` ASC) ,
  CONSTRAINT `fk_Favourites_Product1`
    FOREIGN KEY (`Product_idProduct` )
    REFERENCES `mydb`.`Product` (`idProduct` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Favourites_User1`
    FOREIGN KEY (`User_idUser` )
    REFERENCES `mydb`.`User` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



INSERT INTO mydb.Section VALUES(1,'Young','young');
INSERT INTO mydb.Section VALUES(2,'Sportswear','sports');
INSERT INTO mydb.Section VALUES(3,'Kids','kids');
INSERT INTO mydb.Section VALUES(4,'Man and Woman','manAndWoman');

INSERT INTO mydb.Category VALUES(1,'Jeans','jeans',1);
INSERT INTO mydb.Category VALUES(2,'Shirts','shirts',1);
INSERT INTO mydb.Category VALUES(3,'Skirts','skirts',1);
INSERT INTO mydb.Category VALUES(4,'Sweaters','sweaters',1);
INSERT INTO mydb.Category VALUES(5,'T-shirts','tshirts',1);

INSERT INTO mydb.Category VALUES(6,'T-shirts','tshirts',2);
INSERT INTO mydb.Category VALUES(7,'Blouses','blouses',2);

INSERT INTO mydb.Category VALUES(8,'Coats','coats',3);
INSERT INTO mydb.Category VALUES(9,'Dresses','dresses',3);
INSERT INTO mydb.Category VALUES(10,'Pants','pants',3);
INSERT INTO mydb.Category VALUES(11,'Blouses','blouses',3);

INSERT INTO mydb.Category VALUES(12,'Dresses','dresses',4);
INSERT INTO mydb.Category VALUES(13,'Shirts','shirts',4);
INSERT INTO mydb.Category VALUES(14,'Suits','suits',4);
INSERT INTO mydb.Category VALUES(15,'Components','components',4);




INSERT INTO mydb.Product VALUES(1,'Jeans ver 1',49.99,'Super jeans decription........',8,'images/young/jeansm1.jpg',false,1);
INSERT INTO mydb.Product VALUES(2,'Blouse ver 1',39.99,'Super blouse decription...........',6,'images/sports/sportm5.jpg',false,7);
INSERT INTO mydb.Product VALUES(3,'Suit ver 1',49.99,'Extra suit description........',2,'images/manwoman/suitm1.jpg',false,14);
INSERT INTO mydb.Product VALUES(4,'Boy Blouse 1',29.99,'Other oldschoold Blouse for young children',11,'images/kids/tshirtb1.jpg',false,11);
INSERT INTO mydb.Product VALUES(5,'Boy Blouse 2',15.99,'Other oldschoold Blouse for young children',9,'images/kids/tshirtb2.jpg',false,11);
INSERT INTO mydb.Product VALUES(6,'Boy Blouse 3',9.99,'Other oldschoold Blouse for young children',5,'images/kids/tshirtb3.jpg',false,11);
INSERT INTO mydb.Product VALUES(7,'Boy Blouse 4',8.99,'Other oldschoold Blouse for young children',4,'images/kids/tshirtb4.jpg',false,11);
INSERT INTO mydb.Product VALUES(8,'Girl Blouse 1',8.99,'Other oldschoold Blouse for young children',3,'images/kids/tshirtg1.jpg',false,11);
INSERT INTO mydb.Product VALUES(9,'Girl Blouse 2',8.99,'Other oldschoold Blouse for young children',2,'images/kids/tshirtg2.jpg',false,11);
INSERT INTO mydb.Product VALUES(10,'Girl Blouse 3',8.49,'Other oldschoold Blouse for young children',7,'images/kids/tshirtg3.jpg',false,11);
INSERT INTO mydb.Product VALUES(11,'Girl Blouse 4',10.99,'Other oldschoold Blouse for young children',6,'images/kids/tshirtg4.jpg',false,11);
INSERT INTO mydb.Product VALUES(12,'Boy Coat 1',58.99,'Other oldschoold Coat for young children',7,'images/kids/coatb1.jpg',false,8);
INSERT INTO mydb.Product VALUES(13,'Boy Coat 2',58.99,'Other oldschoold Coat for young children',9,'images/kids/coatb2.jpg',false,8);
INSERT INTO mydb.Product VALUES(14,'Boy Coat 3',58.49,'Other oldschoold Coat for young children',11,'images/kids/coatb3.jpg',false,8);
INSERT INTO mydb.Product VALUES(15,'Boy Coat 4',60.99,'Other oldschoold Coat for young children',12,'images/kids/coatb4.jpg',false,8);
INSERT INTO mydb.Product VALUES(16,'Girl Coat 1',48.99,'Other oldschoold Coat for young children',7,'images/kids/coatg1.jpg',false,8);
INSERT INTO mydb.Product VALUES(17,'Girl Coat 2',48.99,'Other oldschoold Coat for young children',9,'images/kids/coatg2.jpg',false,8);
INSERT INTO mydb.Product VALUES(18,'Girl Coat 3',48.49,'Other oldschoold Coat for young children',11,'images/kids/coatg3.jpg',false,8);
INSERT INTO mydb.Product VALUES(19,'Girl Coat 4',50.99,'Other oldschoold Coat for young children',12,'images/kids/coatg4.jpg',false,8);
INSERT INTO mydb.Product VALUES(20,'Girl Dress 1',28.99,'Other oldschoold dress for young girls',7,'images/kids/dressg1.jpg',false,9);
INSERT INTO mydb.Product VALUES(21,'Girl Dress 2',28.99,'Other oldschoold dress for young grils',9,'images/kids/dressg2.jpg',false,9);
INSERT INTO mydb.Product VALUES(22,'Girl Dress 3',28.49,'Other oldschoold dress for young girls',11,'images/kids/dressg3.jpg',false,9);
INSERT INTO mydb.Product VALUES(23,'Girl Dress 4',30.99,'Other oldschoold dress for young girls',12,'images/kids/dressg4.jpg',false,9);
INSERT INTO mydb.Product VALUES(24,'Boy Pants 1',18.99,'Other oldschoold Pants for young children',7,'images/kids/pantsb1.jpg',false,10);
INSERT INTO mydb.Product VALUES(25,'Boy Pants 2',18.99,'Other oldschoold Pants for young children',9,'images/kids/pantsb2.jpg',false,10);
INSERT INTO mydb.Product VALUES(26,'Boy Pants 3',18.49,'Other oldschoold Pants for young children',11,'images/kids/pantsb3.jpg',false,10);
INSERT INTO mydb.Product VALUES(27,'Boy Pants 4',20.99,'Other oldschoold Pants for young children',12,'images/kids/pantsb4.jpg',false,10);

INSERT INTO mydb.User VALUES(1,'aa','John','Doe','john.doe@gmail.com','+34 666 555 444','Avenida de Atocha 42, 28045 Madrid',false);
INSERT INTO mydb.Order VALUES(1,'2013-11-10 13:43:00',1,false,false);

