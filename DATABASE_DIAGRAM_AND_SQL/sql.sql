SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Section` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Section` (
  `idSection` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `url` VARCHAR(45) NULL,
  PRIMARY KEY (`idSection`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Category` (
  `idCategory` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `url` VARCHAR(45) NULL,
  `Section_idSection` INT NOT NULL,
  PRIMARY KEY (`idCategory`),
  INDEX `fk_Category_Section1` (`Section_idSection` ASC),
  CONSTRAINT `fk_Category_Section1`
    FOREIGN KEY (`Section_idSection`)
    REFERENCES `mydb`.`Section` (`idSection`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Product` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `price` DECIMAL(6,2) NULL,
  `description` VARCHAR(2000) NULL,
  `stock` INT NULL,
  `imageUrl` VARCHAR(100) NULL,
  `highlighted` TINYINT(1) NULL DEFAULT false,
  `Category_idCategory` INT NOT NULL,
  PRIMARY KEY (`idProduct`),
  INDEX `fk_Product_Category1` (`Category_idCategory` ASC),
  CONSTRAINT `fk_Product_Category1`
    FOREIGN KEY (`Category_idCategory`)
    REFERENCES `mydb`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `address` VARCHAR(200) NULL,
  `adminRights` TINYINT(1) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ord`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ord` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Ord` (
  `idOrd` INT NOT NULL AUTO_INCREMENT,
  `time` DATETIME NULL,
  `User_idUser` INT NOT NULL,
  `confirmed` TINYINT(1) NULL DEFAULT false,
  `paid` TINYINT(1) NULL DEFAULT false,
  PRIMARY KEY (`idOrd`),
  INDEX `fk_Session_User1` (`User_idUser` ASC),
  CONSTRAINT `fk_Session_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ordproduct`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ordproduct` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Ordproduct` (
  `idOrdproduct` INT NOT NULL,
  `Order_idOrd` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `quantity` INT NULL,
  INDEX `fk_OrderProducts_Order1` (`Order_idOrd` ASC),
  INDEX `fk_OrderProducts_Product1` (`Product_idProduct` ASC),
  PRIMARY KEY (`idOrdproduct`),
  CONSTRAINT `fk_OrderProducts_Order1`
    FOREIGN KEY (`Order_idOrd`)
    REFERENCES `mydb`.`Ord` (`idOrd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderProducts_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `mydb`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Favourites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Favourites` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Favourites` (
  `idFavourites` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idFavourites`),
  INDEX `fk_Favourites_Product1` (`Product_idProduct` ASC),
  INDEX `fk_Favourites_User1` (`User_idUser` ASC),
  CONSTRAINT `fk_Favourites_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `mydb`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Favourites_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
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
INSERT INTO mydb.Category VALUES(16,'Jeans','jeans',4);



/*YOUNG SECTIONS EXAMPLE DATA*/
INSERT INTO mydb.Product VALUES(1,'Jeans 1 for man',49.19,'Super jeans decription........',8,'images/young/jeansm1.jpg',false,1);
INSERT INTO mydb.Product VALUES(2,'Jeans 2 for man',59.99,'Super jeans decription........',8,'images/young/jeansm2.jpg',false,1);
INSERT INTO mydb.Product VALUES(3,'Jeans 3 for man',29.29,'Super jeans decription........',8,'images/young/jeansm3.jpg',false,1);
INSERT INTO mydb.Product VALUES(5,'Shirt 1 for women',69.99,'Super girl shirt decription........',8,'images/young/shirtsw1.jpg',false,2);
INSERT INTO mydb.Product VALUES(6,'Shirt 2 for women',29.99,'Super girl shirt decription........',8,'images/young/shirtsw2.jpg',false,2);
INSERT INTO mydb.Product VALUES(10,'Skirt 1 for women',29.99,'Super girl skirt decription........',8,'images/young/skirtsw2.jpg',false,3);
INSERT INTO mydb.Product VALUES(11,'Skirt 2 for women',39.49,'Super girl skirt decription........',8,'images/young/skirtsw3.jpg',false,3);
INSERT INTO mydb.Product VALUES(13,'Sweater 1 for man ',29.49,'Super sweater decription........',8,'images/young/sweaterm1.jpg',false,4);
INSERT INTO mydb.Product VALUES(14,'Sweater 2 for man ',39.99,'Super sweater decription........',8,'images/young/sweaterm2.jpg',false,4);
INSERT INTO mydb.Product VALUES(15,'Sweater 3 for man ',24.49,'Super sweater decription........',8,'images/young/sweaterm3.jpg',false,4);
INSERT INTO mydb.Product VALUES(16,'Sweater 4 for man ',29.99,'Super sweater decription........',8,'images/young/sweaterm4.jpg',false,4);
INSERT INTO mydb.Product VALUES(19,'Sweater 1 for woman ',24.49,'Super sweater decription........',8,'images/young/sweaterw3.jpg',false,4);
INSERT INTO mydb.Product VALUES(20,'Sweater 2 for woman ',29.99,'Super sweater decription........',8,'images/young/sweaterw4.jpg',false,4);
INSERT INTO mydb.Product VALUES(21,'T-shirt 1 for man',7.99,'Super t-shirt decription........',8,'images/young/tshirtm1.jpg',false,5);
INSERT INTO mydb.Product VALUES(22,'T-shirt 2 for man',5.99,'Super t-shirt decription........',8,'images/young/tshirtm2.jpg',false,5);
INSERT INTO mydb.Product VALUES(23,'T-shirt 3 for man',8.99,'Super t-shirt decription........',8,'images/young/tshirtm3.jpg',false,5);
INSERT INTO mydb.Product VALUES(24,'T-shirt 4 for man',9.29,'Super t-shirt decription........',8,'images/young/tshirtm4.jpg',false,5);

/*SPORTS SECTIONS EXAMPLE DATA*/
INSERT INTO mydb.Product VALUES(25,'Tshirt 1',11.99,'Super t-shirt decription...........',6,'images/sports/sportw2.jpg',false,6);
INSERT INTO mydb.Product VALUES(26,'Tshirt 2',8.99,'Super t-shirt decription...........',6,'images/sports/sportw5.jpg',false,6);
INSERT INTO mydb.Product VALUES(27,'Tshirt 3',9.99,'Super t-shirt decription...........',6,'images/sports/sportw6.jpg',false,6);
INSERT INTO mydb.Product VALUES(28,'Tshirt 4',12.99,'Super blouse decription...........',6,'images/sports/sportm1.jpg',false,6);
INSERT INTO mydb.Product VALUES(29,'Tshirt 5',7.99,'Super blouse decription...........',6,'images/sports/sportm2.jpg',false,6);
INSERT INTO mydb.Product VALUES(30,'Tshirt 6',8.99,'Super blouse decription...........',6,'images/sports/sportm3.jpg',false,6);
INSERT INTO mydb.Product VALUES(31,'Blouse 1',49.99,'Super blouse decription...........',6,'images/sports/sportm4.jpg',false,7);
INSERT INTO mydb.Product VALUES(32,'Blouse 2',22.99,'Super blouse decription...........',6,'images/sports/sportm5.jpg',false,7);
INSERT INTO mydb.Product VALUES(33,'Blouse 3',26.99,'Super blouse decription...........',6,'images/sports/sportm6.jpg',false,7);
INSERT INTO mydb.Product VALUES(34,'Blouse 4',34.99,'Super t-shirt decription...........',6,'images/sports/sportw1.jpg',false,7);
INSERT INTO mydb.Product VALUES(35,'Blouse 5',39.99,'Super t-shirt decription...........',6,'images/sports/sportw3.jpg',false,7);
INSERT INTO mydb.Product VALUES(36,'Blouse 6',45.99,'Super t-shirt decription...........',6,'images/sports/sportw4.jpg',false,7);

/*KIDS SECTIONS EXAMPLE DATA*/
INSERT INTO mydb.Product VALUES(37,'Boy Blouse 1',29.99,'Other oldschoold Blouse for young children',11,'images/kids/tshirtb1.jpg',false,11);
INSERT INTO mydb.Product VALUES(38,'Boy Blouse 2',15.99,'Other oldschoold Blouse for young children',9,'images/kids/tshirtb2.jpg',false,11);
INSERT INTO mydb.Product VALUES(39,'Boy Blouse 3',9.99,'Other oldschoold Blouse for young children',5,'images/kids/tshirtb3.jpg',false,11);
INSERT INTO mydb.Product VALUES(41,'Girl Blouse 1',8.99,'Other oldschoold Blouse for young children',3,'images/kids/tshirtg1.jpg',false,11);
INSERT INTO mydb.Product VALUES(42,'Girl Blouse 2',8.99,'Other oldschoold Blouse for young children',2,'images/kids/tshirtg2.jpg',false,11);
INSERT INTO mydb.Product VALUES(43,'Girl Blouse 3',8.49,'Other oldschoold Blouse for young children',7,'images/kids/tshirtg3.jpg',false,11);
INSERT INTO mydb.Product VALUES(45,'Boy Coat 1',58.99,'Other oldschoold Coat for young children',7,'images/kids/coatb1.jpg',false,8);
INSERT INTO mydb.Product VALUES(46,'Boy Coat 2',58.99,'Other oldschoold Coat for young children',9,'images/kids/coatb2.jpg',false,8);
INSERT INTO mydb.Product VALUES(47,'Boy Coat 3',58.49,'Other oldschoold Coat for young children',11,'images/kids/coatb3.jpg',false,8);
INSERT INTO mydb.Product VALUES(49,'Girl Coat 1',48.99,'Other oldschoold Coat for young children',7,'images/kids/coatg1.jpg',false,8);
INSERT INTO mydb.Product VALUES(50,'Girl Coat 2',48.99,'Other oldschoold Coat for young children',9,'images/kids/coatg2.jpg',false,8);
INSERT INTO mydb.Product VALUES(51,'Girl Coat 3',48.49,'Other oldschoold Coat for young children',11,'images/kids/coatg3.jpg',false,8);
INSERT INTO mydb.Product VALUES(53,'Girl Dress 1',28.99,'Other oldschoold dress for young girls',7,'images/kids/dressg1.jpg',false,9);
INSERT INTO mydb.Product VALUES(54,'Girl Dress 2',28.99,'Other oldschoold dress for young grils',9,'images/kids/dressg2.jpg',false,9);
INSERT INTO mydb.Product VALUES(57,'Boy Pants 1',18.99,'Other oldschoold Pants for young children',7,'images/kids/pantsb1.jpg',false,10);

/*MAN AND WOMAN SECTIONS EXAMPLE DATA*/
INSERT INTO mydb.Product VALUES(58,'Dress 1',249.99,'Extra dress description........',2,'images/manwoman/dressw1.jpg',false,12);
INSERT INTO mydb.Product VALUES(59,'Dress 2',229.99,'Extra dress description........',2,'images/manwoman/dressw2.jpg',false,12);
INSERT INTO mydb.Product VALUES(60,'Dress 3',159.99,'Extra dress description........',2,'images/manwoman/dressw3.jpg',false,12);
INSERT INTO mydb.Product VALUES(61,'Dress 4',239.99,'Extra dress description........',2,'images/manwoman/dressw4.jpg',false,12);
INSERT INTO mydb.Product VALUES(63,'Shirt 1',54.99,'Extra shirt description........',2,'images/manwoman/shirtm2.jpg',false,13);
INSERT INTO mydb.Product VALUES(64,'Shirt 2',65.99,'Extra shirt description........',2,'images/manwoman/shirtm3.jpg',false,13);
INSERT INTO mydb.Product VALUES(65,'Shirt 3',69.99,'Extra shirt description........',2,'images/manwoman/shirtm4.jpg',false,13);
INSERT INTO mydb.Product VALUES(66,'Suit 1',449.99,'Extra suit description........',2,'images/manwoman/suitm1.jpg',false,14);
INSERT INTO mydb.Product VALUES(67,'Suit 2',549.99,'Extra suit description........',2,'images/manwoman/suitm2.jpg',false,14);
INSERT INTO mydb.Product VALUES(68,'Suit 3',449.99,'Extra suit description........',2,'images/manwoman/suitm3.jpg',false,14);
INSERT INTO mydb.Product VALUES(69,'Suit 4',649.99,'Extra suit description........',2,'images/manwoman/suitm4.jpg',false,14);
INSERT INTO mydb.Product VALUES(70,'Component 1 - bag',49.99,'Extra component description........',2,'images/manwoman/compw1.jpg',false,15);
INSERT INTO mydb.Product VALUES(71,'Component 2 - small bag',29.99,'Extra component description........',2,'images/manwoman/compw2.jpg',false,15);
INSERT INTO mydb.Product VALUES(72,'Component 3 - cap',19.99,'Extra component description........',2,'images/manwoman/compw3.jpg',false,15);
INSERT INTO mydb.Product VALUES(73,'Component 4 - scarf',19.99,'Extra component description........',2,'images/manwoman/compw4.jpg',false,15);
INSERT INTO mydb.Product VALUES(74,'Jeans 1 for man',69.99,'Extra jeans description........',2,'images/manwoman/jeanm1.jpg',false,16);
INSERT INTO mydb.Product VALUES(75,'Jeans 2 for man',75.99,'Extra jeans description........',2,'images/manwoman/jeanm2.jpg',false,16);
INSERT INTO mydb.Product VALUES(77,'Jeans 1 for woman',55.99,'Extra jeans description........',2,'images/manwoman/jeansw1.jpg',false,16);
INSERT INTO mydb.Product VALUES(78,'Jeans 2 for woman',49.99,'Extra jeans description........',2,'images/manwoman/jeansw2.jpg',false,16);
INSERT INTO mydb.Product VALUES(79,'Jeans 3 for woman',59.99,'Extra jeans description........',2,'images/manwoman/jeansw3.jpg',false,16);


INSERT INTO mydb.User VALUES(1,'aa','John','Admin','john.admin@gmail.com','+34 666 555 444','Avenida de Atocha 42, 28045 Madrid',true);
INSERT INTO mydb.User VALUES(2,'ss','John','Noadmin','john.noadmin@gmail.com','+34 666 555 444','Avenida de Atocha 42, 28045 Madrid',false);
INSERT INTO mydb.Ord VALUES(1,'2013-11-10 13:43:00',1,false,false);
INSERT INTO mydb.Ord VALUES(2,'2013-11-10 13:43:00',2,false,false);

INSERT INTO mydb.Ordproduct VALUES(1,1,30,2);
INSERT INTO mydb.Ordproduct VALUES(2,1,31,5);
INSERT INTO mydb.Ordproduct VALUES(3,1,32,1);
INSERT INTO mydb.Ordproduct VALUES(4,1,33,1);
INSERT INTO mydb.Ordproduct VALUES(5,1,34,1);
INSERT INTO mydb.Ordproduct VALUES(6,1,35,1);
INSERT INTO mydb.Ordproduct VALUES(7,1,36,1);
INSERT INTO mydb.Ordproduct VALUES(8,2,30,1);
INSERT INTO mydb.Ordproduct VALUES(9,2,31,1);
INSERT INTO mydb.Ordproduct VALUES(10,2,31,1);
INSERT INTO mydb.Ordproduct VALUES(11,2,34,1);
INSERT INTO mydb.Ordproduct VALUES(12,2,34,1);
