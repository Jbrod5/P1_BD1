-- rol para consultas de auditoria y reportes, sin permiso de modificar datos
CREATE ROLE auditor_lectura WITH LOGIN PASSWORD 'CambioClave2026Lectura';

-- otorga conexion a la base de datos
GRANT CONNECT ON DATABASE Proyecto1_BD1 TO auditor_lectura;

-- otorga uso del esquema public
GRANT USAGE ON SCHEMA public TO auditor_lectura;

-- otorga SELECT sobre todas las tablas existentes en el esquema public
GRANT SELECT ON ALL TABLES IN SCHEMA public TO auditor_lectura;

-- asegura SELECT automatico en tablas futuras
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO auditor_lectura;

-- ejemplo de verificacion: SELECT debe funcionar conectado como auditor_lectura
-- SELECT * FROM paciente; -- deberia funcionar
-- INSERT en paciente; -- deberia fallar por permisos (no se otorgan INSERT, UPDATE, DELETE ni secuencias)
