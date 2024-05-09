-- First, we create the tables based on the ER Model we designed in the previous exercise.

CREATE TABLE Reader (
   	Reader_ID INT PRIMARY KEY,
    	Name VARCHAR(50),
    	Address VARCHAR(100),
    	Birth_Date DATE,
    	Birth_Town VARCHAR(20),
    	Phone VARCHAR(20),
    	Email VARCHAR(50),
    	Education_Level VARCHAR(50), 
    	Relative_contact_info VARCHAR(50)
);

CREATE TABLE Book (
    	Book_ID INT PRIMARY KEY,
    	Title VARCHAR(100),
    	Publishing_House VARCHAR(100),
    	Nr_copies INT, 
    	Shelf_position VARCHAR(50)
);

create table Library (
	Library_ID INT primary key,
	Reader_ID INT,
	library_Adress Varchar (100),
	Book_ID INT, 
	FOREIGN KEY (Reader_ID) REFERENCES Reader(Reader_ID),
    	FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

CREATE TABLE Author (
    	Author_ID INT PRIMARY KEY,
    	Author_Name VARCHAR(50),
    	Book_ID INT,
    	FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

CREATE TABLE Loan (
    	Loan_ID INT PRIMARY KEY,
    	Reader_ID INT,
    	Book_ID INT,
    	Loan_status bool,
    	Library_ID INT,
    	Date_Taken timestamp,
    	Date_Returned timestamp,
    	Late_Fee DECIMAL(10, 2),
    	FOREIGN KEY (Reader_ID) REFERENCES Reader(Reader_ID),
    	FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID), 
    	FOREIGN KEY (Library_ID) REFERENCES Library(Library_ID)
);

CREATE TABLE Book_Classification (
	Book_ID INT primary key,
    	Genre_Name VARCHAR(50),
    	Subgenre_Name VARCHAR(50), 
    	Index_Keyword Varchar (50),
    	FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);


------------------------------------------------------------------------- INSERT DATA -------------------------------------------------------------------------


-- Insert data into Reader table
INSERT INTO Reader (Reader_ID, Name, Address, Birth_Date, Birth_Town, Phone, Email, Education_Level, Relative_contact_info) VALUES
(1, 'John Smith', '123 Main St, Anytown, USA', '1985-05-10', 'Smallville', '555-1234', 'john@example.com', 'Bachelor''s Degree', 'Jane Smith - 555-5678'),
(2, 'Alice Johnson', '456 Elm St, Othertown, USA', '1990-09-15', 'Bigcity', '555-5678', 'alice@example.com', 'Master''s Degree', 'Bob Johnson - 555-9876'),
(3, 'Michael Brown', '789 Oak St, Anycity, USA', '1988-03-20', 'Hometown', '555-8765', 'michael@example.com', 'Associate Degree', 'Sarah Brown - 555-5432'),
(4, 'Emily Davis', '321 Pine St, Smalltown, USA', '1995-07-25', 'Villagetown', '555-2345', 'emily@example.com', 'High School Diploma', 'David Davis - 555-6543'),
(5, 'Jessica Wilson', '654 Maple St, Largetown, USA', '1980-12-30', 'Mediumville', '555-3456', 'jessica@example.com', 'Doctorate Degree', 'Jack Wilson - 555-8765'),
(6, 'Christopher Lee', '987 Birch St, Newcity, USA', '1976-01-05', 'Townville', '555-4567', 'chris@example.com', 'Bachelor''s Degree', 'Rachel Lee - 555-2345'),
(7, 'Sarah Martinez', '147 Walnut St, Oldtown, USA', '1992-04-12', 'Hometown', '555-5432', 'sarah@example.com', 'Master''s Degree', 'Carlos Martinez - 555-8765'),
(8, 'Daniel Taylor', '258 Cedar St, Anytown, USA', '1983-08-18', 'Villageville', '555-6789', 'daniel@example.com', 'Associate Degree', 'Sophia Taylor - 555-3456'),
(9, 'Jennifer Garcia', '369 Pine St, Littletown, USA', '1978-02-25', 'Townsville', '555-7890', 'jennifer@example.com', 'High School Diploma', 'Ethan Garcia - 555-4567'),
(10, 'David Rodriguez', '123 Oak St, Bigtown, USA', '1986-06-30', 'Smallville', '555-8901', 'david@example.com', 'Doctorate Degree', 'Isabella Rodriguez - 555-6789'),
(11, 'Melissa Hernandez', '456 Maple St, Largetown, USA', '1991-10-15', 'Hometown', '555-9012', 'melissa@example.com', 'Bachelor''s Degree', 'Noah Hernandez - 555-7890'),
(12, 'Andrew Lopez', '789 Cedar St, Newcity, USA', '1989-04-20', 'Villagetown', '555-0123', 'andrew@example.com', 'Master''s Degree', 'Ava Lopez - 555-9012'),
(13, 'Megan Gonzalez', '654 Elm St, Othertown, USA', '1984-11-25', 'Mediumville', '555-1234', 'megan@example.com', 'Associate Degree', 'Liam Gonzalez - 555-0123'),
(14, 'Kevin Perez', '987 Walnut St, Anycity, USA', '1979-05-31', 'Townsville', '555-2345', 'kevin@example.com', 'High School Diploma', 'Olivia Perez - 555-1234'),
(15, 'Amanda Sanchez', '147 Pine St, Bigcity, USA', '1975-01-05', 'Smalltown', '555-3456', 'amanda@example.com', 'Doctorate Degree', 'Lucas Sanchez - 555-2345'),
(16, 'Justin Torres', '258 Oak St, Mediumtown, USA', '1993-06-12', 'Hometown', '555-4567', 'justin@example.com', 'Bachelor''s Degree', 'Mia Torres - 555-3456'),
(17, 'Rachel Flores', '369 Cedar St, Largetown, USA', '1981-10-20', 'Villageville', '555-5678', 'rachel@example.com', 'Master''s Degree', 'Elijah Flores - 555-4567'),
(18, 'Ryan Rivera', '123 Elm St, Newcity, USA', '1987-02-15', 'Smallville', '555-6789', 'ryan@example.com', 'Associate Degree', 'Avery Rivera - 555-5678'),
(19, 'Nicole Cruz', '456 Walnut St, Anytown, USA', '1982-07-31', 'Hometown', '555-7890', 'nicole@example.com', 'High School Diploma', 'Jackson Cruz - 555-6789'),
(20, 'Brandon Ramirez', '789 Pine St, Bigcity, USA', '1977-03-05', 'Mediumtown', '555-8901', 'brandon@example.com', 'Doctorate Degree', 'Charlotte Ramirez - 555-7890');

-- Insert data into Book table
INSERT INTO Book (Book_ID, Title, Publishing_House, Nr_copies, Shelf_position) 
VALUES 
(1, 'The Great Gatsby', 'Penguin', 3, 'A1'),
(2, 'To Kill a Mockingbird', 'HarperCollins', 2, 'B2'),
(3, 'Harry Potter and the Sorcerer''s Stone', 'Scholastic', 5, 'C3'),
(4, '1984', 'Penguin', 1, 'D4'),
(5, 'Pride and Prejudice', 'Random House', 4, 'E5'),
(6, 'The Catcher in the Rye', 'Little, Brown and Company', 3, 'F6'),
(7, 'The Hobbit', 'Houghton Mifflin Harcourt', 2, 'G7'),
(8, 'The Lord of the Rings', 'Houghton Mifflin Harcourt', 5, 'H8'),
(9, 'Animal Farm', 'Penguin', 1, 'I9'),
(10, 'Brave New World', 'Harper & Brothers', 4, 'J10'),
(11, 'The Odyssey', 'Oxford University Press', 3, 'K11'),
(12, 'Moby-Dick', 'Harper & Brothers', 2, 'L12'),
(13, 'War and Peace', 'Gutenberg', 5, 'M13'),
(14, 'The Adventures of Huckleberry Finn', 'Chatto & Windus', 1, 'N14'),
(15, 'The Grapes of Wrath', 'Viking Press', 4, 'O15'),
(16, 'Crime and Punishment', 'The Russian Messenger', 3, 'P16'),
(17, 'The Great Expectations', 'Chapman & Hall', 2, 'Q17'),
(18, 'Don Quixote', 'Francisco de Robles', 5, 'R18'),
(19, 'The Brothers Karamazov', 'The Russian Messenger', 1, 'S19'),
(20, 'Jane Eyre', 'Smith, Elder & Co.', 4, 'T20');

-- Insert data into Author table
INSERT INTO Author (Author_ID, Author_Name, Book_ID) 
VALUES 
(1, 'F. Scott Fitzgerald', 1),
(2, 'Harper Lee', 2),
(3, 'J.K. Rowling', 3),
(4, 'George Orwell', 4),
(5, 'Jane Austen', 5),
(6, 'J.D. Salinger', 6),
(7, 'J.R.R. Tolkien', 7),
(8, 'J.R.R. Tolkien', 8),
(9, 'George Orwell', 9),
(10, 'Aldous Huxley', 10),
(11, 'Homer', 11),
(12, 'Herman Melville', 12),
(13, 'Leo Tolstoy', 13),
(14, 'Mark Twain', 14),
(15, 'John Steinbeck', 15),
(16, 'Fyodor Dostoevsky', 16),
(17, 'Charles Dickens', 17),
(18, 'Miguel de Cervantes', 18),
(19, 'Fyodor Dostoevsky', 19),
(20, 'Charlotte Bronte', 20);

-- Insert data into Library table
INSERT INTO Library (Library_ID, Reader_ID, library_Adress, Book_ID)
VALUES
(1, 1, 'Via Giuseppe Frua 21', 1),
(2, 2, 'Ibsen 6445 Las Condes', 2),
(3, 3, 'Via Commerio 234', 3),
(4, 4, 'Julio Fosa 633', 4),
(5, 5, 'Corso XXV Aprile 758', 5),
(6, 6, 'Maple Street 456', 6),
(7, 7, 'Walnut Avenue 789', 7),
(8, 8, 'Cedar Lane 147', 8),
(9, 9, 'Pine Road 258', 9),
(10, 10, 'Oak Drive 369', 10),
(11, 11, 'Elm Court 123', 11),
(12, 12, 'Cedar Lane 789', 12),
(13, 13, 'Elm Street 654', 13),
(14, 14, 'Walnut Avenue 987', 14),
(15, 15, 'Pine Street 147', 15),
(16, 16, 'Oak Street 258', 16),
(17, 17, 'Cedar Street 369', 17),
(18, 18, 'Elm Street 123', 18),
(19, 19, 'Walnut Street 456', 19),
(20, 20, 'Pine Street 789', 20);

-- Insert data into Loan table
INSERT INTO Loan (Loan_ID, Reader_ID, Book_ID, Library_ID, Loan_status, Date_Taken, Date_Returned, Late_Fee) 
VALUES 
(1, 1, 1, 1, true, '2024-03-01 10:00:00', '2024-03-15 10:00:00', 0),
(2, 2, 2, 1, true, '2024-03-02 09:00:00', '2024-03-14 09:00:00', 0),
(3, 3, 3, 2, true, '2024-03-03 08:00:00', NULL, NULL),
(4, 4, 4, 4, false, '2024-03-04 07:00:00', NULL, NULL),
(5, 5, 5, 5, true, '2024-03-05 06:00:00', '2024-03-13 06:00:00', 0),
(6, 6, 6, 6, true, '2024-03-06 10:00:00', NULL, NULL),
(7, 7, 7, 3, true, '2024-03-07 09:00:00', '2024-03-21 09:00:00', 0),
(8, 8, 8, 4, true, '2024-03-08 08:00:00', '2024-03-20 08:00:00', 0),
(9, 9, 9, 6,  false, '2024-03-09 07:00:00', NULL, NULL),
(10, 10, 10, 7, true, '2024-03-10 06:00:00', '2024-03-18 06:00:00', 0),
(11, 11, 11, 8, true, '2024-03-11 10:00:00', NULL, NULL),
(12, 12, 12, 9, true, '2024-03-12 09:00:00', '2024-03-16 09:00:00', 0),
(13, 13, 13, 10, true, '2024-03-13 08:00:00', '2024-03-15 08:00:00', 0),
(14, 14, 14, 11, false, '2024-03-14 07:00:00', NULL, NULL),
(15, 15, 15, 12, true, '2024-03-15 06:00:00', '2024-03-19 06:00:00', 0),
(16, 16, 16, 16, true, '2024-03-16 10:00:00', NULL, NULL),
(17, 17, 17, 19, true, '2024-03-17 09:00:00', '2024-03-23 09:00:00', 0),
(18, 18, 18, 20, true, '2024-03-18 08:00:00', '2024-03-22 08:00:00', 0),
(19, 19, 19, 11, false, '2024-03-19 07:00:00', NULL, NULL),
(20, 20, 20, 9, true, '2024-03-20 06:00:00', '2024-03-24 06:00:00', 0),
(21, 1, 2, 2, true, '2024-03-21 10:00:00', '2024-03-30 10:00:00', 0),
(22, 2, 3, 3, true, '2024-03-22 09:00:00', NULL, NULL),
(23, 3, 4, 4, true, '2024-03-23 08:00:00', NULL, NULL),
(24, 4, 5, 5, true, '2024-03-24 07:00:00', '2024-04-02 07:00:00', 0),
(25, 5, 6, 6, true, '2024-03-25 06:00:00', NULL, NULL),
(26, 6, 7, 7, true, '2024-03-26 10:00:00', '2024-04-03 10:00:00', 0),
(27, 7, 8, 8, true, '2024-03-27 09:00:00', '2024-04-04 09:00:00', 0),
(28, 8, 9, 9, true, '2024-03-28 08:00:00', '2024-04-05 08:00:00', 0),
(29, 9, 10, 10, true, '2024-03-29 07:00:00', NULL, NULL),
(30, 10, 11, 11, true, '2024-03-30 06:00:00', '2024-04-07 06:00:00', 0),
(31, 11, 12, 12, true, '2024-03-31 10:00:00', NULL, NULL),
(32, 12, 13, 13, true, '2024-04-01 09:00:00', '2024-04-09 09:00:00', 0),
(33, 13, 14, 14, true, '2024-04-02 08:00:00', NULL, NULL),
(34, 14, 15, 15, true, '2024-04-03 07:00:00', '2024-04-11 07:00:00', 0),
(35, 15, 16, 16, true, '2024-04-04 06:00:00', '2024-04-12 06:00:00', 0),
(36, 16, 17, 17, true, '2024-04-05 10:00:00', NULL, NULL),
(37, 17, 18, 18, true, '2024-04-06 09:00:00', '2024-04-14 09:00:00', 0),
(38, 18, 19, 19, true, '2024-04-07 08:00:00', NULL, NULL),
(39, 19, 20, 20, true, '2024-04-08 07:00:00', '2024-04-16 07:00:00', 0),
(40, 20, 1, 1, true, '2024-04-09 06:00:00', NULL, NULL),
(41, 1, 2, 2, true, '2024-04-10 10:00:00', '2024-04-18 10:00:00', 0),
(42, 2, 3, 3, true, '2024-04-11 09:00:00', NULL, NULL),
(43, 3, 4, 4, true, '2024-04-12 08:00:00', '2024-04-20 08:00:00', 0),
(44, 4, 5, 5, true, '2024-04-13 07:00:00', NULL, NULL),
(45, 5, 6, 6, true, '2024-04-14 06:00:00', '2024-04-22 06:00:00', 0),
(46, 6, 7, 7, true, '2024-04-15 10:00:00', NULL, NULL),
(47, 7, 8, 8, true, '2024-04-16 09:00:00', '2024-04-24 09:00:00', 0),
(48, 8, 9, 9, true, '2024-04-17 08:00:00', NULL, NULL),
(49, 9, 10, 10, true, '2024-04-18 07:00:00', '2024-04-26 07:00:00', 0),
(50, 10, 11, 11, true, '2024-04-19 06:00:00', NULL, NULL);

-- Insert data into Book_Classification table
INSERT INTO Book_Classification (Book_ID, Genre_Name, Subgenre_Name, Index_Keyword) 
VALUES 
(1, 'Fiction', 'Classic', 'Literature'),
(2, 'Fiction', 'Legal', 'Literature'),
(3, 'Fantasy', 'Adventure', 'Fiction'),
(4, 'Science Fiction', 'Dystopian', 'Fiction'),
(5, 'Romance', 'Regency', 'Literature'),
(6, 'Fiction', 'Coming-of-Age', 'Literature'),
(7, 'Fantasy', 'Adventure', 'Fiction'),
(8, 'Fantasy', 'High Fantasy', 'Fiction'),
(9, 'Science Fiction', 'Allegory', 'Fiction'),
(10, 'Science Fiction', 'Dystopian', 'Fiction'),
(11, 'Epic Poetry', 'Ancient Greek Literature', 'Poetry'),
(12, 'Adventure', 'Sea Story', 'Fiction'),
(13, 'Historical Fiction', 'War', 'Fiction'),
(14, 'Adventure', 'Picaresque', 'Fiction'),
(15, 'Social Realism', 'Great Depression', 'Fiction'),
(16, 'Philosophical Fiction', 'Crime', 'Fiction'),
(17, 'Realism', 'Social Critique', 'Fiction'),
(18, 'Satire', 'Adventure', 'Fiction'),
(19, 'Philosophical Fiction', 'Existential', 'Fiction'),
(20, 'Gothic Fiction', 'Romantic', 'Literature');

----------------------------------------------------------------------------- QUERY -----------------------------------------------------------------------------

-- Books Usage 

SELECT b.Title, COUNT(l.Loan_ID) AS Num_Requests
FROM Book b
LEFT JOIN Loan l ON b.Book_ID = l.Book_ID
GROUP BY b.Title;

-- Usage rate 

WITH BookUsage AS (
    SELECT 
        b.Title, 
        l.Library_ID,
        SUM(EXTRACT(epoch FROM (l.Date_Returned - l.Date_Taken)) / 60) / (b.Nr_copies * 24 * 60) AS Usage_Rate
    FROM 
        Book b
    LEFT JOIN 
        Loan l ON b.Book_ID = l.Book_ID
    GROUP BY 
        b.Title, l.Library_ID, b.Nr_copies
)
SELECT 
    Title,
    AVG(Usage_Rate) AS Average_Usage_Rate_Across_Libraries
FROM 
    BookUsage
GROUP BY 
    Title;


-- This calculates the usage rate in minutes per book across the libraries. In this case, the book that has 
   -- more usage rate is to kill a mocking bird. The first 2 ones are null because the reader hasn't returned the book yet.
   
   
create table social_data_facebook (
   fb_post_id int primary key,
   name varchar(50),
   date_time_posted timestamp,
   text VARCHAR(200),
   likes int,
   shares int,
   repost int
);

delete from social_data_facebook;

-- insert data into social_data_facebook
INSERT INTO social_data_facebook (fb_post_id, name, date_time_posted, text, likes, shares, repost) VALUES
(1, 'John Smith', '2024-03-01 10:00:00', 'Just finished reading "The Great Gatsby". What an amazing book!', 20, 10, 5),
(2, 'Alice Johnson', '2024-03-02 09:00:00', 'Currently enjoying "To Kill a Mockingbird". Such a powerful story!', 15, 8, 3),
(3, 'Niccolò Baronio', '2024-03-03 08:00:00', 'Lost in the world of "Harry Potter and the Sorcerer''s Stone". Magic is real!', 30, 12, 6),
(4, 'Emily Davis', '2024-03-04 07:00:00', 'Reading "1984" for the second time. Still chillingly relevant.', 25, 15, 7),
(5, 'Jessica Wilson', '2024-03-05 06:00:00', 'Diving into "Pride and Prejudice". Jane Austen never disappoints!', 18, 9, 4),
(6, 'Maria Jesus Traub DAmico', '2024-03-06 10:00:00', 'Just started "The Catcher in the Rye". Holden Caulfield seems intriguing.', 22, 11, 5),
(7, 'Sarah Martinez', '2024-03-07 09:00:00', 'Recommend "The Hobbit" to all fantasy lovers out there. A classic adventure!', 28, 14, 7),
(8, 'Daniel Taylor', '2024-03-08 08:00:00', 'Excited to begin "The Lord of the Rings" trilogy. Time for an epic journey!', 32, 16, 8),
(9, 'Micheal Jackson', '2024-03-09 07:00:00', 'Reflecting on the lessons from "Animal Farm". Orwell is so profound.', 19, 9, 3),
(10, 'Valentina Vakthangashvili', '2024-03-10 06:00:00', 'Books are my escape from reality. There is nothing like getting lost in a good story!', 27, 13, 6),
(11, 'Melissa Hernandez', '2024-03-11 10:00:00', 'Embarking on "The Odyssey". Ready for an epic adventure!', 26, 13, 6),
(12, 'Andrew Lopez', '2024-03-12 09:00:00', 'Feeling the call of the sea with "Moby-Dick". A timeless classic!', 21, 10, 5),
(13, 'Megan Gonzalez', '2024-03-13 08:00:00', 'Engrossed in the epic saga of "War and Peace". Tolstoy is masterpiece!', 29, 15, 7),
(14, 'Ozan Can Acar', '2024-03-14 07:00:00', 'Adventuring down the Mississippi with "The Adventures of Huckleberry Finn".', 17, 8, 4),
(15, 'Amanda Sanchez', '2024-03-15 06:00:00', 'Exploring the struggles of the Great Depression in "The Grapes of Wrath".', 23, 11, 5),
(16, 'Justin Torres', '2024-03-16 10:00:00', 'Delving into the depths of guilt and redemption in "Crime and Punishment".', 27, 14, 7),
(17, 'Tommaso Bianchi', '2024-03-17 09:00:00', 'Immersing myself in the world of "The Great Expectations". Dickens never disappoints!', 31, 16, 8),
(18, 'Ryan Rivera', '2024-03-18 08:00:00', 'Lost in the whimsical adventures of "Don Quixote". Cervantes'' masterpiece!', 33, 17, 9),
(19, 'Ludovica Botta', '2024-03-19 07:00:00', 'Contemplating existential themes in "The Brothers Karamazov". Dostoevsky''s brilliance!', 20, 10, 5),
(20, 'Brandon Ramirez', '2024-03-20 06:00:00', 'Escaping into the dark secrets of "Jane Eyre". Bronte''s masterpiece!', 25, 12, 6);

select * from social_data_facebook;

-- inner joining post about books on social with actual Reader of the libraries in our system
select reader.reader_id , reader.name, social_data_facebook.text
from reader 
inner join social_data_facebook 
on reader.name = social_data_facebook.name
order by reader.reader_ID;

-- from here, we need to understand what data we need in order to predict useful trends.
  -- should we ask the professor? or do you have any idea



-- Support a collection application to remind the reader (by sms, by mail, by letter) 
  -- the loan end date, and manage the fee associated to late returns.

-- creating a table where we store readers that surpassed the deadline, and the correlated fee (0.5*day)
with late_returns as (
  select r.reader_id,
    r.name,
    r.email,
    r.phone,
    r.address,
    b.title as book_title,
    l.loan_id,
    l.date_taken::date as taken_date,
    current_date as Date_today,
    (current_date - date_taken::date) as delay,
    (current_date - date_taken::date) * 0.5 as fee
  from loan l
  inner join reader r on l.reader_id = r.reader_id
  inner join book b on l.book_id = b.book_id
  where l.loan_status = false 
  and l.date_returned is null
  and (current_date - l.date_taken::date) > 30  -- here we are setting the deadline equal to 30 (1 month).
)
select * from late_returns;

-- creating a table where we store readers that had libraries books for more than 15 days
with deadline_week as (
  select r.reader_id,
    r.name as reader_name,
    r.email,
    r.phone,
    r.address,
    l.loan_id,
    b.title as book_title,
    l.date_taken,
    (current_date - l.date_taken::date) as delay
  from loan l
  inner join reader r on l.reader_id = r.reader_id
  inner join book b on b.book_id = l.book_id
  where l.loan_status = false
  and l.date_returned is null 
  and (current_date - l.date_taken::date) > 15  -- let's suppose that we send a message when 15 days has passed.
)
select * from deadline_week;

select r.name as reader_name,
r.reader_id,
l.loan_id,
l.book_id,
b.title as book_name
from loan l
inner join reader r on r.reader_id = l.reader_id
inner join book b on b.book_id = l.book_id;







   