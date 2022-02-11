1. Download SSMS.
    a. Search "download SSMS".
    b. Download version 18.10 (the first link, probably).
1. Go to https://www.sharkattackfile.net/incidentlog.htm
    a. Open it up in Excel.
    b. What you will see is a shoddy dataset (i.e., low quality) containing many sins such as rogue whitespace characters, null values, inconsistent data types within columns...
1. Restart your machines, enjoy your admin privileges, and install some SSMS (step 1).
1. Once installed, launch it and copy the login credentials into the portal, which should connect you to the friendly database on the other side.

# Microsoft SQL Server Management Studio

1. So, all set up and logged in. You can bring up the Object Explorer with the F8 key, or by revealing it from the "Tools" drop-down.
1. Go to the AdventureWorks database, open up tables and have a look at all that data.
1. Start a new query from the menu at the top or the shortcut "ctrl + n".
1. In this query, add:
   ```
   use [databaseName]
   go
   select
       *
   from [table.name]
   ```
   You'll be able to drag the desired table into the query directly. Helpful for fiddly table names.
   In this example, `databaseName = AdventureWorks` and `[table.name] = [Production].[Product]`
   - Please don't run real queries with the asterisk (`*`). It makes data engineers very sad.
1. Hit F5 to run that query.
1. You've successfully run your first query!
1. You can return selected columns by listing them under `select`:
   ```
   select
      [column 1]
      [column 2]
      [column 3]
   from [table.name]
   ```
1. You can also perform arithmetic operations on columns to return a new output column. You can concatenate things. All the stuff you'd expect to do with data tables, you can do.
1. Suppose I want a variable, here's how to do it:
   ```
   declare @variableName dataType
   set @variableName = foo
   ```
   So, you would declare the variable with a `declare` statement, define its type, and any associated arguments, and then you would set its value with the `set` statement.
1. But now you don't like its type - how do you convert between data types? Use `cast` or `convert`.
1. Suppose you don't want to return all rows - there are millions of them, after all. Just amend your query:
   ```
   select top 10
      *
   from [table.name]
   ```
   And it'll return the first ten results of your query. It obviously doesn't always have to be ten...
1. But now, as a clever clogs, you fancy joining some tables together. Have a look at this sample code to join the product, subcategory and category tables:
   ```
   select
      p.[name] as Productname
     ,p.listprice
     ,p.color
     ,s.[name] as Subcatname
     ,c.[name] as Catname
   from [Production].[Product] as p
   join [Production].[ProductSubcategory] as s
     on p.ProductSubcategoryID = s.ProductSubcategoryID
   join [Production].[ProductCategory] as c
     on s.ProductCategoryID = c.ProductCategoryID
   ```
   - So, first thing to note: "name" is enclosed in square brackets because it is a SQL keyword, and this addresses that.
   - Next, we have multiple instances of [name] that come from different tables. We have turned them into aliases to disambiguate them by making them `p.[name]`, `c.[name]`, and `s.[name]`.
   - To add to that, since we don't want them all to be called "name" in the output table, we've told it to rename those columns once it imports them with the `as` statements.
   - And then we get to the joining. The syntax for joining columns is `FROM first_table JOIN second_table [ON <join condition>]`
   - Here, we're saying to join the Product table with the Product Subcategory table when the IDs are equal.
   - We are also telling it to import that Product table with the alias `p`, the Subcategory table `s`, and Category table `c`.
   - The same with the Category table.
   - And don't forget about that order of operations! SQL executes code by function, rather than by line number, which is why it can call columns in line two that are only joined to the table in line 45.

## Rules for Object Naming

-	Spaces require []
-	Reserved keywords require []
-	First character should be (a-z)
