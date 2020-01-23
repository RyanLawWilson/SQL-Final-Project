USE library_management_system;
GO

CREATE PROCEDURE dbo.uspQuestion5
AS

/* For each library branch, retrieve the branch name and the total number of books loaned out from that branch. */
SELECT BranchName, COUNT(bl.BranchID) AS 'Loans from Branch:' FROM LIBRARY_BRANCH lb
INNER JOIN BOOK_LOANS bl ON bl.BranchID = lb.BranchID
/* Group by takes the duplicate values and represents them as one value. */
GROUP BY BranchName;

GO

EXEC [dbo].[uspQuestion5];