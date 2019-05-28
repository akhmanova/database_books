-- CREATE UNIQUE INDEX AK_BookName
--   ON Books(BookName);

-- CREATE UNIQUE INDEX AK_Index
--  ON Books (BookName)
--   WITH (IGNORE_DUP_KEY = ON);
-- GO

CREATE NONCLUSTERED INDEX IX_Books
ON Books (
    BookYear DESC
)
GO

CREATE NONCLUSTERED INDEX IX_INCLUDE_BOOKS
  ON Books (BookName)
  INCLUDE (BookYear, BookISBN, BookPages);
GO

--DROP INDEX IX_Books ON Books

ALTER INDEX IX_Books ON Books
  REORGANIZE
GO

CREATE NONCLUSTERED INDEX IX_Author 
ON Authors (
    AuthorName, AuthorSurname
)
WHERE AuthorDateD IS NULL;
GO

CREATE NONCLUSTERED INDEX IX_Books_ISBN 
ON Books (
    BookName, BookISBN
)
WHERE BookISBN IS NOT NULL;
GO

CREATE NONCLUSTERED INDEX IX_Books_Year
ON Books (
    BookName, BookISBN, BookYear
)
WHERE BookYear BETWEEN 2000 AND 2015;
GO

CREATE NONCLUSTERED INDEX IX_INDEX_1
  ON Books (BookName)
WITH ( DATA_COMPRESSION = ROW );
GO
