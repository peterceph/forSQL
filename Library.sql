SET SERVEROUTPUT ON
SET DEFINE OFF




CREATE TABLE Branch
(
Branch_id VARCHAR(10) PRIMARY KEY,
Manager_id VARCHAR(10),
Branch_address VARCHAR(30),
Contact_no VARCHAR(15)
);

alter table branch
add primary key (branch_id);

DESC branch;

CREATE TABLE Employee
(
Emp_id VARCHAR(10) PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary DECIMAL(10,2),
Branch_id VARCHAR2(50)
);
DESC employee;


CREATE TABLE Customer
(
Customer_Id VARCHAR(10) PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE
);
DESC customer;


CREATE TABLE IssueStatus
(
Issue_Id VARCHAR(10) PRIMARY KEY,
Issued_cust VARCHAR(30),
Issued_book_name VARCHAR(50),
Issue_date DATE,
Isbn_book VARCHAR(15)
);

ALTER TABLE issuestatus
ADD CONSTRAINT FK_ISSUESTAT FOREIGN KEY (ISSUED_CUST)
REFERENCES CUSTOMER (CUSTOMER_ID) ON DELETE CASCADE;
      
--ALTER TABLE returnstatus
--ADD CONSTRAINT FK_ISBNBOOK FOREIGN KEY (ISBN_BOOK2)
--REFERENCES BOOKS(ISBN) ON DELETE CASCADE;

alter table returnstatus
add constraint FK_ISBNBK2 FOREIGN KEY (ISBN_BOOK2)
REFERENCES books(ISBN) ON DELETE CASCADE; 

DESC books;

ALTER TABLE issuestatus MODIFY  Issued_book_name VARCHAR(80);
ALTER TABLE issuestatus MODIFY  Isbn_book VARCHAR(25);

CREATE TABLE ReturnStatus
(
Return_id VARCHAR(10) PRIMARY KEY,
Return_cust VARCHAR(30),
Return_book_name VARCHAR(50),
Return_date DATE,
isbn_book2 VARCHAR(15)
);

ALTER TABLE RETURNSTATUS
ADD PRIMARY KEY (RETURN_ID);

SELECT * FROM RETURNSTATUS

SELECT RETURN_ID, COUNT(*)
FROM RETURNSTATUS
GROUP BY RETURN_ID
HAVING COUNT(*)>1;

DELETE FROM RETURNSTATUS 
WHERE ROWID NOT IN(
SELECT MIN(ROWID) FROM RETURNSTATUS
GROUP BY RETURN_ID
);


TRUNCATE TABLE RETURNSTATUS

DESC returnstatus;
ALTER TABLE returnstatus MODIFY  Return_book_name VARCHAR(80);
ALTER TABLE returnstatus MODIFY  isbn_book2 VARCHAR(25);

CREATE TABLE Books (
    ISBN VARCHAR2(10) PRIMARY KEY,
    Book_title VARCHAR2(50),
    Category_BK VARCHAR2(30),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR2(3) CHECK (Status IN ('Yes', 'No')),
    Author VARCHAR2(30),
    Publisher VARCHAR2(30)
);
DESC Books;
alter TABLE books MODIFY  ISBN VARCHAR(25);
alter TABLE books MODIFY  Book_title VARCHAR(80);

INSERT ALL
INTO branch(BRANCH_ID, MANAGER_ID, BRANCH_ADDRESS, CONTACT_NO) VALUES('B001', 'M101', '123 Main St', '+234909988676')
INTO branch(BRANCH_ID, MANAGER_ID, BRANCH_ADDRESS, CONTACT_NO) VALUES('B002', 'M102', '456 Elm St', '+2349099988677')
INTO branch(BRANCH_ID, MANAGER_ID, BRANCH_ADDRESS, CONTACT_NO) VALUES('B003', 'M103', '789 Oak St', '+2349190988678')
INTO branch(BRANCH_ID, MANAGER_ID, BRANCH_ADDRESS, CONTACT_NO) VALUES('B004', 'M104', '567 Pine St','+2349190998679')
INTO branch(BRANCH_ID, MANAGER_ID, BRANCH_ADDRESS, CONTACT_NO) VALUES('B005', 'M105', '890 Maple St','+2349190988680')
SELECT * FROM DUAL;
SELECT * FROM BRANCH

DESC EMPLOYEE

SELECT * FROM EMPLOYEE

INSERT ALL
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E101', 'John Doe', 'Manager', 60000.00, 'B001')
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E102', 'Jane Smith', 'Clerk', 45000.00, 'B003')
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B004')
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E104', 'Emily Davis', 'Assistant', 40000.00,'B002')
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B003')
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B002')
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E107', 'Michael Thompson', 'Manager', 62000.00, 'B001')
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B005')
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E109', 'Daniel Anderson', 'Librarian', 57000.00, 'B003')
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E110', 'Laura Martinez', 'Assistant', 41000.00, 'B001')
INTO employee(EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_ID)VALUES('E111', 'Christopher Lee', 'Manager', 65000.00, 'B001')
SELECT * FROM DUAL;

DESC CUSTOMER
INSERT ALL
INTO customer(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE) 
VALUES('C101', 'Alice Johnson', '123 Main St', TO_DATE('2021-05-15', 'YYYY-MM-DD'))
INTO customer(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE) 
VALUES('C102', 'Bob Smith', '456 Elm St', TO_DATE('2021-06-20', 'YYYY-MM-DD'))
INTO customer(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE) 
VALUES('C103', 'Carol Davis', '789 Oak St', TO_DATE('2021-07-10', 'YYYY-MM-DD'))
INTO customer(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE) 
VALUES('C104', 'Dave Wilson', '567 Pine St', TO_DATE('2021-08-05', 'YYYY-MM-DD'))
INTO customer(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE) 
VALUES('C105', 'Eve Brown', '890 Maple St', TO_DATE('2021-09-25', 'YYYY-MM-DD'))
INTO customer(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE) 
VALUES('C106', 'Frank Thomas', '234 Cedar St', TO_DATE('2021-10-15', 'YYYY-MM-DD'))
INTO customer(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE) 
VALUES('C107', 'Grace Taylor', '345 Walnut St', TO_DATE('2021-11-20', 'YYYY-MM-DD'))
INTO customer(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE) 
VALUES('C108', 'Henry Anderson', '456 Birch St', TO_DATE('2021-12-10', 'YYYY-MM-DD'))
INTO customer(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE) 
VALUES('C109', 'Ivy Martinez', '567 Oak St', TO_DATE('2022-01-05', 'YYYY-MM-DD'))
INTO customer(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE) 
VALUES('C110', 'Jack Wilson', '678 Pine St', TO_DATE('2022-02-25', 'YYYY-MM-DD'))
SELECT * FROM DUAL;

INSERT ALL 
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'Yes', 'J.D. Salinger', 'Little, Brown and Company')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'Yes', 'George Orwell', 'Penguin Books')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'Yes', 'Gabriel Garcia Marquez', 'Penguin Books')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'Yes', 'F. Scott Fitzgerald', 'Scribner')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'Yes', 'Charlotte Bronte', 'Penguin Classics')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'Yes', 'Paulo Coelho', 'HarperOne')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'Yes', 'J.K. Rowling', 'Scholastic')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'Yes', 'Dan Brown', 'Doubleday')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'Yes', 'George R.R. Martin', 'Bantam')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'Yes', 'Howard Zinn', 'Harper Perennial')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'Yes', 'Barbara W. Tuchman', 'Oxford University Press')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'Yes', 'Yuval Noah Harari', 'Harper Perennial')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'Yes', 'Anne Frank', 'Bantam')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'Yes', 'Herodotus', 'Penguin Classics')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'Yes', 'Jared Diamond', 'W. W. Norton & Company')
INTO books(ISBN, BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'Yes', 'Charles C. Mann', 'Vintage Books')
SELECT *  FROM DUAL;
SELECT * FROM BOOKS
desc books;

UPDATE books 
SET status = 'No' 
WHERE isbn in ('978-0-307-58837-1','978-0-141-44171-6','978-0-7432-7357-1');

SELECT * FROM RETURNSTATUS


INSERT ALL
INTO ISSUESTATUS(ISSUE_ID, ISSUED_CUST, ISSUED_BOOK_NAME, ISSUE_DATE, ISBN_BOOK)  
VALUES('IS101', 'C101', 'The Catcher in the Rye', TO_DATE('2023-05-01', 'YYYY-MM-DD'), '978-0-553-29698-2')
INTO ISSUESTATUS(ISSUE_ID, ISSUED_CUST, ISSUED_BOOK_NAME, ISSUE_DATE, ISBN_BOOK)  
VALUES('IS102', 'C102', 'The Da Vinci Code', TO_DATE('2023-05-02', 'YYYY-MM-DD'), '978-0-7432-4722-4')
INTO ISSUESTATUS(ISSUE_ID, ISSUED_CUST, ISSUED_BOOK_NAME, ISSUE_DATE, ISBN_BOOK)  
VALUES('IS103', 'C103', '1491: New Revelations of the Americas Before Columbus', TO_DATE('2023-05-03', 'YYYY-MM-DD'), '978-0-7432-7357-1')
INTO ISSUESTATUS(ISSUE_ID, ISSUED_CUST, ISSUED_BOOK_NAME, ISSUE_DATE, ISBN_BOOK)  
VALUES('IS104', 'C104', 'Sapiens: A Brief History of Humankind', TO_DATE('2023-05-04', 'YYYY-MM-DD') , '978-0-307-58837-1')
INTO ISSUESTATUS(ISSUE_ID, ISSUED_CUST, ISSUED_BOOK_NAME, ISSUE_DATE, ISBN_BOOK)  
VALUES('IS105', 'C105', 'The Diary of a Young Girl', TO_DATE('2023-05-05', 'YYYY-MM-DD'), '978-0-375-41398-8')
SELECT * FROM DUAL;

SELECT * FROM ISSUESTATUS

INSERT ALL 
INTO ReturnStatus(RETURN_ID, RETURN_CUST, RETURN_BOOK_NAME, RETURN_DATE, ISBN_BOOK2) 
VALUES('RS101', 'C101', 'The Catcher in the Rye', TO_DATE('2023-06-06' , 'YYYY-MM-DD'), '978-0-553-29698-2')
INTO ReturnStatus(RETURN_ID, RETURN_CUST, RETURN_BOOK_NAME, RETURN_DATE, ISBN_BOOK2) 
VALUES('RS102', 'C102', 'The Da Vinci Code', TO_DATE('2023-06-07', 'YYYY-MM-DD'), '978-0-7432-4722-4')
INTO ReturnStatus(RETURN_ID, RETURN_CUST, RETURN_BOOK_NAME, RETURN_DATE, ISBN_BOOK2) 
VALUES('RS103', 'C105', 'The Diary of a Young Girl', TO_DATE('2023-06-08', 'YYYY-MM-DD'), '978-0-375-41398-8')
INTO ReturnStatus(RETURN_ID, RETURN_CUST, RETURN_BOOK_NAME, RETURN_DATE, ISBN_BOOK2) 
VALUES('RS104', 'C108', 'The Histories', TO_DATE('2023-06-09', 'YYYY-MM-DD'), '978-0-14-044930-3')
INTO ReturnStatus(RETURN_ID, RETURN_CUST, RETURN_BOOK_NAME, RETURN_DATE, ISBN_BOOK2) 
VALUES('RS105', 'C110', 'A Game of Thrones', TO_DATE('2023-06-10', 'YYYY-MM-DD'), '978-0-09-957807-9')
SELECT * FROM DUAL;

alter table issuestatus
modify issued_book_name varchar2(100);

select * from EMPLOYEE

alter table employee
add constraints fk_emp_branch foreign key(branch_id)
references branch(branch_id);






/*Queries*/

# 1. Retrieve the book title, category, and rental price of all available books.

SELECT * FROM BOOKS

SELECT BOOK_TITLE, CATEGORY_BK, RENTAL_PRICE FROM BOOKS


# 2. List the employee names and their respective salaries in descending order of salary.

SELECT * FROM EMPLOYEE

SELECT EMP_NAME, SALARY FROM EMPLOYEE
WHERE SALARY IS NOT NULL
ORDER BY SALARY DESC


# 3. Retrieve the book titles and the corresponding customers who have issued those books.

select * from issuestatus

SELECT  i.issued_cust, i.issued_book_name , customer.customer_name 
from issuestatus i inner join customer
on customer.customer_id = i.issued_cust;



# 4. Display the total count of books in each category.

select category_bk, count(*) Num_in_Category from books
group by category_bk;



# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select * from employee

select e.emp_name, e.position, e.salary 
from employee e
where salary > 50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
sele

select c.customer_name, c.reg_date, i.issued_cust, i.issued_book_name from customer c 
left join issuestatus i on c.customer_id = i.issued_cust
where reg_date < to_date('2022-01-01','yyyy-mm-dd')
and issue_id is null; 

# 7. Display the branch numbers and the total count of employees in each branch.



select  b.branch_id, count(*) as emp_in_branch
from employee e join branch b
on e.branch_id = b.branch_id
group by b.branch_id;
 

desc employee

SELECT BRANCH_ID AS id, MANAGER_ID AS ref_id, BRANCH_ADDRESS AS info, CONTACT_NO AS misc
FROM branch

UNION ALL

SELECT EMP_ID AS id, EMP_NAME AS ref_id, POSITION AS info, TO_CHAR(SALARY) AS misc
FROM employee;


# 8. Display the names of customers who have issued books in the month of June 2023.

select * from issuestatus
select * from customer 

select * from customer c join issuestatus i 
on i.issued_cust = c.customer_id
WHERE to_char(i.ISSUE_DATE, 'mm-yyyy') = '06-2023';

# 9. Retrieve book_title from book table containing 'history'.

select * from books

select book_title, category_bk from books 
where category_bk = 'History';


# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

select branch_id, emp_count from 
(select e.branch_id, count(*)as emp_count from employee e
group by e.branch_id)
where emp_count>5;

--select * from session_privs
--where privilege = 'CREATE TRIGGER'
--
----create or replace trigger trg_update_book_avail
----after insert on issuestatus
----for each row
----begin
----  update books
----  set available_quality = available_quality-1
----  where ISBN = :New.ISBN
----  end;
----  select * from issuestatus
----
----
----rollback;
--
--
--
--Basic Queries
--
--#1. List all books in the library.
--select book_title from books
--
--#2 Show all branches and their contact details.
--select contact_no from branch
--
--#3 Display all customers registered after May 5, 2023.
--select * from issuestatus
--select c.customer_name from customer c
--join issuestatus i
--on i.issued_cust = c.customer_id
--where to_char(i.issue_date, 'dd-mon-yyyy') = '05-may-2023';
--
--4# List all employees with a salary greater than 50,000.
--select * from employee
--where salary > 50000;
--
--
--#5 Retrieve book titles along with their categories and authors.
--
--select book_title, category_bk, author from books
--
--
--
--#6 Show customers who have returned books.
--select * from returnstatus
--where
--
--Get all books that are currently available (status = 'Yes').
--
--🔹 Joins and Relationships
--List the names of customers and the books they've issued.
--
--Show return details along with the corresponding customer names.
--
--Find books that were issued and returned by the same customer.
--
--Get the branch info where a particular employee (by name or ID) works.
--
--List all customers who have borrowed more than 2 books.
--
--🔹 Grouping and Aggregation
--Count the number of books in each category.
--
--Find the total number of books issued.
--
--Count how many employees hold each job position.
--
--Find the average salary of all employees.
--
--Display the number of returns per customer.
--
--🔹 Filtering and Conditions
--Show books issued in May 2023.
--
--List all employees whose names start with 'M'.
--
--Find customers who have not returned a specific book yet.
--
--Display books with a rental price between 5 and 8.
--
--List customers who have issued ‘History’ category books.
--
--🔹 Subqueries & Advanced
--Find customers who have issued all the books they have returned.
--
--Get the book(s) with the highest rental price.
--
--Find employees earning more than the average salary.
--
--List books that have never been issued.
--
--Find branches that have no employees assigned (if there's a link).
--
--Show customers who returned books after more than 30 days from the issue date.
--
--🔹 Bonus Challenge Queries
--Create a view showing current issued books with customer and issue date.
--
--List top 3 most issued books.
--
--Generate a report of customers and their issue + return history.
--
--Calculate revenue from issued books (if you assume each rental generates revenue).
--
--
--CTE-Based Query Questions
--Using a CTE, list all customers who have borrowed more than 3 books.
--
--Create a CTE to find the most recent book each customer has borrowed.
--
--Using a CTE, list all books that have never been returned.
--
--Write a CTE to calculate the total fine per customer, and list only those with fines greater than 500.
--
--Use a CTE to rank customers by the number of books they’ve borrowed, highest to lowest.
--
--🔷 Subquery-Based Query Questions
--Find the names of customers who have never borrowed any books.
--
--List the titles of books that have been borrowed more times than the average borrow count across all books.
--
--Find employees whose salary is higher than the average salary of all librarians.
--
--Get the names of customers who have borrowed books from all available branches.
--
--List the books that were issued in the same month as the most recent issued book.
--
--🔷 Advanced SQL Query Questions
--For each employee, display their salary rank within the entire library system.
--
--Show the top 3 most borrowed books and how many times each was borrowed.
--
--For each branch, show the number of employees working there.
--
--Find the number of books borrowed each month in 2023, grouped by month.
--
--Display the names of customers who returned books late more than twice.
--
--
--# End
--
--
