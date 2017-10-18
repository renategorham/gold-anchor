USE db_libraryManagementSystem;

/*Setting up publisher table*/

CREATE TABLE tbl_publisher (
	publisher_publisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(100),
	publisher_telephone VARCHAR(25)
	);

/*Setting up book table*/

CREATE TABLE tbl_book (
	book_bookID INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	book_title VARCHAR(75),
	book_publisherName VARCHAR(50) NOT NULL CONSTRAINT fk_book_publiherName FOREIGN KEY REFERENCES tbl_publisher(publisher_publisherName) ON UPDATE CASCADE ON DELETE CASCADE
	);

/*Setting up author table*/

CREATE TABLE tbl_author (
	author_bookID INT NOT NULL CONSTRAINT fk_author_bookID FOREIGN KEY REFERENCES tbl_book(book_bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	author_authorName VARCHAR(50) NOT NULL
	);

/*Setting up branch table*/

CREATE TABLE tbl_branch (
	branch_branchID INT PRIMARY KEY NOT NULL IDENTITY (100,10),
	branch_name VARCHAR(50),
	branch_address VARCHAR(75)
	);
/*Setting up borrower table*/

CREATE TABLE tbl_borrower (
	borrower_cardNum VARCHAR(8) PRIMARY KEY NOT NULL,
	borrower_name VARCHAR(50),
	borrower_address VARCHAR(50),
	borrower_telephone VARCHAR(25)
	);

/*Setting up copy table*/

CREATE TABLE tbl_copy (
	copy_bookID INT NOT NULL CONSTRAINT fk_copy_bookID FOREIGN KEY REFERENCES tbl_book(book_bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	copy_branchID INT NOT NULL CONSTRAINT fk_copy_branchID FOREIGN KEY REFERENCES tbl_branch(branch_branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	copy_qty INT NOT NULL
	);


/*Setting up loan table*/

CREATE TABLE tbl_loan (
	loan_bookID INT NOT NULL CONSTRAINT fk_loan_bookID FOREIGN KEY REFERENCES tbl_book(book_bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	loan_branchID INT NOT NULL CONSTRAINT fk_loan_branchID FOREIGN KEY REFERENCES tbl_branch(branch_branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	loan_cardNum VARCHAR(8) NOT NULL CONSTRAINT fk_borrower_cardNum FOREIGN KEY REFERENCES tbl_borrower(borrower_cardNum) ON UPDATE CASCADE ON DELETE CASCADE,
	loan_dateOut DATE NOT NULL,
	loan_dateDue DATE NOT NULL
	);

/*Publisher table records*/

INSERT INTO tbl_publisher
		(publisher_publisherName, publisher_address, publisher_telephone)
	VALUES
		('Pan Macmillan','20 New Wharf Road, London N1 9RR','+44 (0)20 7014 6000'), 
		('Simon & Schuster','1230 Avenue of the Americas, New York, NY 10020','1-866-248-3049'),
		('John Wiley & Sons','111 river Street, Hoboken NJ 07030','(201) 748-6011'),
		('Willard Grant Press','20 Providence Street, Boston MA 02116',NULL),
		('Taylor & Francis','2&4 Park Square, Milton Park, Abingdon, OX14 4RN','+44 (0) 20 7017 6000'),
		('HarperCollins','10 East 53rd Street, New York, NY 10022','212-207-7000'), 
		('Cambridge University Press','The Pitt Building, Trumpington Street, Cambridge, UK','+44 (0)1223 358331'), 
		('World Scientific','5 Toh Tuck Link, Singapore  596224','65-6466-5775'),
		('W.B. Saunders','The Curtis Center, Independence Square West, Philadelphia, PA 19106','1-800-654-2452'),
		('OReilly and Associates','101 Morris Street, Sebastopol, CA 95472','(707) 827-7000'),
		('BIS Publishers','Building Het Sieraad, Postjesweg 1, 1057 DT Amsterdam, The Netherlands','(31) 020 515 02 30'),
		('Random House','1745 Broadway, New York, NY 10019','1-212-782-9000'),
		('Holden-Day','4432 Telegraph Ave, Oakland, CA 94609',NULL),
		('Carol Publishing','600 Madison Ave., New York, NY 10022','1.201.583.6500'), 
		('Cengage Learning','20 Channel Street, Boston, MA 02210','1-800-354-9706'),
		('Princeton University Press','41 William Street, Princeton, New Jersey 08540','609-258-4900'), 
		('Elsevier','Radarweg 29, 1043 NX Amsterdam, The Netherlands','+31 20 485 3911'),
		('American Society for Microbiology','1325 Massachusetts Ave. NW, Washington, DC 20005','(202) 737-3600'),
		('Radius Press','227 E. Palace Avenue, Suite W, Santa Fe, NM 87501','505 983 4068')
;

/*Book table 
 There is a book called 'The Lost Tribe'.
  There are at least 20 books in the BOOK table*/

INSERT INTO tbl_book
		(book_title, book_publisherName)
	VALUES
		('The Lost Tribe','Pan Macmillan'),
		('Dream Catcher','Simon & Schuster'),
		('Applied Logistic Regression','John Wiley & Sons'),
		('Life in Moving Fluids','Willard Grant Press'),
		('Statistical Power Analysis for the Behavioral Sciences','Taylor & Francis'),
		('The Cartoon Guide to Statistics','HarperCollins'),
		('Stated Choice Methods','Cambridge University Press'),
		('Injection Blow Molding','Taylor & Francis'),
		('Photosynthesis','Cambridge University Press'),
		('Asset Pricing','World Scientific'),
		('Gastrointestinal Endoscopy','W.B. Saunders'),
		('Bioinformatics Computer Skills','OReilly and Associates'),
		('This Is Service Design Thinking','BIS Publishers'),
		('Quiet','Random House'),
		('Mastering the Complex Sale','John Wiley & Sons'),
		('Fresh-Water Biology','Holden-Day'),
		('Rapid Math Without a Calculator','Carol Publishing'),
		('Probability','Cengage Learning'),
		('Chance in Biology','Princeton University Press'),
		('Service Orchestration As Organization','Elsevier'),
		('Project Management','John Wiley & Sons'),
		('Molecular Biotechnology','American Society for Microbiology'),
		('Multivariate Statistical Analysis','Radius Press')
;

/*Author table
There are at least 10 authors in the BOOK_AUTHORS table
There must be at least one book written by 'Stephen King'*/

INSERT INTO tbl_author
		(author_bookID, author_authorName)
	VALUES
		(1006,'Mark Lee'),
		(1007,'Stephen King'),
		(1008,'David Hosmer, Stanley Lemeshow'),
		(1009,'Steven Vogel'),
		(1010,'Jacob Cohen'),
		(1011,'Larry Gonick, Woollcott Smith'),
		(1012,'Jordan Louviere, David Hensher, Joffre Swait'),
		(1013,'Samuel Belcher'),
		(1014,'David Hall, K. Rao'),
		(1015,'Bing Cheng, Howell Tong'),
		(1016,'Richard Kozarek'),
		(1017,'Cynthia Gibas, Per Jambeck'),
		(1018,'Jacob Schneider'),
		(1019,'Susan Cain'),
		(1020,'Jeff Thull'),
		(1021,'James Needham, Paul Needham'),
		(1022,'A. Frederick Collins'),
		(1023,'Catherine Gorini'),
		(1024,'Mark Denny, Steven Gaines'),
		(1025,'Malinda Kapuruge, Jun Han, Alan Colman'),
		(1026,'Jack Meredith, Samuel Mantel'),
		(1027,'Bernard Glick, Jack Pasternak'),
		(1028,'Sam Kash Kachigan')
;

/*Borrower table, card number is a unique 8 digit alpha-numeric
 There are at least 8 borrowers in the BORROWER table*/

INSERT INTO tbl_borrower
		(borrower_cardNum, borrower_name, borrower_address, borrower_telephone)
	VALUES
		('rgd4mz5d','Myles Milstead','4124 SE Salmon St, Portland, OR 97214','503-849-4520'),
		('4966uhhw','Faye Febus','1029 SE 44th Ave, Portland, OR 97215','503-821-1235'),
		('p7hcl9t7','Rick Ravenscroft','615 SE 37th Ave, Portland, OR 97214','503-794-0475'),
		('qcp2ggna','Ivy Izquierdo','5615 SE 46th Ave, Portland, OR 97206','503-915-0766'),
		('wxxtlz4f','Demetrius Degraw','3133 SE Claybourne St, Portland, OR 97202','503-310-6179'),
		('7p3fnvnq','Illa Isaac','2480 NW Raleigh St, Portland, OR 97210','503-451-6868'),
		('w86czdfw','Marcia Magness','1311 NW 24th Ave, Portland, OR 97210','503-816-6958'),
		('d9cv8jk2','Jarred Jayne','1251 SW Texas St, Portland, OR 97219','503-824-0210'),
		('zxyssdaa','Jaye Jovel','6800 SW 11th Dr, Portland, OR 97219','503-808-9557'),
		('4uabnfwn','Dalton Dinardo','1441 SW Harrison St, Portland, OR 97201','503-162-0004')
;

/*Branch table
There is a library branch called 'Sharpstown' and one called 'Central'
There are at least 4 branches in the LIBRARY_BRANCH table*/
		
INSERT INTO tbl_branch
		(branch_name, branch_address)
	VALUES
		('Sharpstown','2300 NW Thurman St, Portland, OR 97210'),
		('Central','801 SW 10th Ave, Portland, OR 97205'),
		('Sunnyside','1038 SE Cesar Estrada Chavez Blvd, Portland, OR 97214'),
		('Woodstock','6008 SE 49th Ave, Portland, OR 97206'), 
		('Hillsdale','1525 SW Sunset Blvd, Portland, OR 97239')
;

/*number of copies table
 Each library branch has at least 10 book titles, and at least two copies of each of those titles*/


INSERT INTO tbl_copy
		(copy_bookID, copy_branchID, copy_qty)
	VALUES
		(1006,	170,	6),
		(1007,	170,	3),
		(1008,	170,	5),
		(1009,	170,	0),
		(1010,	170,	0),
		(1011,	170,	0),
		(1012,	170,	6),
		(1013,	170,	0),
		(1014,	170,	6),
		(1015,	170,	6),
		(1016,	170,	0),
		(1017,	170,	0),
		(1018,	170,	0),
		(1019,	170,	5),
		(1020,	170,	0),
		(1021,	170,	0),
		(1022,	170,	6),
		(1023,	170,	3),
		(1024,	170,	0),
		(1025,	170,	0),
		(1026,	170,	6),
		(1027,	170,	6),
		(1028,	170,	4),
		(1006,	160,	4),
		(1007,	160,	6),
		(1008,	160,	3),
		(1009,	160,	3),
		(1010,	160,	6),
		(1011,	160,	0),
		(1012,	160,	3),
		(1013,	160,	0),
		(1014,	160,	0),
		(1015,	160,	3),
		(1016,	160,	0),
		(1017,	160,	4),
		(1018,	160,	6),
		(1019,	160,	0),
		(1020,	160,	0),
		(1021,	160,	0),
		(1022,	160,	3),
		(1023,	160,	0),
		(1024,	160,	6),
		(1025,	160,	0),
		(1026,	160,	0),
		(1027,	160,	4),
		(1028,	160,	4),
		(1006,	150,	0),
		(1007,	150,	0),
		(1008,	150,	5),
		(1009,	150,	3),
		(1010,	150,	6),
		(1011,	150,	0),
		(1012,	150,	4),
		(1013,	150,	6),
		(1014,	150,	5),
		(1015,	150,	3),
		(1016,	150,	4),
		(1017,	150,	0),
		(1018,	150,	0),
		(1019,	150,	6),
		(1020,	150,	4),
		(1021,	150,	0),
		(1022,	150,	0),
		(1023,	150,	3),
		(1024,	150,	0),
		(1025,	150,	0),
		(1026,	150,	3),
		(1027,	150,	0),
		(1028,	150,	0),
		(1006,	140,	0),
		(1007,	140,	4),
		(1008,	140,	0),
		(1009,	140,	4),
		(1010,	140,	0),
		(1011,	140,	4),
		(1012,	140,	5),
		(1013,	140,	0),
		(1014,	140,	0),
		(1015,	140,	0),
		(1016,	140,	4),
		(1017,	140,	0),
		(1018,	140,	0),
		(1019,	140,	0),
		(1020,	140,	3),
		(1021,	140,	4),
		(1022,	140,	5),
		(1023,	140,	0),
		(1024,	140,	4),
		(1025,	140,	5),
		(1026,	140,	6),
		(1027,	140,	5),
		(1028,	140,	0),
		(1006,	130,	5),
		(1007,	130,	0),
		(1008,	130,	0),
		(1009,	130,	6),
		(1010,	130,	3),
		(1011,	130,	0),
		(1012,	130,	0),
		(1013,	130,	4),
		(1014,	130,	6),
		(1015,	130,	0),
		(1016,	130,	5),
		(1017,	130,	3),
		(1018,	130,	4),
		(1019,	130,	0),
		(1020,	130,	0),
		(1021,	130,	0),
		(1022,	130,	4),
		(1023,	130,	3),
		(1024,	130,	0),
		(1025,	130,	0),
		(1026,	130,	5),
		(1027,	130,	0),
		(1028,	130,	0)	
;			 

/*loan book table
at least 2 of those borrowers have more than 5 books loaned to them
There are at least 50 loans in the BOOK_LOANS table.*/

INSERT INTO tbl_loan
		(loan_bookID, loan_branchID, loan_cardNum, loan_dateOut, loan_dateDue)
	VALUES
		(1012,150,'rgd4mz5d','2017-10-03','2017-10-31'),
		(1006,150,'rgd4mz5d','2017-09-15','2017-10-13'),
		(1007,150,'rgd4mz5d','2017-09-20','2017-10-18'),
		(1015,150,'rgd4mz5d','2017-10-04','2017-11-01'),
		(1026,150,'rgd4mz5d','2017-10-16','2017-11-13'),
		(1027,150,'rgd4mz5d','2017-10-16','2017-11-13'),
		(1016,150,'rgd4mz5d','2017-10-03','2017-10-31'),
		(1015,150,'rgd4mz5d','2017-09-15','2017-10-13'),
		(1007,150,'4966uhhw','2017-09-14','2017-10-12'),
		(1027,150,'4966uhhw','2017-09-14','2017-10-12'),
		(1025,150,'4966uhhw','2017-09-14','2017-10-12'),
		(1008,150,'p7hcl9t7','2017-10-07','2017-11-04'),
		(1010,150,'p7hcl9t7','2017-10-07','2017-11-04'),
		(1012,150,'p7hcl9t7','2017-10-07','2017-11-04'),
		(1015,150,'p7hcl9t7','2017-10-07','2017-11-04'),
		(1027,150,'p7hcl9t7','2017-10-14','2017-11-11'),
		(1020,150,'p7hcl9t7','2017-10-14','2017-11-11'),
		(1017,150,'p7hcl9t7','2017-10-14','2017-11-11'),
		(1014,160,'qcp2ggna','2017-09-23','2017-10-21'),
		(1016,160,'qcp2ggna','2017-09-23','2017-10-21'),
		(1007,160,'wxxtlz4f','2017-09-15','2017-10-13'),
		(1026,160,'wxxtlz4f','2017-09-15','2017-10-13'),
		(1023,160,'wxxtlz4f','2017-09-15','2017-10-13'),
		(1017,160,'wxxtlz4f','2017-10-02','2017-10-30'),
		(1006,160,'wxxtlz4f','2017-10-02','2017-10-30'),
		(1013,160,'wxxtlz4f','2017-10-02','2017-10-30'),
		(1027,160,'wxxtlz4f','2017-10-17','2017-11-14'),
		(1008,160,'wxxtlz4f','2017-10-17','2017-11-14'),
		(1012,160,'wxxtlz4f','2017-10-17','2017-11-14'),
		(1011,130,'7p3fnvnq','2017-10-05','2017-11-02'),
		(1022,130,'7p3fnvnq','2017-10-05','2017-11-02'),
		(1010,130,'7p3fnvnq','2017-10-05','2017-11-02'),
		(1007,130,'7p3fnvnq','2017-10-05','2017-11-02'),
		(1017,130,'7p3fnvnq','2017-10-05','2017-11-02'),
		(1026,130,'w86czdfw','2017-10-06','2017-11-03'),
		(1020,130,'w86czdfw','2017-10-06','2017-11-03'),
		(1021,130,'w86czdfw','2017-10-06','2017-11-03'),
		(1022,170,'d9cv8jk2','2017-09-25','2017-10-23'),
		(1015,170,'d9cv8jk2','2017-10-08','2017-11-05'),
		(1006,170,'d9cv8jk2','2017-10-08','2017-11-05'),
		(1013,170,'zxyssdaa','2017-10-15','2017-11-12'),
		(1020,170,'zxyssdaa','2017-10-15','2017-11-12'),
		(1014,170,'zxyssdaa','2017-10-15','2017-11-12'),
		(1015,140,'4uabnfwn','2017-10-08','2017-11-05'),
		(1020,140,'4uabnfwn','2017-10-08','2017-11-05'),
		(1014,140,'4uabnfwn','2017-10-08','2017-11-05'),	
		(1025,140,'4uabnfwn','2017-10-08','2017-11-05'),
		(1018,140,'4uabnfwn','2017-10-15','2017-11-12'),
		(1014,140,'4uabnfwn','2017-10-15','2017-11-12'),
		(1017,140,'4uabnfwn','2017-10-15','2017-11-12')
;

/* How many copies of the book titled "The Lost Tribe" 
are owned by the library branch whose name is "Sharpstown"?*/

SELECT copy_qty AS 'Number of Copies' FROM tbl_copy
	JOIN tbl_book ON tbl_copy.copy_bookID=tbl_book.book_bookID
	JOIN tbl_branch ON tbl_copy.copy_branchID=tbl_branch.branch_branchID
	WHERE book_title='The Lost tribe'
	AND branch_name='Sharpstown'
;

/* How many copies of the book titled "The Lost Tribe" 
are owned by each library branch?*/

SELECT branch_name AS 'Branch', copy_qty 'Copies'  FROM tbl_branch
	JOIN tbl_copy ON tbl_branch.branch_branchID=tbl_copy.copy_branchID
	JOIN tbl_book ON tbl_copy.copy_bookID=tbl_book.book_bookID
	WHERE book_title='The Lost tribe'
;

/*Retrieve the names of all borrowers who do not have any books checked out.*/

SELECT DISTINCT borrower_name FROM tbl_borrower
	JOIN tbl_loan ON tbl_borrower.borrower_cardNum=tbl_loan.loan_cardNum
	WHERE loan_dateDue < GETDATE()
;

/*For each book that is loaned out from the "Sharpstown" 
branch and whose DueDate is today, retrieve the book title, 
the borrower's name, and the borrower's address.*/

SELECT DISTINCT book_title AS 'Book', borrower_name AS'Borrower', borrower_address AS 'Address' FROM tbl_borrower
	JOIN tbl_loan ON tbl_borrower.borrower_cardNum=tbl_loan.loan_cardNum
	JOIN tbl_book ON tbl_loan.loan_bookID=tbl_book.book_bookID
	WHERE loan_dateDue=GETDATE()
;

/*For each library branch, retrieve the branch name and 
the total number of books currently loaned out from that branch*/

SELECT branch_name AS 'Branch', COUNT(loan_dateDue) AS 'Books' FROM tbl_branch
	JOIN tbl_loan ON branch_branchID=loan_branchID
	WHERE loan_dateDue > GETDATE()
	GROUP BY	tbl_branch.branch_name	
;



/*Retrieve the names, addresses, and number of books checked out 
for all borrowers who have more than five books checked out.*/

SELECT borrower_name, borrower_address, COUNT(borrower_cardNum) FROM tbl_borrower
	JOIN tbl_loan ON tbl_loan.loan_cardNum=tbl_borrower.borrower_cardNum
	GROUP BY tbl_borrower.borrower_name, tbl_borrower.borrower_address, tbl_loan.loan_dateDue
	HAVING tbl_loan.loan_dateDue > GETDATE() AND COUNT(borrower_cardNum) > 5
;

/*For each book authored (or co-authored) by "Stephen King", 
retrieve the title and the number of copies owned by the library 
branch whose name is "Central"*/

SELECT book_title, copy_qty FROM tbl_book
	JOIN tbl_author ON tbl_author.author_bookID=tbl_book.book_bookID
	JOIN tbl_copy ON tbl_copy.copy_bookID=tbl_book.book_bookID
	JOIN tbl_branch ON tbl_branch.branch_branchID=tbl_copy.copy_branchID

	WHERE author_authorName='Stephen King' AND branch_name='Central'
;
	

	