-- 09_cirugia_recursos.sql
-- DML de recursos de cirugia y participantes

INSERT INTO cirugia_insumo (id_cirugia, id_insumo, cantidad) VALUES
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), (SELECT id_insumo FROM insumo WHERE nombre = 'Jeringa 10 ml'), 4),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), (SELECT id_insumo FROM insumo WHERE nombre = 'Cateter venoso'), 2),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), (SELECT id_insumo FROM insumo WHERE nombre = 'Suturas de seda'), 5),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), (SELECT id_insumo FROM insumo WHERE nombre = 'Guantes quirurgicos'), 6),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), (SELECT id_insumo FROM insumo WHERE nombre = 'Bisturi descartable'), 3),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), (SELECT id_insumo FROM insumo WHERE nombre = 'Gasa esteril'), 8),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), (SELECT id_insumo FROM insumo WHERE nombre = 'Mascarilla N95'), 10),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), (SELECT id_insumo FROM insumo WHERE nombre = 'Algodon hidofilo'), 2),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), (SELECT id_insumo FROM insumo WHERE nombre = 'Gasas no esteriles'), 7),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), (SELECT id_insumo FROM insumo WHERE nombre = 'Cateter venoso'), 3),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), (SELECT id_insumo FROM insumo WHERE nombre = 'Guantes quirurgicos'), 5),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), (SELECT id_insumo FROM insumo WHERE nombre = 'Suturas de seda'), 4),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), (SELECT id_insumo FROM insumo WHERE nombre = 'Jeringa 10 ml'), 3),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), (SELECT id_insumo FROM insumo WHERE nombre = 'Suero fisiologico'), 6),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), (SELECT id_insumo FROM insumo WHERE nombre = 'Gasas no esteriles'), 2);

INSERT INTO cirugia_instrumento (id_cirugia, id_instrumento) VALUES
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Bisturi No. 11')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Pinza hemostatica')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Porta-aguja Mayo')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Tijeras quirurgicas')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Pinza de Allis')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Separador de Farabeuf')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Pinza de diseccion')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Separador autoestatico')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Implante ortopedico')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Pinza de campo')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Bisturi No. 11')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Pinza hemostatica')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Porta-aguja Mayo')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Tijeras quirurgicas')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), (SELECT id_instrumento FROM instrumento WHERE nombre = 'Separador de Farabeuf'));

INSERT INTO cirugia_equipo (id_cirugia, id_equipo) VALUES
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), (SELECT id_equipo FROM equipo WHERE nombre = 'Monitor de signos vitales')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), (SELECT id_equipo FROM equipo WHERE nombre = 'Maquina de anestesia')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), (SELECT id_equipo FROM equipo WHERE nombre = 'Electrocardiografo')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), (SELECT id_equipo FROM equipo WHERE nombre = 'Lampara quirurgica')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), (SELECT id_equipo FROM equipo WHERE nombre = 'Maquina de anestesia')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), (SELECT id_equipo FROM equipo WHERE nombre = 'Bomba de infusion')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), (SELECT id_equipo FROM equipo WHERE nombre = 'Monitor de signos vitales')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), (SELECT id_equipo FROM equipo WHERE nombre = 'Mesa de cirugia')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), (SELECT id_equipo FROM equipo WHERE nombre = 'Electrocardiografo')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), (SELECT id_equipo FROM equipo WHERE nombre = 'Lampara quirurgica'));

INSERT INTO cirugia_participante (id_cirugia, rol, id_medico, id_personal_apoyo) VALUES
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), 'Cirujano', (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo'), NULL),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), 'Anestesiologo', (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez'), NULL),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Roberto Castillo')), 'Instrumentista', NULL, (SELECT id_personal FROM personal_apoyo WHERE nombre = 'Carlos Eduardo Lopez')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), 'Cirujano', (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez'), NULL),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), 'Anestesiologo', (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez'), NULL),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez')), 'Circulante', NULL, (SELECT id_personal FROM personal_apoyo WHERE nombre = 'Maria Elena Ramos')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), 'Cirujano', (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez'), NULL),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), 'Anestesiologo', (SELECT id_medico FROM medico WHERE nombre = 'Dr. Eduardo Salazar'), NULL),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez')), 'Instrumentista', NULL, (SELECT id_personal FROM personal_apoyo WHERE nombre = 'Sofia Isabel Castro')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), 'Cirujano', (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez'), NULL),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), 'Anestesiologo', (SELECT id_medico FROM medico WHERE nombre = 'Dra. Ana Maria Torres'), NULL),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez')), 'Circulante', NULL, (SELECT id_personal FROM personal_apoyo WHERE nombre = 'Diana Karina Solis')),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), 'Cirujano', (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna'), NULL),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), 'Anestesiologo', (SELECT id_medico FROM medico WHERE nombre = 'Dr. Pedro Alvarez'), NULL),
((SELECT id_cirugia FROM cirugia WHERE id_medico_cirujano = (SELECT id_medico FROM medico WHERE nombre = 'Dra. Gabriela Luna')), 'Instrumentista', NULL, (SELECT id_personal FROM personal_apoyo WHERE nombre = 'Juan Pablo Herrera'));
