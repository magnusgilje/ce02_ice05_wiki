[[_TOC_]]

# Boolean Expressions and Truth Values

An expression is any combination of symbols that represents a value.  
A boolean expression is an expression that returns a boolean value (True, False).

|A|B|A and B|A or B|not A|
|-|-|-      |-     |-    |
|F|F|F      |F     |T    |
|F|T|F      |T     |T    |
|T|F|F      |T     |F    |
|T|T|T      |T     |F    |

The 'and', 'or', and 'not' keywords are commonly used to form boolean expressions.
- x or y : If x is considered false, return y. Otherwise, return x.
- x and y: If x is considered false, return x. Otherwise, return y.
- not x  : If x is considered false, return True. Otherwise, return False.

By default, an object is considered to be true unless either of the following holds:
- it has a __len__() method that returns zero.
- it has a __bool__() method that returns false.
- it has value of zero.

You can check if it has a __len__() or a __bool__() method by using dir(object)

Every Python expression can be interpreted as either `True` or `False`
Example:

```
my_list = [] # False -- length is zero
my_list = [1] # True -- length is not zero
my_dict = {} # False -- length is zero
```

# Conditional Execution (`if`, `elif`, and `else`)

`if`, `elif` and `else` statements are used for conditional execution

`if` block

```
if <condition>:
    # block to execute if <condition> is True
    <statement>
    <statement>
    ...
```

`if-else` block

```
if <condition>:
    # block to execute if <condition> is True
    <statement>
    <statement>
    ...
else:
    # block to execute if <condition> is False
    <statement>
    <statement>
    ...  
```

`if-elif-else` block

```
if <condition>:
    # block to execute if <condition> is True
    <statement>
    <statement>
    ...
elif <condition2>:
    # block to execute if <condition2> is True
    <statement>
    <statement>
    ...
elif <condition3>:
    # block to execute if <condition3> is True
    <statement>
    <statement>
    ...
...
else:
    # block to execute if none of the conditions above are True
    <statement>
    <statement>
    ...  
```

Notes
- Blocks are executed when the relevant boolean expression is True. 
- We can have an arbitrary number of elif statements. Order matters in elif
- `elif` and `else` blocks are optional
- Only one block of statements is executed. Boolean expressions are checked from top to bottom.

# Iteration and Looping

## `for` loop

For loops are used to iterate through an iterable object one item at a time

for i in <iterable>:
    <statement>
    <statement>
    ...
Examples of iterable objects include lists, tuples, sets, dictionaries and strings.
i is called the iterator variable.

If your iterable is not a list but is instead a range of numbers, there isn't a need to create a list specifically, use `range`.

- `range(n)` generates numbers from 0 to n-1
- `range(m,n)` generates numbers from m to n-1
- `range(m,n,s)` generates numbers from m to n-1 with a step s

The `enumerate` function returns a count and a value - it rolls your counter variable and variable unpacking into one function.

- Use `enumerate(values, start = n)`, where `n` is the index of the first item in the list that you would like to start enumerating from.

## `while` loop

A while loop continues to execute until the condition (boolean expression) evaluates to False

```
while <condition>:
    statement
    statement
    ...
```

The `break` statement can be used to break out of a loop (`break` works with both `for` and `while` loops). As the name suggests, it will break you out of the loop.

The `continue` statement can be used to skip the rest of the current iteration in a loop (`continue` also works with both `for` and `while` loops).

# Exceptions

An exception occurs when your code runs into a boo-boo. They are typically quite helpful. Compare and contrast:
![image.png](/.attachments/image-8d379c42-202c-48d4-80c3-fc5e4411424d.png)

## Raising Exceptions

Exceptions indicate errors and break out of the normal control flow of the program. Exceptions can be raised by using the `raise` statement:

```
def send_email(email_address):
    if '@' not in email_address:
        raise Exception('The email address is not valid!')
    else:
        # code to send email
        print('Email has been sent!')
```

## Catching and Handling Exceptions

Exceptions are caught and handled using the `try-except` block

Execution stops in the try block as soon as an exception occurs and jumps straight into the except block

We can have multiple `except` blocks to handle different types of exceptions

```
try:
    statement
    statement
except:
    statement
    statement
```

## Exception Class Hierarchy

![image.png](/.attachments/image-1454a562-e6b0-400b-a25c-ad7df8b5266c.png)