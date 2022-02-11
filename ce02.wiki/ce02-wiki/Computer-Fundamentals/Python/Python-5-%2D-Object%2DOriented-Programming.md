[[_TOC_]]

# Classes

Classes are the mechanism we use to create new kinds of object types in Python.

We can think of classes as blueprints/templates to create custom object types.

In the context of OOP, an object refers to an instance of the class.

## `class` Statement

The self argument is implicitly used to pass an object into its methods.

Functions inside the scope of a class are called as methods.

```
class Car:
    def __init__(self,make,model,year,colour,fuel):
    # The __init__ method is run everytime we create a new instance
    # The purpose of __init__ method is to initialise an object
    # The following are called instance attributes/variables
        self.make = make
        self.model = model
        self.age = year
        self.colour = colour
        self.fuel = fuel
    
    # This is an instance method
    def description(self):
        print(f'The car is {self.colour} {self.make} {self.model} from {self.age}')
        
    # This is another instance method
    def is_electric(self):
        if self.fuel == 'battery':
            print('Yay, it is an electric car!!')
        else:
            print('No, it is not an electric car!')
    scription_2(self):
    # This is incorrect as it does not use self to refer to attributes!!
    def de
        print(f'The car is {colour} {make} {model} from {year}')
```

Creating instances of this class:

```
matts_car = Car('Mazda','2',2016,'Navy','Petrol')
```

Getting attributes for an instance (values associated with the instance):

```
 In [1]: matts_car.fuel
Out [1]: 'Petrol'
```

Calling methods (functions associated with an instance):

```
 In [2]: matts_car.is_electric()
Out [2]: No, it is not an electric car!
```

You can use `type` to check if an object is a class.
You can use `dir` to check the methods callable for an object.
You can use `isinstance(instance, class)` to check if `instance` is an instance of `class`.

## Scoping Rules for Classes

Classes do not create a scope for names inside their bodies and methods. When a method is called, the instance is passed back into the method as self.

We need to be very explicit when referring to attributes and methods in a class.

# Object Oriented Programming, Idea 1: Inheritance

Inheritance allows us to create classes that specialise or modify the behaviour of an existing class.

The existing class that you inherit from: **Parent Class/Super Class/Base Class**

The new class that inherits from Parent class: **Child Class/Sub Class**

Attributes from the parent class are inherited.
- The child class can have attributes that are not in the parent class.
- The parent class does not inherit the attributes of the child class.

The methods of the parent class are also inherited by the child class. These methods can be overridden in the child class.
- A child class may contain specialised methods that are not part of the parent class.
- The parent class does not inherit methods from the child class.

## Multiple Inheritance

A class may additionally inherit from multiple parent classes.

# Object Oriented Programming, Idea 2: Polymorphism, Dynamic Binding and Duck Typing

Polymorphism/Dynamic Binding is the capability to use an instance without regard to its type. As long as it has the right interface, it will run.

Duck typing: "If it walks like a duck, quacks like a duck, then it probably is a duck"

## Class methods and Static methods

In a class definition, methods are assumed to operate on the class instance (self).

Class methods and static methods are exceptions:
- Class methods are methods that operate on the class (as opposed to an instance)
    - Created using the decorator `@classmethod`
    - Includes a parameter `cls` to refer to the class

- Static methods are functions that live inside a class. They do not interact with attributes of the class.
    - Created using the decorator `@staticmethod`
    - Do not have `self` or `cls` arguments

# Object Oriented Programming, Idea 3: Data encapsulation and private attributes/methods

Private methods/attributes are those that you don't want to expose to the outside world.
- In Python, private attributes start with a double underscore or dunder (`__`)
- Python obfuscates the names of these private attributes, so that it is harder to use them
- They should not be accessed from outside the class

Protected attributes begin with a single underscore (`_`)
- It is recommended that they are not accessed from outside, these attributes may change from one release version to another

```
class BankAccount:
    def __init__(self,password):
        self._pin = 123 # _pin is a protected attribute
        self.__password = password # __password is a private attribute
        self.balance = 0
        
    def deposit(self,amount):
        if amount > 0:
            self.balance += amount
            
    def withdraw(self,amount,password):
        if self.__password == password:
            self.balance -= amount 
            print('Withdraw successful')
            return amount
        else:
            print('Withdraw unsuccessful - incorrect password!')
            return 0
```

# Class Properties

A property is a special kind of attribute that computes its value when it is accessed.  
To define a property, we use the `@property` decorator
