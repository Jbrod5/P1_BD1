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

## Referencias
- sql/ddl/ para DDL
- sql/dml/ para DML
- sql/dcl/ para DCL
- modelo/ para diagrama
