use BookShop;

create table Role(
	idRole int identity(1,1) primary key,
	roleName nvarchar(50) not null
);

create table Category(
	idCategory int identity(1,1) primary key,
	categoryName nvarchar(50) not null
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
	category int constraint Product_Category_FK foreign key references Category(idCategory) on delete cascade not null 
);

create table BookOrder(
	idOrder int identity(1,1) primary key,
	status nvarchar(20) not null
);

create table Card(
	idCard int identity(1,1) primary key,
	idOrder int constraint Card_Order_FK foreign key references BookOrder(idOrder) on delete cascade not null
);

create table BookshopUser(
	idUser int identity(1,1) primary key,
	username nvarchar(40) not null,
	password int not null,
	role int constraint User_Role_FK foreign key references Role(idRole) on delete cascade not null,
	card int unique foreign key references Card(idCard) on delete cascade not null
);

create table OrderItem(
	idOrder int primary key constraint OrderItem_Order_FK foreign key references BookOrder(idOrder) on delete cascade not null,
	idProduct int foreign key references Product(idProduct) on delete cascade not null,
	unitPrice int not null,
	quantity int not null default(1)
);

drop table OrderItem;
drop table BookOrder;
drop table BookshopUser;
drop table Card;
drop table Product;
drop table Role;
drop table Category;
drop table Author;