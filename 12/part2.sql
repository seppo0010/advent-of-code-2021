.mode csv input
create table cave_conn (from_cave VARCHAR(5), to_cave VARCHAR(5));
.separator "-"
.import input cave_conn
.separator ","

INSERT INTO cave_conn SELECT to_cave, from_cave FROM cave_conn;
DELETE FROM cave_conn WHERE to_cave = 'start';
DELETE FROM cave_conn WHERE from_cave = 'end';


CREATE TABLE path_cave (cave VARCHAR(5), full_path TEXT, has_twice integer);
PRAGMA recursive_triggers = ON;

CREATE TRIGGER cave_conn_insert
AFTER INSERT ON path_cave
WHEN instr(NEW.full_path, '-end') = 0
BEGIN
INSERT INTO path_cave
SELECT to_cave, NEW.full_path || '-' || to_cave, NEW.has_twice OR (NEW.cave = LOWER(NEW.cave) AND INSTR(NEW.full_path, '-' || NEW.cave || '-') > 0)
FROM cave_conn 
WHERE
from_cave = NEW.cave AND
(NEW.cave = UPPER(NEW.cave) OR NEW.has_twice = 0 OR INSTR(NEW.full_path, '-' || NEW.cave || '-') = 0)
;
END;

INSERT INTO path_cave VALUES ('start', '-start', 0);

SELECT full_path FROM path_cave WHERE INSTR(full_path, '-end') = LENGTH(full_path) - 3;
-- .dump
