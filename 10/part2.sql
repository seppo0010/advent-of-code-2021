CREATE TABLE input (data TEXT, row_ INTEGER PRIMARY KEY AUTOINCREMENT);
.mode csv input
.import input input

CREATE TABLE brackets (bracket char(1), stack text, row_ integer, position integer);
PRAGMA recursive_triggers = ON;

CREATE TRIGGER example_1
AFTER INSERT on brackets WHEN LENGTH(NEW.bracket) > 0
BEGIN INSERT INTO brackets (bracket, row_, position, stack) VALUES
    (SUBSTR(NEW.bracket, 2), NEW.row_, NEW.position+1,
     CASE WHEN NEW.stack IS NULL THEN NULL
     ELSE
        CASE WHEN SUBSTR(NEW.bracket, 1, 1) IN ('[', '{', '(', '<') THEN NEW.stack || SUBSTR(NEW.bracket, 1, 1)
        ELSE
            CASE WHEN
                SUBSTR(NEW.stack, -1) = '[' AND SUBSTR(NEW.bracket, 1, 1) = ']' OR
                SUBSTR(NEW.stack, -1) = '(' AND SUBSTR(NEW.bracket, 1, 1) = ')' OR
                SUBSTR(NEW.stack, -1) = '<' AND SUBSTR(NEW.bracket, 1, 1) = '>' OR
                SUBSTR(NEW.stack, -1) = '{' AND SUBSTR(NEW.bracket, 1, 1) = '}'
            THEN
                SUBSTR(NEW.stack, 0, LENGTH(NEW.stack))
            ELSE
                NULL
            END
        END
     END
     ); END;

INSERT INTO brackets (bracket, position, row_, stack) SELECT data, 0, row_, '' FROM input;
DROP TRIGGER example_1;
DROP TABLE input;

DELETE FROM brackets WHERE row_ IN (SELECT DISTINCT row_ FROM brackets WHERE stack IS NULL);

CREATE TABLE missing (stack text, value integer default 0);

create trigger get_value
AFTER UPDATE ON missing WHEN LENGTH(NEW.stack) > 0
BEGIN update missing SET stack = substr(NEW.stack, 0, length(NEW.stack)), value = NEW.value * 5 +
CASE substr(NEW.stack, -1)
    WHEN '(' THEN 1
    WHEN '[' THEN 2
    WHEN '{' THEN 3
    WHEN '<' THEN 4
END WHERE stack = NEW.stack AND value = NEW.value; END;

INSERT INTO missing (stack) SELECT stack FROM (
    SELECT stack, MAX(position), row_ FROM brackets GROUP BY row_
);

UPDATE missing SET stack = SUBSTR(stack, 0, LENGTH(stack)+1);

SELECT value
FROM missing
ORDER BY value
LIMIT 1
OFFSET (SELECT COUNT(*) FROM missing) / 2;
drop table brackets;
-- .dump
