To navigate to a database's built-in functions, go to your database, there will be a folder called `Programmability`, and then `Programmability > Functions > System Functions` and then have a browse.

[[_TOC_]]

# Built In Functions

Within SQL there are built in functions which can help you perform queries. Here we will make a log of the functions covered, what they do and what they need to work.

- `DATEDIFF(interval, date1, date2)`

Interval can be Year (year, yyyy, yy), Month (month, mm, m), Day (day, dy, y) and more (quarter, day of year etc.)

To get the year in decimal, find the difference in days then divide by 365. (365.25 if lots of years to account for leap years)

- `LEFT(string, number_of_chars)`
- `RIGHT(string, number_of_chars)`

Returns the left / right defined number of characters. For example:

`LEFT('Kubrick', 2)` would return `'Ku'`

- `CHARINDEX(substring, string)`

Returns the index of the substring within the string (Note: count from 1)

- `LEN(string)`

Simply returns the length of the string given

- `TRIM(string)`

Will return the string without any leading or trailing whitespaces

- `SUBSTRING(expression, start, length)`

To get a substring from a string

## Window Functions

Functions that are not limited to the scope of the row they are being performed on.

Three types of window functions
- Statistics
- Ordinal
- Ranking

### Statistical Window Functions

Format:
`func(column) over (partition by (column))`

Examples of statistical functions to be used across a window:
- `sum()` - Total
- `avg()` - Average (mean) of values
- `count(*)` - Number of entries
- `min()` - Minimum value
- `max()` - Maximum value
- `stdev()` - Standard deviation (How much the data is spread)
- `var()` - (Standard deviation)^2
- `count()` - Number of entries

### Ordinal Window Functions

- `LAG()` - Previous
- `LEAD()` - Next
- `FIRST_VALUE()` - Beginning of the window
- `LAST_VALUE()` - Last of the window

Example:
`lead(TotalDue) over (partition by CustomerID order by OrderDate) as NextVisit`

This will create a column which will show the same customers next spend after that visit.

### Ranking Window Functions

`rank() over (order by <column> desc)`

The above will display another column with the ranking with the highest values of <column> returning the lowest ranking.

`rank()` will make tied values equal to the lowest rank. For example 1,1,1,4,4,6,7,...

Using `dense_rank()` will display the above as 1,1,1,2,2,3,4,...

## Number Functions

- `abs(number)` - Absolute value (makes positive)
- `ceiling(number)` - Rounds up to nearest integer
- `floor(number)` - Rounds down to nearest integer
- `round(number, precision)` - Rounded number to <precision> decimal places