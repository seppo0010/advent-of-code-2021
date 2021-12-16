.mode csv input
CREATE TABLE grid (value varchar(100), x integer, y integer, id integer primary key autoincrement);
.import input grid
update grid set y = id-1;

update grid set x = 0;

PRAGMA recursive_triggers = ON;
create trigger parse_grid
AFTER UPDATE ON grid WHEN LENGTH(NEW.value) > 1
BEGIN
INSERT INTO grid SELECT SUBSTR(NEW.value, LENGTH(NEW.value), 1), LENGTH(NEW.value) - 1, NEW.y, NULL;
UPDATE grid SET value = SUBSTR(NEW.value, 1, LENGTH(NEW.value) - 1) WHERE id = NEW.id;
END;
update grid set y = y;
DROP TRIGGER parse_grid;

CREATE TABLE positions (x integer, y integer, value INTEGER
	, PRIMARY KEY(x, y)
);

CREATE TABLE log(x integer, y integer, value integer);


-- CREATE TRIGGER next_position
-- AFTER INSERT ON positions WHEN NEW.x || ',' || NEW.y != (SELECT MAX(x) || ',' || MAX(y) FROM grid)
-- BEGIN
-- INSERT INTO log VALUES (NEW.x, NEW.y, NEW.value);
-- INSERT INTO positions SELECT NEW.x+1, NEW.y, NEW.value + grid.value FROM grid WHERE x = NEW.x + 1 AND y = NEW.y
-- ON CONFLICT (x, y) DO UPDATE SET value = CASE WHEN excluded.value < positions.value THEN excluded.value ELSE positions.value END;
-- INSERT INTO positions SELECT NEW.x, NEW.y+1, NEW.value + grid.value FROM grid WHERE x = NEW.x AND y = NEW.y + 1
-- ON CONFLICT (x, y) DO UPDATE SET value = CASE WHEN excluded.value < positions.value THEN excluded.value ELSE positions.value END;
-- END;

CREATE TABLE iteration ( whole INTEGER, previous INTEGER );
INSERT INTO iteration VALUES(0, -1);

CREATE TRIGGER search_value
AFTER UPDATE ON iteration WHEN NEW.previous != NEW.whole
BEGIN
UPDATE positions SET value = (
    SELECT MIN(value) FROM (
        SELECT positions.value
        UNION 
        SELECT (
            SELECT grid.value FROM grid WHERE grid.x = positions.x AND grid.y = positions.y
        ) + (
            SELECT MIN(p.value) FROM positions p WHERE
                (p.x + 1 = positions.x AND p.y = positions.y) OR
                (p.x - 1 = positions.x AND p.y = positions.y) OR
                (p.x = positions.x AND p.y + 1 = positions.y) OR
                (p.x = positions.x AND p.y - 1 = positions.y)
        )
    )
);
UPDATE iteration set previous = whole, whole = (SELECT SUM(value) FROM positions);
END;

INSERT INTO positions SELECT x, y, 1234567890 FROM grid;
UPDATE positions SET value = 0 WHERE x = 0 AND y = 0;
UPDATE iteration SET whole = 0, previous = -1;

DROP TABLE grid;
DROP TRIGGER search_value;
SELECT value FROM positions WHERE x = (SELECT MAX(x) FROM positions) AND y = (SELECT MAX(y) FROM positions);
.dump
