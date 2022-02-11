[[_TOC_]]

# Statistical Functions

Statistical results include:

`SUM()`, `AVG()`, `MIN()`, `MAX()`, `COUNT()`, `STDEV()`, `VAR()`.

The important thing to remember is that your measures should be applied to naturally numeric fields. Basically, don't do a sum across a column containing telephone numbers. Nobody will thank you for that.

These functions will require that they be involved in a **window function** or **summary**.

# Group By

Window functions can do nice things, but the granularity of the data remains the same, i.e., the number of rows is the same. To summarise data, you'll need to use the `GROUP BY` syntax. To do this, you will group by a particular column, and then include only the statistics columns: in a summary you will not need fine details like "Order ID" or other primary keys, because by definition they cannot be summarised.

> Some Good Practice: Use `SELECT TOP` to look at data so you don't brick the server trying to load up a gazillion rows.

When using `GROUP BY`, you can only project columns that are being grouped or that have been measured by a statistical function.

If you want to filter the results of the summary, use the `HAVING` statement - this is because `WHERE` executes before `GROUP BY`, necessitating the statement that runs after.

You also can't call aliases in `GROUP BY` - if you have a summary column that is having operations done to it, you're going to have to copy that down the `GROUP BY` statement for SQL to be happy:
![image.png](/.attachments/image-d433fe7f-ee5d-4b1d-846c-a24e009d6cd8.png)
In line 12, I could not say `group by [year]` - this will say that the column [year] (or whatever I've called it in line 4) is invalid.

# PIVOT

Table structures are typically quite static (**stable**). The data is not. Altering tables involves a lengthy approval process involving a change board and all of that nonsense, since other applications might depend on it.

## Pivot Syntax (example):
![image.png](/.attachments/image-2e0ca873-1a6e-4e6b-bdcb-a64caca704ca.png)

# Set Functions

# Performance Tuning

People have no patience. Nobody wants to be waiting for queries to load, for apps to respond, for webpages to fill... And it's not necessarily TikTok's fault.

## Physical Data Storage

Data is stored on physical disks, whether they're actually spinning disks or solid-state or whatever. Physically, they are just 0s and 1s represented by magnetic fields, physical deformations, or charges on the physical media. Go have a look: if you have a microscope large enough you'll see them!

The system wants to know what's on the drive, and to keep track of everything it will create a big phat `.mdf` (Master Data File) document/header to tell it where everything is.

The `.mdf` file contains loads of pages, and each page represents a unit of storage (8 kB), much like the empty trays in a filing cabinet. Tables in a database get allocated to pages and, by default, a table will get allocated one page (the system has no idea how many pages you might need just yet). Come to think of it, this leads to messiness if your table will have many columns, because one row might turn out to exceed one page. What a mess. And it gets worse as more rows get added: more and more pages get allocated to sort out your table's needs.

But what do you know, you've got more tables, and more data, and more appends, maybe even some deletes. And, much like a messy human, the file system just slams that data into whichever page it can. And before you know it, your table is now smeared across your whole hard drive, one row at a time. Your hard drive now hates you and so does the system - it takes forever to find what it wants. This is called **fragmentation**, and the process of **defragmentation** is what happens when the system is told to "go tidy your room". The hard disk becomes nicely-ordered again, and performance is up.

But even if the rows from one table are all kept together, you still run into the problem of very large tables. No matter how few pages it takes, looking for something will still take some time. Unless... you can put everything in order. **Sort** the data, and create an *index*, and suddenly a whole load of functions get faster.

Imagine your dictionary just contained *words*. Just *words*. Everywhere. No order. You want to find a word? Well take a seat because you've just found your new full-time job. Luckily, dictionaries are ordered and each entry is sorted by its first character, and each additional character until the words are differentiated. Finding a word is now trivial because you know where it should be before even seeing the dictionary.

## Indexing

- Clustered Indexes - an ordered table. You'll need a primary key to sort things by, but once you have one you're good to go. Performance increases **if you search this table by the primary key**. Otherwise, well, you try and search the dictionary by last letter and get back to me.

- Non-Clustered Index - an ordered table, with added ordering. The system now creates a copy of the original table, instead indexing it by this different column, and to lighten the load on your hard drive you can limit which columns are included in this index.

So, in comes the juggling act that all of IT balances on: indexes improve performance, indexes take up space. We want performance but we also don't want to take up all the space with copies of tables in index form. Whose queries do we want to prioritise? Whose queries are most critical? Which queries are most frequent?

What will help when creating indexes is to know the statistics of your data. If a clustered index is the dictionary, nicely ordered by leading characters, a non-clustered index might be like the last few pages that contain an alternative index: the dictionary, ordered by some other word attribute. The usefulness of this non-clustered index would depend on the statistics that applies to all the words. An additional index that returned all pages containing the word "noun" would be totally useless since it would return all pages. However, a non-clustered index that ordered the dictionary by number of letters might be useful if your dictionary was for crossword players. It would then relist all words, with their corresponding page numbers, pointing you to the place you need to be in the data table (dictionary body).

## Statistics

`set statistics io on` will return various statistics on the given query.