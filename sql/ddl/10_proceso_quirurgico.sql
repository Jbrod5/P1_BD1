-- 10_proceso_quirurgico.sql
-- DDL de etapas quirurgicas y registros de verificacion
-- PostgreSQL 16+

-- las 3 fases grandes del proceso quirurgico de una cirugia
CREATE TABLE etapa_quirurgica (
    id_etapa SERIAL PRIMARY KEY,
    id_cirugia INTEGER NOT NULL REFERENCES cirugia(id_cirugia) ON DELETE CASCADE ON UPDATE CASCADE,
    tipo_etapa VARCHAR(20) NOT NULL,
    hora_inicio TIMESTAMP NOT NULL,
    hora_fin TIMESTAMP,
    -- Valida que el tipo de etapa sea Preoperatorio, Intraoperatorio o Postoperatorio
    CONSTRAINT chk_etapa_quirurgica_tipo_etapa CHECK (tipo_etapa IN ('Preoperatorio', 'Intraoperatorio', 'Postoperatorio'))
);

-- puntos de verificacion dentro de cada etapa quirurgica
CREATE TABLE registro_etapa (
    id_registro SERIAL PRIMARY KEY,
    id_etapa INTEGER NOT NULL REFERENCES etapa_quirurgica(id_etapa) ON DELETE CASCADE ON UPDATE CASCADE,
    seccion VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    resultado VARCHAR(25) NOT NULL,
    hora_registro TIMESTAMP NOT NULL,
    id_personal_registra INTEGER NOT NULL REFERENCES personal_apoyo(id_personal) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Valida que la seccion sea una de las secciones de verificacion permitidas
    CONSTRAINT chk_registro_etapa_seccion CHECK (seccion IN ('Entrada', 'Chequeo en Quirofano', 'Procedimientos de Pausa Quirurgica', 'Gestion de Cuidados Intraoperatoria', 'Salida Quirurgica', 'Ingreso a Sala de Recuperacion', 'Traslado Seguro')),
    -- Valida que el resultado use una de las dos escalas del documento original segun la seccion
    CONSTRAINT chk_registro_etapa_resultado CHECK (resultado IN ('Aceptable', 'Medianamente aceptable', 'No aceptable', 'Exito', 'Fallo'))
);
