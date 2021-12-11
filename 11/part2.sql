.mode csv input
create table octopus_input (str TEXT, id INTEGER primary key autoincrement);

CREATE TABLE octopus_coords (x INTEGER, y INTEGER, energy_level INTEGER, id INTEGER primary key autoincrement);

PRAGMA recursive_triggers = ON;

CREATE TRIGGER octopus_insert
AFTER INSERT ON octopus_input WHEN LENGTH(NEW.str) > 1
BEGIN
UPDATE octopus_input SET str = NEW.str WHERE id = NEW.id; -- trigger update
END;

CREATE TRIGGER octopus_update
AFTER UPDATE ON octopus_input WHEN LENGTH(NEW.str) > 0
BEGIN
INSERT INTO octopus_coords (x, y, energy_level) SELECT NEW.id, LENGTH(NEW.str) - 1, SUBSTR(NEW.str, LENGTH(NEW.str), 1);
UPDATE octopus_input SET str = SUBSTR(NEW.str, 1, LENGTH(NEW.str) - 1) WHERE id = NEW.id;
END;

.import input octopus_input

DROP TRIGGER octopus_update;
DROP TRIGGER octopus_insert;
DROP TABLE octopus_input;

CREATE TRIGGER new_energy
AFTER UPDATE ON octopus_coords WHEN NEW.energy_level = 10
BEGIN
UPDATE octopus_coords SET energy_level = energy_level + 1
WHERE
ABS(octopus_coords.x - NEW.x) <= 1
AND ABS(octopus_coords.y - NEW.y) <= 1
AND octopus_coords.id != NEW.id;
END;

CREATE TABLE iteration (counter INTEGER);

CREATE TRIGGER iterator
AFTER UPDATE ON iteration WHEN (SELECT SUM(energy_level) FROM octopus_coords) > 0
BEGIN
UPDATE octopus_coords SET energy_level = energy_level + 1;
UPDATE octopus_coords SET energy_level = 0 WHERE energy_level > 9;
UPDATE iteration SET counter = counter + 1;
END;

INSERT INTO iteration VALUES(0); UPDATE iteration SET counter = counter;
SELECT counter FROM iteration;
