USE library_management_system;
GO

CREATE PROCEDURE dbo.uspQuestion7
AS

/* For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central". */
SELECT Title, Number_Of_Copies FROM BOOKS bo
INNER JOIN BOOK_COPIES bc ON bc.BookID = bo.BookID
INNER JOIN BOOK_AUTHORS ba ON ba.BookID = bo.BookID
INNER JOIN LIBRARY_BRANCH lb ON lb.BranchID = bc.BranchID
WHERE lb.BranchName = 'Central' AND AuthorName = 'Stephen King';

GO