-- 1

-- Inner join
SELECT * FROM Books INNER JOIN Authors
ON Books.AuthorId =  Authors.AuthorId
GO

-- -- Outer join
SELECT a.AuthorName, a.AuthorSurname 
FROM Authors a 
LEFT OUTER JOIN Books b ON a.AuthorId = b.AuthorId

-- Cross join
SELECT * FROM Books CROSS JOIN Authors

-- Cross apply
SELECT * 
FROM Books b1 
CROSS APPLY (
    SELECT MAX(BookYear) max_year FROM Books b2 
    JOIN Authors a ON a.AuthorId = b2.AuthorId
    WHERE b1.AuthorId = (SELECT a2.AuthorId FROM Authors a2 WHERE a2.AuthorId = b1.AuthorId )
) X;


-- Between
SELECT * FROM Books 
WHERE BookYear BETWEEN 2000 AND 2015

-- Exist
Select *
FROM Authors AS a 
WHERE EXISTS 
(SELECT * 
    FROM Books as b
    WHERE a.AuthorId = b.AuthorId
)
GO

-- IN
SELECT * FROM Books b 
JOIN Authors a 
On a.AuthorId = b.AuthorId 
WHERE b.BookName IN (
    N'Computer Networks', N'The Help'
);

-- SOME ANY
IF 6 < SOME (SELECT AuthorId FROM Authors)
    PRINT 'TRUE'
ELSE
    PRINT 'FALSE';

-- LIKE 
SELECT * FROM Books b 
INNER JOIN Authors a 
ON a.AuthorId = b.AuthorId 
WHERE a.AuthorSurname NOT LIKE 'Stok%'

-- CAST 
SELECT 9.5 AS Original,
       CAST(9.5 AS INT) AS [int],
       CAST(9.5 AS DECIMAL(6, 4)) AS [decimal];

-- CONVERT
SELECT 9.5 AS Original,
       CONVERT(INT, 9.5) AS [int],
       CONVERT(DECIMAL(6, 4), 9.5) AS [decimal];

-- NULL
SELECT AuthorSurname
FROM Authors a 
WHERE UniversityId IS NULL

-- Case
SELECT *
FROM Books
ORDER BY CASE Books.BookYear WHEN 1 THEN BookYear END DESC,
CASE WHEN Books.BookId > 1 THEN BookId END;

--COALESCE
SELECT BookISBN, BookName, 
COALESCE (BookISBN, BookName) as all_needed
FROM Books

-- UPPER
SELECT UPPER(BookName) 
FROM BOOKS

-- LOWER
SELECT LOWER(BookName) 
FROM BOOKS

-- STR
SELECT LOWER(BookName), STR(BookId)
FROM BOOKS

-- DATE
SELECT SYSDATETIME() AS [SYSDATETIME()]  
    ,SYSDATETIMEOFFSET() AS [SYSDATETIMEOFFSET()]  
    ,SYSUTCDATETIME() AS [SYSUTCDATETIME()]  
    ,CURRENT_TIMESTAMP AS [CURRENT_TIMESTAMP]  
    ,GETDATE() AS [GETDATE()]  
    ,GETUTCDATE() AS [GETUTCDATE()];  

-- HAVING
SELECT BookId
FROM Books 
GROUP BY BookId
HAVING SUM(BookId) < 100

