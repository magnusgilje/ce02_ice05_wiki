[[_TOC_]]

# Introduction to Jupyter notebooks

There are two types of cell modes in Jupyter:

- Command mode (with a blue box)
- Edit mode (with a green box)
To run a cell, press Shift+Enter

In command mode (after pressing Esc),

- click 'm' to go into Markdown cell type
- click 'y' to switch to Python code cell type

To create a cell above the current cell, press 'a'.
To create a cell below the current cell, press 'b'.
To delete a cell, press 'd' twice in command mode

Here is a [markdown](https://www.markdownguide.org/cheat-sheet) guide.

# Variables and Arithmetic Expressions

The equals `=` sign is called the "assignment operator". It assigns the value to its right to the variable to its left.

```
 In [1]: 6 + 3 * 5
Out [1]: 21

 In [2]: a = 10
         print(a)
Out [2]: 10

 In [3]: a = 5
         b = 10
         c = a * b
         print(c)
Out [3]: 50
```

# Naming Rules and Conventions

- Variable names may only contain alphanumeric characters and underscores (A-Z, a-z, 0-9, _).
- Variable names may not begin with a numeric character.
   - Variable names beginning with an underscore have a special meaning in Python. Don't do this unless you know what you're doing and have a good reason for it.
- Variable names may not be another Python keyword.
- Variable names are case-sensitive.
- Use lower case rather than upper case.
   - Camel case is sometimes useful if a variable name contains multiple words.
   - Or use an underscore.
   - Or just use mixed case you absolute rebel. (Please don't.)
<IMG  src="https://maximus136.gallerycdn.vsassets.io/extensions/maximus136/change-string-case/1.1.2/1571421328667/Microsoft.VisualStudio.Services.Icons.Default"  alt="Change String Case - Visual Studio Marketplace"/>
- Names should be descriptive and concise.

Use `whos` to list all variables that have been named so far.

# Strings

The "string" data type holds a sequence of characters (letters, numbers, punctuation, symbols, etc.)
You can create a string by wrapping a bunch of characters in quotation marks:
- `'This is a string.'`
- `"This is a string."`
- `'''This is a string.'''`
- `"""This is a string."""`

## String Formatting

Formatting strings is useful if you have a string with placeholders and you want to replace the placeholders with variable names.
Placeholders are created in a string using curly brackets, `{}`.

```
 In [4]: a = 5
         b = 6
         print('Variable a is {} and variable b is {}.'.format(a, b)) # old method
         print(f'Variable a is {a} and variable b is {b}.') # f strings
         print(r'Variable a is {a} and variable b is {b}.') # raw string literal
Out [4]: Variable a is 5 and variable b is 6.
         Variable a is 5 and variable b is 6.
         Variable a is {a] and variable b is {b}.
```

# Conditional Statements (IF)

An `if` statement checks that a condition is true before continuing code execution.
The syntax for an if statement:

```
   if <condition>:
       <statements to execute if condition is true>
```

An if statement has optional extras such as the `else` and `elif` statements:

```
   if <condition>:
       <statements to execute if condition is true>
   elif <condition>:
       <statements to execute it the "else, if" condition is true>
   else:
       <statements to execute for everything else>
```

An `if` statement does not execute anything else within the `if` block except for the branch that satisfies the given conditions.

# Collections

There are four main data types in Python for storing multiple values in a single variable:

- Lists
- Tuples
- Sets
- Dictionaries

There are three main properties associated with each collection:

- **Mutability** - Whether the values in a collection can be changed after creation
- **Ordering** - Whether the values are ordered within the collection
- **Uniqueness** - Whether there can be more than one of the same value in the collection

## Lists

- Used to store a sequence of items.
- **Mutable** and **ordered** collection of values.
- Created using square brackets `[]`.

```
 In [5]: my_list = [1, 2, 3]
         print(my_list)
Out [5]: [1, 2, 3]
```

### List Methods

Access elements of a list by calling their index. Python uses zero indexing (the index of the first value in a list is 0, not 1).
`my_list[n]`

```
 In [6]: my_list[1]
Out [6]: 2
```

Use the `append` method to add items to the end of a list.
`my_list.append(value)`

```
 In [7]: my_list.append(4)
         print(my_list)
Out [7]: [1, 2, 3, 4]
```

Use the `insert` method to add items to a list at a particular location (index). Bear in mind that list indexes start from 0.
`my_list.insert(loc,value)`

```
 In [8]: my_list.insert(0,5)
         print(my_list)
Out [8]: [5, 1, 2, 3, 4]
```

Use the `remove` method to remove a given value from a list. This method will **only remove the first instance of that value in a list**.
`my_list.remove(value)`

```
 In [9]: my_list.remove(3)
         print(my_list)
Out [9]: [5, 1, 2, 4]
```

Lists can be concatenated using `+`.

```
 In [10]: my_list2 = ["a", "b", "c"]
          my_list_concat = my_list + my_list2
          print(my_list_concat)
Out [10]: [5, 1, 2, 4, "a", "b", "c"]
```

## Tuples

- **Immutable** collection.
- Created using round brackets `()`.
- Whereas a list would be better for values that are related, a tuple is more useful for grouping different variables together.

Tuples can also be concatenated using '+'.

Lists and tuples can be converted from one to the other using `list(my_tuple)` and `tuple(my_list)`.

## Sets

- Sets are **mutable**, **unordered**, and contain collections of **unique** values.
- Created using curly brackets `{}`.

A set can be a useful tool to remove duplicates from a list.

## Dictionaries

- **Mutable** collection of **key-value** pairs created by enclosing them with curly brackets `{}`.

`item 1` in a dictionary consists of `key1:value1`.
Values may also consist of lists.
After defining a dictionary, you can call the value for a corresponding key by using that key.

```
 In [11]: my_dict = {'key1':'value1', 'key2':'value2', 'key3':['listvalue1', 'listvalue2']}
          print(my_dict['key1'])
          print(my_dict['key3'][1])
Out [11]: value1
          listvalue2
```

Use the `keys` method to list all of the keys present in a dictionary.
`my_dict.keys()`

```
 In [12]: my_dict.keys()
Out [12]: dict_keys(['key1', 'key2', 'key3'])
```

Use the `values` method to list all of the values present in a dictionary.
`my_dict.values()`

```
 In [13]: my_dict.values()
Out [13]: dict_values(['value1', 'value2', ['listvalue1', 'listvalue2']])
```

Use the `items` method to list all of the items present in a dictionary.
`my_dict.items()`

```
 In [14]: my_dict.items()
Out [14]: dict_items(['key1', 'value1', 'key2', 'value2', 'key3', ['listvalue1', 'listvalue2']])
```

# Iteration and Looping

To "iterate" means to perform an action repeatedly. In this context, the repetitions are typically determined by the progression of a loop through the elements in a collection.
Use a `for` loop to iterate through the elements in a collection.

```
for <each_item> in <collection>:
    <process>
```

You may use this structure to iterate through lists, sets, tuples, and dictionaries.
When iterating through dictionaries, a `for` loop will typically return the key in that position rather than the value, but of course you can do a little Python wizardry to change that.

# Functions

Functions are useful for encapsulating logic in a program.
Case study:

> Abe notices that a particular set of actions takes place throughout his code. Abe writes a function that performs those actions and, in every location in his code where he needs it, he calls that function. When he needs to tweak his function, he goes into the function and changes it, and his whole program is happy.
> Bob writes out the same set of actions every time it takes place, adding thousands of lines of code to his program that all do the same thing. When he needs to tweak his function, he has to go all the way through his spaghetti code and fix it every time it occurs. His program probably won't be happy for days. Neither will his colleagues.
> Abe's approach is more efficient and easier to read. Bob's approach is pretty irritating.
> Be like Abe, don't be like Bob.

Functions are created using the `def` keyword.

```
def my_function(inputs)
    <do something with my inputs>
    return result # this line passes the output of the function into the global namespace
                  # we'll talk about namespaces later!
```

# File I/O

Python can read and write to files.
- Different modes for file handling - `'w'`, `'r'`, and `'a'`.
- When saving, use `..\example.file` to save it in the parent folder to the current directory.
   - Use `.\example.file` to save it in the current directory.
- Or you can define the full file path using a raw string literal to save it in a specific place.

## Writing to Files

```
my_file = open(r'.\example.file', 'w')
my_file.write('example text')
my_file.close()
```

The example text contained in the `write()` command should now be stored in your file.
In the first line, notice that the string is declared as a raw string literal.

## Reading Files

```
my_file = open(r'.\example.file', 'r')
contents = my_file.read
my_file.close()
```

The contents of your file are now stored in the variable `content`.
In the first line, the `open` function expects the file to be in the current working directory.

## Appending Files

```
my_file = open(r'.\example.file', 'a')
my_file.write('even more text')
my_file.close()
```

The contents of the write function should now be added to the end of the file, rather than overwriting the contents of the file (which is what `'w'` would do).

# Objects and Classes

In Python, every piece of data is an object. Each object has a specific type. We can create our own custom types by using classes.

So far, we have looked at a few different built-in object types such as strings, integers, floats, lists, tuples etc.

It is possible to see the object type by using the `type(object)` function.
Use the `dir` function to see the methods and attributes of an object. `dir(object)`.

You can create your own custom object types using classes. Classes are the blueprint for creating Python objects.

# Exceptions

Exceptions are raised when something is wrong with the program and it is unable to execute a piece of code.

Exceptions can be handled using a try/except block.

```
try:
    <operation to try>
except <error type, or blank for all errors>:
    <operation to perform if an exception is raised>
```

# Modules and Packages

There are many more functions and classes that we can 'import' into our programs. Python makes these available as Modules and Packages.

Import a module into python using the `import` command.

# Conventions and Syntax

## Termination of Statements

- Statements are terminated by new lines.
- It is not possible to have multiple statements on one line.

## Indentation

- Indentation and whitespace are very important in Python.
- Unexpected indentations (or lack thereof) causes errors.
- Code blocks in different scopes are differentiated using indentation.

# Operators

## Arithmetic Operators

`+` - add things together.
`-` - subtract things from each other.
`*` - multiply things together.
`/` - divide things among each other.
`**` - raise a thing to some power.
`//` - floor operator. Returns the integer of a division, discarding the remainder.
`%` - modulo. Returns the integer remainder of a division.
You'll probably need to import other packages to get other things like `sqrt()`, `abs()`, `mean()`, and so on.

## Comparators

`>` - greater than.
`<` - less than.
`>=` - greater than or equal to.
`<=` - less than or equal to.
`==` - has the same value as.
`!=` - is not equal to.

## Logical Operators

`and` - both statements must be true to return `true`.
`or` - one or the other, or both statements must be true to return `true`.
`not` - inverts the statement. `not True` evaluates to `False` and vice versa.

## Bitwise Operators

Tricky little devils. These operators treat each operand as a sequence of binary digits and work on them bit by bit. They also work as logical operators on boolean values though.

`&` - Each bit is the logical **and** of the bits in the corresponding position of the operands.
`|` - Each bit is the logical **or** of the bits in the corresponding position of the operands.
`~` - Each bit is the logical **not** (negation) of the bits in the...
`^` - Each bit is the logical **xor** (exclusive or) of the bits... Only one of the operands may be true to evaluate `true`.

# Documentation Strings

Case study:

> Charlie writes a function and, before letting it loose upon the world, explains what it does by adding a string literal as the first statement in a module, function, class, or a method definition. This string can be returned by using the `help()` function on the function and explains clearly what the function does and what it needs from the user to work.
> Dick writes a function and can't be bothered to fill in the documentation string - he simply allows it to wreak havoc in the wild. His function has a generic name and it isn't clear what it wants or what it's doing. In fact, when Dick returns on Monday, he doesn't even know what it was for.
> Be like Charlie. Don't be like Dick. Write your documentation strings.

A documentation string is simple added below the `def` line.

```
def my_function(inputs)
    '''
    This is the documentation string for my_function, explaining what it will do if it gets the inputs that it wants.
    '''
    <here is the rest of the function>
```