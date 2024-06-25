-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------- CREATE DATABASE ---------------------------------------------------------------------
CREATE DATABASE real_estate_Buc1;
USE real_estate_Buc1;
SHOW databases;

-- -- ------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------- CREATE TABLE -------------------------------------------------------------------------
-- -- ------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(25),
    first_name VARCHAR(20),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);
-- ------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE details_employees (
    details_id INT PRIMARY KEY,
    position VARCHAR(15),
    email VARCHAR(50),
    phone VARCHAR(20),
    employee_id INT UNIQUE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
-- ------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE properties (
    property_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
-- ------------------------------------------------------------------------------------------------------------------------------------------------


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
-- ------------------------------------------------------------------------------------------------------------------------------------------------


ALTER TABLE details_properties
ADD CONSTRAINT FK_details_properties_properties
FOREIGN KEY (employee_id)
REFERENCES properties (employee_id);

-- ------------------------------------------------------------------------------------------------------------------------------------------------

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

-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------- INSERT ---------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------

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

-- ------------------------------------------------------------------------------------------------------------------------------------------------

ALTER table details_properties ADD COLUMN space_area VARCHAR(50) AFTER rooms;
-- ------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO details_properties (details_properties_id, property_status, property_type, rooms, space_area, property_address, district, price, employee_id) VALUES 
(35,'for rent', 'commercial space', '0', '70 sqm', 'Bucharest, Lascar Catargiu Blvd, no. 12', '1', '1150 Euro',6),
(36,'for rent', 'commercial space', '0', '85 sqm', 'Bucharest, Mihai Eminescu St., no. 14', '2', '1500 Euro',6),
(37,'for rent', 'commercial space', '0', '110 sqm', 'Bucharest, Baba Novac St., no. 7', '3', '2200 Euro',6),
(38,'rent', 'commercial space', '0', '195 sqm', 'Bucharest, Mihai Bravu St., no. 71', '3', '3420 Euro',6);


INSERT INTO clients (last_name, first_name, email, phone, rental_date, action_status, property_type, address, employee_id)
	VALUES 	('Matei', 'Florina', 'florina.matei@gmail.com', '0745678912', '17.04.2023', 'bought', 'apartment', 'Soseaua Pantelimon', 1),
			('Matei', 'Florina', 'florina.matei@gmail.com', '0745678912', '03.11.2023', 'rented', 'commercial space', 'Soseaua Pantelimon', 1),
			('Constantin', 'Georgiana', 'georgiana-constantin@gmail.com', '0753214567', '12.01.2024', 'rented', 'apartment space', 'Campia Libertatii', 2),
            ('Popescu', 'Cristina', 'cristina.popescu@gmail.com', '0712345623', '05.09.2023', 'bought', 'apartment', 'Barajul Dunarii', 3),
            ('Popescu', 'Cristina', 'cristina.popescu@gmail.com', '0712345623', '05.09.2023', 'rented', 'apartment', 'Calea Mosilor', 3),
            ('Cristea', 'Eugen', 'cristea.eugen@gmail.com', '0732456871', '01.08.2023', 'bought', 'apartment', 'B-dul Iuliu Maniu', 4),
            ('Pop', 'Ion', 'popion@gmail.com', '0723234563', '06.02.2024', 'rented', 'commercial space', 'B-dul Nicolae Grigorescu', 5),
            ('Pop', 'Ion', 'popion@gmail.com', '0723234563', '06.02.2024', 'rented', 'commercial space', 'Soseaua Mihai Bravu', 5),
            ('Dumbrava', 'George', 'george.d@gmail.com', '0721333258', '23.01.2024', 'bought', 'apartment', 'Strada Tineretului', 6),
            ('Dumitru', 'Roxana', 'roxi.dumitru@gmail.com', '0721369333', '01.03.2024', 'bought', 'apartment', 'Strada Sperantei', 7);
            
-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------- SELECT ---------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM employees;
SELECT * FROM details_employees;
SELECT * FROM properties;
SELECT * FROM details_properties;
SELECT * FROM clients;

-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------- DROP  ----------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------

DROP DATABASE real_estate_Buc1;

-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------- DATABASE RELATIONSHIP  ----------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM employees CROSS JOIN details_employees;

SELECT * FROM employees INNER JOIN details_employees ON employees.employee_id = details_employees.employee_id;

SELECT * FROM employees LEFT JOIN details_employees ON employees.employee_id=details_employees.employee_id;

SELECT * FROM employees RIGHT JOIN details_employees ON employees.employee_id=details_employees.employee_id;

-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------- DATA QUERY LANGUAGE--------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM details_properties where property_status ="sold";

SELECT * FROM details_properties where rooms = '2' or price > '70000 Euro';

SELECT * FROM details_properties WHERE property_status="for rent" order by price asc;

SELECT * FROM details_properties where property_type ="house";

SELECT * FROM clients where last_name= "Matei"; 

SELECT * FROM clients where first_name= "Cristina" and property_type= "apartment" and action_status = "rented";

SELECT * FROM details_employees WHERE employee_id = "4";

SELECT * FROM details_employees WHERE position="agent" AND employee_id = "6";

SELECT count(price) FROM details_properties WHERE price < '1800 Euro';

SELECT min(price) FROM details_properties WHERE price >= '1700 Euro';

SELECT MAX(PRICE) FROM details_properties WHERE price >"2000" and property_status = "rent";

SELECT AVG(price) FROM details_properties WHERE district= "3" and property_type = 'commercial space';

SELECT * FROM details_properties WHERE price LIKE '7%';

SELECT * FROM clients WHERE phone LIKE "%567"; 

SELECT * FROM details_properties LIMIT 5;

SELECT district, COUNT(*) AS num_properties FROM details_properties GROUP BY district;

SELECT district, COUNT(*) AS num_properties FROM details_properties WHERE district = 'Ilfov' GROUP BY district HAVING COUNT(*) > 1;

SELECT * FROM clients WHERE last_name LIKE '%op' OR property_type LIKE 'apar%' AND employee_id = '5';

-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------- DATA DEFINITION LANGUAGE---------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------
desc clients;

ALTER TABLE clients RENAME TO customers;

SELECT * FROM customers;

ALTER TABLE customers MODIFY email varchar(40);

ALTER TABLE details_properties MODIFY property_status char (30) not null;

ALTER TABLE details_employees ADD COLUMN date_of_birth date;

ALTER TABLE details_employees DROP COLUMN date_of_birth;

ALTER TABLE details_employees ADD COLUMN SEX CHAR (10);

ALTER TABLE details_employees CHANGE SEX GENDER VARCHAR(10) after position;

UPDATE details_employees SET gender="M" WHERE employee_id in (2, 4, 7, 8); 

UPDATE details_employees SET gender="F" WHERE employee_id in (1, 3, 5, 6); 

select * from details_employees;

DELETE FROM details_employees WHERE gender='M';

INSERT INTO details_employees (details_id, position, email, phone, employee_id) VALUES
(2, 'Coordinator', 'georgep@gmail.com', '0723456789',2),
(4, 'Agent','dumitrascuf@gmail.com', '0745678912',4),
(7, 'Agent','mihaic@gmail.com', '0789123456',7),
(8, 'Agent','valenting@gmail.com', '0791234567',8);

-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------- DATA MANIPULATION LANGUAGE---------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE customers SET action_status = 'sold' WHERE employee_id = '1';

UPDATE details_properties SET price='450 Euro' WHERE details_properties_id = '8';

UPDATE employees SET first_name = 'Georgiana' WHERE employee_id = '6';








