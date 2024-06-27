<h1>Database Project for **Inserati aici numele aplicatiei pe care o testati**</h1>

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

Application under test: **Database Real estate**

Tools used: MySQL Workbench

Database description: **As part of the project, I developed a database for a real estate agency using SQL. The project involved creating and managing multiple relational tables, each with a specific structure and well-defined connections through primary and foreign keys**

<ol>
<li>Database Schema </li>
<br>
You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.

The tables are connected in the following way:

<ul>
  <li> **manager_id**  is connected with **employee_id** through a **self referencing** relationship which was implemented through **employees.employee_id** as a primary key and **employees.employee_id** as a foreign key</li>
  <li> **details_employees**  is connected with **employees** through a **one-to-one** relationship which was implemented through **details_employees.details_id** as a primary key and **employees.employee_id** as a foreign key</li>
  <li> **property**  is connected with **employees** through a **one-to-many** relationship which was implemented through **properties.property_id** as a primary key and **employees.employee_id** as a foreign key</li>
  <li> **details_properties**  is connected with **employees** through a **one-to-many** relationship which was implemented through **details_properties.details_properties_id** as a primary key and **employees.employee_id** as a foreign key</li>
</ul><br>

<li>Database Queries</li><br>

<ol type="a">
  <li>DDL (Data Definition Language)</li>

  The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)

  ```
CREATE DATABASE real_estate_Buc1;
USE real_estate_Buc1;
SHOW databases;

CREATE TABLE employees (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
last_name VARCHAR(25),
first_name VARCHAR(20),
manager_id INT,
FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE details_employees (
details_id INT PRIMARY KEY,
position VARCHAR(15),
email VARCHAR(50),
phone VARCHAR(20),
employee_id INT UNIQUE,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE properties (
property_id INT PRIMARY KEY AUTO_INCREMENT,
employee_id INT,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE details_properties (
details_properties_id INT PRIMARY KEY,
property_status VARCHAR(50) NOT NULL,
property_type VARCHAR(50) NOT NULL,
rooms INT NOT NULL,
property_address VARCHAR(60) NOT NULL,
district VARCHAR(30) NOT NULL,
price VARCHAR(15) NOT NULL,
employee_id INT,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE clients (
client_id INT PRIMARY KEY AUTO_INCREMENT,
last_name VARCHAR(50),
first_name VARCHAR(50),
email VARCHAR(255),
phone VARCHAR(50),
rental_date VARCHAR(50),
action_status VARCHAR(50),
property_type VARCHAR(50),
address VARCHAR(150),
employee_id INT,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
```

  After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:

``` Each record in the 'details_properties' table is associated with a record in the 'properties' table through the 'employee_id' column. ```
```
ALTER TABLE details_properties
ADD CONSTRAINT FK_details_properties_properties
FOREIGN KEY (employee_id)
REFERENCES properties (employee_id);
```

```A new column named 'space_area' was added to the 'details_properties' table and positioned after the 'rooms' column.```

```
ALTER table details_properties ADD COLUMN space_area VARCHAR(50) AFTER rooms;
```

```The column name "clients" has been changed to "customers".```
```
ALTER TABLE clients RENAME TO customers;
```

```The data types that can be entered in the 'property_status' and 'email' columns have been modified.``` 

```
ALTER TABLE customers MODIFY email varchar(40);

ALTER TABLE details_properties MODIFY property_status char (30) not null;
```

```The 'date_of_birth' column was added to the 'details_employees' table and was subsequently deleted.```
```
ALTER TABLE details_employees ADD COLUMN date_of_birth date;

ALTER TABLE details_employees DROP COLUMN date_of_birth;
```

```The 'sex' column was added to the 'details_employees' table and was subsequently changed to 'gender'.```
```
ALTER TABLE details_employees ADD COLUMN SEX CHAR (10);

ALTER TABLE details_employees CHANGE SEX GENDER VARCHAR(10) after position;
```

  
  <li>DML (Data Manipulation Language)</li>

  In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. 
  In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase. 

  Below you can find all the insert instructions that were created in the scope of this project:

 ```
INSERT INTO employees (last_name, first_name, manager_id) VALUES
('Popescu', 'Ioana', 1),
('Petrescu', 'George',  1),
('Mihai', 'Maria', 1),
('Dumitrascu', 'Florin', 1),
('Petre', 'Silvia', 2),
('Marinescu', 'Elena', 2),
('Coman', 'Mihai', 2),
('Georgescu', 'Valentin', 2);

INSERT INTO details_employees (details_id, position, email, phone, employee_id) VALUES
(1, 'Manager', 'ioanap@gmail.com', '0712345678',1),
(2, 'Coordinator', 'georgep@gmail.com', '0723456789',2),
(3, 'Agent','mariam@gmail.com', '0734567891',3),
(4, 'Agent','dumitrascuf@gmail.com', '0745678912',4),
(5, 'Agent','silviap@gmail.com', '0756789123',5),
(6, 'Agent','elenam@gmail.com', '0767891234',6),
(7, 'Agent','mihaic@gmail.com', '0789123456',7),
(8, 'Agent','valenting@gmail.com', '0791234567',8);

INSERT INTO properties (property_id, employee_id) 
VALUES (1, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 6),(7, 7),(8, 8);

INSERT INTO details_properties (details_properties_id, property_status, property_type, rooms, property_address, district, price, employee_id) VALUES
(1, 'rent', 'apartment', '2', 'Bucharest, Campia Libertatii St., no. 16', '3', '450 Euro', 1),
(2,'for rent', 'apartment', '2', 'Bucharest, Liviu Rebreanu Blvd., no. 53', '3', '500 Euro',1),
(3,'for sale', 'apartemnt', '3', 'Bucharest, Nitu Vasile St., no. 2', '4', '75000 Euro',1),
(4,'for rent', 'house', '4', 'Bucharest, Arcadiei St., no. 29', '4', '850 Euro',1),
(5,'sold', 'apartment', '4', 'Bucharest, Barajul Dunarii St., no. 10', '3', '76000 Euro',1),
(6,'for sale', 'apartemnt', '2', 'Popesti Leordeni, Drumul Fermei St., no. 6', 'Ilfov', '63000 Euro',1),
(7, 'for sale', 'house', '4', 'Popesti Leordeni, Amurgului St., no. 25', 'Ilfov', '125000 Euro',1),
(8,'for sale', 'apartment', '2', 'Bucharest, Mihai Bravu St., no. 56', '2', '550 Euro',2),
(9,'for sale', 'apartment', '2', 'Bucharest, Iancului St., no. 13', '2', '82500 Euro',2),
(10,'sold', 'apartment', '3', 'Bucharest, Barajul Sadului St., no. 15', '3', '73000 Euro',2),
(11,'for rent', 'apartment', '1', 'Bucharest, Buhusi Ale, no. 5', '3', '300 Euro',2),
(12,'sold', 'apartment', '2', 'Bucharest, Pantelimon St., no. 73', '2', '70000 Euro',2),
(13,'for sale', 'apartment', '3', 'Bucharest, Burdujeni St., no. 3', '2', '100000 Euro',2),
(14,'for sale', 'apartment', '1', 'Bucharest, Drumul Gura Putnei, no. 32', '3', '58000 Euro',2),
(15,'sold', 'apartment', '2', 'Bucharest, Iuliu Maniu Blvd., no. 73', '6', '103000 Euro',3),
(16,'for sale', 'apartment', '1', 'Bucharest, Iuliu Maniu Blvd, no. 25', '6', '55000 Euro',3),
(17,'for sale', 'apartment', '2', 'Bucharest, Virtutii St., no. 8', '6', '76000 Euro',3),
(18,'for sale', 'apartment', '3', 'Bucharest, Drumul Taberei, no. 52', '6', '68000 Euro',3),
(19,'for sale', 'apartment', '2', 'Bucharest, Brasov St., no. 14', '6', '95000 Euro',3),
(20,'for sale', 'apartment', '1', 'Bucharest, Virtutii St., no. 19', '6', '60000 Euro',3),
(21,'sold', 'apartment', '2', 'Bucharest, Iuliu Maniu Blvd, no. 110', '6', '73000 Euro',3),
(22,'sold', 'apartment', '2', 'Bucharest, Iuliu Maniu Blvd, no. 60', '6', '85000 Euro',3),
(23,'for sale', 'apartment', '2', 'Chiajna, Rezervelor St., no. 43', 'Ilfov', '65000 Euro',4),
(24,'for sale', 'apartment', '3', 'Chiajna, Apeductului St., no. 17', 'Ilfov', '725000 Euro',4),
(25,'sold', 'apartment', '2', 'Chiajna, Tineretului St., no. 34', 'Ilfov', '68000 Euro',4),
(26,'sold', 'apartment', '2', 'Chiajna, Rezervelor St., no. 24', 'Ilfov', '65400 Euro',4),
(27,'for sale', 'apartment', '1', 'Chiajna, Tineretului St., no. 20', 'Ilfov', '48000 Euro',4),
(28,'sold', 'apartment', '2', 'Chiajna, Tineretului St., no. 6', 'Ilfov', '60000 Euro',4),
(29,'for rent', 'apartment', '2', 'Bucharest, Dacia Blvd, no. 5', '1', '750 Euro',5),
(30,'for rent', 'apartment', '2', 'Bucharest, Lascar Catargiu St., no. 34', '1', '880 Euro',5),
(31,'for sale', 'apartment', '1', 'Bucharest, Mihai Eminescu St., no. 38', '2', '65000 Euro',5),
(32,'for sale', 'apartment', '2', 'Bucharest, Stirbei Voda St., no. 3', '1', '99000 Euro',5),
(33,'sold', 'apartment', '1', 'Bucharest, Sperantei St., no. 5', '1', '900 Euro',5),
(34,'rent', 'apartment', '2', 'Bucharest, Calea Mosilor, no. 178', '2', '680 Euro',5);

INSERT INTO details_properties (details_properties_id, property_status, property_type, rooms, space_area, property_address, district, price, employee_id) VALUES 
(35,'for rent', 'commercial space', '0', '70 sqm', 'Bucharest, Lascar Catargiu Blvd, no. 12', '1', '1150 Euro',6),
(36,'for rent', 'commercial space', '0', '85 sqm', 'Bucharest, Mihai Eminescu St., no. 14', '2', '1500 Euro',6),
(37,'for rent', 'commercial space', '0', '110 sqm', 'Bucharest, Baba Novac St., no. 7', '3', '2200 Euro',6),
(38,'rent', 'commercial space', '0', '195 sqm', 'Bucharest, Mihai Bravu St., no. 71', '3', '3420 Euro',6);

INSERT INTO clients (last_name, first_name, email, phone, rental_date, action_status, property_type, address, employee_id) VALUES
('Matei', 'Florina', 'florina.matei@gmail.com', '0745678912', '17.04.2023', 'bought', 'apartment', 'Soseaua Pantelimon', 1),
('Matei', 'Florina', 'florina.matei@gmail.com', '0745678912', '03.11.2023', 'rented', 'commercial space', 'Soseaua Pantelimon', 1),
('Constantin', 'Georgiana', 'georgiana-constantin@gmail.com', '0753214567', '12.01.2024', 'rented', 'apartment space', 'Campia Libertatii', 2),
('Popescu', 'Cristina', 'cristina.popescu@gmail.com', '0712345623', '05.09.2023', 'bought', 'apartment', 'Barajul Dunarii', 3),
('Popescu', 'Cristina', 'cristina.popescu@gmail.com', '0712345623', '05.09.2023', 'rented', 'apartment', 'Calea Mosilor', 3),
('Cristea', 'Eugen', 'cristea.eugen@gmail.com', '0732456871', '01.08.2023', 'bought', 'apartment', 'B-dul Iuliu Maniu', 4),
('Pop', 'Ion', 'popion@gmail.com', '0723234563', '06.02.2024', 'rented', 'commercial space', 'B-dul Nicolae Grigorescu', 5),
('Pop', 'Ion', 'popion@gmail.com', '0723234563', '06.02.2024', 'rented', 'commercial space', 'Soseaua Mihai Bravu', 5),
('Dumbrava', 'George', 'george.d@gmail.com', '0721333258', '23.01.2024', 'bought', 'apartment', 'Strada Tineretului', 6),
('Dumitru', 'Roxana', 'roxi.dumitru@gmail.com', '0721369333', '01.03.2024', 'bought', 'apartment', 'Strada Sperantei', 7);

INSERT INTO details_employees (details_id, position, email, phone, employee_id) VALUES
(2, 'Coordinator', 'georgep@gmail.com', '0723456789',2),
(4, 'Agent','dumitrascuf@gmail.com', '0745678912',4),
(7, 'Agent','mihaic@gmail.com', '0789123456',7),
(8, 'Agent','valenting@gmail.com', '0791234567',8);

```

  After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:

```The "gender" column has been updated with information regarding the sex of each employee.```
```
UPDATE details_employees SET gender="M" WHERE employee_id in (2, 4, 7, 8); 

UPDATE details_employees SET gender="F" WHERE employee_id in (1, 3, 5, 6);
```

```The column 'action_status' in the 'customers' table was modified to 'sold' for 'employee_id 1'.```
```
UPDATE customers SET action_status = 'sold' WHERE employee_id = '1';
```

```The 'price' column in the 'details_properties' table was modified for details_properties_id = '8'.```
```
UPDATE details_properties SET price='450 Euro' WHERE details_properties_id = '8';
```

```The first name for 'employee_id = 6' in the 'employees' table was modified.```
```
UPDATE employees SET first_name = 'Georgiana' WHERE employee_id = '6';
```

  <li>DQL (Data Query Language)</li>

After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean: 

``` The database was deleted, but recreated later.```
```
DROP DATABASE real_estate_Buc1;
```

```  The values in the 'gender' column were deleted where gender='M'.```
```
DELETE FROM details_employees WHERE gender='M';
```

In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:

**Inserati aici toate instructiunile de SELECT pe care le-ati scris folosind filtrarile necesare astfel incat sa extrageti doar datele de care aveti nevoie**
**Incercati sa acoperiti urmatoarele:**<br>
**- where**<br>
**- AND**<br>
**- OR**<br>
**- NOT**<br>
**- like**<br>
**- inner join**<br>
**- left join**<br>
**- OPTIONAL: right join**<br>
**- OPTIONAL: cross join**<br>
**- functii agregate**<br>
**- group by**<br>
**- having**<br>
**- OPTIONAL DAR RECOMANDAT: Subqueries - nu au fost in scopul cursului. Puteti sa consultati tutorialul [asta](https://www.techonthenet.com/mysql/subqueries.php) si daca nu intelegeti ceva contactati fie trainerul, fie coordonatorul de grupa**<br>

</ol>

<li>Conclusions</li>

**Inserati aici o concluzie cu privire la ceea ce ati lucrat, gen lucrurile pe care le-ati invatat, lessons learned, un rezumat asupra a ceea ce ati facut si orice alta informatie care vi se pare relevanta pentru o concluzie finala asupra a ceea ce ati lucrat**

</ol>
