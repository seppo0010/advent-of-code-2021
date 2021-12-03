.mode csv input
create table input (value int, id integer primary key autoincrement);
.import input input

SELECT SUM(input.value < next.value) FROM input JOIN input next ON input.id+3 = next.id LIMIT 20;
