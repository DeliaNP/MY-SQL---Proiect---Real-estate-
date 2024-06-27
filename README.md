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

  **Inserati aici toate instructiunile de INSERT pe care le-ati scris. Incercati sa folositi atat insert pe toate coloanele (fara sa precizati pe ce coloane se face insert) cat si insert pe cateva coloane (care necesita mentionarea explicita a coloanelor pe care se face insert). De asemenea, incercati sa acoperiti situatia in care inserati mai multe randuri in acelasi timp**

  After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:

  **Inserati aici toate instructiunile de UPDATE pe care le-ati scris folosind filtrarile necesare astfel incat sa actualizati doar datele de care aveti nevoie**


  <li>DQL (Data Query Language)</li>

After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean: 

**Inserati aici toate instructiunile de DELETE pe care le-ati scris folosind filtrarile necesare astfel incat sa stergeti doar datele de care aveti nevoie**

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
