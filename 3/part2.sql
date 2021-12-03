create table input (
	data char(12),
	col1 int, col2 int, col3 int, col4 int, 
	col5 int, col6 int, col7 int, col8 int,
	col9 int, col10 int, col11 int, col12 int,
	o2 int, co2 int
);
.mode csv input
.import input input

update input set col1 = substr(data, 1, 1);
update input set col2 = substr(data, 2, 1);
update input set col3 = substr(data, 3, 1);
update input set col4 = substr(data, 4, 1);
update input set col5 = substr(data, 5, 1);
update input set col6 = substr(data, 6, 1);
update input set col7 = substr(data, 7, 1);
update input set col8 = substr(data, 8, 1);
update input set col9 = substr(data, 9, 1);
update input set col10 = substr(data, 10, 1);
update input set col11 = substr(data, 11, 1);
update input set col12 = substr(data, 12, 1);

UPDATE input SET o2 = 1;
UPDATE input SET o2 = 0 WHERE col1 != (SELECT SUM(col1) >= COUNT(col1) - SUM(col1) FROM input);
UPDATE input SET o2 = 0 WHERE col2 != (SELECT SUM(col2) >= COUNT(col2) - SUM(col2) FROM input WHERE o2 = 1);
UPDATE input SET o2 = 0 WHERE col3 != (SELECT SUM(col3) >= COUNT(col3) - SUM(col3) FROM input WHERE o2 = 1);
UPDATE input SET o2 = 0 WHERE col4 != (SELECT SUM(col4) >= COUNT(col4) - SUM(col4) FROM input WHERE o2 = 1);
UPDATE input SET o2 = 0 WHERE col5 != (SELECT SUM(col5) >= COUNT(col5) - SUM(col5) FROM input WHERE o2 = 1);
UPDATE input SET o2 = 0 WHERE col6 != (SELECT SUM(col6) >= COUNT(col6) - SUM(col6) FROM input WHERE o2 = 1);
UPDATE input SET o2 = 0 WHERE col7 != (SELECT SUM(col7) >= COUNT(col7) - SUM(col7) FROM input WHERE o2 = 1);
UPDATE input SET o2 = 0 WHERE col8 != (SELECT SUM(col8) >= COUNT(col8) - SUM(col8) FROM input WHERE o2 = 1);
UPDATE input SET o2 = 0 WHERE col9 != (SELECT SUM(col9) >= COUNT(col9) - SUM(col9) FROM input WHERE o2 = 1);
UPDATE input SET o2 = 0 WHERE col10 != (SELECT SUM(col10) >= COUNT(col10) - SUM(col10) FROM input WHERE o2 = 1);
UPDATE input SET o2 = 0 WHERE col11 != (SELECT SUM(col11) >= COUNT(col11) - SUM(col11) FROM input WHERE o2 = 1);
UPDATE input SET o2 = 0 WHERE col12 != (SELECT SUM(col12) >= COUNT(col12) - SUM(col12) FROM input WHERE o2 = 1);

UPDATE input SET co2 = 1;
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col1 != (SELECT SUM(col1) < COUNT(col1) - SUM(col1) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col2 != (SELECT SUM(col2) < COUNT(col2) - SUM(col2) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col3 != (SELECT SUM(col3) < COUNT(col3) - SUM(col3) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col4 != (SELECT SUM(col4) < COUNT(col4) - SUM(col4) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col5 != (SELECT SUM(col5) < COUNT(col5) - SUM(col5) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col6 != (SELECT SUM(col6) < COUNT(col6) - SUM(col6) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col7 != (SELECT SUM(col7) < COUNT(col7) - SUM(col7) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col8 != (SELECT SUM(col8) < COUNT(col8) - SUM(col8) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col9 != (SELECT SUM(col9) < COUNT(col9) - SUM(col9) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col10 != (SELECT SUM(col10) < COUNT(col10) - SUM(col10) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col11 != (SELECT SUM(col11) < COUNT(col11) - SUM(col11) FROM input WHERE co2 = 1);
UPDATE input SET co2 = CASE WHEN (SELECT SUM(co2) > 1 FROM input) THEN 0 ELSE 1 END WHERE co2 = 1 AND col12 != (SELECT SUM(col12) < COUNT(col12) - SUM(col12) FROM input WHERE co2 = 1);

SELECT (
	(SELECT
		col1 * (1<<11) +
		col2 * (1<<10) +
		col3 * (1<<9) +
		col4 * (1<<8) +
		col5 * (1<<7) +
		col6 * (1<<6) +
		col7 * (1<<5) +
		col8 * (1<<4) +
		col9 * (1<<3) +
		col10 * (1<<2) +
		col11 * (1<<1) +
		col12 * (1<<0)
	FROM input WHERE o2 = 1)
	*
	(SELECT
		col1 * (1<<11) +
		col2 * (1<<10) +
		col3 * (1<<9) +
		col4 * (1<<8) +
		col5 * (1<<7) +
		col6 * (1<<6) +
		col7 * (1<<5) +
		col8 * (1<<4) +
		col9 * (1<<3) +
		col10 * (1<<2) +
		col11 * (1<<1) +
		col12 * (1<<0)
	FROM input WHERE co2 = 1)
);
