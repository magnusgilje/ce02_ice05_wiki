[[_TOC_]]

# Introduction to Functions

## Why do we need functions?

- Functions allow us to encapsulate logic in our code
- They can be defined using the `def` keyword

They make it a lot easier to manage code by breaking it all down into related chunks.
Use functions. Don't write the same thing repeatedly. Everyone stays happy that way. :)

## Positional Arguments

Python will match the list of arguments (that you provide when you call a function) with a list of parameters (that are part of the function definition).

## Keyword Arguments

Keyword (or named) arguments are passed into the function along with a parameter name.

```
 In [1]: def my_func(a,b,c): # a,b,c are the parameters because they are part of the function definition
         print(f'a is {a}')
         print(f'b is {b}')

 In [2]: my_func(a=10,b=20,c=30)
Out [2]: a is 10
         b is 20
         c is 30

 In [3]: my_func(c=20,b=10,a=30)
Out [3]: a is 30
         b is 10
         c is 20
```

## Default Arguments

Default arguments are optional (i.e. the user does not need to specify them when calling the function).

They default to a value if they are not specified during function call.

If the argument is provided during function call, the default value gets overridden.

```
def my_func(a=10):
    print(a)
```

Will return `10` if no inputs are given.

**Note: A non-default argument cannot follow a default argument in the function definition.**

## Pitfall: Mutable Default Arguments

We need to be careful when we use mutable default arguments. This is because default arguments are created only when the function is defined. When you make changes to this mutable default argument, this will also persist across function calls.

```
# Example with a mutable default argument ('AVOID IF POSSIBLE!')
def dodgy_append_to_list(x, my_list=[]):
    my_list.append(x)
    return my_list
```

```
# Example without a default argument
def append_to_list(x, my_list):
    my_list.append(x)
    return my_list
```

What happens is that when a function is defined, a new list is created. But the same list is reused in each successive calls to the function.

The default arguments are only evaluated once when the function is defined, not each time when the function is called. So if we use a mutable default argument (such as a list), then it will get mutated each time we call a function.

**Make sure your code does not change the input values unless specifically designed to do so.**

# Variable Number of Arguments

We can define a function with a variable number of arguments by using the `*args` and `**kwargs` syntax
- `*args` - arbitrary number of positional arguments
- `**kwargs` - arbitrary number of keyword arguments

## Using `*args`

Example: Say you want to write a function that adds a collection of numbers whose count is unknown,

```
def sum_of_numbers(*args):
    total_sum = 0
    for i in args:
        total_sum = total_sum + i
    return total_sum
```

Would allow the user to add as many numbers as they would like that will then be summed by the function. **The function must be appropriately designed to accept an undefined number of input arguments**.

## Using `**kwargs`

"(Variable) keyword arguments". These allow you to define specific arguments, and only some of them as needed. It's the pick-and-chooser for a function that's too busy to fully populate all the time.

- kwargs are useful when we may only want to change a subset of the total number of arguments from their default values.
- They are also useful when we have functions that call other functions.

# Parameter Passing

When passing in a mutable object into a function, the mutable object can be potentially modified within the function. Functions that mutate(change the value of) their inputs or other parts of the program can have unintended side effects.

# Return Passing

The return statement specifies what we want to return to the caller. The return value is the output of the function. 

If there is no explicit return statement, then `None` is returned when the function terminates.

If you are returning multiple values, it is good practice to return them as a tuple (your situation permitting, of course).

# Scoping Rules

When a function is executed, a new namespace is created.

The namespace is a local environment that contains the names of function parameters and variables.

- Local variables override global variables in the local scope.
- You can modify variables in the global scope from the local scope by explicitly using the `global` keyword.
- If the variable is not in the local scope, python will look in the parent level.
- You can modify variables in the global scope for mutable objects.

# Decorators

A decorator is a function whose primary purpose is to decorate/modify another function.

Decorators are denoted by the `@` symbol

```
# The add_five function is decorated by my_simple_decorator
@my_simple_decorator
def add_five(x):
    return x+5
```

```
The above code is equivalent to the following:

def add_five(x):
    return x+5
    
add_five = my_simple_decorator(add_five) # my decorator returns the modified/decorated version of add five.
```

Thing to keep in mind: **The input to the decorator is a function, and the output of the decorator is a modified version of the same function**.

Here's another example of how to present decorators:

```
# decorator to check for zero division
def check_for_zero_div(my_func):
    def modified_my_func(a,b):
        if b==0:
            print('Cannot divide by zero!')
            return None
        return my_func(a,b)
    return modified_my_func
```

```
@check_for_zero_div
def my_divide(a,b):
    print(a/b)
```

Which will return the given error message once decorated, but will return a typical exception message if not.

# Generators

Generator functions use `yield` keyword to return values. They return an iterable sequence of values.

```
def countdown(n):
    while n>0:
        yield n # yield instead of return
        n-=1
```

This example simply generates the sequence of numbers from n to 0.

They are very useful because they allow us to iterate through the values without creating and storing the entire sequence in memory.

The built-in `range` function is a generator <https://docs.python.org/3/library/stdtypes.html?highlight=range#range>


# Comprehensions

## List Comprehensions

List comprehensions give us an easy way to apply a function to all elements in an iterable object

Results are returned as a list, i.e. the comprehension pattern is enclosed by a pair of square brackets `[]`.

Consider these functionally identical functions:

```
# Multiply all numbers from 1 to 10 by 20 and store it in a list - Long way
result = []
for i in range(1,11):
    result.append(i*20)
```

```
# List comprehension way
[i*20 for i in range(1,11)]
```

We can also use the if keyword for filtering:

```
[i*20 for i in range(1,11) if i%2==0]
```

We can also apply a custom function to each element in this iterable object:

```
my_list = [my_func(x) for x in [1,2,3,4,5]]
```

## Generator Comprehensions

Very similar to list comprehensions, except the results are returned as a generator rather than a list. 

We enclose the comprehension pattern with `()` rather than `[]`.

# Lambda Functions

Lambda functions are also known as anonymous functions. They are used for ad-hoc function definitions.

```
# normal way to define a function
def cube(x):
    return x**3
```

```
# The above can be written as a lambda function as:
cube_lambda = lambda x : x**3 # lambda function
```

And with multiple parameters:

```
def power(x,y):
    if y>0:
        return x**y
    else:
        return None
```

```
power_lambda = lambda x,y : x**y if y>0 else None
```

# Functions for Convenience

## Zip

Zip function allows us to combine two (or more) collections into a collection of tuples

- It provides us a way of pairing together the elements from multiple iterables
- `zip` only works as far as the shortest iterable (by length)
- `zip` objects can be used directly for iteration
- You can also create a dictionary from a list of tuples

## Map

The map function allows us to apply a function to each element in an iterable object, returning a generator-like object, that in turn can be iterated over.

## Filter

The filter function is used to filter an iterable object by condition.