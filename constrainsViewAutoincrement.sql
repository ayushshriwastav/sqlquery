create database allQueries;
show databases;
drop database allQueries;
/* database has been created 

/*create table */
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    commission DECIMAL(5,2)
);

insert into salesman (name, city, commission) values ('John Smith', 'New York', 0.15),('Robert Brown', 'Chicago', 0.13),
('Michael Johnson', 'New York', 0.12);

select * from salesman;
select name from salesman where city='New York';

