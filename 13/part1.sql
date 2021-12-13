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
DELETE FROM folds WHERE id > (SELECT MIN(id) FROM folds);

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

SELECT COUNT(*) FROM (SELECT DISTINCT x, y FROM grid);

-- .dump
