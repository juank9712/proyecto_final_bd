-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema NOTAS_COLEGIO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NOTAS_COLEGIO` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `NOTAS_COLEGIO` ;

-- -----------------------------------------------------
-- Table `NOTAS_COLEGIO`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NOTAS_COLEGIO`.`persona` (
    `id_persona` INT NOT NULL
        COMMENT 'Identificador unico de la persona',
    `per_jornada` VARCHAR(45) NOT NULL 
        COMMENT 'Identifica si la persona tiene jornada en la tarde o en la mañana',
    `per_nombre` VARCHAR(50) NOT NULL 
        COMMENT 'Nombre de la persona',
    `per_tipodcto` VARCHAR(45) NOT NULL 
        COMMENT 'Tipo de documento de la persona',
    `per_numdcto` VARCHAR(45) NOT NULL 
        COMMENT 'Numero de documento de la persona',
    PRIMARY KEY (`id_persona`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NOTAS_COLEGIO`.`administrativo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NOTAS_COLEGIO`.`administrativo` (
    `adm_id_persona` INT NOT NULL
        COMMENT 'Identificador de la persona que es administrativo',
    `adm_cargo` VARCHAR(45) NOT NULL 
        COMMENT 'Cargo especifico del administrativo',
    `adm_num_ofc` VARCHAR(45) NOT NULL 
        COMMENT 'Lugar de trabajo del administrativo',
    INDEX `fk_ADMINISTRATIVO_PERSONA_idx` (`adm_id_persona` ASC),
    PRIMARY KEY (`adm_id_persona`),
    CONSTRAINT `fk_ADMINISTRATIVO_PERSONA`
        FOREIGN KEY (`adm_id_persona`)
        REFERENCES `NOTAS_COLEGIO`.`persona` (`id_persona`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NOTAS_COLEGIO`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NOTAS_COLEGIO`.`horario` (
    `id_horario` INT NOT NULL 
        COMMENT 'Identificador del horario',
    `hor_aula` VARCHAR(45) NOT NULL 
        COMMENT 'Aula del horario',
    PRIMARY KEY (`id_horario`) 
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NOTAS_COLEGIO`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NOTAS_COLEGIO`.`curso` (
	`id_curso` INT NOT NULL
		COMMENT 'Identificador del curso',
	`hor_id_horario` INT NOT NULL 
		COMMENT 'Identificador del horario que tiene el curso',
	PRIMARY KEY (`id_curso`),
	INDEX `fk_curso_horario1_idx` (`hor_id_horario` ASC),
	CONSTRAINT `fk_curso_horario1`
		FOREIGN KEY (`hor_id_horario`)
		REFERENCES `NOTAS_COLEGIO`.`horario` (`id_horario`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NOTAS_COLEGIO`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NOTAS_COLEGIO`.`estudiante` (
	`est_id_persona` INT NOT NULL
		COMMENT 'Identificador de la persona que es estudiante',
	`cur_id_curso` INT NOT NULL
		COMMENT 'Identificador del curso al que pertenece el estudiante',
	PRIMARY KEY (`est_id_persona`) ,
	INDEX `fk_estudiante_persona1_idx` (`est_id_persona` ASC),
	INDEX `fk_estudiante_curso1_idx` (`cur_id_curso` ASC),
	CONSTRAINT `fk_estudiante_persona1`
		FOREIGN KEY (`est_id_persona`)
		REFERENCES `NOTAS_COLEGIO`.`persona` (`id_persona`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT `fk_estudiante_curso1`
		FOREIGN KEY (`cur_id_curso`)
		REFERENCES `NOTAS_COLEGIO`.`curso` (`id_curso`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NOTAS_COLEGIO`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NOTAS_COLEGIO`.`profesor` (
	`pro_id_persona` INT NOT NULL
		COMMENT 'Identificador de la persona que es profesor',
	`pro_especialidad` VARCHAR(45) NOT NULL 
		COMMENT 'Especialidad que tiene el profesor',
	PRIMARY KEY (`pro_id_persona`),
	CONSTRAINT `fk_profesor_persona1`
		FOREIGN KEY (`pro_id_persona`)
		REFERENCES `NOTAS_COLEGIO`.`persona` (`id_persona`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NOTAS_COLEGIO`.`materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NOTAS_COLEGIO`.`materia` (
	`id_materia` INT NOT NULL
		COMMENT 'Identificador de la materia',
	`pro_id_persona` INT NOT NULL 
		COMMENT 'Identificador del profesor que dicta la materia',
	`hor_id_horario` INT NOT NULL 
		COMMENT 'Identificador del horario al que pertenece la materia',
	`mat_nombre` VARCHAR(45) NOT NULL 
		COMMENT 'Nombre de la materia',
	INDEX `fk_table1_profesor1_idx` (`pro_id_persona` ASC),
	PRIMARY KEY (`id_materia`),
	INDEX `fk_materia_horario1_idx` (`hor_id_horario` ASC),
	CONSTRAINT `fk_table1_profesor1`
		FOREIGN KEY (`pro_id_persona`)
		REFERENCES `NOTAS_COLEGIO`.`profesor` (`pro_id_persona`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT `fk_materia_horario1`
		FOREIGN KEY (`hor_id_horario`)
		REFERENCES `NOTAS_COLEGIO`.`horario` (`id_horario`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NOTAS_COLEGIO`.`reporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NOTAS_COLEGIO`.`reporte` (
	`id_reporte` INT NOT NULL
		COMMENT 'Identificador del reporte',
	`est_id_persona` INT NOT NULL 
		COMMENT 'Identificador del estudiante al cual pertenece el reporte',
	`mat_id_materia` INT NOT NULL
		COMMENT 'Identificador de la materia de la cual se hace el reporte',
	`inf_id_informe` INT NOT NULL 
		COMMENT 'Identificador del informe al que pertenece el informe',
	`rep_fecha` DATE NOT NULL 
		COMMENT 'Fecha en que se hace el reporte',
	`rep_nombre_nota` VARCHAR(45) NOT NULL 
		COMMENT 'Nombre de la nota que se esta evaluando (por ejemplo, examen01)',
	`rep_valor_nota` INT NOT NULL 
		COMMENT 'Valor de la nota que se esta evaluando',
	`rep_porcentaje` INT NOT NULL 
		COMMENT 'Porcentaje de la nota que se esta evaluando',
	PRIMARY KEY(`id_reporte`),
	INDEX `fk_reporte_estudiante1_idx` (`est_id_persona` ASC),
	INDEX `fk_reporte_materia1_idx` (`mat_id_materia` ASC),
	INDEX `fk_reporte_informe1_idx` (`inf_id_informe` ASC),
	CONSTRAINT `fk_reporte_estudiante1`
		FOREIGN KEY (`est_id_persona`)
		REFERENCES `NOTAS_COLEGIO`.`estudiante` (`est_id_persona`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT `fk_reporte_materia1`
		FOREIGN KEY (`mat_id_materia`)
		REFERENCES `NOTAS_COLEGIO`.`materia` (`id_materia`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT `fk_reporte_informe1`
		FOREIGN KEY (`inf_id_informe`)
		REFERENCES `NOTAS_COLEGIO`.`informe` (`id_informe`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NOTAS_COLEGIO`.`informe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NOTAS_COLEGIO`.`informe` (
	`id_informe` INT NOT NULL
		COMMENT 'Identificador del informe',
	`inf_fecha` DATE NOT NULL 
		COMMENT 'Fecha en la que se realiza el informe',
	`inf_estado_est` VARCHAR(20) NOT NULL 
		COMMENT 'Estado del informe del estudiante(aprobado o reprobado)',
	`est_id_persona` INT NOT NULL 
		COMMENT 'Identificador del estudiante al que pertenece el informe',
	`pro_id_persona` INT(45) NOT NULL 
		COMMENT 'Identificador del profresor que hace el informe',
	PRIMARY KEY (`id_informe`),
		FOREIGN KEY (`est_id_persona`)
		REFERENCES `NOTAS_COLEGIO`.`estudiante` (`est_id_persona`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
		FOREIGN KEY (`pro_id_persona`)
		REFERENCES `NOTAS_COLEGIO`.`profesor` (`pro_id_persona`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
 )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NOTAS_COLEGIO`.`curso_tiene_profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NOTAS_COLEGIO`.`curso_tiene_profesor` (
	`cur_id_curso` INT NOT NULL 
		COMMENT 'Identificador del curso',
	`pro_id_persona` INT NOT NULL
		COMMENT 'Identificador del profesor',
	PRIMARY KEY (`cur_id_curso`, `pro_id_persona`),
	INDEX `fk_curso_has_profesor_profesor1_idx` (`pro_id_persona` ASC),
	INDEX `fk_curso_has_profesor_curso1_idx` (`cur_id_curso` ASC),
	CONSTRAINT `fk_curso_has_profesor_curso1`
		FOREIGN KEY (`cur_id_curso`)
		REFERENCES `NOTAS_COLEGIO`.`curso` (`id_curso`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT `fk_curso_has_profesor_profesor1`
		FOREIGN KEY (`pro_id_persona`)
		REFERENCES `NOTAS_COLEGIO`.`profesor` (`pro_id_persona`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;