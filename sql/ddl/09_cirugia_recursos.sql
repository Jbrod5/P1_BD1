-- 09_cirugia_recursos.sql
-- DDL de insumos, instrumental, equipo y participantes de cirugia
-- PostgreSQL 16+

-- insumos consumidos en una cirugia
CREATE TABLE cirugia_insumo (
    id_cirugia INTEGER NOT NULL REFERENCES cirugia(id_cirugia) ON DELETE CASCADE ON UPDATE CASCADE,
    id_insumo INTEGER NOT NULL REFERENCES insumo(id_insumo) ON DELETE RESTRICT ON UPDATE CASCADE,
    cantidad INTEGER NOT NULL,
    -- Valida que la cantidad consumida sea mayor que cero
    CONSTRAINT chk_cirugia_insumo_cantidad CHECK (cantidad > 0),
    PRIMARY KEY (id_cirugia, id_insumo)
);

-- instrumental utilizado en una cirugia
CREATE TABLE cirugia_instrumento (
    id_cirugia INTEGER NOT NULL REFERENCES cirugia(id_cirugia) ON DELETE CASCADE ON UPDATE CASCADE,
    id_instrumento INTEGER NOT NULL REFERENCES instrumento(id_instrumento) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (id_cirugia, id_instrumento)
);

-- equipo utilizado en una cirugia
CREATE TABLE cirugia_equipo (
    id_cirugia INTEGER NOT NULL REFERENCES cirugia(id_cirugia) ON DELETE CASCADE ON UPDATE CASCADE,
    id_equipo INTEGER NOT NULL REFERENCES equipo(id_equipo) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (id_cirugia, id_equipo)
);

-- equipo humano que participa en una cirugia
CREATE TABLE cirugia_participante (
    id_participacion SERIAL PRIMARY KEY,
    id_cirugia INTEGER NOT NULL REFERENCES cirugia(id_cirugia) ON DELETE CASCADE ON UPDATE CASCADE,
    rol VARCHAR(20) NOT NULL,
    id_medico INTEGER REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_personal_apoyo INTEGER REFERENCES personal_apoyo(id_personal) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Valida que el rol sea un rol quirurgico permitido
    CONSTRAINT chk_cirugia_participante_rol CHECK (rol IN ('Cirujano', 'Anestesiologo', 'Instrumentista', 'Circulante', 'Ayudante')),
    -- Valida que el participante sea un medico O un personal de apoyo, nunca ambos ni ninguno
    CONSTRAINT chk_participante_exclusivo CHECK ((id_medico IS NOT NULL)::int + (id_personal_apoyo IS NOT NULL)::int = 1)
);
