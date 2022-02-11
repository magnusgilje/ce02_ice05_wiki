[[_TOC_]]

# Objects

Every piece of data in Python is an object and has:
- an identity (id)
- a type
- a value

When an object is created, its ID and type cannot be changed.

The ID of an object can be returned using the built-in `id(object)` function.

The type of an object can be returned using the built-in `type(object)` function.

## Mutability and Immutability

If an object's value can be changed, it is mutable. Otherwise, it is immutable.

Examples of mutable objects are Lists, Sets and Dictionaries. This means that multiple references to the same object will reflect changes made by any of the references.

Examples of immutable objects are Tuples, ints, floats and strings. This means that multiple references to the same object will then refer to different objects, should any of them change.

## References and Copies

When you use the assignment operator var1 = var2, a new reference to var2 is created.

If var2 is immutable, then this effectively creates a copy of var2. If var2 is mutable, then the reference is copied.

### Reference Counting

Python keeps track of the number of references for each object. We can get the count by using `sys.getrefcount()`.

If we need to delete objects, we use the `del` keyword

If there are no references to an object, Python will delete the object from memory: this is called 'garbage collection'.

## Comparing Objects

`==` compares the *value* of two objects.
`is` compares the *id* of two objects.

## First Class Objects

In Python, all objects are said to be 'first class'. What this means all variables have equal status.

The objects can be treated as data and can be included in collections, arguments, named variables etc.

# Built-in Data Types

In Python, data falls under different categories:

- None
- Numbers (int, float, complex, bool)
- Sequences (list, tuple, string)
- Mappings (dict)
- Sets (set, frozenset)

## None

The `None` object is used to represent null values.

## Numbers

We can perform arithmetic operations on different types of numbers.

### Integers

Integers are only whole numbers. Converting a number to an integer using `int()` truncates everything after the decimal point - data is lost.

### Floating Point Numbers

Floating Point values contain decimal places.

## Boolean

`True` or `False`, which are equivalent to `1` or `0`.
**The case is important and there are no quotes around booleans**.

## Sequences

Sequences can be indexed using non-negative numbers (i.e. starting from 0). Examples of sequences are lists, tuples and strings. All sequences support indexing, slicing and iteration.

Operations on sequences include:
- Concatenation (`+`)
- Duplication (`*`)
- Indexing

### Slicing

Slicing is done by `[start:stop]`. Note that the value at the `start` index is always included in the slice but the value at the `stop` index is not included.

You can also include a step given by `[start:stop:step]` to slice every n'th element from the sequence (assuming your step is n).

You can also omit `start` and/or `stop`.

You can also use negative indices. Negative indices count from the back of the sequence. This also allows you to reverse a string by using a negative step.

## Membership (in operator)

Use the `in` operator to check if a given element is present within a sequence or collection.

## Aggregation

Aggregation describes the process of reducing a sequence to a single value.
- Built-in functions (`len`, `min`, `max`)
- Other methods (`str.count()`)
- Functions from other packages such as numpy.

## Sets

Sets are an unordered collection of unique items. Common operations include:
- `set_a.union(set_b)`, returns the values of `set_a` and `set_b`.
- `set_a.intersection(set_b)`, returns the values that are common to `set_a` and `sete_b`.
- `set_a.difference(set_b)`, returns all values in `set_a` that are not in `set_b`.
- `set_a.issubset(set_b)`, returns `True` if `set_a` is a subset of `set_b`.
- `set_a.isdisjoint(set_b)`, returns `True` is there are no elements in common between `set_a` and `set_b`.

# Converting between data types

It is possible to convert between some data types:
- `str()` converts the data into the "string" data type.
- `int()` converts the data into the "integer" data type.
- `float()` converts the data into the "float" data type.
- `list()` converts the data into a list.
- `tuple()` converts the data into a tuple.

# String Methods

- `my_string.count()` counts the number of occurrences of the given string within the main string.
- `my_string.find()` returns the index within the main string that the substring occurs.
- `my_string.replace(<string to replace>,<string to replace with>)` replaces one substring with another.
- `my_string.strip()` removes leading and trailing whitespace.
   - `my_string.lstrip()` removes leading whitespace. ('l' is for 'left'.)
   - `my_string.rstrip()` removes trailing whitespace. ('r' is for 'right'.)
- my_string.split() splits the sequence into a list using a separator of your choice (blank for any whitespace).
- `.join(words)` joins a list of words into a string using a separator of your choice.
- `my_str.upper()` converts the whole string into upper case.
- `my_str.lower()` converts the whole string into lower case.
- `my_str.title()` converts the string to title case.
- `my_str.swapcase()` swaps each element of the string into the opposite case.
And for even more Python string nuttiness, check out [this guide](https://docs.python.org/3/library/stdtypes.html#string-methods).

# Built-in Types for Representing Programming Structure

There are several categories of types for representing programming structure:

- Classes
- Callables
- Modules and Packages

## Classes

## Callables

Callables are objects that support the function call operation. This includes functions and methods.

Hint: If you can put round brackets after the object, then it is callable.

You can check if an object is callable by using the in-built `callable` function.

## Modules and Packages

If you get a `ModuleNotFound` error, install the package using either `conda install -c conda-forge flask-restful` or `pip install flask-restful` and re-run the import again.