create database Library_management_system;

use Library_management_system;


-- Create Books table

create table Books (
    BookID int primary key,
    Title varchar(150) not null,
    Author varchar(100) not null,
    PublicationYear year,
    Genre varchar(50)
);


-- Create Members table

create table Members (
    MemberID int primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Email varchar(100) unique,
    MembershipDate date
);


-- Create Authors table

create table Authors (
    AuthorID int primary key,
    AuthorName varchar(100) not null,
    BirthYear year
);


-- Create Loans table

create table Loans (
    LoanID int primary key,
    BookID int,
    MemberID int,
    LoanDate date,
    ReturnDate date,
    foreign key (BookID) references Books(BookID),
    foreign key (MemberID) references Members(MemberID)
);


-- Create BookAuthors table

create table BookAuthors (
    BookID int,
    AuthorID int,
    primary key (BookID, AuthorID),
    foreign key (BookID) references Books(BookID),
    foreign key (AuthorID) references Authors(AuthorID)
);


-- Create Fines table

create table Fines (
    FineID int primary key,
    LoanID int,
    FineAmount decimal(6,2),
    PaidDate date,
    foreign key (LoanID) references Loans(LoanID)
);


-- Insert Books

insert into Books values
(1, 'A Brief History of Time', 'Stephen Hawking', 1988, 'Science'),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction'),
(3, 'The Data Science Handbook', 'Field Cady', 2017, 'Science'),
(4, '1984', 'George Orwell', 1949, 'Dystopian'),
(5, 'Sapiens', 'Yuval Noah Harari', 2011, 'History'),
(6, 'The Art of Computer Programming', 'Donald Knuth', 1968, 'Computer Science'),
(7, 'The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy'),
(8, 'Cosmos', 'Carl Sagan', 1980, 'Science'),
(9, 'Educated', 'Tara Westover', 2018, 'Memoir'),
(10, 'The Selfish Gene', 'Richard Dawkins', 1976, 'Science');


-- Insert Members

insert into Members values
(1, 'John', 'Smith', 'john.smith@mail.com', '2020-01-15'),
(2, 'Emma', 'Johnson', 'emma.johnson@mail.com', '2019-05-22'),
(3, 'Michael', 'Brown', 'michael.brown@mail.com', '2021-03-10'),
(4, 'Sarah', 'Davis', 'sarah.davis@mail.com', '2018-11-05'),
(5, 'David', 'Wilson', 'david.wilson@mail.com', '2022-06-18'),
(6, 'Laura', 'Miller', 'laura.miller@mail.com', '2020-09-30'),
(7, 'James', 'Taylor', 'james.taylor@mail.com', '2019-02-14'),
(8, 'Olivia', 'Anderson', 'olivia.anderson@mail.com', '2021-07-25'),
(9, 'Robert', 'Thomas', 'robert.thomas@mail.com', '2017-12-01'),
(10, 'Sophia', 'Martinez', 'sophia.martinez@mail.com', '2023-04-08');


-- Insert Authors

insert into Authors values
(1, 'Stephen Hawking', 1942),
(2, 'Harper Lee', 1926),
(3, 'Field Cady', 1985),
(4, 'George Orwell', 1903),
(5, 'Yuval Noah Harari', 1976),
(6, 'Donald Knuth', 1938),
(7, 'J.R.R. Tolkien', 1892),
(8, 'Carl Sagan', 1934),
(9, 'Tara Westover', 1986),
(10, 'Richard Dawkins', 1941);


-- Insert BookAuthors

insert into BookAuthors values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


-- Insert Loans

insert into Loans values
(1, 1, 1, '2023-01-10', '2023-01-20'),
(2, 2, 1, '2023-02-05', '2023-02-15'),
(3, 3, 1, '2023-03-01', '2023-03-10'),
(4, 4, 1, '2023-04-12', '2023-04-22'),
(5, 5, 1, '2023-05-15', '2023-05-25'),
(6, 6, 1, '2024-01-05', null),
(7, 8, 1, '2024-02-10', null),
(8, 1, 2, '2023-06-01', '2023-06-11'),
(9, 3, 2, '2024-03-01', null),
(10, 5, 3, '2023-07-20', '2023-07-30'),
(11, 1, 4, '2023-08-05', '2023-08-15'),
(12, 3, 5, '2024-04-18', null),
(13, 7, 6, '2023-09-01', '2023-09-14'),
(14, 1, 7, '2024-05-02', '2024-05-20'),
(15, 9, 8, '2023-10-11', '2023-10-25'),
(16, 3, 9, '2023-11-02', '2023-11-16'),
(17, 8, 10, '2024-06-07', null),
(18, 5, 2, '2023-12-01', '2023-12-18'),
(19, 6, 3, '2024-01-25', '2024-02-05'),
(20, 10, 4, '2024-07-01', null);


-- Insert Fines

insert into Fines values
(1, 2, 5.00, '2023-02-16'),
(2, 2, 7.50, '2023-02-18'),
(3, 4, 3.00, '2023-04-23'),
(4, 8, 12.00, '2023-06-12'),
(5, 10, 15.00, '2023-07-31'),
(6, 11, 2.50, '2023-08-16'),
(7, 13, 20.00, null),
(8, 15, 4.00, '2023-10-26'),
(9, 18, 9.00, '2023-12-19'),
(10, 19, 6.00, '2024-02-06'),
(11, 19, 5.00, '2024-02-07');


-- 1. Books published before 2000

select *
from Books
where PublicationYear < 2000;


-- 2. Loans from 2024 which are not returned

select *
from Loans
where LoanDate between '2024-01-01' and '2024-12-31'
and ReturnDate is null;


-- 3. Books having "Science" in the title

select *
from Books
where Title like '%Science%';


-- 4. Check whether the book is available or checked out

select Title,
case
    when exists (
        select 1
        from Loans
        where Loans.BookID = Books.BookID
        and ReturnDate is null
    )
    then 'Checked Out'
    else 'Available'
end as Availability
from Books;


-- 5. Members who borrowed more than 5 books

select *
from Members
where MemberID in (
    select MemberID
    from Loans
    group by MemberID
    having count(LoanID) > 5
);


-- 6. Total books borrowed by each member

select MemberID, count(LoanID) as TotalBorrowed
from Loans
group by MemberID
order by TotalBorrowed desc;


-- 7. Loans having total fine greater than 10

select LoanID, sum(FineAmount) as TotalFine
from Fines
group by LoanID
having sum(FineAmount) > 10;


-- 8. Top 5 most borrowed books

select Books.BookID, Books.Title, count(Loans.LoanID) as TimesBorrowed
from Books
join Loans
on Books.BookID = Loans.BookID
group by Books.BookID, Books.Title
order by TimesBorrowed desc
limit 5;


-- 9. Inner Join - Books and Loans

select Books.Title, Loans.LoanDate, Loans.ReturnDate
from Loans
inner join Books
on Loans.BookID = Books.BookID;


-- 10. Left Join - All books with or without loans

select Books.Title, Loans.LoanID, Loans.LoanDate, Loans.ReturnDate
from Books
left join Loans
on Books.BookID = Loans.BookID;


-- 11. Total books written by each author

select Authors.AuthorID, Authors.AuthorName,
count(BookAuthors.BookID) as TotalBooks
from Authors
inner join BookAuthors
on Authors.AuthorID = BookAuthors.AuthorID
group by Authors.AuthorID, Authors.AuthorName
order by TotalBooks desc;


-- 12. Books written by authors born after 1970

select Title, Author, PublicationYear
from Books
where BookID in (
    select BookID
    from BookAuthors
    where AuthorID in (
        select AuthorID
        from Authors
        where BirthYear > 1970
    )
);


-- 13. Book title, author name and fine amount

select Books.Title, Authors.AuthorName, Fines.FineAmount
from Fines
inner join Loans
on Fines.LoanID = Loans.LoanID

inner join Books
on Loans.BookID = Books.BookID

left join BookAuthors
on Books.BookID = BookAuthors.BookID

left join Authors
on BookAuthors.AuthorID = Authors.AuthorID

order by Fines.FineAmount desc;