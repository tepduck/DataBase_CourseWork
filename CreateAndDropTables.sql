use BookShop;

create table Role(
	roleName nvarchar(50) primary key
);

create table Category(
	categoryName nvarchar(50) primary key
);

create table Author(
	idAuthor int identity(1,1) primary key,
	firstName nvarchar(50) not null,
	lastName nvarchar(50) not null
);

create table Product(
	idProduct int identity(1,1) primary key,
	productName nvarchar(50) not null,
	author int constraint Product_Author_FK foreign key references Author(idAuthor) on delete cascade not null,
	category nvarchar(50) constraint Product_Category_FK foreign key references Category(categoryName) on delete cascade not null 
);

create table BookshopUser(
	idUser int identity(1,1) primary key,
	username nvarchar(40) not null,
	password nvarchar(40) not null,
	role nvarchar(50) constraint User_Role_FK foreign key references Role(roleName) on delete cascade not null
);

create table OrderItem(
	idOrder int identity(1,1) primary key,
	idProduct int foreign key references Product(idProduct) on delete cascade not null,
	quantity int not null default(1),
	status nvarchar(50) not null default('заказ создан'),
	iduser int foreign key references BookshopUser(idUser) on delete cascade not null
);

drop table BookshopUser;
drop table OrderItem;
drop table Product;
drop table Category;
drop table Author;
drop table Role;