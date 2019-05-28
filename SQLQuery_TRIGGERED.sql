CREATE TRIGGER Books_INSERT
ON Books
AFTER INSERT
AS
INSERT INTO Books (BookId, AuthorId)
SELECT BookId, 'Добавлена книга ' + BookName + '   ISBN ' + BookISBN
FROM INSERTED
Go 

CREATE TRIGGER Bookss_UPDATE
ON Books
AFTER UPDATE
AS
INSERT INTO Books (BookId, AuthorId)
SELECT BookId, 'Обновлена книга ' + BookName + '   ISBN ' + BookISBN
FROM INSERTED
GO 

CREATE TRIGGER Bookss_DELETE
ON Books
AFTER DELETE
AS
INSERT INTO Books (BookId, AuthorId)
SELECT BookId, 'Удалена книга ' + BookName + '   ISBN ' + BookISBN
FROM INSERTED
GO 

CREATE TRIGGER BOOKS_IN_DELETE
ON Books
INSTEAD OF DELETE
AS
PRINT 'Can not delete'
GO 

CREATE TRIGGER Countries_IN_Insert
ON Countries
INSTEAD OF INSERT
AS
PRINT 'Can not add country'
