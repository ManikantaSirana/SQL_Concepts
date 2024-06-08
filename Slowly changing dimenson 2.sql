--Implmenting SCD2
Create table Car_model_Transaction
(
product_id int,
product_name varchar(50),
price int
);

Create table Car_model_Dimension
(
product_id int,
product_name varchar(50),
price int,
Start_date Date,
end_date Date,
);

delete from Car_model_Transaction;
delete from Car_model_Dimension;

insert into  Car_model_Transaction values (1,'Mustang',1000),(2,'Intercepter',30000)

select * from Car_model_Transaction;
select * from Car_model_Dimension;

declare @today date='2024-01-01'

insert into Car_model_Dimension
select product_id ,
product_name ,
price ,
@today,'9999-12-31'
from Car_model_Transaction;

delete from Car_model_Transaction

insert into  Car_model_Transaction values (3,'Eco sport',50000),(1,'Mustang',60000)

select * from Car_model_Transaction
select * from Car_model_Dimension

declare @today date='2024-01-20'
update Car_model_Dimension 
set end_date=@today from Car_model_Transaction
where Car_model_Transaction.product_id=Car_model_Dimension.product_id and end_date='9999-12-31'

declare @today date='2024-01-20'
insert into Car_model_Dimension
select product_id ,
product_name ,
price ,
@today,'9999-12-31'
from Car_model_Transaction;

select * from Car_model_Dimension