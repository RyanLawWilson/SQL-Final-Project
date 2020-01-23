CREATE DATABASE library_management_system;
GO

USE library_management_system;
GO

/* Need 4 */
CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(80) NOT NULL
);

/* Need 8 - at least 2 have more than 5 book loans */
CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY  (1,1),
	Name VARCHAR(60) NOT NULL,
	Address VARCHAR(80) NOT NULL,
	Phone VARCHAR(15) NOT NULL
);

/* NO CONSTRAINT SPECIFIED */
CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(60) PRIMARY KEY NOT NULL,
	Address VARCHAR(80) NOT NULL,
	Phone VARCHAR(15) NOT NULL
);

/* Need 20 - 2 books by "stephen king" in the central branch */
CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(60) NOT NULL CONSTRAINT fk_PublisherName_BOOKS FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

/* Need 10 */
CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_BookID_BOOK_AUTHORS FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(60) NOT NULL
);

/* 10 book titles for each branch and 2 copies of each of those titles. */
CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BookID_BOOK_COPIES FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID_BOOK_COPIES FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

/* Need 50 */
CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_BookID_BOOK_LOANS FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID_BOOK_LOANS FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo_BOOK_LOANS FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

INSERT INTO LIBRARY_BRANCH
	(BranchName, Address)
	VALUES
	('Central', '95 Wilson Ave. North Miami Beach, FL 33160'),
	('Sharpstown', '374 Edgefield Street Saint Johns, FL 32259'),
	('Salt Lake', '420 Randall Mill Dr. Union City, NJ 07087'),
	('Maryland', '747 Shipley Street Potomac, MD 20854')
;

INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES
	('John Wilkes Booth','16 S. Thomas Street Martinsville, VA 24112','(610) 964-7489'),
	('Joe Rogan','79 Ketch Harbour Street Dubuque, IA 52001','(401) 405-8200'),
	('John Cena','8713 Hawthorne Ave. Kansas City, MO 64151','(935) 541-7569'),
	('Captain Crunch','111 N. Arch Drive Covington, GA 30014','(483) 588-9369'),
	('Doctor Robotnik','8483 Glendale Street Lake Jackson, TX 77566','(739) 236-0063'),
	('Luke Skywalker','7560 Second Ave. Schaumburg, IL 60193','(550) 519-3414'),
	('Ben Kenobi','7012 Piper St. Ozone Park, NY 11417','(801) 495-8376'),
	('Puff the magic dragon','93 Lyme St. Flint, MI 48504','(337) 863-6357'),
	('John Wick', '123 Some Place Drive, UT 84115', '(123) 456-7890')
;

INSERT INTO PUBLISHER
	(PublisherName, Address, Phone)
	VALUES
	('Penguin Random House','635 SW. Woodside Ave. Upper Darby, PA 19082','(246) 544-2501'),
	('Hatchette Livre','7383 Oak Valley Ave. Bethpage, NY 11714','(620) 866-4173'),
	('HarperCollins','9 Windsor St. Ridgewood, NJ 07450','(882) 208-5692'),
	('Macmillan Publishers','65 Stillwater St. Schaumburg, IL 60193','(536) 581-2784'),
	('Simon & Schuster','25 Rosewood Rd. Hackettstown, NJ 07840','(245) 661-9462'),
	('McGraw-Hill Education','6 Woodland St. Des Plaines, IL 60016','(363) 236-9065'),
	('Houghton Mifflin Harcourt','7617 Rockville Lane Mansfield, MA 02048','(953) 251-6131'),
	('Pearson Education','9314 West Lakeshore St. Alliance, OH 44601','(527) 227-4197'),
	('Scholastic','650 North Nut Swamp Drive Sicklerville, NJ 08081','(798) 712-8791'),
	('Cengage Learning','815 South Golden Star Rd. Staten Island, NY 10301','(710) 459-8396'),
	('Springer Nature','8422 East Wagon Ave. Hyde Park, MA 02136','(889) 743-8328'),
	('Wiley (John Wiley & Sons)','962 Rockcrest Lane Rome, NY 13440','(904) 337-6666'),
	('Oxford University Press','942 Sunset St. Cuyahoga Falls, OH 44221','(943) 210-8793'),
	('Kodansha','372 Foxrun Street Selden, NY 11784','(743) 286-1046'),
	('Shueisha','8852 Beech Street Crown Point, IN 46307','(409) 484-4042'),
	('Grupo Santillana','564 Cambridge Street Oconomowoc, WI 53066','(565) 967-2124'),
	('Bonnier Books','8863 Aspen St. Salt Lake City, UT 84119','(358) 403-4925'),
	('Editis','531 Elm Avenue East Meadow, NY 11554','(663) 538-7477'),
	('Klett','58 Orchard Street Bemidji, MN 56601','(852) 439-6529'),
	('Egmont Books','18 Warren Rd. Asheboro, NC 27205','(919) 476-1815')
;

/* PublisherName is fk */
INSERT INTO BOOKS 
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Penguin Random House'),
	('The Shining', 'Oxford University Press'),/*stephen king*/
	('Doctor Sleep', 'Shueisha'),/*stephen king*/
	('Gone with the Wind', 'Egmont Books'),
	('War and Peace', 'Egmont Books'),
	('Song of Solomon', 'Shueisha'),
	('Ulysses', 'Egmont Books'),
	('The Shadow of the Wind', 'Wiley (John Wiley & Sons)'),
	('The Lord of the Rings', 'Penguin Random House'),
	('The Satanic Verses', 'Pearson Education'),
	('Don Quixote', 'Wiley (John Wiley & Sons)'),
	('The Golden Compass', 'Pearson Education'),
	('Catch-22', 'Oxford University Press'),
	('1984', 'Pearson Education'),
	('The Kite Runner', 'Oxford University Press'),
	('Little Women', 'Wiley (John Wiley & Sons)'),
	('The Cloud Atlas', 'Simon & Schuster'),
	('The Fountainhead', 'Simon & Schuster'),
	('The Picture of Dorian Gray', 'Grupo Santillana'),
	('Lolita', 'Simon & Schuster'),
	('The Help', 'Penguin Random House'),
	('The Liar’s Club', 'Shueisha')
;

/* BookID is fk */
/* Need 10 - 2 books by "Stephen King" */
INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(1, 'William Shakespeare'),	(1, 'Ovid'), (2, 'Stephen King'),
	(3, 'Stephen King'), (4, 'Emily Dickinson'), (5, 'H. P. Lovecraft'),
	(6, 'Leo Tolstoy'),	(7, 'Charles Dickens'),	(8, 'Milton Friedman'),
	(9, 'Abraham Lincoln'),	(10, 'Aristotle'), (11, 'Abraham Lincoln'),
	(12, 'Aristotle'), (13, 'Milton Friedman'),	(14, 'Abraham Lincoln'),
	(15, 'William Shakespeare'), (16, 'Charles Dickens'), (17, 'John Milton'),
	(18, 'Milton Friedman'), (19, 'Charles Dickens'), (20, 'William Shakespeare'),
	(21, 'Aristotle'), (22, 'Aristotle'), (22, 'John Milton'),
	(8, 'Charles Dickens'),	(14, 'John Milton'), (10, 'William Shakespeare')
;

/* BookID and BrandID are fks */
/* Each branch must have at least 10 books and 2 copies of each book */
INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	/* Central */
	(1, 1, 8), (2, 1, 3), (3, 1, 8), (5, 1, 7),
	(7, 1, 2), (9, 1, 12), (11, 1, 11), (13, 1, 6),
	(15, 1, 5), (17, 1, 4), (19, 1, 9), (21, 1, 10),
	/* Sharpstown */
	(1, 2, 2), (2, 2, 2), (3, 2, 2), (4, 2, 6),
	(6, 2, 8), (8, 2, 4), (10, 2, 5), (12, 2, 5),
	(14, 2, 3), (16, 2, 7), (18, 2, 3), (20, 2, 5),
	/* Salt Lake */
	(1, 3, 4), (2, 3, 9), (3, 3, 7), (4, 3, 3),
	(5, 3, 3), (8, 3, 4), (9, 3, 5), (12, 3, 6),
	(13, 3, 11), (16, 3, 11), (17, 3, 20), (20, 3, 3),
	/* Maryland */
	(1, 4, 7), (2, 4, 7), (3, 4, 8), (4, 4, 5),
	(5, 4, 6), (6, 4, 7), (10, 4, 5), (11, 4, 2),
	(12, 4, 4), (16, 4, 5), (17, 4, 6), (18, 4, 2)
;

/* BookId, BranchID, CarnNo are fks */
/* Need at least 2 borrowers to have more than 5 loans */
/* Need 50 loans */
INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut,	DateDue)
	VALUES
	/* John Wilkes Booth - 8 loans */
	(2, 1, 1, '2019-09-23', '2020-01-01'), (8, 1, 1, '2020-01-02', '2020-01-23'),
	(5, 1, 1, '2019-10-20', '2020-01-01'), (14, 1, 1, '2020-01-09', '2020-01-23'),
	(9, 1, 1, '2019-09-30', '2020-01-07'), (3, 1, 1, '2020-01-05', '2020-01-31'),
	(11, 1, 1, '2019-11-01', '2020-01-07'), (21, 1, 1, '2020-01-06', '2020-01-31'),
	/* Joe Rogan - 16 loans */
	(2, 2, 2, '2020-01-01', '2020-01-23'), (3, 2, 2, '2020-01-01', '2020-01-30'),
	(1, 2, 2, '2020-01-01', '2020-01-30'), (4, 2, 2, '2020-01-01', '2020-01-23'),
	(5, 3, 2, '2019-10-02', '2019-11-01'), (21, 3, 2, '2019-06-30', '2019-09-01'),
	(12, 3, 2, '2005-02-21', '2005-03-01'), (20, 4, 2, '2020-01-01', '2020-01-23'),
	(9, 4, 2, '2020-01-01', '2020-02-01'), (7, 4, 2, '2020-01-01', '2020-02-01'),
	(11, 4, 2, '2020-01-01', '2020-02-01'), (6, 4, 2, '2020-01-01', '2020-02-01'),
	(15, 4, 2, '2020-01-01', '2020-02-01'), (16, 4, 2, '2020-01-01', '2020-02-01'),
	(17, 4, 2, '2020-01-01', '2020-02-01'), (10, 4, 2, '2020-01-01', '2020-02-01'),
	/* John Cena - 2 loans */
	(10, 1, 3, '2020-01-01', '2020-02-01'), (20, 1, 3, '2020-01-02', '2020-01-23'),
	/* Captain Crunch - 6 loans */
	(1, 3, 4, '2020-01-01', '2020-01-30'), (9, 3, 4, '2020-01-01', '2020-01-23'),
	(2, 3, 4, '2020-01-01', '2020-01-30'), (10, 3, 4, '2020-01-01', '2020-01-23'),
	(3, 3, 4, '2020-01-01', '2020-01-30'), (11, 3, 4, '2020-01-01', '2020-01-23'),
	/* Doctor Robotnik - 6 loans */
	(5, 2, 5, '1975-05-08', '1975-05-15'), (6, 2, 5, '1975-05-08', '1975-05-15'),
	(7, 2, 5, '1975-05-08', '1975-05-15'), (8, 2, 5, '1975-05-08', '1975-05-15'),
	(9, 2, 5, '1975-05-08', '1975-05-15'), (10, 2, 5, '1975-05-08', '1975-05-15'), 
	/* Luke Skywalker - 4 loans */
	(7, 3, 6, '1977-08-08', '1977-08-15'), (7, 3, 6, '1977-09-09', '1977-09-22'),
	(7, 3, 6, '1977-10-10', '1977-11-05'), (7, 3, 6, '1978-01-01', '1978-02-01'),
	/* Ben Kenobi - 1 loan */
	(20, 1, 7, '1942-11-01', '1942-12-01'),
	/* Puff the magic dragon - 13 loans */
	(1, 2, 8, '2016-01-01', '2016-06-01'), (2, 2, 8, '2016-01-01', '2016-06-01'), 
	(3, 2, 8, '2016-01-01', '2016-12-31'), (4, 2, 8, '2016-01-01', '2016-12-31'),
	(1, 3, 8, '2017-01-01', '2017-06-01'), (2, 3, 8, '2017-01-01', '2017-06-01'), 
	(3, 3, 8, '2017-01-01', '2017-12-31'), (4, 3, 8, '2017-01-01', '2017-12-31'), 
	(1, 4, 8, '2018-01-01', '2018-06-01'), (2, 4, 8, '2018-01-01', '2018-06-01'), 
	(3, 4, 8, '2018-01-01', '2018-12-31'), (4, 4, 8, '2018-01-01', '2018-12-31'), 
	(1, 1, 8, '2019-01-01', '2019-06-01'), (2, 1, 8, '2019-01-01', '2019-06-01'), 
	(3, 1, 8, '2019-01-01', '2019-12-31'), (4, 1, 8, '2019-01-01', '2019-12-31'),
	(18, 1, 8, '2020-01-02', '2020-01-23')
;