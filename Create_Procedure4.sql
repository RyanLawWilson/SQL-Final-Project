USE library_management_system;
GO

CREATE PROCEDURE dbo.uspQuestion4
AS

/* For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. */
SELECT Title, br.Name, br.Address FROM BOOK_LOANS bl
INNER JOIN BORROWER br ON br.CardNo = bl.CardNo
INNER JOIN LIBRARY_BRANCH lb ON lb.BranchID = bl.BranchID
INNER JOIN BOOKS bo ON bo.BookID = bl.BookID
/* SYSDATETIME returns the time with hours, minutes, etc.  I'm making sure it returns as a varchar with only the first 10 characters: YYYY-MM-DD*/
WHERE BranchName = 'Sharpstown' AND DateDue = CAST(SYSDATETIME() AS VARCHAR(10));

Go