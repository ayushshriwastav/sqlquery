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
delimiter //

drop procedure if exists fibonacci;

create procedure fibonacci(in n int)
begin
    declare a int default 0;
	declare  b int default 1;
	declare  c int;
	declare  i int default 1;
    
    drop temporary table if exists temp_fib;
    create temporary table temp_fib (
        term_no int,
        value int
    );

    while i <= n do
        insert into temp_fib values (i, a);
        set c = a + b;
        set a = b;
        set b = c;
        set i = i + 1;
    end while;


    select * from temp_fib;
end //

delimiter ;

call fibonacci(5);



//////////////check Prime Number////////////////////

delimiter //

/*drop procedure if exists checkPrimeNumber;*/

create procedure checkPrimeNumber(in num int)
begin 
declare i int default 2;
declare isPrime boolean default true;

if num <= 1 then 
set isPrime = false;
else
while i <= num/2 do
if ( num % i = 0) then 
set isPrime = false;
end if;
set i = i+1;
end while;
end if;

if isPrime then 
select concat(num, " is prime") as result;
else
select concat(num, " is not prime") as result;
end if;
end //
delimiter ;

call checkPrimeNumber(99)




