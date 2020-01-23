USE library_management_system;
GO

CREATE PROCEDURE dbo.uspQuestion2
AS

/* How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
SELECT lb.BranchName AS 'Branch Name:', Number_Of_Copies AS 'The Lost Tribe' FROM BOOK_COPIES bc
INNER JOIN BOOKS bo ON bo.BookID = bc.BookID
INNER JOIN LIBRARY_BRANCH lb ON lb.BranchID = bc.BranchID
WHERE bo.Title = 'The Lost Tribe';

GO