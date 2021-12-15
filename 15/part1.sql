.mode csv input
CREATE TABLE grid (value integer, x integer, y integer, id integer primary key autoincrement);
.import miniinput grid
update grid set y = id-1;

update grid set x = (SELECT MAX(id) + 1 FROM grid);
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


CREATE TRIGGER next_position
AFTER INSERT ON positions WHEN NEW.x || ',' || NEW.y != (SELECT MAX(x) || ',' || MAX(y) FROM grid)
BEGIN
INSERT INTO positions SELECT NEW.x+1, NEW.y, NEW.value + grid.value FROM grid WHERE x = NEW.x + 1 AND y = NEW.y
ON CONFLICT (x, y) DO UPDATE SET value = CASE WHEN excluded.value < positions.value THEN excluded.value ELSE positions.value END;
INSERT INTO positions SELECT NEW.x, NEW.y+1, NEW.value + grid.value FROM grid WHERE x = NEW.x AND y = NEW.y + 1
ON CONFLICT (x, y) DO UPDATE SET value = CASE WHEN excluded.value < positions.value THEN excluded.value ELSE positions.value END;
END;

INSERT INTO positions SELECT 0, 0, value FROM grid WHERE x = 0 AND y = 0;

DROP TABLE grid;
DROP TRIGGER next_position;
.dump
