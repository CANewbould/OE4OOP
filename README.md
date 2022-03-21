# Open Euphoria and Object-Oriented Programming (OE4OOP)

This project describes a very simple means of creating multi-valued **Objects**, and modifying their contents in a "user safe" manner.

## An **Object**

In this context an **Object** is a **map** object as defined in the standard OE library *map.e*.

Properties/attributes belonging to an **Object** are stored within the **map** and can be modified, deleted or augmented using the routines provided by the *map* library.

The important factor, and one which guarantees both *encapsulation* and *abstraction* (two of the four "pillars" of OOP) is that the data cannot be accessed directly but only through the *map*'s handle. Scope settings govern the separation between the act of creating an **Object** by a user and the internal management of the stored data.

## Classes

All **Object**s are manifestations of a **class** definition, which, for ease of illustration, as well as for other good reasons, are located in separate library modules - one class per module.

Each class is defined with a *Constructor* and, where needed, *method*s to access or change the data held within the **map**. Scope values determine how *inheritance* works: *Constructor*s are set to *export*, as are *method*s which never reach beyond the level of 'children'; the rest are set to *public* to ensure the chain of inheritance persists.

In this implementation of OOP a class has no other existence nor purpose; it is solely to set down the prototype of a resulting **Object**.

## Exemplification

This project includes some examples to show how modules for **class** definition and for user applications look and also how different kinds of **Object**s interact. These illustrations sit in the root folder of the repository and have names which correspond to the class or class-group being considered.

If you want more detail than can be gleaned from the exemplars, then take a guided tour of OE4OOP: the *Animals* folder contains an account of OE4OOP in action, with well-annotated library modules, along with a guide, written in html, which takes you through the **class**-building exercise as well as making some wider observations about Euphoria and OOP.

## Supplementary modules

To make OE4OOP independent of all but *map* in OE's standard libraries, there is some dependency on the library modules provided in the sister *CANOE* project. To run the examples you will need to install this repository or edit the code to use standard OE equivalents instead.

There is a real sense in which OE4OOP and CANOE are one concept: CANOE focusses on object types and  **list**s of well-regulated **sequence**s, like all-integers, all-atoms, all-characters, all-boolean. OE4OOP deals with more "unregulated" **sequence**s, where a system for handling structures is desirable. (As such, there is not only no need for overlap between the two but also the same layout system has been adopted, in may ways to emphasise this congruence.)

## Dot notation

Many implementations of OOP include dot-notation syntax. Although not fundamental to the concept it is a very useful way to emphasise the centrality of the **object** notion.

More as an exercise than anything, this project includes a small application, called *dot.ex* which acts as a pre-processor for OE4OOP. As an illustration, the file *persons.dex* casts an example use of the **person** class. It is executed as follows:

`eui dot persons.dex`

This process converts the *dex* code into standard OE code, which is stored in *dottemp.ex* and then interpreted by OE in the normal way. The output is prefixed by a short banner to indicate the pre-processing stage.

A user could exploit this facility but should restrict dotted statements to one per line. As currently constituted the pre-processor only works in this limited way so that class definitions have to be written in OE, following the OE4OOP conventions; the dotted code should be restricted to applications calling the class modules.
