CREATE TABLE "estudiantes" (
	"identificacion"	INTEGER,
	"nombre"	TEXT,
	"apellido"	TEXT,
	PRIMARY KEY("identificacion")
);

INSERT INTO "estudiantes" VALUES (123456789, "Juan", "Angarita");
INSERT INTO "estudiantes" VALUES (234567890, "Yoel", "López");
INSERT INTO "estudiantes" VALUES (345678901, "Juana", "Abril");
INSERT INTO "estudiantes" VALUES (456789012, "Sofia", "Rios");
INSERT INTO "estudiantes" VALUES (567890123, "Mateo", "Tierradentro");
INSERT INTO "estudiantes" VALUES (678901234, "Luna", "Vega");
INSERT INTO "estudiantes" VALUES (789012345, "Julian", "Cabrera");

CREATE TABLE "materias" (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"nombre"	TEXT,
	"creditos"	INTEGER
)

INSERT INTO "materias" ("nombre", "creditos") VALUES ("Programación orientada a objetos", 3);
INSERT INTO "materias" ("nombre", "creditos") VALUES ("Introducción a la programación y a las ciencias de la computación", 3);
INSERT INTO "materias" ("nombre", "creditos") VALUES ("Fundamentos de matemáticas", 4);
INSERT INTO "materias" ("nombre", "creditos") VALUES ("Cálculo diferencial", 4);
INSERT INTO "materias" ("nombre", "creditos") VALUES ("Sistemas numéricos", 4);
INSERT INTO "materias" ("nombre", "creditos") VALUES ("Estructuras de datos", 3);
INSERT INTO "materias" ("nombre", "creditos") VALUES ("Álgebra Lineal", 3);


CREATE TABLE "notas_finales" (
	"id_estudiante"	INTEGER,
	"id_materia"	INTEGER,
	"nota"	INTEGER,
	FOREIGN KEY("id_estudiante") REFERENCES "estudiantes"("identificacion"),
	FOREIGN KEY("id_materia") REFERENCES "materias"("id")
)

INSERT INTO "notas_finales" VALUES (123456789, 1, 4.5);
INSERT INTO "notas_finales" VALUES (123456789, 2, 4.3);
INSERT INTO "notas_finales" VALUES (123456789, 3, 3.5);
INSERT INTO "notas_finales" VALUES (123456789, 4, 2.5);
INSERT INTO "notas_finales" VALUES (123456789, 5, 3.0);
INSERT INTO "notas_finales" VALUES (123456789, 6, 3.3);
INSERT INTO "notas_finales" VALUES (123456789, 7, 1);
INSERT INTO "notas_finales" VALUES (234567890, 1, 2);
INSERT INTO "notas_finales" VALUES (234567890, 2, 5);
INSERT INTO "notas_finales" VALUES (234567890, 3, 2);
INSERT INTO "notas_finales" VALUES (234567890, 4, 4);
INSERT INTO "notas_finales" VALUES (234567890, 5, 2);
INSERT INTO "notas_finales" VALUES (234567890, 6, 3.7);
INSERT INTO "notas_finales" VALUES (234567890, 7, 3.3);
INSERT INTO "notas_finales" VALUES (345678901, 1, 3.3);
INSERT INTO "notas_finales" VALUES (345678901, 2, 4.4);
INSERT INTO "notas_finales" VALUES (345678901, 3, 2.8);
INSERT INTO "notas_finales" VALUES (345678901, 4, 2.4);
INSERT INTO "notas_finales" VALUES (345678901, 5, 5);
INSERT INTO "notas_finales" VALUES (345678901, 6, 3.5);
INSERT INTO "notas_finales" VALUES (345678901, 7, 3.4);
INSERT INTO "notas_finales" VALUES (456789012, 1, 2.3);
INSERT INTO "notas_finales" VALUES (456789012, 2, 2.8);
INSERT INTO "notas_finales" VALUES (456789012, 3, 4.4);
INSERT INTO "notas_finales" VALUES (456789012, 4, 4.5);
INSERT INTO "notas_finales" VALUES (456789012, 5, 4.3);
INSERT INTO "notas_finales" VALUES (456789012, 6, 2.3);
INSERT INTO "notas_finales" VALUES (456789012, 7, 4.3);
INSERT INTO "notas_finales" VALUES (567890123, 1, 2.2);
INSERT INTO "notas_finales" VALUES (567890123, 2, 1);
INSERT INTO "notas_finales" VALUES (567890123, 3, 0);
INSERT INTO "notas_finales" VALUES (567890123, 4, 5);
INSERT INTO "notas_finales" VALUES (567890123, 5, 3.5);
INSERT INTO "notas_finales" VALUES (567890123, 6, 5);
INSERT INTO "notas_finales" VALUES (567890123, 7, 4.2);
INSERT INTO "notas_finales" VALUES (678901234, 1, 3.3);
INSERT INTO "notas_finales" VALUES (678901234, 2, 2.3);
INSERT INTO "notas_finales" VALUES (678901234, 3, 3.2);
INSERT INTO "notas_finales" VALUES (678901234, 4, 3.7);
INSERT INTO "notas_finales" VALUES (678901234, 5, 4.3);
INSERT INTO "notas_finales" VALUES (678901234, 6, 3.3);
INSERT INTO "notas_finales" VALUES (678901234, 7, 1.5);
INSERT INTO "notas_finales" VALUES (789012345, 1, 5);
INSERT INTO "notas_finales" VALUES (789012345, 2, 3.2);
INSERT INTO "notas_finales" VALUES (789012345, 3, 4.3);
INSERT INTO "notas_finales" VALUES (789012345, 4, 2.2);
INSERT INTO "notas_finales" VALUES (789012345, 5, 3.2);
INSERT INTO "notas_finales" VALUES (789012345, 6, 4);
INSERT INTO "notas_finales" VALUES (789012345, 7, 3);

SELECT 
	identificacion as "Identificación",
	estudiantes.nombre as "Nombre",
	COUNT(identificacion) as "Cantidad de materias tomadas",
	SUM(materias.creditos) as "Cantidad de créditos acumulados",
	ROUND(SUM(notas_finales.nota * materias.creditos) / SUM(materias.creditos),2) as "Promedio"
	FROM notas_finales
	JOIN estudiantes 
		ON notas_finales.id_estudiante = estudiantes.identificacion
	JOIN materias
		ON notas_finales.id_materia = materias.id
	GROUP BY id_estudiante
	ORDER BY "Promedio" DESC