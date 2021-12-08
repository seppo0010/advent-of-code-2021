.mode csv input
create table numbers (
	input1 varchar(7),
	input2 varchar(7),
	input3 varchar(7),
	input4 varchar(7),
	input5 varchar(7),
	input6 varchar(7),
	input7 varchar(7),
	input8 varchar(7),
	input9 varchar(7),
	input10 varchar(7),
	pipe char(1),
	output1 vachar(7),
	output2 vachar(7),
	output3 vachar(7),
	output4 vachar(7)
);
.separator " "
.import input numbers

DELETE FROM numbers WHERE pipe IS NULL;

SELECT SUM(c) FROM (
	SELECT COUNT(*) c FROM numbers WHERE LENGTH(output1) IN (2, 4, 3, 7)
	UNION ALL
	SELECT COUNT(*) c FROM numbers WHERE LENGTH(output2) IN (2, 4, 3, 7)
	UNION ALL
	SELECT COUNT(*) c FROM numbers WHERE LENGTH(output3) IN (2, 4, 3, 7)
	UNION ALL
	SELECT COUNT(*) c FROM numbers WHERE LENGTH(output4) IN (2, 4, 3, 7)
);

-- .dump
