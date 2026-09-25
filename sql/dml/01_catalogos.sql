-- 01_catalogos.sql
-- DML de catalogo base
-- Datos ficticios, sin tildes ni ñ

INSERT INTO hospital (nombre, direccion) VALUES
('Hospital Regional de Quetzaltenango', 'Avenida de los Cerezos 45, Zona 1'),
('Hospital General San Marcos', 'Calle del Comercio 12, Barrio El Centro'),
('Hospital de Huehuetenango Occidental', 'Carretera a San Pedro 78, Colonia El Pino');

INSERT INTO direccion (municipio, departamento, area) VALUES
('Quetzaltenango', 'Quetzaltenango', 'Urbana'),
('San Marcos', 'San Marcos', 'Urbana'),
('Huehuetenango', 'Huehuetenango', 'Urbana'),
('Totonicapan', 'Totonicapan', 'Urbana'),
('La Esperanza', 'Quetzaltenango', 'Rural'),
('Comitancillo', 'San Marcos', 'Rural'),
('San Antonio Huista', 'Huehuetenango', 'Rural'),
('Momostenango', 'Totonicapan', 'Rural'),
('San Mateo', 'Quetzaltenango', 'Urbana'),
('San Pedro Sacatepequez', 'San Marcos', 'Rural'),
('San Sebastian Huehuetenango', 'Huehuetenango', 'Rural'),
('Santa Maria Chiquimula', 'Totonicapan', 'Urbana');

INSERT INTO especialidad (nombre, area) VALUES
('Cardiologia', 'Consulta Externa'),
('Dermatologia', 'Consulta Externa'),
('Fisioterapia', 'Consulta Externa'),
('Ginecologia Oncologica', 'Consulta Externa'),
('Hematologia', 'Consulta Externa'),
('Medicina Fisica y Rehabilitacion', 'Consulta Externa'),
('Medicina General', 'Consulta Externa'),
('Nutricion y Dietetica', 'Consulta Externa'),
('Odontologia General', 'Consulta Externa'),
('Oftalmologia', 'Consulta Externa'),
('Psicologia', 'Consulta Externa'),
('Pediatria', 'Consulta Externa'),
('Urologia', 'Consulta Externa'),
('Terapia del Lenguaje', 'Consulta Externa'),
('Cirugia Cardiovascular Adulto y Pediatrica', 'Cirugia'),
('Cirugia de la Mano', 'Cirugia'),
('Cirugia General', 'Cirugia'),
('Videolaparoscopia Quirurgica', 'Cirugia'),
('Cirugia Ginecologica', 'Cirugia'),
('Cirugia Neurologica', 'Cirugia'),
('Cirugia Oftalmologica', 'Cirugia'),
('Cirugia Oncologica', 'Cirugia'),
('Cirugia Ortopedica', 'Cirugia'),
('Cirugia Otorrinolaringologica', 'Cirugia'),
('Cirugia Pediatrica', 'Cirugia'),
('Cirugia Plastica', 'Cirugia'),
('Cirugia de Torax', 'Cirugia'),
('Cirugia Urologica', 'Cirugia');

INSERT INTO personal_apoyo (nombre, tipo, dpi) VALUES
('Ana Lucia Mendez', 'Practicante de Medicina', '1234567890123'),
('Carlos Eduardo Lopez', 'Enfermero Registrado', '2345678901234'),
('Maria Elena Ramos', 'Practicante de Enfermeria', '3456789012345'),
('Juan Pablo Herrera', 'Practicante de Medicina', '4567890123456'),
('Sofia Isabel Castro', 'Enfermero Registrado', '5678901234567'),
('Luis Alberto Ruiz', 'Practicante de Enfermeria', '6789012345678'),
('Diana Karina Solis', 'Enfermero Registrado', '7890123456789'),
('Pedro Jose Morales', 'Practicante de Medicina', '8901234567890');

INSERT INTO insumo (nombre, descripcion, material, tipo, costo_unitario) VALUES
('Jeringa 10 ml', 'Jeringa descartable con aguja', 'Plastico', 'Medico', 3.50),
('Gasa esteril', 'Paquete de gasas esteriles 10x10', 'Algodon', 'Medico', 8.25),
('Guantes quirurgicos', 'Par esteril talla M', 'Latex', 'Quirurgico', 15.00),
('Cateter venoso', 'Cateter periferico 18 G', 'PVC', 'Medico', 22.75),
('Suero fisiologico', 'Solucion salina 0.9% 500 ml', 'Plastico', 'Medico', 12.00),
('Algodon hidofilo', 'Paquete de 200 g', 'Algodon', 'Otro', 9.50),
('Suturas de seda', 'Hilo de sutura 3-0', 'Seda', 'Quirurgico', 45.00),
('Mascarilla N95', 'Mascarilla filtrante', 'Polipropileno', 'Otro', 18.50),
('Gasas no esteriles', 'Paquete de 20 unidades', 'Algodon', 'Medico', 5.75),
('Bisturi descartable', 'Hoja de bisturi No. 11', 'Acero', 'Quirurgico', 7.25);

INSERT INTO instrumento (nombre, descripcion, tipo, funcion) VALUES
('Bisturi No. 11', 'Hoja de bisturi para incisiones', 'Quirurgico', 'Corte'),
('Pinza hemostatica', 'Pinza para control de hemorragia', 'Quirurgico', 'Hemostatica'),
('Tijeras quirurgicas', 'Tijeras para corte de tejidos', 'Quirurgico', 'Corte'),
('Separador de Farabeuf', 'Retractor manual de tejido', 'Quirurgico', 'Retractor'),
('Porta-aguja Mayo', 'Porta-aguja para suturas', 'Quirurgico', 'Contencion'),
('Pinza de Allis', 'Pinza de contencion de tejidos', 'Quirurgico', 'Contencion'),
('Implante ortopedico', 'Placa de titanio 4 agujeros', 'Quirurgico', 'Implante'),
('Separador autoestatico', 'Retractor autoestatico abdominal', 'Quirurgico', 'Retractor'),
('Pinza de diseccion', 'Pinza sin dientes', 'Quirurgico', 'Otro'),
('Pinza de campo', 'Pinza para sujetar campos', 'Quirurgico', 'Accesorio');

INSERT INTO equipo (nombre, descripcion, tipo, funcion) VALUES
('Monitor de signos vitales', 'Monitor multiparametrico', 'Medico', 'Exploracion'),
('Maquina de anestesia', 'Equipo de anestesia general', 'Quirurgico', 'Tratamiento'),
('Electrocardiografo', 'Registro de actividad cardiaca', 'Medico', 'Diagnostico'),
('Bomba de infusion', 'Control de infusion intravenosa', 'Medico', 'Tratamiento'),
('Lampara quirurgica', 'Iluminacion de campo operatorio', 'Quirurgico', 'Tratamiento'),
('Mesa de cirugia', 'Mesa articulada para procedimientos', 'Quirurgico', 'Tratamiento'),
('Equipo de rehabilitacion', 'Bicicleta estacionaria terapéutica', 'Medico', 'Rehabilitacion'),
('Tomografo portatil', 'Unidad de imagen portatil', 'Medico', 'Diagnostico');
