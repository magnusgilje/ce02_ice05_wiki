# Session 1

1. Open up SSMS.
1. Go to the AdventureWorks database.
1. Start a new query:
   ```
   use AdventureWorks
   go
   ```
1. We're going to be looking at some nifty functions, and these can all be found in the `Functions` folder within the `Programmability` folder of that database.
1. You can nest functions within each other to automate or simplify the inputs and add functionality.
1. Use some functions to return the data to the left of a hyphen, and one for the data to the right:
![image.png](/.attachments/image-bb8708ab-4685-4ae9-9f24-5da20caff6e3.png)
   ```
   use adventureworks
      go
   select
	 productnumber
	,left(productnumber,CharIndex('-',productnumber,1)-1) as Category
	,right(productnumber,Len(productnumber) - CharIndex('-',productnumber,1)) as Num
	,color
  	,listprice
   from Production.Product
   ```
1. Go and look at all other cool string functions you can use!

# Session 2
1. From the AdventureWorks database, go have a look at `person.address`.
1. There is a "geography" data type that handles some representations of geographic data. This is of course not standard and you'll need to add it as an extension or model. This data type is case-sensitive and was written in C#. Fun times.
1. We are able to call methods on this data type to make it a bit more readable to people.
1. There are additional methods you can call on geographic data types to calculate some cool things that you might like to know, given geographic data.
1. A function typically acts within each row. That is, a function is applied to every row individually. However, if I want a function to consider other rows, I would use a **window function**. These allow you to calculate, for example, averages across rows, running totals, etc. A windows function is declared by the `ORDER` statement:
   ```
   SUM([column1]) OVER (ORDER BY [column2]) AS running_total
   ```
   Returns the running total of column 1, ordering the table by column 2, and storing this in the new column "running_total".

   - You can also group the data being worked on by using the `PARTITION BY` statement.


# Session 3