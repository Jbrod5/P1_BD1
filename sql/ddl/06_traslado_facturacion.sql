-- 06_traslado_facturacion.sql
-- DDL de traslados, facturacion, pagos y consumo de insumos
-- PostgreSQL 16+

CREATE TABLE traslado (
    id_traslado SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_medico_indica INTEGER NOT NULL REFERENCES medico(id_medico) ON DELETE RESTRICT ON UPDATE CASCADE,
    fecha_hora TIMESTAMP NOT NULL,
    id_egreso_origen INTEGER REFERENCES egreso(id_egreso) ON DELETE SET NULL ON UPDATE CASCADE,
    id_unidad_origen INTEGER REFERENCES unidad_medica(id_unidad_medica) ON DELETE SET NULL ON UPDATE CASCADE,
    id_hospital_origen INTEGER REFERENCES hospital(id_hospital) ON DELETE SET NULL ON UPDATE CASCADE,
    origen_interno BOOLEAN NOT NULL,
    id_ingreso_destino INTEGER REFERENCES ingreso(id_ingreso) ON DELETE SET NULL ON UPDATE CASCADE,
    id_unidad_destino INTEGER NOT NULL REFERENCES unidad_medica(id_unidad_medica) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_hospital_destino INTEGER NOT NULL REFERENCES hospital(id_hospital) ON DELETE RESTRICT ON UPDATE CASCADE,
    destino_interno BOOLEAN NOT NULL
);
COMMENT ON TABLE traslado IS 'traslados de pacientes entre unidades u hospitales';

CREATE TABLE factura (
    id_factura SERIAL PRIMARY KEY,
    id_paciente INTEGER NOT NULL REFERENCES paciente(id_paciente) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_egreso INTEGER REFERENCES egreso(id_egreso) ON DELETE RESTRICT ON UPDATE CASCADE,
    id_consulta INTEGER REFERENCES consulta(id_consulta) ON DELETE RESTRICT ON UPDATE CASCADE,
    fecha_emision DATE NOT NULL,
    descripcion TEXT NOT NULL,
    monto_total NUMERIC(10,2) NOT NULL,
    estado_pago VARCHAR(20) NOT NULL,
    -- Valida que el monto total no sea negativo
    CONSTRAINT chk_factura_monto_total CHECK (monto_total >= 0),
    -- Valida que el estado de pago sea Pendiente, En cuotas o Pagada
    CONSTRAINT chk_factura_estado_pago CHECK (estado_pago IN ('Pendiente', 'En cuotas', 'Pagada')),
    -- Valida que la factura venga de un egreso O de una consulta, nunca ambas ni ninguna
    CONSTRAINT chk_factura_origen_exclusivo CHECK ((id_egreso IS NOT NULL)::int + (id_consulta IS NOT NULL)::int = 1)
);
COMMENT ON TABLE factura IS 'factura por servicios de consulta externa o de un episodio de emergencias/cirugia/hospitalizacion (arco exclusivo)';

CREATE TABLE detalle_factura (
    id_detalle SERIAL PRIMARY KEY,
    id_factura INTEGER NOT NULL REFERENCES factura(id_factura) ON DELETE CASCADE ON UPDATE CASCADE,
    concepto VARCHAR(150) NOT NULL,
    monto NUMERIC(10,2) NOT NULL
);
COMMENT ON TABLE detalle_factura IS 'detalle de conceptos facturados';

CREATE TABLE pago (
    id_pago SERIAL PRIMARY KEY,
    id_factura INTEGER NOT NULL REFERENCES factura(id_factura) ON DELETE CASCADE ON UPDATE CASCADE,
    fecha_pago DATE NOT NULL,
    numero_cuota INTEGER NOT NULL,
    monto NUMERIC(10,2) NOT NULL,
    -- Valida que el numero de cuota este entre 1 y 12
    CONSTRAINT chk_pago_numero_cuota CHECK (numero_cuota BETWEEN 1 AND 12)
);
COMMENT ON TABLE pago IS 'pagos o cuotas de una factura, maximo 12 cuotas';

CREATE TABLE consumo_insumo (
    id_consumo SERIAL PRIMARY KEY,
    id_ingreso INTEGER NOT NULL REFERENCES ingreso(id_ingreso) ON DELETE CASCADE ON UPDATE CASCADE,
    id_insumo INTEGER NOT NULL REFERENCES insumo(id_insumo) ON DELETE RESTRICT ON UPDATE CASCADE,
    cantidad INTEGER NOT NULL,
    -- Valida que la cantidad consumida sea mayor que cero
    CONSTRAINT chk_consumo_insumo_cantidad CHECK (cantidad > 0)
);
COMMENT ON TABLE consumo_insumo IS 'insumos consumidos durante un ingreso, usado para calcular el costo de hospitalizacion/emergencias';
