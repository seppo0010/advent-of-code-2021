CREATE TABLE input (action varchar(10), value integer);
.mode csv input
.separator " "
.import input input

SELECT
    (SELECT SUM(value) FROM input WHERE action = 'forward') *
    (
        (SELECT SUM(value) FROM input WHERE action = 'down') -
        (SELECT SUM(value) FROM input WHERE action = 'up')
    );
