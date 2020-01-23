USE library_management_system;
GO

CREATE PROCEDURE dbo.uspQuestion1
AS

/* How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */
/* Title --> BOOKS | Number_Of_Copies --> BOOK_COPIES | BranchName --> LIBRARY_BRANCH */
/* We want number of copies so let's start in BOOK_COPIES */
SELECT Number_Of_Copies FROM BOOK_COPIES bc
/* Getting the title */
INNER JOIN BOOKS bo ON bo.BookID = bc.BookID
/* Getting the branch name */
INNER JOIN LIBRARY_BRANCH lb ON lb.BranchID = bc.BranchID
WHERE bo.Title = 'The Lost Tribe' AND lb.BranchName = 'Sharpstown';

GO