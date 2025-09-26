CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    amount DECIMAL(10,2),
    status VARCHAR(20)
);


INSERT INTO orders (customer_name, amount, status) VALUES
('John Smith', 8000, NULL),
('Robert Brown', 12000, NULL),
('David Lee', 5000, NULL);

select * from orders;

DELIMITER //

CREATE PROCEDURE update_order_status(IN order_id INT)
BEGIN
    DECLARE orderAmount DECIMAL(10,2);


    SELECT amount INTO orderAmount
    FROM orders
    WHERE id = order_id;
    IF orderAmount > 10000 THEN
        UPDATE orders
        SET status = 'VIP'
        WHERE id = order_id;
    ELSE
        UPDATE orders
        SET status = 'Normal'
        WHERE id = order_id;
    END IF;
END //



CALL update_order_status(1);
CALL update_order_status(2);
CALL update_order_status(3);
select * from orders;

////
/* Write a stored procedure check_number(IN num INT) that:
•	Prints 'Positive' if num > 0
•	'Negative' if num < 0
•	'Zero' otherwise
*/

DELIMITER //
 
CREATE PROCEDURE check_number(IN num INT)
BEGIN
    IF num > 0 THEN
        SELECT 'Positive' AS result;
    ELSEIF num < 0 THEN
        SELECT 'Negative' AS result;
    ELSE
        SELECT 'Zero' AS result;
    END IF;
END //

DELIMITER ;
CALL check_number(15);  
CALL check_number(-7);   
CALL check_number(0);   

