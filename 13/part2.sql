.mode csv input
create table grid (x int, y int, id integer primary key autoincrement);
.import input grid
DELETE FROM grid WHERE y IS NULL;

create table folds (axis text, rowcol int(1), id integer primary key autoincrement);
.separator "="
.import input folds
.separator ","
DELETE FROM folds WHERE rowcol IS NULL;
UPDATE folds SET axis = REPLACE(axis, 'fold along ', '');

CREATE TRIGGER folding_x
AFTER UPDATE ON folds WHEN NEW.axis = 'x'
BEGIN
DELETE FROM grid WHERE x = NEW.rowcol;
UPDATE grid SET x = (SELECT(MAX(x)) FROM grid) - x WHERE x > NEW.rowcol;
END;

CREATE TRIGGER folding_y
AFTER UPDATE ON folds WHEN NEW.axis = 'y'
BEGIN
DELETE FROM grid WHERE y = NEW.rowcol;
UPDATE grid SET y = (SELECT(MAX(y)) FROM grid) - y WHERE y > NEW.rowcol;
END;

UPDATE folds SET axis = axis, rowcol = rowcol;

CREATE TABLE output (t TEXT, maxx integer, maxy integer, pos integer);

PRAGMA recursive_triggers = ON;
CREATE TRIGGER draw_output
AFTER UPDATE ON output WHEN NEW.pos < (1+NEW.maxx) * (1+NEW.maxy)
BEGIN
UPDATE output SET t = t || COALESCE(
	(
		SELECT '#' FROM grid WHERE x = NEW.pos % NEW.maxx AND
		y = NEW.pos / NEW.maxx
	), ' '
) || (CASE NEW.pos % NEW.maxx WHEN NEW.maxx-1 THEN '
' ELSE '' END),
pos = NEW.pos + 1;
END;

insert into output SELECT '', MAX(x), MAX(y), 0 FROM grid;
update output set t = '
';

SELECT t FROM output;
-- .dump
