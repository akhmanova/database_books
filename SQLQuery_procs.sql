CREATE PROCEDURE AddCity
    @name  NVARCHAR(255),
    @countryId int 
AS
   INSERT Cities(
        CityName, CountryId   
    ) 
    VALUES (
        @name,
        @countryId
    )
GO
-- DECLARE @cityName NVARCHAR(20)
-- DECLARE @country INT
-- SET @cityName = N'Вологда'
-- SET @country = 2

-- EXECUTE AddCity @cityName @country
-- GO

CREATE PROCEDURE AddBook
    @bookname  NVARCHAR(255),
    @bookISBN  NVARCHAR(255),
    @authorid int,
    @bookyear int
AS
    INSERT Books
    ( 
        BookName, AuthorId, BookISBN, BookYear
    )
    VALUES
    (
   @bookname,
    @bookISBN,
    @authorid,
    @bookyear
    )
GO

CREATE PROCEDURE Author
    @AuthorName  NVARCHAR(255),
    @AuthorSurame  NVARCHAR(255)
AS
    INSERT Author
    ( 
        AuthorName, AuthorSurname
    )
    VALUES
    (
  @AuthorName,
    @AuthorSurame
    )
GO


-- EXECUTE AddBook N'Название книги', 2, '0123456789', 2019
-- GO

CREATE PROCEDURE GetBookYears
    @minYear INT OUTPUT,
    @maxYear INT OUTPUT
AS
SELECT @minYear = MIN(BookYear),  @maxYear = MAX(BookYear)
FROM Books