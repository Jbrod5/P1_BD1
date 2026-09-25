-- 04_ingreso_egreso.sql
-- DDL de fichas de ingreso, egreso y diagnosticos secundarios
-- PostgreSQL 16+

-- ficha de ingreso de pacientes, usada por todas las unidades excepto Consulta Externa
CREATE TABLE ingreso (
    id_ingreso SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_unidad_medica INTEGER NOT NULL REFERENCES unidad_medica(id_unidad_medica) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_servicio INTEGER REFERENCES servicio_unidad(id_servicio) ON DELETE SET NULL ON UPDATE CASCADE,
    id_medico INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_recurso INTEGER REFERENCES recurso_asignable(id_recurso) ON DELETE SET NULL ON UPDATE CASCADE,
    fecha_hora TIMESTAMP NOT NULL,
    motivo_ingreso TEXT NOT NULL,
    diagnostico_presuntivo TEXT NOT NULL
);

-- ficha de egreso, relacion uno a uno con su ingreso
CREATE TABLE egreso (
    id_egreso SERIAL PRIMARY KEY,
    id_ingreso INTEGER NOT NULL UNIQUE REFERENCES ingreso(id_ingreso) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_unidad_medica INTEGER NOT NULL REFERENCES unidad_medica(id_unidad_medica) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_servicio INTEGER REFERENCES servicio_unidad(id_servicio) ON DELETE SET NULL ON UPDATE CASCADE,
    id_medico INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_recurso INTEGER REFERENCES recurso_asignable(id_recurso) ON DELETE SET NULL ON UPDATE CASCADE,
    fecha_hora TIMESTAMP NOT NULL,
    diagnostico_principal TEXT NOT NULL,
    motivo_egreso TEXT NOT NULL,
    codigo_egreso VARCHAR(15) NOT NULL,
    egreso_sin_consentimiento BOOLEAN NOT NULL DEFAULT FALSE,
    motivo_sin_consentimiento TEXT,
    numero_dias_hospitalizado INTEGER,
    id_hospital_referido INTEGER REFERENCES hospital(id_hospital) ON DELETE SET NULL ON UPDATE CASCADE,
    -- Valida que el codigo de egreso sea Vivo, Muerto, Embarazo o Parto
    CONSTRAINT chk_egreso_codigo_egreso CHECK (codigo_egreso IN ('Vivo', 'Muerto', 'Embarazo', 'Parto')),
    -- Valida que el numero de dias hospitalizado no sea negativo
    CONSTRAINT chk_egreso_numero_dias_hospitalizado CHECK (numero_dias_hospitalizado >= 0)
);

-- diagnosticos secundarios de un egreso, relacion uno a muchos
CREATE TABLE diagnostico_secundario (
    id_diagnostico_secundario SERIAL PRIMARY KEY,
    id_egreso INTEGER NOT NULL REFERENCES egreso(id_egreso) ON DELETE CASCADE ON UPDATE CASCADE,
    descripcion TEXT NOT NULL
);
