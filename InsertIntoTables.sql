use BookShop;

--INSERT INTO CATEGORY

insert into Category(categoryName) values
	('Книга'), ('Журнал'), ('Комикс');


--INSERT INTO ROLE

insert into Role(roleName) values
	('admin'), ('user');


---INSERT INTO BOOKORDER

insert into BookOrder(status) values
	('оформлен'), ('подтвеждён'), ('оплачен'), ('забран');