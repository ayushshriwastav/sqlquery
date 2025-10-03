
-- salary every month as a input 
DELIMITER //

DROP FUNCTION IF EXISTS get_annual_salary;

CREATE FUNCTION get_annual_salary(salary DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN salary * 12;
END //

DELIMITER ;

SELECT get_annual_salary(25000) AS annual_salary;


//////////////////////////////////////////////////////

DELIMITER //

DROP FUNCTION IF EXISTS get_factorial;

CREATE FUNCTION get_factorial(num INT)
RETURNS BIGINT
DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE fact BIGINT DEFAULT 1;

    IF num < 0 THEN
        RETURN NULL;  
    END IF;

    WHILE i <= num DO
        SET fact = fact * i;
        SET i = i + 1;
    END WHILE;

    RETURN fact;
END //

DELIMITER ;

SELECT get_factorial(5) AS factorial;

