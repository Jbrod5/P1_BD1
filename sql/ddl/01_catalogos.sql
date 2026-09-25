-- 01_catalogos.sql
-- DDL de tablas de catalogo base (sin llaves foraneas)
-- PostgreSQL 16+

CREATE TABLE hospital (
    id_hospital SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(250) NOT NULL
);
COMMENT ON TABLE hospital IS 'catalogo de hospitales de la cadena Hospitales de Occidente';

CREATE TABLE direccion (
    id_direccion SERIAL PRIMARY KEY,
    municipio VARCHAR(100) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    area VARCHAR(10) NOT NULL,
    -- Valida que el area sea Urbana o Rural
    CONSTRAINT chk_direccion_area CHECK (area IN ('Urbana', 'Rural'))
);
COMMENT ON TABLE direccion IS 'direcciones reutilizables para paciente, encargado y medico';

CREATE TABLE especialidad (
    id_especialidad SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    area VARCHAR(20) NOT NULL,
    -- Valida que el area sea Consulta Externa, Cirugia o Ambas
    CONSTRAINT chk_especialidad_area CHECK (area IN ('Consulta Externa', 'Cirugia', 'Ambas'))
);
COMMENT ON TABLE especialidad IS 'catalogo de especialidades medicas y quirurgicas';

CREATE TABLE personal_apoyo (
    id_personal SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    dpi VARCHAR(13),
    -- Valida que el tipo sea personal de apoyo permitido
    CONSTRAINT chk_personal_apoyo_tipo CHECK (tipo IN ('Practicante de Medicina', 'Enfermero Registrado', 'Practicante de Enfermeria'))
);
COMMENT ON TABLE personal_apoyo IS 'personal de apoyo que interviene en cirugias, no contratado como medico';

CREATE TABLE insumo (
    id_insumo SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    material VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    costo_unitario NUMERIC(10,2) NOT NULL,
    -- Valida que el tipo de insumo sea Medico, Quirurgico u Otro
    CONSTRAINT chk_insumo_tipo CHECK (tipo IN ('Medico', 'Quirurgico', 'Otro')),
    -- Valida que el costo unitario no sea negativo
    CONSTRAINT chk_insumo_costo_unitario CHECK (costo_unitario >= 0)
);
COMMENT ON TABLE insumo IS 'catalogo de insumos consumibles usados en la institucion';

CREATE TABLE instrumento (
    id_instrumento SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    tipo VARCHAR(20) NOT NULL,
    funcion VARCHAR(20) NOT NULL,
    -- Valida que el tipo de instrumento sea Medico, Quirurgico u Otro
    CONSTRAINT chk_instrumento_tipo CHECK (tipo IN ('Medico', 'Quirurgico', 'Otro')),
    -- Valida que la funcion sea una de las funciones quirurgicas permitidas
    CONSTRAINT chk_instrumento_funcion CHECK (funcion IN ('Corte', 'Contencion', 'Hemostatica', 'Retractor', 'Accesorio', 'Implante', 'Otro'))
);
COMMENT ON TABLE instrumento IS 'catalogo de instrumental quirurgico reutilizable';

CREATE TABLE equipo (
    id_equipo SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    tipo VARCHAR(20) NOT NULL,
    funcion VARCHAR(20) NOT NULL,
    -- Valida que el tipo de equipo sea Medico, Quirurgico u Otro
    CONSTRAINT chk_equipo_tipo CHECK (tipo IN ('Medico', 'Quirurgico', 'Otro')),
    -- Valida que la funcion del equipo sea una funcion clinica permitida
    CONSTRAINT chk_equipo_funcion CHECK (funcion IN ('Exploracion', 'Diagnostico', 'Tratamiento', 'Rehabilitacion', 'Otro'))
);
COMMENT ON TABLE equipo IS 'catalogo de equipo medico/quirurgico';
