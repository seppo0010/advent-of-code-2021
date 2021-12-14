.mode csv input
create table polymer (str text, pos integer default 0, id integer primary key autoincrement);
.import input polymer
DELETE FROM polymer WHERE id > 1;

.separator " "
CREATE TABLE rules (input char(2), garbage char(4), output char(1));
.import input rules
DELETE FROM rules WHERE garbage != '->' OR garbage is NULL;

-- CREATE TABLE log (str text, pos integer);

PRAGMA recursive_triggers = ON;
CREATE TRIGGER polymer_execution
AFTER UPDATE ON polymer WHEN NEW.pos < LENGTH(NEW.str)-1
BEGIN
UPDATE polymer SET
    str = SUBSTR(NEW.str, 1, NEW.pos+1) || COALESCE((SELECT output FROM rules WHERE input = SUBSTR(NEW.str, NEW.pos+1, 2)), '') || SUBSTR(NEW.str, NEW.pos+2, LENGTH(NEW.str)+1),
    pos = NEW.pos + 2;
-- INSERT INTO log SELECT NEW.str, NEW.pos FROM polymer;
END;

UPDATE polymer SET pos = 0;
UPDATE polymer SET pos = 0;
UPDATE polymer SET pos = 0;
UPDATE polymer SET pos = 0;
UPDATE polymer SET pos = 0;
UPDATE polymer SET pos = 0;
UPDATE polymer SET pos = 0;
UPDATE polymer SET pos = 0;
UPDATE polymer SET pos = 0;
UPDATE polymer SET pos = 0;

DROP TRIGGER polymer_execution;
CREATE TABLE occurences (letter char(1));
CREATE TRIGGER polymer_occurences
AFTER UPDATE ON polymer WHEN LENGTH(NEW.str) > 0
BEGIN
INSERT INTO occurences SELECT SUBSTR(NEW.str, 1, 1);
UPDATE polymer SET
    str = SUBSTR(NEW.str, 2, LENGTH(NEW.str)),
    pos = NEW.pos + 2;
-- INSERT INTO log SELECT NEW.str, NEW.pos FROM polymer;
END;

UPDATE polymer SET pos = 0;

SELECT MAX(c) - MIN(c) FROM
    (SELECT COUNT(*) c, letter FROM occurences GROUP BY letter) t
;
-- .dump
