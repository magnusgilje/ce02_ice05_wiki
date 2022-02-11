[[_TOC_]]

# Getting Started

1. Open up a Jupyter notebook (you need to be in an anaconda prompt, don't forget).
1. Pip and Anaconda are both package repositories for Python.
1. Run `pip install pyodbc` from a **new** anaconda prompt. If it is already installed, then happy days! Proceed.
1. Open up the `connecting-to-sequel-servers` guide in Github in a separate tab. You'll need it.
1. In your Jupyter Notebook, run
   ```
   import pyodbc
   conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=test;DATABASE=test;UID=user;PWD=password')
   ```
   This should connect you to your server and database.
1. You'll then need a cursor. Run:
   ```
   cur = conn.cursor()
   ```
1. And then you'd write your query:
   ```
   query = 'select productnumber, color, listprice from production.product'
   ```
1. And then get your results:
   ```
   results = cur.execute(query)
   for row in results:
      print(row)
   ```

Now, because your laptop is a potato and can't handle a hundred billion rows, we'll need to *shard* the data (partition it). We'll use a primary key to do this and we'll need to find a way to split it up using something clever.

9. Sharding this data by Product ID:
   ```
   queryshard0 = 'select productnumber, color, listprice from production.product where productid % 5 = 0'
   queryshard1 = 'select productnumber, color, listprice from production.product where productid % 5 = 1'
   queryshard2 = 'select productnumber, color, listprice from production.product where productid % 5 = 2'
   queryshard3 = 'select productnumber, color, listprice from production.product where productid % 5 = 3'
   queryshard4 = 'select productnumber, color, listprice from production.product where productid % 5 = 4'
   ```
And what this does is split the data into five parts based on the property of productid that it'll leave some remainder after being divided by 5. That's one way to partition data. There may be more or different ways depending on what you're working with and what you want out of the data.

1. Suppose you wanted to add additional parameters to your query. Before asking it, define some parameters:
   ```
   query = 'select productnumber, color, listprice from production.product where color = ? and listprice > ?'
   params = ['red',100]
   results = cur.execute(query,params)
   ```
1. But we can be clever with that and prompt the user for inputs for those parameters:
   ```
   color_prompt = input('Pick a color: ')
   params = (color_prompt,100)
   ```
1. Remember that you are in a Python environment, and Python will do its thing before the server even knows it's about to get hit, so whatever Python can do in terms of string manipulation, user inputs, whatever, it will do all that and then pass the complete query off to the server. So you end up with a dynamic query that can be built by Python limited only by how brave you are.
   **But use the parametised query** (with the question mark), don't try and build the query string with fstrings - it's a mess and not worth the effort.

## Schemas

1. Define a query that adds a column:
   ```
   query = 'insert into [table] ([column1],[column2]) values (?,?)'
   ```
   And populates it:
   ```
   params = ([data1],[data2])
   cur.execute(query)
   conn.commit()
   ```
   And if you don't commit, the rainbow wheel of death appears, the server grinds to a halt, and the End Times dawn on the horizon with blazing fire.
   But seriously, do remember to commit to prevent the database from being locked.

#SQL Transactions

Inserting, updating, and deleting data. The only other thing you'd want to do is read the data. And this is only SQL - other DBs will have different terminology, but they generally mean the same thing.

As much as SQL on Windows lets you get away with murder, all commands should end in a semicolon (according to the ANSI standard for SQL).

##Insertions

You may insert hard-coded values, paste it in from another table, or merge it from another table.

Or, you have the mother of all tables and you'd like to dump that in. This is **data ingestion**.

Data used to be handled by the "Extract-Transform-Load" framework. Now we use Data Pipelines. With fancy cloud storage options, databases now work from the file directly, reading data as it is in the file rather than making a copy of the raw version to create a new database on the local machine. Yes, that explanation was terrible. Point is ETL involved transforming data whereas modern approaches can't be bothered with that anymore - data just gets passed through a pipeline to its destination.