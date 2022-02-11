[[_TOC_]]

SQL server refers specifically to Microsoft sql database,
SQL (SeQueL) can refer to both the database and language
Structure English Query Language	
For comment, use `--` 

- Structured SQL DBMS (Database Management Systems):
   - Schema on Write – at the time when you wrote it, must abide by the schema (rules)
      - CLEAN DATA REQUIRED
- Semi-Structured Data Management Systems “NoSQL” (can use same query language) eg JSON, xml
   - We want more FREEDOOOOOOOOMMMM
   - Schema on Read – store any old junk, but when you query it, you need to cleanse/define what you get
      - Can store anything you want 


FULLY QUALIFIED NAME = Servername.databasename.schema.table

Select_list is about which columns you want to select or PROJECT
SELECT only once, separate what you want with commas

LOWER(thing you want to look for) gives lowercase stuff back

WHERE gives you horizontal filter.

Datediff(dd or mm or yy, start date, end date)

charindex(thing to find, where to look)

trim (something) removes leading and lagging blankspaces, should always be the first one you run to clean data


##Joining Tables:

Unique Identifier column is called PK- Primary Key
Where it is being referenced, is called FK- Foreign Key
Things that are just put in once are called Attributes

# SQL

"SQL", "SeQueL" - Structured English Query Language. SQL refers to both the language and the software (Microsoft SQL).

A SQL cloud database is typically serverless: the user does not get access to the server, only the service (much like a function, but you knew that). Physically, there still is a server or a cloud database where the data resides, it is just made available over the cloud. The client opens up a physical connection with the server with an IP address, and then uses SQL queries to request data, returning tabular data from the database (i.e., a swanky table containing all the data that matches the client's query). These SQL requests and what the client does with the tabular data will depend on your needs and tools:

- Py ODBC is a service that allows the client to interface with the database. This is a data-sciency approach.
- The data analyst approach, using nice easy drag-and-drops for creating big pictures with nice colours, is PowerBI.
- Or you might be a developer using databases, in which case you could use a client like SSMS client.

## SQL Commands

There are ten core SQL commands. They are broken down as follows:

### DDL - Data Definition Language

Defining the structure and schema of objects.

`CREATE` - "I want to create database objects."
`DROP` - "I want to remove database objects."
`ALTER` - "I want to change a database object."

### DQL - Data Query Language

Getting stuff from the data that is present.

`SELECT` - "I want to choose data."

The `SELECT` is within a logical processing order when parsing database arguments:

1. `FROM`
1. `ON`
1. `JOIN`
1. `WHERE`
1. `GROUP BY`
1. `WITH CUBE` or `WITH ROLLUP`
1. `HAVING`
1. `SELECT`
1. `DISTINCT`
1. `ORDER BY`
1. `TOP`

What does this all mean? It means that the system will perform some operations before getting around to the select so, much like in mathematics, the order of operations is important. But hopefully this order will be somewhat intuitive.

### DML - Data Manipulation Language

Making changes to the data directly.

`INSERT` - "I want to add data."
`DELETE` - "I want to remove data."
`UPDATE` - "I want to change data in place."

### DCL - Data Control Language

Making changes to who can do what on the data (permissions).

`GRANT` - "I want to give you permissions."
`DENY` - "I want to prevent you from doing something."
`REVOKE` - "I want to clear the permission rules that are applied to you."

## Ordinal Window Functions

- `LAG` Returns things from the previous row.
- `LEAD` Returns things from the next row.
- `FIRST_VALUE()` Returns the very first item in the window.
- `LAST_VALUE()` Returns the very last item (who knew) in the window.
