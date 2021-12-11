use BookShop;

--INSERT INTO CATEGORY

insert into Category(categoryName) values
	('�����'), ('������'), ('������');


--INSERT INTO ROLE

insert into Role(roleName) values
	('admin'), ('user');

--INSERT INTO AUTHOR

exec InsertAuthor;

--INSERT INTO PRODUCT

exec InsertIntoProduct '����', 2, '�����';
exec InsertIntoProduct '������������ � ���������', 4, '�����';
exec InsertIntoProduct '���� ����', 345, '������';
exec InsertIntoProduct 'Magazin', 1, '������';

--INSERT INTO USER

exec InsertUser 'user', 'user';
exec InsertUser 'root', 'root';
exec UpdateUserRole 'root';

--INSERT INTO ORDERITEM

exec InsertOrderItem 2, 10, 1;
exec InsertOrderItem 4, 5, 2;
exec InsertOrderItem 4, 4, 1;
exec InsertOrderItem 3, 7, 2;

