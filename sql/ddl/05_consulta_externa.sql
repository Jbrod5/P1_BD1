-- 05_consulta_externa.sql
-- DDL de citas, consultas, recetas y medicamentos de consulta externa
-- PostgreSQL 16+

-- citas programadas de consulta externa
CREATE TABLE cita_programada (
    id_cita SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_medico INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_clinica INTEGER NOT NULL REFERENCES clinica(id_clinica) ON DELETE RESTRICT ON UPDATE CASCADE,
    fecha_hora TIMESTAMP NOT NULL,
    estado VARCHAR(20) NOT NULL,
    referida_por_institucion BOOLEAN NOT NULL DEFAULT FALSE,
    notificada_cancelacion BOOLEAN,
    -- Valida que el estado de la cita sea Programada, Realizada, Reprogramada o Cancelada
    CONSTRAINT chk_cita_programada_estado CHECK (estado IN ('Programada', 'Realizada', 'Reprogramada', 'Cancelada'))
);

-- ficha de consulta del paciente en consulta externa (id_clinica es independiente de id_cita: toda consulta ocurre en un consultorio, tenga o no cita previa)
CREATE TABLE consulta (
    id_consulta SERIAL PRIMARY KEY,
    id_cita INTEGER REFERENCES cita_programada(id_cita) ON DELETE SET NULL ON UPDATE CASCADE,
    id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_medico INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_clinica INTEGER NOT NULL REFERENCES clinica(id_clinica) ON DELETE RESTRICT ON UPDATE CASCADE,
    fecha DATE NOT NULL,
    tipo_consulta VARCHAR(20) NOT NULL,
    diagnostico TEXT NOT NULL,
    otros_datos_interes TEXT,
    notas_observaciones TEXT,
    costo NUMERIC(10,2) NOT NULL,
    -- Valida que el tipo de consulta sea Primera vez, Reconsulta o Referida
    CONSTRAINT chk_consulta_tipo_consulta CHECK (tipo_consulta IN ('Primera vez', 'Reconsulta', 'Referida'))
);

-- receta medica emitida en una consulta
CREATE TABLE receta (
    id_receta SERIAL PRIMARY KEY,
    id_consulta INTEGER NOT NULL REFERENCES consulta(id_consulta) ON DELETE CASCADE ON UPDATE CASCADE,
    fecha DATE NOT NULL,
    proxima_cita_fecha DATE,
    id_clinica INTEGER REFERENCES clinica(id_clinica) ON DELETE SET NULL ON UPDATE CASCADE
);

-- medicamentos incluidos en una receta
CREATE TABLE medicamento_recetado (
    id_item SERIAL PRIMARY KEY,
    id_receta INTEGER NOT NULL REFERENCES receta(id_receta) ON DELETE CASCADE ON UPDATE CASCADE,
    nombre_medicamento VARCHAR(150) NOT NULL,
    dosis VARCHAR(100) NOT NULL,
    duracion VARCHAR(100) NOT NULL
);
