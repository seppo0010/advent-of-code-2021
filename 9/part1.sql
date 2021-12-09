CREATE TABLE input (data TEXT, row INTEGER PRIMARY KEY AUTOINCREMENT);
.mode csv input
.import input input

CREATE TABLE position (row INTEGER, col INTEGER, value INTEGER);
INSERT INTO position SELECT row, 1, SUBSTR(data, 1, 1) FROM input;
INSERT INTO position SELECT row, 2, SUBSTR(data, 2, 1) FROM input;
INSERT INTO position SELECT row, 3, SUBSTR(data, 3, 1) FROM input;
INSERT INTO position SELECT row, 4, SUBSTR(data, 4, 1) FROM input;
INSERT INTO position SELECT row, 5, SUBSTR(data, 5, 1) FROM input;
INSERT INTO position SELECT row, 6, SUBSTR(data, 6, 1) FROM input;
INSERT INTO position SELECT row, 7, SUBSTR(data, 7, 1) FROM input;
INSERT INTO position SELECT row, 8, SUBSTR(data, 8, 1) FROM input;
INSERT INTO position SELECT row, 9, SUBSTR(data, 9, 1) FROM input;
INSERT INTO position SELECT row, 10, SUBSTR(data, 10, 1) FROM input;
INSERT INTO position SELECT row, 11, SUBSTR(data, 11, 1) FROM input;
INSERT INTO position SELECT row, 12, SUBSTR(data, 12, 1) FROM input;
INSERT INTO position SELECT row, 13, SUBSTR(data, 13, 1) FROM input;
INSERT INTO position SELECT row, 14, SUBSTR(data, 14, 1) FROM input;
INSERT INTO position SELECT row, 15, SUBSTR(data, 15, 1) FROM input;
INSERT INTO position SELECT row, 16, SUBSTR(data, 16, 1) FROM input;
INSERT INTO position SELECT row, 17, SUBSTR(data, 17, 1) FROM input;
INSERT INTO position SELECT row, 18, SUBSTR(data, 18, 1) FROM input;
INSERT INTO position SELECT row, 19, SUBSTR(data, 19, 1) FROM input;
INSERT INTO position SELECT row, 20, SUBSTR(data, 20, 1) FROM input;
INSERT INTO position SELECT row, 21, SUBSTR(data, 21, 1) FROM input;
INSERT INTO position SELECT row, 22, SUBSTR(data, 22, 1) FROM input;
INSERT INTO position SELECT row, 23, SUBSTR(data, 23, 1) FROM input;
INSERT INTO position SELECT row, 24, SUBSTR(data, 24, 1) FROM input;
INSERT INTO position SELECT row, 25, SUBSTR(data, 25, 1) FROM input;
INSERT INTO position SELECT row, 26, SUBSTR(data, 26, 1) FROM input;
INSERT INTO position SELECT row, 27, SUBSTR(data, 27, 1) FROM input;
INSERT INTO position SELECT row, 28, SUBSTR(data, 28, 1) FROM input;
INSERT INTO position SELECT row, 29, SUBSTR(data, 29, 1) FROM input;
INSERT INTO position SELECT row, 30, SUBSTR(data, 30, 1) FROM input;
INSERT INTO position SELECT row, 31, SUBSTR(data, 31, 1) FROM input;
INSERT INTO position SELECT row, 32, SUBSTR(data, 32, 1) FROM input;
INSERT INTO position SELECT row, 33, SUBSTR(data, 33, 1) FROM input;
INSERT INTO position SELECT row, 34, SUBSTR(data, 34, 1) FROM input;
INSERT INTO position SELECT row, 35, SUBSTR(data, 35, 1) FROM input;
INSERT INTO position SELECT row, 36, SUBSTR(data, 36, 1) FROM input;
INSERT INTO position SELECT row, 37, SUBSTR(data, 37, 1) FROM input;
INSERT INTO position SELECT row, 38, SUBSTR(data, 38, 1) FROM input;
INSERT INTO position SELECT row, 39, SUBSTR(data, 39, 1) FROM input;
INSERT INTO position SELECT row, 40, SUBSTR(data, 40, 1) FROM input;
INSERT INTO position SELECT row, 41, SUBSTR(data, 41, 1) FROM input;
INSERT INTO position SELECT row, 42, SUBSTR(data, 42, 1) FROM input;
INSERT INTO position SELECT row, 43, SUBSTR(data, 43, 1) FROM input;
INSERT INTO position SELECT row, 44, SUBSTR(data, 44, 1) FROM input;
INSERT INTO position SELECT row, 45, SUBSTR(data, 45, 1) FROM input;
INSERT INTO position SELECT row, 46, SUBSTR(data, 46, 1) FROM input;
INSERT INTO position SELECT row, 47, SUBSTR(data, 47, 1) FROM input;
INSERT INTO position SELECT row, 48, SUBSTR(data, 48, 1) FROM input;
INSERT INTO position SELECT row, 49, SUBSTR(data, 49, 1) FROM input;
INSERT INTO position SELECT row, 50, SUBSTR(data, 50, 1) FROM input;
INSERT INTO position SELECT row, 51, SUBSTR(data, 51, 1) FROM input;
INSERT INTO position SELECT row, 52, SUBSTR(data, 52, 1) FROM input;
INSERT INTO position SELECT row, 53, SUBSTR(data, 53, 1) FROM input;
INSERT INTO position SELECT row, 54, SUBSTR(data, 54, 1) FROM input;
INSERT INTO position SELECT row, 55, SUBSTR(data, 55, 1) FROM input;
INSERT INTO position SELECT row, 56, SUBSTR(data, 56, 1) FROM input;
INSERT INTO position SELECT row, 57, SUBSTR(data, 57, 1) FROM input;
INSERT INTO position SELECT row, 58, SUBSTR(data, 58, 1) FROM input;
INSERT INTO position SELECT row, 59, SUBSTR(data, 59, 1) FROM input;
INSERT INTO position SELECT row, 60, SUBSTR(data, 60, 1) FROM input;
INSERT INTO position SELECT row, 61, SUBSTR(data, 61, 1) FROM input;
INSERT INTO position SELECT row, 62, SUBSTR(data, 62, 1) FROM input;
INSERT INTO position SELECT row, 63, SUBSTR(data, 63, 1) FROM input;
INSERT INTO position SELECT row, 64, SUBSTR(data, 64, 1) FROM input;
INSERT INTO position SELECT row, 65, SUBSTR(data, 65, 1) FROM input;
INSERT INTO position SELECT row, 66, SUBSTR(data, 66, 1) FROM input;
INSERT INTO position SELECT row, 67, SUBSTR(data, 67, 1) FROM input;
INSERT INTO position SELECT row, 68, SUBSTR(data, 68, 1) FROM input;
INSERT INTO position SELECT row, 69, SUBSTR(data, 69, 1) FROM input;
INSERT INTO position SELECT row, 70, SUBSTR(data, 70, 1) FROM input;
INSERT INTO position SELECT row, 71, SUBSTR(data, 71, 1) FROM input;
INSERT INTO position SELECT row, 72, SUBSTR(data, 72, 1) FROM input;
INSERT INTO position SELECT row, 73, SUBSTR(data, 73, 1) FROM input;
INSERT INTO position SELECT row, 74, SUBSTR(data, 74, 1) FROM input;
INSERT INTO position SELECT row, 75, SUBSTR(data, 75, 1) FROM input;
INSERT INTO position SELECT row, 76, SUBSTR(data, 76, 1) FROM input;
INSERT INTO position SELECT row, 77, SUBSTR(data, 77, 1) FROM input;
INSERT INTO position SELECT row, 78, SUBSTR(data, 78, 1) FROM input;
INSERT INTO position SELECT row, 79, SUBSTR(data, 79, 1) FROM input;
INSERT INTO position SELECT row, 80, SUBSTR(data, 80, 1) FROM input;
INSERT INTO position SELECT row, 81, SUBSTR(data, 81, 1) FROM input;
INSERT INTO position SELECT row, 82, SUBSTR(data, 82, 1) FROM input;
INSERT INTO position SELECT row, 83, SUBSTR(data, 83, 1) FROM input;
INSERT INTO position SELECT row, 84, SUBSTR(data, 84, 1) FROM input;
INSERT INTO position SELECT row, 85, SUBSTR(data, 85, 1) FROM input;
INSERT INTO position SELECT row, 86, SUBSTR(data, 86, 1) FROM input;
INSERT INTO position SELECT row, 87, SUBSTR(data, 87, 1) FROM input;
INSERT INTO position SELECT row, 88, SUBSTR(data, 88, 1) FROM input;
INSERT INTO position SELECT row, 89, SUBSTR(data, 89, 1) FROM input;
INSERT INTO position SELECT row, 90, SUBSTR(data, 90, 1) FROM input;
INSERT INTO position SELECT row, 91, SUBSTR(data, 91, 1) FROM input;
INSERT INTO position SELECT row, 92, SUBSTR(data, 92, 1) FROM input;
INSERT INTO position SELECT row, 93, SUBSTR(data, 93, 1) FROM input;
INSERT INTO position SELECT row, 94, SUBSTR(data, 94, 1) FROM input;
INSERT INTO position SELECT row, 95, SUBSTR(data, 95, 1) FROM input;
INSERT INTO position SELECT row, 96, SUBSTR(data, 96, 1) FROM input;
INSERT INTO position SELECT row, 97, SUBSTR(data, 97, 1) FROM input;
INSERT INTO position SELECT row, 98, SUBSTR(data, 98, 1) FROM input;
INSERT INTO position SELECT row, 99, SUBSTR(data, 99, 1) FROM input;
INSERT INTO position SELECT row, 100, SUBSTR(data, 100, 1) FROM input;
DROP TABLE input;

SELECT SUM(value+1) FROM position WHERE (
	(position.col = 100 OR value < (SELECT value FROM position p WHERE position.col + 1 = p.col AND position.row = p.row))
	AND
	(position.col = 1 OR value < (SELECT value FROM position p WHERE position.col - 1 = p.col AND position.row = p.row))
	AND
	(position.row = 100 OR value < (SELECT value FROM position p WHERE position.row + 1 = p.row AND position.col = p.col))
	AND
	(position.row = 1 OR value < (SELECT value FROM position p WHERE position.row - 1 = p.row AND position.col = p.col))
);

-- .dump
