-- rol con control administrativo completo sobre el esquema
CREATE ROLE admin_hospital WITH LOGIN PASSWORD 'CambioClave2026Admin' CREATEROLE;

-- conexion a la base de datos
GRANT CONNECT ON DATABASE Proyecto1_BD1 TO admin_hospital;

-- privilegios completos sobre el esquema
GRANT ALL PRIVILEGES ON SCHEMA public TO admin_hospital;

-- privilegios completos sobre tablas existentes
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_hospital;

-- privilegios completos sobre secuencias existentes
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin_hospital;

-- privilegios futuros sobre tablas
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO admin_hospital;

-- privilegios futuros sobre secuencias
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO admin_hospital;

-- este rol NO es superusuario de PostgreSQL: no puede crear o eliminar otras bases de datos ni otros roles fuera de este esquema, solo tiene control total dentro del esquema public
