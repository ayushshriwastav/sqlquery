DELIMITER //

DROP PROCEDURE IF EXISTS swap_numbers;

CREATE PROCEDURE swap_numbers(INOUT a INT, INOUT b INT)
BEGIN
    DECLARE temp INT;

    SET temp = a;
    SET a = b;
    SET b = temp;
END //

DELIMITER ;

SET @x = 10;
SET @y = 20;

CALL swap_numbers(@x, @y);

SELECT @x AS first_number, @y AS second_number;


////////////Without in out swap number//////////////

DELIMITER //

DROP PROCEDURE IF EXISTS swap_numbers;

CREATE PROCEDURE swap_numbers(IN a INT, IN b INT)
BEGIN
    DECLARE temp INT;

    SET temp = a;
    SET a = b;
    SET b = temp;

    SELECT a AS first_number, b AS second_number;
END //

DELIMITER ;


call swap_numbers(10,20);


///////////////////discount Prices with in out total price////////////////

DELIMITER //

-- DROP PROCEDURE IF EXISTS apply_discount;

CREATE PROCEDURE apply_discount(
    IN discount_percent INT, 
    INOUT total_price DECIMAL(10,2)
)
BEGIN
    DECLARE discount_amount DECIMAL(10,2);


    SET discount_amount = (total_price * discount_percent) / 100;

    SET total_price = total_price - discount_amount;
END //

DELIMITER ;


SET @price = 1000.00;

CALL apply_discount(10, @price);

SELECT @price AS final_price;


