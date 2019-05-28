CREATE VIEW BOOKS_ENC
WITH ENCRYPTION
AS
    Select *
    FROM Authors AS a 
    WHERE EXISTS 
    (SELECT * 
        FROM Books as b
        WHERE a.AuthorId = b.AuthorId
    )

GO

--Set the options to support indexed views.  
SET NUMERIC_ROUNDABORT OFF;  
SET ANSI_PADDING, ANSI_WARNINGS,
    CONCAT_NULL_YIELDS_NULL, ARITHABORT,  
    QUOTED_IDENTIFIER, ANSI_NULLS ON; 
-- Between
GO
CREATE VIEW BOOKS_BETWEEN
AS
    SELECT * FROM Books b 
    JOIN Authors a 
    On a.AuthorId = b.AuthorId 
    WHERE b.BookName IN (
        N'Computer Networks', N'The Help'
    );
GO

 