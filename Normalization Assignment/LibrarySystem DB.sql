-- Create the database and switch to it
CREATE DATABASE library_system;
USE library_system;

-- Create Authors table
CREATE TABLE Authors (
    Author_ID INT IDENTITY(1,1) PRIMARY KEY,
    Author_Name VARCHAR(100) NOT NULL,
    Author_Nationality VARCHAR(50)
);

-- Create Members table
CREATE TABLE Members (
    Borrow_ID INT PRIMARY KEY,
    Member_Name VARCHAR(100) NOT NULL,
    Member_Phone VARCHAR(15) NOT NULL
);

-- Create Books table
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Book_Title VARCHAR(100) NOT NULL,
    Author_ID INT NOT NULL,
    FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID)
);

-- Create Borrow_Transactions table
CREATE TABLE Borrow_Transactions (
    Borrow_ID INT PRIMARY KEY,
    Book_ID INT NOT NULL,
    Borrow_Date DATE NOT NULL,
    Return_Date DATE,
    Fine_Amount DECIMAL(5, 2),
    FOREIGN KEY (Borrow_ID) REFERENCES Members(Borrow_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

-- Insert data into Authors table
INSERT INTO Authors (Author_Name, Author_Nationality) VALUES
('Ramez Elmasri', 'USA'),
('Joel Grus', 'USA'),
('Mark Lutz', 'UK');

-- Insert data into Books table
INSERT INTO Books (Book_ID, Book_Title, Author_ID) VALUES
(200, 'Database Systems', 1),
(201, 'Data Science', 2),
(202, 'Python Basics', 3);

-- Insert data into Members table
INSERT INTO Members (Borrow_ID, Member_Name, Member_Phone) VALUES
(201, 'Ali Hassan', '9876543210'),
(202, 'Fatima Noor', '9871234560');

-- Insert data into Borrow_Transactions table
INSERT INTO Borrow_Transactions (Borrow_ID, Book_ID, Borrow_Date, Return_Date, Fine_Amount) VALUES
(201, 200, '2025-01-10', '2025-01-20', 0.00),
(202, 201, '2025-01-12', '2025-01-25', 5.00);

-- Show tables
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrow_Transactions;
