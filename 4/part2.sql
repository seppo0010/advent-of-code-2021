create table numbers (
	value integer,
	id integer primary key autoincrement
);
create table rows (
	col0 integer,
	col1 integer,
	col2 integer,
	col3 integer,
	col4 integer,
	col5 integer,
	col6 integer,
	col7 integer,
	col8 integer,
	col9 integer,
	board integer,
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	completed_in_number integer
);
create table cols (
	row0 integer,
	row1 integer,
	row2 integer,
	row3 integer,
	row4 integer,
	board integer,
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	completed_in_number integer
);
.mode csv input
.separator "q" ","
.import input numbers
UPDATE numbers SET value = CAST(value AS INTEGER);

.separator " " "\n"
.import input rows --skip 2

delete from rows where id % 6 = 0;
update rows set board = id / 6;
UPDATE rows SET col0 = col1, col1 = col0 WHERE col0 = '';
UPDATE rows SET col1 = col2, col2 = col1 WHERE col1 = '';
UPDATE rows SET col2 = col3, col3 = col2 WHERE col2 = '';
UPDATE rows SET col3 = col4, col4 = col3 WHERE col3 = '';
UPDATE rows SET col4 = col5, col5 = col4 WHERE col4 = '';
UPDATE rows SET col5 = col6, col6 = col5 WHERE col5 = '';
UPDATE rows SET col6 = col7, col7 = col6 WHERE col6 = '';
UPDATE rows SET col7 = col8, col8 = col7 WHERE col7 = '';
UPDATE rows SET col8 = col9, col9 = col8 WHERE col8 = '';
UPDATE rows SET col0 = col1, col1 = col0 WHERE col0 = '';
UPDATE rows SET col1 = col2, col2 = col1 WHERE col1 = '';
UPDATE rows SET col2 = col3, col3 = col2 WHERE col2 = '';
UPDATE rows SET col3 = col4, col4 = col3 WHERE col3 = '';
UPDATE rows SET col4 = col5, col5 = col4 WHERE col4 = '';
UPDATE rows SET col5 = col6, col6 = col5 WHERE col5 = '';
UPDATE rows SET col6 = col7, col7 = col6 WHERE col6 = '';
UPDATE rows SET col7 = col8, col8 = col7 WHERE col7 = '';
UPDATE rows SET col8 = col9, col9 = col8 WHERE col8 = '';
UPDATE rows SET col0 = col1, col1 = col0 WHERE col0 = '';
UPDATE rows SET col1 = col2, col2 = col1 WHERE col1 = '';
UPDATE rows SET col2 = col3, col3 = col2 WHERE col2 = '';
UPDATE rows SET col3 = col4, col4 = col3 WHERE col3 = '';
UPDATE rows SET col4 = col5, col5 = col4 WHERE col4 = '';
UPDATE rows SET col5 = col6, col6 = col5 WHERE col5 = '';
UPDATE rows SET col6 = col7, col7 = col6 WHERE col6 = '';
UPDATE rows SET col7 = col8, col8 = col7 WHERE col7 = '';
UPDATE rows SET col8 = col9, col9 = col8 WHERE col8 = '';
UPDATE rows SET col0 = col1, col1 = col0 WHERE col0 = '';
UPDATE rows SET col1 = col2, col2 = col1 WHERE col1 = '';
UPDATE rows SET col2 = col3, col3 = col2 WHERE col2 = '';
UPDATE rows SET col3 = col4, col4 = col3 WHERE col3 = '';
UPDATE rows SET col4 = col5, col5 = col4 WHERE col4 = '';
UPDATE rows SET col5 = col6, col6 = col5 WHERE col5 = '';
UPDATE rows SET col6 = col7, col7 = col6 WHERE col6 = '';
UPDATE rows SET col7 = col8, col8 = col7 WHERE col7 = '';
UPDATE rows SET col8 = col9, col9 = col8 WHERE col8 = '';
UPDATE rows SET col0 = col1, col1 = col0 WHERE col0 = '';
UPDATE rows SET col1 = col2, col2 = col1 WHERE col1 = '';
UPDATE rows SET col2 = col3, col3 = col2 WHERE col2 = '';
UPDATE rows SET col3 = col4, col4 = col3 WHERE col3 = '';
UPDATE rows SET col4 = col5, col5 = col4 WHERE col4 = '';
UPDATE rows SET col5 = col6, col6 = col5 WHERE col5 = '';
UPDATE rows SET col6 = col7, col7 = col6 WHERE col6 = '';
UPDATE rows SET col7 = col8, col8 = col7 WHERE col7 = '';
UPDATE rows SET col8 = col9, col9 = col8 WHERE col8 = '';

INSERT INTO cols (row0, row1, row2, row3, row4, board)
SELECT DISTINCT t0.col0, t1.col0, t2.col0, t3.col0, t4.col0, t0.board
FROM rows t0
LEFT join rows t1 ON t0.board = t1.board AND t0.col0 != t1.col0
LEFT join rows t2 ON t0.board = t2.board AND t2.col0 NOT IN (t0.col0, t1.col0)
LEFT join rows t3 ON t0.board = t3.board AND t3.col0 NOT IN (t0.col0, t1.col0, t2.col0)
LEFT join rows t4 ON t0.board = t4.board AND t4.col0 NOT IN (t0.col0, t1.col0, t2.col0, t3.col0)
WHERE
	t0.id % 6 = 1 AND
	t1.id % 6 = 2 AND
	t2.id % 6 = 3 AND
	t3.id % 6 = 4 AND
	t4.id % 6 = 5
;
INSERT INTO cols (row0, row1, row2, row3, row4, board)
SELECT DISTINCT t0.col1, t1.col1, t2.col1, t3.col1, t4.col1, t0.board
FROM rows t0
LEFT join rows t1 ON t0.board = t1.board AND t0.col1 != t1.col1
LEFT join rows t2 ON t0.board = t2.board AND t2.col1 NOT IN (t0.col1, t1.col1)
LEFT join rows t3 ON t0.board = t3.board AND t3.col1 NOT IN (t0.col1, t1.col1, t2.col1)
LEFT join rows t4 ON t0.board = t4.board AND t4.col1 NOT IN (t0.col1, t1.col1, t2.col1, t3.col1)
WHERE
	t0.id % 6 = 1 AND
	t1.id % 6 = 2 AND
	t2.id % 6 = 3 AND
	t3.id % 6 = 4 AND
	t4.id % 6 = 5
;
INSERT INTO cols (row0, row1, row2, row3, row4, board)
SELECT DISTINCT t0.col2, t1.col2, t2.col2, t3.col2, t4.col2, t0.board
FROM rows t0
LEFT join rows t1 ON t0.board = t1.board AND t0.col2 != t1.col2
LEFT join rows t2 ON t0.board = t2.board AND t2.col2 NOT IN (t0.col2, t1.col2)
LEFT join rows t3 ON t0.board = t3.board AND t3.col2 NOT IN (t0.col2, t1.col2, t2.col2)
LEFT join rows t4 ON t0.board = t4.board AND t4.col2 NOT IN (t0.col2, t1.col2, t2.col2, t3.col2)
WHERE
	t0.id % 6 = 1 AND
	t1.id % 6 = 2 AND
	t2.id % 6 = 3 AND
	t3.id % 6 = 4 AND
	t4.id % 6 = 5
;
INSERT INTO cols (row0, row1, row2, row3, row4, board)
SELECT DISTINCT t0.col3, t1.col3, t2.col3, t3.col3, t4.col3, t0.board
FROM rows t0
LEFT join rows t1 ON t0.board = t1.board AND t0.col3 != t1.col3
LEFT join rows t2 ON t0.board = t2.board AND t2.col3 NOT IN (t0.col3, t1.col3)
LEFT join rows t3 ON t0.board = t3.board AND t3.col3 NOT IN (t0.col3, t1.col3, t2.col3)
LEFT join rows t4 ON t0.board = t4.board AND t4.col3 NOT IN (t0.col3, t1.col3, t2.col3, t3.col3)
WHERE
	t0.id % 6 = 1 AND
	t1.id % 6 = 2 AND
	t2.id % 6 = 3 AND
	t3.id % 6 = 4 AND
	t4.id % 6 = 5
;
INSERT INTO cols (row0, row1, row2, row3, row4, board)
SELECT DISTINCT t0.col4, t1.col4, t2.col4, t3.col4, t4.col4, t0.board
FROM rows t0
LEFT join rows t1 ON t0.board = t1.board AND t0.col4 != t1.col4
LEFT join rows t2 ON t0.board = t2.board AND t2.col4 NOT IN (t0.col4, t1.col4)
LEFT join rows t3 ON t0.board = t3.board AND t3.col4 NOT IN (t0.col4, t1.col4, t2.col4)
LEFT join rows t4 ON t0.board = t4.board AND t4.col4 NOT IN (t0.col4, t1.col4, t2.col4, t3.col4)
WHERE
	t0.id % 6 = 1 AND
	t1.id % 6 = 2 AND
	t2.id % 6 = 3 AND
	t3.id % 6 = 4 AND
	t4.id % 6 = 5
;


UPDATE rows SET completed_in_number = (
	SELECT MAX(numbers.id)
	FROM numbers
	WHERE numbers.value IN (col0,col1,col2,col3,col4)
);

UPDATE cols SET completed_in_number = (
	SELECT MAX(numbers.id)
	FROM numbers
	WHERE numbers.value IN (row0,row1,row2,row3,row4)
);

SELECT numbers.value * SUM(remaining.value) FROM 
(
	SELECT numbers.id, numbers.value FROM numbers 
) numbers
JOIN (
	SELECT numbers.id, numbers.value, cols.board FROM numbers
		INNER JOIN cols ON numbers.value IN (row0,row1,row2,row3,row4)
) remaining
JOIN (
	SELECT board, MAX(completed_in_number) completed_in_number FROM (
		SELECT board, MIN(completed_in_number) completed_in_number FROM (
			SELECT board, MIN(completed_in_number) completed_in_number FROM rows GROUP BY board
			UNION
			SELECT board, MIN(completed_in_number) completed_in_number FROM cols GROUP BY board
		) t GROUP BY board
	)
) res
WHERE numbers.id = res.completed_in_number
AND remaining.id > res.completed_in_number
AND remaining.board = res.board
;
