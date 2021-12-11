use BookShop;

-----ROLES
--getting all from roles
go
create procedure GetAllFromRoles
as
begin
	select * from Role;
end;

exec GetAllFromRoles;
drop procedure GetAllFromRoles;

--getting role by name
go
create procedure GetRoleByName @name nvarchar(50)
as
begin
	select * from Role where roleName = @name;
end;

exec GetRoleByName @name = 'user';
drop procedure GetRoleByName;


---CATEGORY
--getting all from categories
go
create procedure GetAllFromCategory
as
begin
	Select * from Category;
end;

exec GetAllFromCategory;
drop procedure GetAllFromCategory;

--get category by name
go
create procedure GetCategoryByName @name nvarchar(50)
as
begin
	select * from Category where categoryName = @name;
end;

exec GetCategoryByName @name='книга';
drop procedure GetCategoryByName;


---AUTHOR
--get all from Author
go
create procedure GetAllFromAuthor
as
begin
	select * from Author;
end;

exec  GetAllFromAuthor;
drop procedure GetAllFromAuthor;

--get author by first name
go
create procedure GetAuthorByFirstName @firstName nvarchar(50)
as
begin
	select * from Author where firstName = @firstName;
end;

exec GetAuthorByFirstName @firstName= 'test';
drop procedure GetAuthorByFirstName; 

---PRODUCT
--get all from product
go 
create procedure GetAllFromProduct
as
begin
	select p.productName, p.category, a.firstName, a.lastName
	from Product p inner join Author a
	on p.author = a.idAuthor;
end;

exec GetAllFromProduct;
drop procedure GetAllFromProduct;

--get product by product name
go
create procedure GetProductByName @productName nvarchar(50)
as
begin
	select * from Product where productName = @productName;
end;

exec GetProductByName @productName = 'test';
drop procedure GetProductByName;

--get product by product id
go
create procedure GetProductById @idproduct int
as
begin
	select * from Product where idProduct = @idproduct;
end;

exec GetProductByName @productName = 'test';
drop procedure GetProductByName;

--get product by category
go
create procedure GetProductByCategory @category int
as
begin
	select pr.productName, a.firstName, a.lastName, c.categoryName
	from Product pr
	inner join Category c on pr.category = c.idCategory
	inner join Author a on pr.author = a.idAuthor
	where c.categoryName = @category;
end;

exec GetProductByCategory @category = 1;
drop procedure GetProductByCategory;

---USERS
--Get All from Users
go
create procedure GetAllUsers
as
begin
	select * from BookshopUser;
end;

exec GetAllUsers;
drop procedure GetAllUsers;
--Get User by username
go
create procedure GetUserByUsername @username nvarchar(50)
as
begin
	select username, password, role from BookshopUser where username = @username;
end;

exec GetUserByUsername @username = 'test';
drop procedure GetUserByUsername;

go
create procedure GetAllFromUserByUsername @username nvarchar(50)
as
begin
	select * from BookshopUser where username = @username;
end;
--Get Uses by Role
go
create procedure GetUserByRole @rolename nvarchar(50)
as
begin
	select * from BookshopUser u
	inner join Role r on r.idRole = u.role
	where r.roleName = @rolename;
end;

exec GetUserByRole @rolename = 'test';
drop procedure GetUserByRole;
--Get Users role
go
create procedure GetUsersRole @username nvarchar(50)
as
begin
	select r.roleName from BookshopUser u
	inner join Role r on r.idRole = u.role
	where u.username = @username;
end;

drop procedure GetUsersRole;
--Get users password
go
create procedure GetPasswordByUsername @username nvarchar(50)
as
begin
	select password from BookshopUser where username = @username;
end;

drop procedure GetPasswordByUsername;
---CARD
--Get Card by Username
go
create procedure GetCardByUsername @username nvarchar(50)
as
begin
	select * from Card c
	inner join BookshopUser u on c.idCard = u.idUser
	where u.username = @username;
end;

exec GetCardByUsername @username = 'test';
drop procedure GetCardByUsername;
--Get Orders By Username
go
create procedure GetOrdersByUsername @username nvarchar(50)
as
begin
	Select u.username, p.productName, o.quantity, o.status from BookshopUser u 
	inner join OrderItem o
	on u.idUser = o.idUser
	inner join Product p
	on p.idProduct = o.idProduct
	where u.username = @username;
end;

exec GetOrdersByUsername @username = 'user';
drop procedure GetOrdersByUsername;