CREATE TABLE input (
    action varchar(10),
    value integer,
    id integer primary key autoincrement,
    aim integer DEFAULT 0,
    horizontal integer DEFAULT 0,
    depth integer DEFAULT 0
);
.mode csv input
.separator " "
.import input input

INSERT INTO input VALUES ('forward', 0, NULL, NULL, NULL, NULL);

UPDATE input
    SET aim = (SELECT
        COALESCE(SUM(COALESCE(i.value, 0)), 0)
        FROM input i
        WHERE i.id <= input.id AND i.action = 'down'
    ) - (SELECT
        COALESCE(SUM(COALESCE(i.value, 0)), 0)
        FROM input i
        WHERE i.id <= input.id AND i.action = 'up'
    )
    ;

UPDATE input
    SET horizontal =
    (
        SELECT COALESCE(SUM(COALESCE(forward.value, 0)), 0)
        FROM input i
        JOIN input forward ON i.id >= forward.id AND forward.action = 'forward'
        WHERE input.id = i.id
    )
;

UPDATE input SET depth = (
        SELECT COALESCE(depth, 0) + CASE WHEN i.action='forward' THEN i.value * i.aim ELSE 0 END
        FROM input i
        WHERE i.id = input.id -1
);
SELECT input.horizontal * input.depth FROM input ORDER BY input.id DESC LIMIT 1;
