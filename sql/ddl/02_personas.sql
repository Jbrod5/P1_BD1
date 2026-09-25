-- 02_personas.sql
-- DDL de tablas de personas (encargados, medicos y pacientes)
-- PostgreSQL 16+

-- encargados o responsables de pacientes
CREATE TABLE encargado (
    id_encargado SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    parentesco VARCHAR(50) NOT NULL,
    dpi VARCHAR(13) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    id_direccion INTEGER NOT NULL REFERENCES direccion(id_direccion) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- medicos de la institucion, residentes internos y externos
CREATE TABLE medico (
    id_medico SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    dpi VARCHAR(13) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    id_direccion INTEGER NOT NULL REFERENCES direccion(id_direccion) ON DELETE RESTRICT ON UPDATE CASCADE,
    tipo_medico VARCHAR(20) NOT NULL,
    tarifa_consulta NUMERIC(10,2),
    -- Valida que el tipo de medico sea Residente, Interno o Externo
    CONSTRAINT chk_medico_tipo_medico CHECK (tipo_medico IN ('Residente', 'Interno', 'Externo'))
);

-- pacientes registrados en la institucion
CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    no_expediente VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    dpi VARCHAR(13) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    id_direccion INTEGER NOT NULL REFERENCES direccion(id_direccion) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_encargado INTEGER REFERENCES encargado(id_encargado) ON DELETE SET NULL ON UPDATE CASCADE,
    estado_civil VARCHAR(20),
    no_seguro_social VARCHAR(20),
    -- Valida que el sexo sea Masculino o Femenino
    CONSTRAINT chk_paciente_sexo CHECK (sexo IN ('Masculino', 'Femenino'))
);

-- relacion muchos a muchos entre medicos y sus especialidades
CREATE TABLE medico_especialidad (
    id_medico INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE CASCADE ON UPDATE CASCADE,
    id_especialidad INTEGER NOT NULL REFERENCES especialidad(id_especialidad) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (id_medico, id_especialidad)
);
