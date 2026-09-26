# P1_BD1

Base de datos Proyecto1_BD1 con PostgreSQL 18 mediante Docker Compose.

## Crear y levantar el contenedor

```
docker compose up -d
```

## Reiniciar borrando datos

```
docker compose down -v
docker compose up -d
```

## Levantar si esta cerrado

```
docker compose start
```

## Conectar con DBeaver o Beekeeper
- Host: localhost
- Puerto: 5432
- Base de datos: Proyecto1_BD1
- Usuario: postgres
- Clave: postgres

## Entrar a la CLI de postgres

```
docker exec -it proyecto1_bd1_postgres psql -U postgres -d Proyecto1_BD1
```

## Matar proceso que usa el puerto 5432 (Linux)
```
sudo lsof -t -i:5432 | xargs kill -9
```

## Ejecutar archivos SQL en orden
```
docker cp sql/ddl/ proyecto1_bd1_postgres:/tmp/
docker cp sql/dml/ proyecto1_bd1_postgres:/tmp/
docker cp sql/dcl/ proyecto1_bd1_postgres:/tmp/
```
Ejecutar dentro del contenedor para ddl:
```
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/01_catalogos.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/02_personas.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/03_unidades_recursos.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/04_ingreso_egreso.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/05_consulta_externa.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/06_traslado_facturacion.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/07_historia_agendamiento.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/08_cirugia.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/09_cirugia_recursos.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/10_proceso_quirurgico.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/ddl/11_calificaciones.sql
```
Para dml:
```
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/01_catalogos.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/02_personas.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/03_unidades_recursos.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/04_ingreso_egreso.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/05_consulta_externa.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/06_traslado_facturacion.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/07_historia_agendamiento.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/08_cirugia.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/09_cirugia_recursos.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/10_proceso_quirurgico.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dml/11_calificaciones.sql
```
Para dcl:
```
psql -U postgres -d Proyecto1_BD1 -f /tmp/dcl/01_rol_lectura.sql
psql -U postgres -d Proyecto1_BD1 -f /tmp/dcl/02_rol_administrador.sql
```

