-- 03_unidades_recursos.sql
-- DDL de unidades medicas, servicios, recursos asignables y clinicas
-- PostgreSQL 16+

CREATE TABLE unidad_medica (
    id_unidad_medica SERIAL PRIMARY KEY,
    id_hospital INTEGER NOT NULL REFERENCES hospital(id_hospital) ON DELETE RESTRICT ON UPDATE CASCADE,
    tipo_unidad VARCHAR(20) NOT NULL,
    -- Valida que el tipo de unidad sea una de las 4 unidades medicas
    CONSTRAINT chk_unidad_medica_tipo_unidad CHECK (tipo_unidad IN ('Consulta Externa', 'Emergencias', 'Cirugia', 'Hospitalizacion')),
    UNIQUE (id_hospital, tipo_unidad)
);
COMMENT ON TABLE unidad_medica IS 'las 4 unidades medicas de cada hospital';

CREATE TABLE servicio_unidad (
    id_servicio SERIAL PRIMARY KEY,
    id_unidad_medica INTEGER NOT NULL REFERENCES unidad_medica(id_unidad_medica) ON DELETE CASCADE ON UPDATE CASCADE,
    nombre VARCHAR(100) NOT NULL,
    tarifa NUMERIC(10,2)
);
COMMENT ON TABLE servicio_unidad IS 'servicios especificos que ofrece cada unidad medica (ej. Hematologia, Medicina Interna, Unidad de Cuidados Intermedios)';

CREATE TABLE recurso_asignable (
    id_recurso SERIAL PRIMARY KEY,
    id_hospital INTEGER NOT NULL REFERENCES hospital(id_hospital) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_unidad_medica INTEGER REFERENCES unidad_medica(id_unidad_medica) ON DELETE SET NULL ON UPDATE CASCADE,
    tipo VARCHAR(10) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    -- Valida que el tipo de recurso sea Camilla o Quirofano
    CONSTRAINT chk_recurso_asignable_tipo CHECK (tipo IN ('Camilla', 'Quirofano')),
    -- Valida que el estado sea Disponible, Ocupado o Mantenimiento
    CONSTRAINT chk_recurso_asignable_estado CHECK (estado IN ('Disponible', 'Ocupado', 'Mantenimiento'))
);
COMMENT ON TABLE recurso_asignable IS 'camillas y quirofanos de cada hospital, unificados en un solo recurso porque la ficha original los trata como un mismo campo';

CREATE TABLE clinica (
    id_clinica SERIAL PRIMARY KEY,
    id_hospital INTEGER NOT NULL REFERENCES hospital(id_hospital) ON DELETE RESTRICT ON UPDATE CASCADE,
    numero_clinica VARCHAR(10) NOT NULL,
    id_medico INTEGER REFERENCES medico(id_medico) ON DELETE SET NULL ON UPDATE CASCADE
);
COMMENT ON TABLE clinica IS 'consultorios de consulta externa por hospital';
