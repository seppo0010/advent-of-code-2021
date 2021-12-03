create table input (
	data char(12),
	col1 int, col2 int, col3 int, col4 int, 
	col5 int, col6 int, col7 int, col8 int, 
	col9 int, col10 int, col11 int, col12 int 
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

SELECT (
(SELECT (
	((SELECT COUNT(1) FROM input WHERE col1 = 0) < (SELECT COUNT(1) FROM input WHERE col1 = 1)) * (1 << 11) +
	((SELECT COUNT(1) FROM input WHERE col2 = 0) < (SELECT COUNT(1) FROM input WHERE col2 = 1)) * (1 << 10) +
	((SELECT COUNT(1) FROM input WHERE col3 = 0) < (SELECT COUNT(1) FROM input WHERE col3 = 1)) * (1 << 9) +
	((SELECT COUNT(1) FROM input WHERE col4 = 0) < (SELECT COUNT(1) FROM input WHERE col4 = 1)) * (1 << 8) +
	((SELECT COUNT(1) FROM input WHERE col5 = 0) < (SELECT COUNT(1) FROM input WHERE col5 = 1)) * (1 << 7) +
	((SELECT COUNT(1) FROM input WHERE col6 = 0) < (SELECT COUNT(1) FROM input WHERE col6 = 1)) * (1 << 6) +
	((SELECT COUNT(1) FROM input WHERE col7 = 0) < (SELECT COUNT(1) FROM input WHERE col7 = 1)) * (1 << 5) +
	((SELECT COUNT(1) FROM input WHERE col8 = 0) < (SELECT COUNT(1) FROM input WHERE col8 = 1)) * (1 << 4) +
	((SELECT COUNT(1) FROM input WHERE col9 = 0) < (SELECT COUNT(1) FROM input WHERE col9 = 1)) * (1 << 3) +
	((SELECT COUNT(1) FROM input WHERE col10 = 0) < (SELECT COUNT(1) FROM input WHERE col10 = 1)) * (1 << 2) +
	((SELECT COUNT(1) FROM input WHERE col11 = 0) < (SELECT COUNT(1) FROM input WHERE col11 = 1)) * (1 << 1) +
	((SELECT COUNT(1) FROM input WHERE col12 = 0) < (SELECT COUNT(1) FROM input WHERE col12 = 1)) * (1 << 0)
)) *
(SELECT (
	((SELECT COUNT(1) FROM input WHERE col1 = 0) > (SELECT COUNT(1) FROM input WHERE col1 = 1)) * (1 << 11) +
	((SELECT COUNT(1) FROM input WHERE col2 = 0) > (SELECT COUNT(1) FROM input WHERE col2 = 1)) * (1 << 10) +
	((SELECT COUNT(1) FROM input WHERE col3 = 0) > (SELECT COUNT(1) FROM input WHERE col3 = 1)) * (1 << 9) +
	((SELECT COUNT(1) FROM input WHERE col4 = 0) > (SELECT COUNT(1) FROM input WHERE col4 = 1)) * (1 << 8) +
	((SELECT COUNT(1) FROM input WHERE col5 = 0) > (SELECT COUNT(1) FROM input WHERE col5 = 1)) * (1 << 7) +
	((SELECT COUNT(1) FROM input WHERE col6 = 0) > (SELECT COUNT(1) FROM input WHERE col6 = 1)) * (1 << 6) +
	((SELECT COUNT(1) FROM input WHERE col7 = 0) > (SELECT COUNT(1) FROM input WHERE col7 = 1)) * (1 << 5) +
	((SELECT COUNT(1) FROM input WHERE col8 = 0) > (SELECT COUNT(1) FROM input WHERE col8 = 1)) * (1 << 4) +
	((SELECT COUNT(1) FROM input WHERE col9 = 0) > (SELECT COUNT(1) FROM input WHERE col9 = 1)) * (1 << 3) +
	((SELECT COUNT(1) FROM input WHERE col10 = 0) > (SELECT COUNT(1) FROM input WHERE col10 = 1)) * (1 << 2) +
	((SELECT COUNT(1) FROM input WHERE col11 = 0) > (SELECT COUNT(1) FROM input WHERE col11 = 1)) * (1 << 1) +
	((SELECT COUNT(1) FROM input WHERE col12 = 0) > (SELECT COUNT(1) FROM input WHERE col12 = 1)) * (1 << 0)
))
);
