.mode csv input
create table x1y2 (x1 int, garbage text, y2 int, id integer primary key autoincrement);
.separator ","
.import input x1y2
UPDATE x1y2 SET garbage=null;

create table y1x2 (y1 int, garbage text, x2 text, idtimes2 integer primary key autoincrement);
.separator " " "," 
.import input y1x2

create table lines (x1 int, x2 int, y1 int, y2 int, id integer primary key autoincrement);
INSERT INTO lines SELECT x1, null, null, y2, id FROM x1y2;
UPDATE lines SET y1 = (SELECT y1 FROM y1x2 WHERE y1x2.idtimes2 = lines.id * 2);
UPDATE lines SET x2 = (SELECT x2 FROM y1x2 WHERE y1x2.idtimes2 = lines.id * 2);

drop table x1y2;
drop table y1x2;

CREATE TABLE vals (num INT);
WITH RECURSIVE
  cnt(x) AS (
     SELECT 0
     UNION ALL
     SELECT x+1 FROM cnt
      LIMIT 10000000 -- max grid size :see_no_evil:
  )
INSERT INTO vals SELECT x FROM cnt;

CREATE TABLE grid (x int, y int, c int default 0, id int primary key);
INSERT INTO grid (id) 
	SELECT num FROM vals WHERE num < (SELECT (1+MAX(MAX(x1), MAX(x2))) * (1+MAX(MAX(y1), MAX(y2))) FROM lines);
DROP TABLE vals;
UPDATE grid
	SET
		x = id / (SELECT 1+MAX(MAX(x1), MAX(x2)) FROM lines),
		y = id % (SELECT 1+MAX(MAX(x1), MAX(x2)) FROM lines)
;

UPDATE grid SET c = (
	SELECT COUNT(*) FROM lines WHERE (
		(x = x1 AND x1 = x2 AND (y BETWEEN y1 AND y2 OR y BETWEEN y2 AND y1)) OR
		(y = y1 AND y1 = y2 AND (x BETWEEN x1 AND x2 OR x BETWEEN x2 AND x1))
	)
);
SELECT COUNT(*) FROM grid WHERE c >= 2;
