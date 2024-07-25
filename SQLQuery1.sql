
create database CoffeeManager
go

use CoffeeManager
go

-- food
-- table
-- foodcategory
-- account
-- bill
-- billinfo

create table TableFood
(
	id int identity primary key,
	name nvarchar(100) NOT NULL DEFAULT N'No Name',
	status nvarchar(100) NOT NULL DEFAULT N'Unoccupied'
)
GO


create table Account
(
	UserName NVARCHAR(100) not null DEFAULT N'Quý Khách',
	DisplayName NVARCHAR(100) PRIMARY KEY not null ,
	Password NVARCHAR(1000) not null DEFAULT N'123456',
	Type INT NOT NULL DEFAULT 0 --1:ADMIN||0:STAFF
)
GO

CREATE TABLE FoodCategory
(
	id INT identity PRIMARY KEY,
	Name NVARCHAR(100) not null
)
GO

CREATE TABLE Food
(
	id INT identity PRIMARY KEY,
	Name NVARCHAR(100) not null DEFAULT N'CHƯA ĐẶT TÊN',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL
	
	FOREIGN KEY (idCategory) references dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
	id INT identity PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0 --1:da thanh toan||0:chua thanh toan
	
	foreign key (idTable) references dbo.TableFood(id)
)
GO

CREATE TABLE BillInfo
(
	id INT identity PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0

	foreign key (idBill) references dbo.Bill(id),
	foreign key (idFood) references dbo.Food(id)
)

insert into dbo.Account
values (	'ptdiep','Phan Tan Diep','123456','1')

insert into dbo.Account
values (	'tnlinh','Tran Nhat Linh','123456','0')
go

create proc USP_GetAccountByUserName 
@username nvarchar(100)
as
begin
	select * from dbo.Account where UserName = @username
end
go

create proc USP_Login
@username nvarchar(100), @password nvarchar(100)
as
begin
	select * from dbo.Account where UserName = @username and Password = @password
end
go

--add table
declare @i int = 1

while @i <=20
begin
	insert dbo.TableFood (name) values (N'Table '+ CAST(@i as nvarchar(100)))
	set @i = @i + 1
end
go


create proc USP_GetTableList
as Select * from dbo.TableFood
go


update dbo.TableFood set status = N'Unoccupied' where id<7

--add category
insert FoodCategory(Name)
values (N'Kem')
insert FoodCategory(Name)
values (N'Nuoc ep')
insert FoodCategory(Name)
values (N'Tra sua')
insert FoodCategory(Name)
values (N'Sinh to')
insert FoodCategory(Name)
values (N'Tra trai cay')
insert FoodCategory(Name)
values (N'Da xay')
insert FoodCategory(Name)
values (N'Tra')
insert FoodCategory(Name)
values (N'Topping')
insert FoodCategory(Name)
values (N'Coffee')

--add food
insert Food
(Name, idCategory, price)
values (N'Kem chocolate', 1, 10000)
insert Food
(Name, idCategory, price)
values (N'Kem chuoi', 1, 10000)
insert Food
(Name, idCategory, price)
values (N'Kem dau', 1, 15000)
insert Food
(Name, idCategory, price)
values (N'Kem Vanilla', 1, 20000)
insert Food
(Name, idCategory, price)
values (N'Cam ep', 2, 15000)
insert Food
(Name, idCategory, price)
values (N'Oi ep', 2, 15000)
insert Food
(Name, idCategory, price)
values (N'Nuoc chanh', 2, 15000)
insert Food
(Name, idCategory, price)
values (N'Tao ep', 2, 2000)
insert Food
(Name, idCategory, price)
values (N'Dua ep', 2, 20000)
insert Food
(Name, idCategory, price)
values (N'TS Truyen thong', 3, 15000)
insert Food
(Name, idCategory, price)
values (N'TS Socola', 3, 20000)
insert Food
(Name, idCategory, price)
values (N'TS Thai Xanh', 3, 20000)
insert Food
(Name, idCategory, price)
values (N'TS Thai Do', 3, 20000)
insert Food
(Name, idCategory, price)
values (N'TS Matcha', 3, 25000)
insert Food
(Name, idCategory, price)
values (N'Sinh to xoai', 4, 20000)
insert Food
(Name, idCategory, price)
values (N'Sinh to dau', 4, 25000)
insert Food
(Name, idCategory, price)
values (N'Sinh to nho', 4, 20000)
insert Food
(Name, idCategory, price)
values (N'Sinh to dua hau', 4, 25000)
insert Food
(Name, idCategory, price)
values (N'Tra dao', 5, 20000)
insert Food
(Name, idCategory, price)
values (N'Tra chanh', 5, 15000)
insert Food
(Name, idCategory, price)
values (N'Tra tac', 5, 10000)
insert Food
(Name, idCategory, price)
values (N'Tra kiwi', 5, 20000)
insert Food
(Name, idCategory, price)
values (N'Tra vai', 5, 20000)
insert Food
(Name, idCategory, price)
values (N'Tra dau', 5, 15000)
insert Food
(Name, idCategory, price)
values (N'Da xay siro dau', 6, 20000)
insert Food
(Name, idCategory, price)
values (N'Da xay sua dac', 6, 20000)
insert Food
(Name, idCategory, price)
values (N'Da xay sua dam chanh', 6, 20000)
insert Food
(Name, idCategory, price)
values (N'Tra da', 7, 5000)
insert Food
(Name, idCategory, price)
values (N'Tran chau', 8, 5000)
insert Food
(Name, idCategory, price)
values (N'Duong nau Coffee', 8, 5000)
insert Food
(Name, idCategory, price)
values (N'Sua dac Coffee', 8, 5000)
insert Food
(Name, idCategory, price)
values (N'Thach trai cay', 8, 5000)
insert Food
(Name, idCategory, price)
values (N'Black Coffee', 9, 15000)
insert Food
(Name, idCategory, price)
values (N'Milk Coffee', 9, 20000)
insert Food
(Name, idCategory, price)
values (N'Latte Coffee', 9, 25000)
insert Food
(Name, idCategory, price)
values (N'Golden Coffee', 9, 35000)

-- add bill
insert Bill
values (GETDATE(), null, 1, 0)
insert Bill
values (GETDATE(), null, 2, 0)
insert Bill
values (GETDATE(), GETDATE(), 2, 1)

-- add bill info
insert BillInfo
values (1, 1, 2)
insert BillInfo
values (1, 3, 4)
insert BillInfo
values (1, 5, 1)

insert BillInfo
values (2, 1, 2)
insert BillInfo
values (2, 3, 3)
insert BillInfo
values (2, 4, 2)
insert BillInfo

values (3, 1, 5)
insert BillInfo
values (3, 2, 3)
insert BillInfo
values (3, 5, 5)
go

create proc USP_InsertBill
@idTable int
as
begin
	insert Bill
	values (GETDATE(), null, @idTable, 0)
end
go

create proc USP_InsertBillInfo
@idBill int, @idFood int, @count int
as
begin
	declare @isExistsBillInfo int
	declare @foodCount int = 1

	select @isExistsBillInfo = id, @foodCount = b.count
	from dbo.BillInfo as b
	where idBill = @idBill and idFood = @idFood

	if (@isExistsBillInfo > 0)
	begin
		declare @newCount int = @foodCount + @count
		if (@newCount > 0)
			update dbo.BillInfo set count = @foodCount +@count where idFood = @idFood
		else
			delete dbo.BillInfo where idBill = @idBill and idFood = @idFood
	end
	else
	begin
		insert BillInfo 
		values (@idBill, @idFood, @count)
	end
end
go

create trigger UTG_UpdateBillInfo
on dbo.BillInfo for insert, update
as
begin
	declare @idBill int
	select @idBill = idBill from inserted
	declare @idTable int
	select @idTable = idTable from dbo.Bill where id = @idBill and status = 0
	update dbo.TableFood set status = N'Occupied' where id = @idTable
end
go

create trigger UTG_UpdateBill
on dbo.Bill for Update
as
begin
	declare @idBill int
	select @idBill = id from inserted
	declare @idTable int
	select @idTable = idTable from dbo.Bill where id = @idBill
	declare @count int = 0
	select @count = count(*) from dbo.Bill where idTable = @idTable and status = 0
	if (@count = 0) update dbo.TableFood set status = N'Unoccupied' where id = @idTable
end
go

select * from Food
select * from FoodCategory
select * from Bill
select * from BillInfo
 select * from TableFood
