-- Slowly changing dimensions SCD-1
--Daily transactional Table
create table Car_model_Transaction
(
product_id int,
product_name varchar(50),
price int
);

create table Car_model_Dimension
(
product_id int,
product_name varchar(50),
price int,
Latest_update Date
);

delete from Car_model_Transaction;
delete from Car_model_Dimension;

insert into  Car_model_Transaction values (1,'Mustang',1000),(2,'Intercepter',30000)

select * from Car_model_Transaction;
select * from Car_model_Dimension;
declare @today date='2024-01-01';

Insert into Car_model_Dimension 
select product_id,product_name,price,@today from Car_model_Transaction

 insert into  Car_model_Transaction values (3,'Eco sport',50000),(1,'Mustang',60000)

select * from Car_model_Dimension;
--implemting SCD1
declare @today date='2024-01-20';
Insert into Car_model_Dimension 
select product_id,product_name,price,@today from Car_model_Transaction
where product_id not in (select product_id from Car_model_Dimension);

declare @today date='2024-01-20';
update Car_model_Dimension
set price= Car_model_Transaction.price,Latest_update=@today
from Car_model_Transaction where Car_model_Transaction.product_id=Car_model_Dimension.product_id


select * from Car_model_Dimension;