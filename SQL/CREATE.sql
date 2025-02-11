-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema capstone_module4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capstone_module4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capstone_module4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `capstone_module4` ;

-- -----------------------------------------------------
-- Table `capstone_module4`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone_module4`.`city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(45) NOT NULL,
  `country_name` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `country_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `capstone_module4`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone_module4`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_old_id` VARCHAR(45) NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `city_id_fk_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `city_id_2_fk`
    FOREIGN KEY (`city_id`)
    REFERENCES `capstone_module4`.`city` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `capstone_module4`.`desert`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone_module4`.`desert` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone_module4`.`drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone_module4`.`drinks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone_module4`.`sides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone_module4`.`sides` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone_module4`.`starters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone_module4`.`starters` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone_module4`.`dish`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone_module4`.`dish` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `starter_id` INT NULL,
  `desert_id` INT NULL,
  `drink_id` INT NULL,
  `side_id` INT NULL,
  `order_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `desert_id_fk_idx` (`desert_id` ASC) VISIBLE,
  INDEX `drink_id_fk_idx` (`drink_id` ASC) VISIBLE,
  INDEX `slide_id_fk_idx` (`side_id` ASC) VISIBLE,
  INDEX `starter_id_fk_idx` (`starter_id` ASC) VISIBLE,
  CONSTRAINT `desert_id_fk`
    FOREIGN KEY (`desert_id`)
    REFERENCES `capstone_module4`.`desert` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `drink_id_fk`
    FOREIGN KEY (`drink_id`)
    REFERENCES `capstone_module4`.`drinks` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `slide_id_fk`
    FOREIGN KEY (`side_id`)
    REFERENCES `capstone_module4`.`sides` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `starter_id_fk`
    FOREIGN KEY (`starter_id`)
    REFERENCES `capstone_module4`.`starters` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone_module4`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone_module4`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` VARCHAR(45) NULL DEFAULT NULL,
  `order_date` DATETIME NULL DEFAULT NULL,
  `delivery_date` DATETIME NULL DEFAULT NULL,
  `costs` DECIMAL(10,0) NULL DEFAULT NULL,
  `sales` DECIMAL(10,0) NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `discount` DECIMAL(10,0) NULL DEFAULT NULL,
  `delivery_cost` DECIMAL(10,0) NULL DEFAULT NULL,
  `dish_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `customer_id_fk_idx` (`customer_id` ASC) VISIBLE,
  INDEX `dish_id_fk_idx` (`dish_id` ASC) VISIBLE,
  CONSTRAINT `customer_id_2_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `capstone_module4`.`customer` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `dish_id_fk`
    FOREIGN KEY (`dish_id`)
    REFERENCES `capstone_module4`.`dish` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2048
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
