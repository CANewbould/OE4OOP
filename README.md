# OE4OOP

**An illustration of Object-Oriented Programming principles applied to Open Euphoria**

This project considers how the principles of Object-Oriented Programming (OOP) can be applied/interpreted within the Open Euphoria (OE) environment.

The most important point is that OE4OOP **doesn't require** any supplementary libraries. It illustrates an *approach* to delivering the foundations of OOP in a systematic and consistent fashion.

## The project described

The project sets out a template, through a small number of examples. A modular approach is adopted throughout, as this seems the most educative. A "class" module (extension *e*) is created and illustrated via a corresponding example (extension *ex*). The means of establishing inheritance are exemplified. Illustrations are included of constructors, and routine overriding and overloading. Each module is
extensively documented via comment lines; indeed the library modules can be used to generate html documentation using a document-extraction tool - [E2CR](https://sourceforge.net/projects/e2cr/). To appreciate the approach it is more informative to study this comment than to simply run the example programs.

### Illustrations

The following illustrations are contained within the project:

1. a simple *person* class, to introduce OE4OOP
2. a *soldier* class, an extension of *person*, to illustate inheritance
3. a *shapes* class, to illustrate a base class and overriding - with child classes:
    * circle
    * rectangle
    * triangle

(Note that this third illustration is all embodied in a single library module, within which several class types are defined.)

4. an alternative to the *shapes* class, to show a different approach to solving the overriding problem, which is a little safer - see *shapes1*

5. yet another approach to the overriding problem, which is probably even better, and is certainly necessary where using single-class modules - see *shapes2*, and the associated *circle*, *rectangle* and *triangle* modules

Here all the donkey work is done in the parent class (*shape*). Base class properties, including the routine-ids for functions to be overridden, are stored in the *shapes2* module, with a single dimensions accessor and associated Constructor. Child classes use both of these but interpret the argument to the Constructor and result from the accessor in a class-specific way, using the relevant local *enum*s to sequence the dimensions. (Note: because of the way OE processes the *include*s, the single-class module approach requires one - and only one - initialisation of the shape store and counter/pointer; hence the need to call an initialisation routine at the start of an application run.)

6. a file-handling library, based on a *file* class, reflecting fairly closely Python's file-handling methods, but utilising OE material in **std/io.e**.

The core idea in all these examples, however, is that an entity's data is hidden by restricting scope (to 'local') and providing only an integer handle, through which accessors, mutators and information routines operate. The structure to enable this approach has, in all these cases, been built within the operating modules. There are, however, cases where the equivalent handle-based linkage is already provided; access to C-language library functions being the most obvious. So, as a final example, this project offers:

7. (for consistency) a library module, *clib.e* containing "classes" for handling C-language library files
8. a set of classes built to interface with the C-language version of the IUP GUI toolkit, stored in *iup.e* (for the toolkit) and *iup.ew* (for the widget classes).

The basic principle of OE4OOP is clearly evident insofar as all these examples are run using the normal OE interpreter call:

`eui <projectname>.ex[w]`

## General implementation

Could/should this approach be more generally adopted?

It is possible to argue that OE4OOP is differentially applicable depending upon the nature of the "properties" of a given case. In particular, if a "class"'s entities only ever have one (*atom*) value each, then the case for setting up a local sequence, to hold that single value, creating a pointer to that local sequence and defining accessor/mutator "method"(s), seems rather like applying a principle purely for the sake of it.

As a parallel to Java, say, where is the dividing line between a primitive data type and a class? This question must be addressed if OE4OOP is to be other than a proof of concept.

You can, of course, emphasise OOP further and insist that every entity *literally* holds its properties and methods inside its shell; this will inevitably result in something akin to [EuCANOOP](https://sourceforge.net/projects/eucanoop/). On the other hand, you can relax the strict scope of OOP and opt instead for an Object-Centred approach, as exemplified by [OCE](https://bitbucket.org/CANewbould/object-centred-euphoria/src/master/).

## Dot notation

Dot notation is not at present provided in OE, but OE4OOP offers an equivalent approach: the first parameter of every routine (qua "method") call is of the *type* (qua "class") instance, and thus (albeit implicitly) applies to an entity.

Included in the project, however, is a first-base pre-processor which enables applications (extension *dex* or *dexw*) cast in dot notation to be run in OE. The *person* example has been re-cast as *person.dex* and is included in this project. It can be run as follows:

`eui dot person.dex`

The terminal/console output begins with messages to indicate that the *dot* pre-processor is in operation; this is followed by the 'normal' OE4OOP output. (A file called *dottemp.ex* holds the dot-converted OE code which is the one actually executed; so it is available for inspection in the case of errors.)

## Feedback

The author would appreciate feedback on these thoughts, whether of a critical nature or in relation to improvements, or refinements, in the approaches outlined.
