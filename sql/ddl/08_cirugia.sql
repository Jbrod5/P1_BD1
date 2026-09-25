-- 08_cirugia.sql
-- DDL de cirugia, consentimiento informado y chequeo preanestesico
-- PostgreSQL 16+

CREATE TABLE cirugia (
    id_cirugia SERIAL PRIMARY KEY,
    id_agendamiento INTEGER NOT NULL UNIQUE REFERENCES agendamiento_quirurgico(id_agendamiento) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_medico_cirujano INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_medico_anestesista INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_ingreso INTEGER NOT NULL UNIQUE REFERENCES ingreso(id_ingreso) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_egreso INTEGER UNIQUE REFERENCES egreso(id_egreso) ON DELETE SET NULL ON UPDATE CASCADE,
    fecha_hora_inicio TIMESTAMP NOT NULL,
    fecha_hora_fin TIMESTAMP
);
COMMENT ON TABLE cirugia IS 'cirugia realizada a partir de un agendamiento aprobado';

CREATE TABLE consentimiento_informado (
    id_consentimiento SERIAL PRIMARY KEY,
    id_cirugia INTEGER NOT NULL REFERENCES cirugia(id_cirugia) ON DELETE CASCADE ON UPDATE CASCADE,
    nombre_procedimiento VARCHAR(150) NOT NULL,
    objetivo TEXT NOT NULL,
    caracteristicas TEXT NOT NULL,
    riesgos TEXT NOT NULL,
    firma_medico VARCHAR(150) NOT NULL,
    firma_paciente_o_representante VARCHAR(150) NOT NULL,
    fecha DATE NOT NULL
);
COMMENT ON TABLE consentimiento_informado IS 'consentimiento informado firmado previo a la cirugia';

CREATE TABLE chequeo_preanestesico (
    id_chequeo SERIAL PRIMARY KEY,
    id_cirugia INTEGER NOT NULL REFERENCES cirugia(id_cirugia) ON DELETE CASCADE ON UPDATE CASCADE,
    clasificacion_asa VARCHAR(10) NOT NULL,
    id_medico_clasifica INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE,
    plan_anestesia TEXT NOT NULL,
    id_medico_anestesista INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE
);
COMMENT ON TABLE chequeo_preanestesico IS 'chequeo preanestesico previo a la cirugia';
