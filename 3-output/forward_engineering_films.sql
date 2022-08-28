-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videoclub` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `videoclub` ;

-- -----------------------------------------------------
-- Table `videoclub`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`actor` (
  `actor_id` BIGINT NOT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `complete_name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`category` (
  `category_id` SMALLINT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`language` (
  `language_id` BIGINT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`film` (
  `film_id` BIGINT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` BIGINT NULL DEFAULT NULL,
  `language_id` BIGINT NULL DEFAULT NULL,
  `original_language_id` BIGINT NULL DEFAULT NULL,
  `rental_duration` BIGINT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` BIGINT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `category_id` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `category_fk` (`category_id` ASC) VISIBLE,
  INDEX `language_fk` (`language_id` ASC) VISIBLE,
  CONSTRAINT `category_fk`
    FOREIGN KEY (`category_id`)
    REFERENCES `videoclub`.`category` (`category_id`),
  CONSTRAINT `language_fk`
    FOREIGN KEY (`language_id`)
    REFERENCES `videoclub`.`language` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`filmactor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`filmactor` (
  `actor_id` BIGINT NULL DEFAULT NULL,
  `film_id` BIGINT NULL DEFAULT NULL,
  INDEX `actor_fk` (`actor_id` ASC) VISIBLE,
  INDEX `film_fk` (`film_id` ASC) VISIBLE,
  CONSTRAINT `actor_fk`
    FOREIGN KEY (`actor_id`)
    REFERENCES `videoclub`.`actor` (`actor_id`),
  CONSTRAINT `film_fk`
    FOREIGN KEY (`film_id`)
    REFERENCES `videoclub`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`inventory` (
  `inventory_id` BIGINT NOT NULL,
  `film_id` BIGINT NULL DEFAULT NULL,
  `store_id` BIGINT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `inventory_fk` (`film_id` ASC) VISIBLE,
  CONSTRAINT `inventory_fk`
    FOREIGN KEY (`film_id`)
    REFERENCES `videoclub`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`rental` (
  `rental_id` BIGINT NULL DEFAULT NULL,
  `rental_date` DATETIME NULL DEFAULT NULL,
  `inventory_id` BIGINT NULL DEFAULT NULL,
  `customer_id` BIGINT NULL DEFAULT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  `staff_id` BIGINT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  INDEX `rental_fk` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `rental_fk`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `videoclub`.`inventory` (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
