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

////////////////////////////////////////////////////////////

delimiter //
drop procedure if exists multiplication_table2;
create procedure multiplication_table2(IN num INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    drop temporary table if exists temp_table;
    create temporary table temp_table (
        result VARCHAR(50)
    );

    while i <= 10 do
        insert into temp_table values (CONCAT(num, ' x ', i, ' = ', num * i));
        set i = i + 1;
    end while;

    select * from temp_table;
end //

delimiter ;

CALL multiplication_table2(7);

//////////////////////////Addition of two number/////////////////////////////////

delimiter //
drop procedure if exists addTwoNumber;
create procedure addTwoNumber(in num int)
begin
declare i int default 1;
declare total int default 0;  

while i <= num do 
set total = total +i;
set i = i+1;
end while;
select concat('sum of number', ' = ', total);
end //
delimiter ;

call addTwoNumber(3);


/////////////////////////factorial program//////////////

delimiter //
drop procedure if exists factorial;
create procedure factorial(in num int)
begin
declare i int default 1;
declare fact int default 1;

while i <= num do 
set fact = fact * i;
set i = i+1;
end while;
select concat('sum of number', ' = ', fact);
end //
delimiter ;

call factorial(5);

//////////////////Reverse Num

delimiter //
drop procedure if exists reverseNumber;
create procedure reverseNumber(in num int)
begin
/*declare i int default 1;*/
declare rev int default 0;
declare rem int;

while num != 0 do
set rem = num %10;
set rev = rev * 10 + rem;
set num = floor(num / 10);
end while;
select concat('reverse number is', ' : ', rev);
end //
delimiter ;

call reverseNumber(123);

//////////////////Nth number fabnocci series///////////////////
DELIMITER //

DROP PROCEDURE IF EXISTS fibonacci;

CREATE PROCEDURE fibonacci(IN n INT)
BEGIN
    DECLARE a INT DEFAULT 0;
    DECLARE b INT DEFAULT 1;
    DECLARE c INT;
    DECLARE i INT DEFAULT 1;

    -- Temporary table बनाएँ result collect करने के लिए
    DROP TEMPORARY TABLE IF EXISTS temp_fib;
    CREATE TEMPORARY TABLE temp_fib (
        term_no INT,
        value INT
    );

    WHILE i <= n DO
        INSERT INTO temp_fib VALUES (i, a);
        SET c = a + b;
        SET a = b;
        SET b = c;
        SET i = i + 1;
    END WHILE;

    -- एक ही grid में पूरा output दिखेगा
    SELECT * FROM temp_fib;
END //

DELIMITER ;

call fibonacci(5);




