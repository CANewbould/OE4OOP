# OE4OOP - Mark II

This is a revision of the proof-of-concept version of Open Euphoria for Object-Oriented-Programming.

The main change is in the use of a base library where all the storage of data is handled, regardless of which class an instance is representative of. The storage mechanism uses the hash-based //map// library.

The library offers four routines:

* **init** which should be used ONCE to reset the map and the counter, which is the *key* linking a value name to its data store

* **New** which acts as a universal constructor, storing an instance's data in return for the integer *key*

* **getD** which returns the *data* when receiving the *key*

* **setD** which resets the *data* given the *key* value

A decision has been taken to include **string** as a type rather than a class, along with **atom** and **integer**.

A **class** type's data can take any form, including the most unspecified **object**, but, in general, will be a **sequence** containing two or more values, some of which could be *key*s to previously defined instances.

It is the responsibility of the user to handle the elements of data items once extracted from the map-store. To do this an *enum* is usually set up as pointers to internal storage, as per Mark I.

The examples of class definitions included here have been laid out in a way which tries to emphasise how the methods apply to the class type, using a Python-like indentation.