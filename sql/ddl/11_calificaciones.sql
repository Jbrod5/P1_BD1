-- 11_calificaciones.sql
-- DDL de calificaciones a hospitales, medicos, personal de apoyo y encargados
-- PostgreSQL 16+

CREATE TABLE calificacion (
    id_calificacion SERIAL PRIMARY KEY,
    id_hospital INTEGER REFERENCES hospital(id_hospital) ON DELETE CASCADE ON UPDATE CASCADE,
    id_medico INTEGER REFERENCES medico(id_medico) ON DELETE CASCADE ON UPDATE CASCADE,
    id_personal_apoyo INTEGER REFERENCES personal_apoyo(id_personal) ON DELETE CASCADE ON UPDATE CASCADE,
    id_encargado INTEGER REFERENCES encargado(id_encargado) ON DELETE CASCADE ON UPDATE CASCADE,
    puntuacion INTEGER NOT NULL,
    comentario TEXT,
    fecha DATE NOT NULL,
    -- Valida que la puntuacion este entre 1 y 5
    CONSTRAINT chk_calificacion_puntuacion CHECK (puntuacion BETWEEN 1 AND 5),
    -- Valida que la calificacion sea de exactamente uno: hospital, medico, personal de apoyo o encargado
    CONSTRAINT chk_calificacion_exclusiva CHECK ((id_hospital IS NOT NULL)::int + (id_medico IS NOT NULL)::int + (id_personal_apoyo IS NOT NULL)::int + (id_encargado IS NOT NULL)::int = 1)
);
COMMENT ON TABLE calificacion IS 'calificaciones de hospitales, medicos, personal de apoyo y encargados';
