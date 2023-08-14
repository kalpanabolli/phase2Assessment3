create database ExerciseDb3
use ExerciseDb3
create table CompanyInfo
(CId int Primary key,
CName nvarchar(50) not null
);
insert into CompanyInfo values (1,'SamSung'),(2,'HP'),(3,'Apple'),(4,'Dell'),(5,'Toshiba'),(6,'Redmi')
select *from CompanyInfo
create table ProductInfo
(PId int Primary key,
PName nvarchar(50),
PPrice float,
PMDate Date not null,
CId int foreign key references CompanyInfo
);
insert into ProductInfo values (101,'Laptop',55000.90,'12/12/2023',1)
insert into ProductInfo values (102,'Laptop',35000.90,'12/12/2012',2) 
insert into ProductInfo values (103,'Mobile',15000.90,'12/03/2012',2) 
insert into ProductInfo values (104,'Laptop',135000.90,'12/12/2021',3) 
insert into ProductInfo values (105,'Mobile',65000.90,'12/12/2012',3) 
insert into ProductInfo values (106,'Laptop',35000.90,'12/12/2012',5) 
insert into ProductInfo values (107,'Laptop',35000.90,'12/01/2012',5) 
insert into ProductInfo values (108,'Earpod',1000.90,'12/01/2022',3) 
insert into ProductInfo values (109,'Laptop',85000.90,'12/12/2021',6) 
insert into ProductInfo values (110,'Mobile',55000.70,'12/12/2020',1) 
select *from ProductInfo

Select CName, PId, PName, PPrice, PMDate FROM CompanyInfo join ProductInfo ON CompanyInfo.CId = ProductInfo.CId order by CName;

Select PName, CName FROM ProductInfo join CompanyInfo ON ProductInfo.CId = CompanyInfo.CId order by PName;

Select CName, PName FROM CompanyInfo cross join ProductInfo order by CName, PName;

create table Products
(PId int Primary key,
PQ int not null,
PPrice float,
Discount float,
);
insert into Products values(101,10,55000.90,10.0)
insert into Products values(102,11,35000.90,20.0)
insert into Products values(103,12,15000.90,30.0)
insert into Products values(104,13,13500.90,40.0)

create function CalculateDiscount
(
@price float,
@discountPercentage float
)
returns float
as
begin
declare @discountedValue float
set @discountedValue = @price - (@price * (@discountPercentage / 100.0))
return @discountedValue
end

 
select PId,PQ,PPrice,Discount, PPrice * PQ as TotalPrice, PPrice * PQ - (PPrice * PQ * Discount / 100) as PriceAfterDiscount from Products;



