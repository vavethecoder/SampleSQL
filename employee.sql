-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema employee
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema employee
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employee` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `employee` ;

-- -----------------------------------------------------
-- Table `employee`.`designation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee`.`designation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `designation` VARCHAR(45) NOT NULL COMMENT '',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employee`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee`.`employee` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `email` VARCHAR(45) NOT NULL COMMENT '',
  `designation_id` INT UNSIGNED NOT NULL COMMENT '',
  `reporting_manager_id` INT UNSIGNED NOT NULL DEFAULT NULL COMMENT '',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_employe_designation_idx` (`designation_id` ASC)  COMMENT '',
  INDEX `fk_employe_employe1_idx` (`reporting_manager_id` ASC)  COMMENT '',
  CONSTRAINT `fk_employe_designation`
    FOREIGN KEY (`designation_id`)
    REFERENCES `employee`.`designation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employe_employe1`
    FOREIGN KEY (`reporting_manager_id`)
    REFERENCES `employee`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO designation (designation)
VALUES ('Manager'), ('Team Lead'), ('SSE'), ('SE');


INSERT INTO employee (name, email, designation_id, reporting_manager_id)
VALUES ('Rahul', 'rahul@company.com', 1, NULL);

INSERT INTO employee (name, email, designation_id, reporting_manager_id)
VALUES ('Kapil', 'kapil@company.com', 2, 1);

INSERT INTO employee (name, email, designation_id, reporting_manager_id)
VALUES ('Jiss', 'jiss@company.com', 3, 2);

INSERT INTO employee (name, email, designation_id, reporting_manager_id)
VALUES ('Rajesh', 'rajesh@company.com', 4, 2);


SELECT m.name, e.name FROM employee as m LEFT JOIN employee as e ON e.reporting_manager_id = m.id WHERE m.name = 'Kapil' GROUP BY m.name ORDER BY m.name;

SELECT e.name, m.name FROM employee as m LEFT JOIN employee as e ON e.reporting_manager_id = m.id WHERE e.name = 'Rahul';