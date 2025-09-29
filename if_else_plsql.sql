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

////

delimiter //
create procedure check_score(IN score int)
begin
    if score >= 90 then
        select 'Excellent' AS result;
    elseif score >= 75 then
        select'Good' AS result;
    elseif score >= 50 then
        select'Average' AS result;
    ELSE
        select 'Fail' AS result;
    end if;
end //
delimiter ;

call check_score(86);


////

DELIMITER //

create procedure check_leapYear(IN yr INT)
begin
    if ( yr % 400 = 0 or (yr % 100 != 0 and yr %4 = 0)) then
    select concat(yr, ' is a leap year') as result;
    else
    select concat(yr, ' is NOT a Leap Year') as result;
    end if;
END //
sys_config
DELIMITER ;

call check_leapYear(1804);

////

DELIMITER //

create procedure check_vowelCharacter(IN ch varchar(1))
begin
    if (ch = 'a' or ch = 'e' or ch = 'i' or ch = 'o' or ch = 'u' or 
    ch = 'A' or ch = 'E' or ch= 'I' or ch = 'O' or ch = 'U' ) then
    select concat(ch, ' is a vowel') as result;
    else
    select concat(ch, ' is consonant') as result;
    end if;
END //
sys_config
DELIMITER ;

call check_vowelCharacter('c');
