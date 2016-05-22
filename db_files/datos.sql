INSERT INTO `NOTAS_COLEGIO`.`horario` (`id_horario`, `hor_aula`) 
VALUES ('1', '101'),
    ('2', '102'),
    ('3', '103'),
    ('4', '104');

INSERT INTO `NOTAS_COLEGIO`.`curso` (`id_curso`, `hor_id_horario`) 
VALUES ('101', '1'),
    ('102', '2'),
    ('103', '3'),
    ('104', '4');

INSERT INTO `NOTAS_COLEGIO`.`persona` (`id_persona`, `per_jornada`, `per_nombre`, `per_tipodcto`, `per_numdcto`) 
VALUES ('1', 'Mañana', 'Juan Carlos Estrada Alvarez', 'CC', '1234'), 
    ('2', 'Mañana', 'Pepito01', 'TI', '123401'),
    ('3', 'Mañana', 'Pepito02', 'CC', '123402'),
    ('4', 'Mañana', 'Pepito03', 'CC', '123403'),
    ('5', 'Mañana', 'Pepito04', 'CC', '123404'),
    ('6', 'Mañana', 'Pepito05', 'CC', '123405');

INSERT INTO `NOTAS_COLEGIO`.`administrativo` (`adm_id_persona`, `adm_cargo`, `adm_num_ofc`) 
VALUES ('5', 'Coordinador', 'OFC101'),
    ('6', 'Secretaria', 'OFC101');

INSERT INTO `NOTAS_COLEGIO`.`estudiante` (`est_id_persona`, `cur_id_curso`) 
VALUES ('1', '101'),
    ('2', '102');
    
INSERT INTO `NOTAS_COLEGIO`.`profesor` (`pro_id_persona`, `pro_especialidad`) 
VALUES ('3', 'Matematicas'), 
    ('4', 'Informatica');
    
INSERT INTO `NOTAS_COLEGIO`.`curso_tiene_profesor` (`cur_id_curso`, `pro_id_persona`) 
VALUES ('101', '3'),
    ('101', '4');

INSERT INTO `NOTAS_COLEGIO`.`materia` (`id_materia`, `pro_id_persona`, `hor_id_horario`, `mat_nombre`) 
VALUES ('101', '3', '1', 'Matematicas'),
    ('102', '4', '1', 'Informatica');
    
INSERT INTO `NOTAS_COLEGIO`.`informe` (`id_informe`, `inf_fecha`, `inf_estado_est`, `est_id_persona`, `pro_id_persona`) 
VALUES ('1', '2016-05-02', 'APROBADO', '1', '3');

INSERT INTO `NOTAS_COLEGIO`.`reporte` (`id_reporte`, `est_id_persona`, `mat_id_materia`, `inf_id_informe`, `rep_fecha`, `rep_nombre_nota`, `rep_valor_nota`, `rep_porcentaje`) 
VALUES ('1', '1', '101', '1', '2016-05-01', 'Examen01', '45', '25'),
    ('2', '1', '101', '1', '2016-05-02', 'Examen02', '32', '25');