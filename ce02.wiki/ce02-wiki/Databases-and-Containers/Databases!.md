[[_TOC_]]

# Databases Introduction

> /ˈdeɪtəbeɪs/
> _noun_
> a structured set of data held in a computer, especially one that is accessible in various ways.

Thanks, Google (and Oxford Languages).

## Database Types

Databases are either **Relational**, **NoSQL** (semi-structured), or a **Data Lake** (unstructured). For a funky list of databases and their relative popularity, head on over to [db-engines](https://db-engines.com/en/ranking_trend).

### Relational Databases And Structured Data

Relational databases were first developed in the 1970s in the form of SQL and are good for structured data. **Structured data** is data that conforms to a set of pre-defined rules such as _data type_ and _nullability_ (whether null values are permitted). This makes the data easy to query as you know what to expect and typically results in high data quality to conform to the rules of the database. And that second reason is what makes relational databases so much hard work - suddenly your database is sulking in the corner because a blank space in row 69420 doesn't conform to the rules.

To help, there are DBMS (Database Management Systems) that may be **schema on write**, meaning that the data must abide by the rules at the time that it is written. These kinds of systems would include Oracle or MySQL.

### Semi-Structured Data And NoSQL

Semi-structured data management systems such as NoSQL came about because data is messy and folks wanted more freedom. These systems are **schema on read**, allowing any data to be written and effectively transferring the task of data cleaning to the client, because "I missed the part where that's my problem".

Semi-structured data types might include `XML`, `JSON`, or `YAML`. Basically everywhere, so if you're unsure, smack it into a JSON document.

DBMS for semi-structured data would include MongoDB, CosmosDB (Azure), or DynamoDB (Amazon) and their main plus point is that they permit data storage in JSON documents.

### Unstructured Data (Chaos)

A Data Lake is the most familiar - it's just a file system containing folders and files much like that mess I call my desktop. A good data lake deployment will introduce some sense to the file structure to make it easier for systems and people to navigate. They can store pretty much anything and order is optional.

# Database Structure

A database is usually mapped to a piece of software, keeping all of the relevant data together.

A database is typically represented with a cylinder.

Databases are typically directly referenced with a fully qualified name: `servername.database.schema.table`.

## Database Conventions

There are just three naming rules that will make your life as a developer easier:

1. Avoid spaces in object names.
1. Avoid reserved SQL keywords.
1. The first character should be alphabetical.

If you break these rules, ~~I will find you, and I will...~~ just pop some square brackets around it and move on.

## Database Practices

### Big Data (In Small Tables)

It is generally more desirable to have data stored in many small tables rather than one monolithic table. With smaller tables, data duplication is controlled and the risk of conflicting data is reduced. In a relational database, unique rows are linked together via IDs, which means that each row in each table is unique, no data is duplicated, and conflicts are avoided.

Unique identifiers are known as **primary keys** and is what uniquely identifies a row within a table. They are called **foreign keys** when they are being used to reference rows in other tables.

# Data Lifecycle

Data is typically received as a rather suspicious-looking file in your inbox. You don't know what's in it. The sender doesn't know what's in it. The researcher doesn't know what's in it. So, what to do?

Assuming the data is the data we wanted, it is first put into **staging tables** in its raw format. This is the file just burping into SQL and giving you some things.

We then go into cleansing using SQL, Python, and other code solutions. This is a very lengthy and drawn-out process that ensures the data conforms to the schema, doesn't contain obvious errors, etc. etc. Painful, but hopefully automatable, and once you set it off, you can go off, play some Crysis, Minecraft, whatever, and come back in a week to pick up your clean tables.

Sometimes the raw and cleaned tables are stored in the same database with _clear_ labels. Oftentimes there will be a database for the raw data and a database for the cleaned tables that will then get passed on to production, or the analytics team, or whoever couldn't be bothered to do the cleaning but wants to show off their shiny graphs.