CREATE TABLE input (position integer);
.mode csv input
.separator " " ","
.import input input

CREATE TABLE vals (target INT, fuel INT);
WITH RECURSIVE
  cnt(x) AS (
     SELECT 0
     UNION ALL
     SELECT x+1 FROM cnt
      LIMIT 10000 -- max grid size :see_no_evil:
  )
INSERT INTO vals (target) SELECT x FROM cnt;

DELETE FROM vals WHERE target > (SELECT MAX(position) FROM input);
DELETE FROM vals WHERE target < (SELECT MIN(position) FROM input);

UPDATE vals SET fuel = (
	SELECT SUM(ABS(target - input.position) * (ABS(target - input.position) + 1)) / 2
		FROM 
		input
);

SELECT MIN(fuel) FROM vals;

-- .dump
