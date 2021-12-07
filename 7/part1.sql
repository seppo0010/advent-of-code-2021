CREATE TABLE input (position integer);
.mode csv input
.separator " " ","
.import input input

SELECT SUM(ABS(position - median))
FROM input
JOIN (
	SELECT position as median
	FROM input
	ORDER BY position
	LIMIT 1
	OFFSET (SELECT COUNT(*)
		FROM input) / 2
) t;
-- .dump
