USE library_management_system;
GO

ALTER PROCEDURE dbo.uspQuestion3
AS

/* Retrieve the names of all borrowers who do not have any books checked out. */

/* Compare the CardNo from BOOK_LOANS and BORROWER to find anyone that doesn't have a loan. */
SELECT br.Name FROM BOOK_LOANS bl
FULL OUTER JOIN BORROWER br ON br.CardNo = bl.CardNo
WHERE bl.CardNo IS NULL;

GO
