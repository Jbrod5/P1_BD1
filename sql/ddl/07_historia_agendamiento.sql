-- 07_historia_agendamiento.sql
-- DDL de historia clinica, exploracion fisica y agendamiento quirurgico
-- PostgreSQL 16+

CREATE TABLE historia_clinica (
    id_historia SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente) ON DELETE RESTRICT ON UPDATE CASCADE,
    sexo VARCHAR(10) NOT NULL,
    edad INTEGER NOT NULL,
    estado_civil VARCHAR(20) NOT NULL,
    religion VARCHAR(50),
    ocupacion VARCHAR(100),
    lugar_nacimiento VARCHAR(150) NOT NULL,
    lugar_residencia VARCHAR(150) NOT NULL,
    antecedentes_heredofamiliares TEXT,
    antecedentes_personales_no_patologicos TEXT,
    antecedentes_patologicos TEXT,
    padecimiento_actual TEXT NOT NULL,
    interrogatorio_aparatos_sistemas TEXT,
    sintomas_generales_terapeutica TEXT,
    estudios_previos TEXT,
    -- Valida que el sexo sea Masculino o Femenino
    CONSTRAINT chk_historia_clinica_sexo CHECK (sexo IN ('Masculino', 'Femenino')),
    -- Valida que la edad registrada no sea negativa
    CONSTRAINT chk_historia_clinica_edad CHECK (edad >= 0)
);
COMMENT ON TABLE historia_clinica IS 'historia clinica preoperatoria, interrogatorio directo o indirecto';

CREATE TABLE exploracion_fisica (
    id_exploracion SERIAL PRIMARY KEY,
    id_historia INTEGER NOT NULL UNIQUE REFERENCES historia_clinica(id_historia) ON DELETE CASCADE ON UPDATE CASCADE,
    signos_vitales TEXT NOT NULL,
    exploracion_general TEXT NOT NULL,
    cabeza TEXT,
    cuello TEXT,
    torax TEXT,
    abdomen TEXT,
    extremidades TEXT,
    columna_vertebral TEXT,
    cavidades TEXT
);
COMMENT ON TABLE exploracion_fisica IS 'exploracion fisica, relacion uno a uno con historia_clinica';

CREATE TABLE agendamiento_quirurgico (
    id_agendamiento SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_historia INTEGER NOT NULL REFERENCES historia_clinica(id_historia) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_medico_cirujano INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_hospital INTEGER NOT NULL REFERENCES hospital(id_hospital) ON DELETE RESTRICT ON UPDATE CASCADE,
    caracter VARCHAR(15) NOT NULL,
    tipo_procedimiento VARCHAR(150) NOT NULL,
    tiempo_estimado INTERVAL NOT NULL,
    tipo_anestesia VARCHAR(100) NOT NULL,
    fecha_hora_solicitud TIMESTAMP NOT NULL,
    estado VARCHAR(15) NOT NULL DEFAULT 'Pendiente',
    motivo_rechazo TEXT,
    -- Valida que el caracter sea Urgente o Programado
    CONSTRAINT chk_agendamiento_caracter CHECK (caracter IN ('Urgente', 'Programado')),
    -- Valida que el estado sea Pendiente, Aprobado o Rechazado
    CONSTRAINT chk_agendamiento_estado CHECK (estado IN ('Pendiente', 'Aprobado', 'Rechazado')),
    -- Valida que si el estado es Rechazado, siempre exista un motivo
    CONSTRAINT chk_agendamiento_motivo_rechazo CHECK ((estado = 'Rechazado' AND motivo_rechazo IS NOT NULL) OR (estado <> 'Rechazado'))
);
COMMENT ON TABLE agendamiento_quirurgico IS 'solicitud de agendamiento quirurgico enviada al comite medico';
