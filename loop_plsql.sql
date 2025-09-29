DELIMITER //

CREATE PROCEDURE multiplication_table(IN num INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10 DO
        SELECT CONCAT(num, ' x ', i, ' = ', num * i) AS result;
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

call multiplication_table(2);

//////////////////////////////////////

DELIMITER //
DROP PROCEDURE IF EXISTS multiplication_table2;
CREATE PROCEDURE multiplication_table2(IN num INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    DROP TEMPORARY TABLE IF EXISTS temp_table;
    CREATE TEMPORARY TABLE temp_table (
        result VARCHAR(50)
    );

    -- WHILE loop से result collect करें
    WHILE i <= 10 DO
        INSERT INTO temp_table VALUES (CONCAT(num, ' x ', i, ' = ', num * i));
        SET i = i + 1;
    END WHILE;

    -- आखिर में एक बार SELECT करें (अब सब rows एक grid में आएंगी)
    SELECT * FROM temp_table;
END //

DELIMITER ;

CALL multiplication_table2(7);



