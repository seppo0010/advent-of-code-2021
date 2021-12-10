CREATE TABLE input (data TEXT, row_ INTEGER PRIMARY KEY AUTOINCREMENT);
.mode csv input
.import input input

CREATE TABLE brackets (bracket char(1), stack text, row_ integer, position integer);
PRAGMA recursive_triggers = ON;

CREATE TRIGGER example_1
AFTER INSERT on brackets WHEN LENGTH(NEW.bracket) > 1
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

SELECT
    SUM(
        CASE SUBSTR(bracket, 1, 1)
        WHEN ')' THEN 3
        WHEN ']' THEN 57
        WHEN '}' THEN 1197
        WHEN '>' THEN 25137
        END
    )
    FROM brackets
    JOIN
        (SELECT MIN(position) p, row_ FROM brackets WHERE stack IS NULL GROUP BY row_) t
        ON brackets.row_ = t.row_ AND brackets.position = t.p - 1;
;

-- .dump
