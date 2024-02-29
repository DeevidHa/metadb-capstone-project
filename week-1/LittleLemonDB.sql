-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customer Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customer Details` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Contact Number` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff Information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff Information` (
  `StaffID` INT NOT NULL,
  `Role` VARCHAR(45) NULL,
  `Salary` DECIMAL(3) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `Table Number` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `Date` DATETIME NULL,
  PRIMARY KEY (`BookingID`),
  UNIQUE INDEX `BookingID_UNIQUE` (`BookingID` ASC) VISIBLE,
  UNIQUE INDEX `Table Number_UNIQUE` (`Table Number` ASC) VISIBLE,
  INDEX `customer_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Bookings_Staff Information1_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `customer_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customer Details` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bookings_Staff Information1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDM`.`Staff Information` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menu` (
  `MenuID` INT NOT NULL,
  `Cuisine Type` VARCHAR(45) NULL,
  `Starter` VARCHAR(45) NULL,
  `Main Course` VARCHAR(45) NULL,
  `Drinks` VARCHAR(45) NULL,
  `Dessert` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`),
  UNIQUE INDEX `MenuID_UNIQUE` (`MenuID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `OrderID` INT UNSIGNED NOT NULL,
  `MenuID` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `Order Date` DATETIME NOT NULL,
  `Quantity` INT NULL,
  `Total Cost` DECIMAL(3) NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `menu_fk_idx` (`MenuID` ASC) VISIBLE,
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC) VISIBLE,
  INDEX `fk_Orders_Bookings1_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Orders_Staff Information1_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `menu_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDM`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Bookings1`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDM`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Staff Information1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDM`.`Staff Information` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Order Delivery Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Order Delivery Status` (
  `OrderID` INT UNSIGNED NOT NULL,
  `Delivery Date` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  INDEX `fk_Order Delivery Status_Orders1_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_Order Delivery Status_Orders1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDM`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders_has_Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders_has_Menu` (
  `Orders_OrderID` INT UNSIGNED NOT NULL,
  `Menu_MenuID` INT NOT NULL,
  PRIMARY KEY (`Orders_OrderID`, `Menu_MenuID`),
  INDEX `fk_Orders_has_Menu_Menu1_idx` (`Menu_MenuID` ASC) VISIBLE,
  INDEX `fk_Orders_has_Menu_Orders1_idx` (`Orders_OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_has_Menu_Orders1`
    FOREIGN KEY (`Orders_OrderID`)
    REFERENCES `LittleLemonDM`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_has_Menu_Menu1`
    FOREIGN KEY (`Menu_MenuID`)
    REFERENCES `LittleLemonDM`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
