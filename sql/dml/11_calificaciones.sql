-- 11_calificaciones.sql
-- DML de calificaciones

INSERT INTO calificacion (id_hospital, id_medico, id_personal_apoyo, id_encargado, puntuacion, comentario, fecha) VALUES
((SELECT id_hospital FROM hospital WHERE nombre = 'Hospital Regional de Quetzaltenango'), NULL, NULL, NULL, 5, 'Excelente atencion y equipamiento', '2026-01-15'),
((SELECT id_hospital FROM hospital WHERE nombre = 'Hospital General San Marcos'), NULL, NULL, NULL, 4, 'Buena atencion con areas de mejora', '2026-02-10'),
((SELECT id_hospital FROM hospital WHERE nombre = 'Hospital de Huehuetenango Occidental'), NULL, NULL, NULL, 5, 'Servicio muy eficiente y moderno', '2026-03-05'),
((SELECT id_hospital FROM hospital WHERE nombre = 'Hospital Regional de Quetzaltenango'), NULL, NULL, NULL, 3, 'Atencion aceptable, tiempos de espera largos', '2026-04-01'),
(NULL, (SELECT id_medico FROM medico WHERE nombre = 'Dr. Alejandro Morales'), NULL, NULL, 5, 'Medico muy profesional y atento', '2026-01-20'),
(NULL, (SELECT id_medico FROM medico WHERE nombre = 'Dra. Elena Vargas'), NULL, NULL, 4, 'Buena comunicacion con pacientes', '2026-02-05'),
(NULL, (SELECT id_medico FROM medico WHERE nombre = 'Dr. Carlos Mendez'), NULL, NULL, 2, 'Necesita mejorar tiempos de atencion', '2026-02-20'),
(NULL, (SELECT id_medico FROM medico WHERE nombre = 'Dra. Lucia Herrera'), NULL, NULL, 5, 'Excelente trato y diagnostico', '2026-03-01'),
(NULL, (SELECT id_medico FROM medico WHERE nombre = 'Dr. Julio Ramirez'), NULL, NULL, 3, 'Atencion regular', '2026-03-10'),
(NULL, (SELECT id_medico FROM medico WHERE nombre = 'Dr. Mario Gutierrez'), NULL, NULL, 4, 'Buena experiencia quirurgica', '2026-03-25'),
(NULL, NULL, (SELECT id_personal FROM personal_apoyo WHERE nombre = 'Carlos Eduardo Lopez'), NULL, 5, 'Personal muy competente', '2026-01-18'),
(NULL, NULL, (SELECT id_personal FROM personal_apoyo WHERE nombre = 'Maria Elena Ramos'), NULL, 4, 'Atencion amable y eficiente', '2026-02-15'),
(NULL, NULL, (SELECT id_personal FROM personal_apoyo WHERE nombre = 'Juan Pablo Herrera'), NULL, 1, 'Falta de puntualidad y atencion', '2026-03-12'),
(NULL, NULL, NULL, (SELECT id_encargado FROM encargado WHERE nombre = 'Jose Luis Rivera'), 5, 'Encargado muy responsable', '2026-01-25'),
(NULL, NULL, NULL, (SELECT id_encargado FROM encargado WHERE nombre = 'Maria Isabel Flores'), 4, 'Buena atencion al paciente', '2026-02-28'),
(NULL, NULL, NULL, (SELECT id_encargado FROM encargado WHERE nombre = 'Carlos Alberto Castellanos'), 3, 'Atencion aceptable', '2026-03-15');
