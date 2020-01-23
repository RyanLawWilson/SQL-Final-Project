USE library_management_system;
GO

CREATE PROCEDURE dbo.uspQuestion6
AS

/* Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out. */
SELECT Name, Address, COUNT(bl.CardNo) AS 'Loans:' FROM BORROWER br
LEFT JOIN BOOK_LOANS bl ON bl.CardNo = br.CardNo
GROUP BY br.Name, br.Address
/* You can only use having with aggregate functions and it must be used after the GROUP BY */
HAVING COUNT(bl.CardNo) > 5;

GO