# OE4OOP

**An illustration of Object-Oriented Programming principles applied to Open Euphoria**

This project considers how the principles of Object-Oriented Programming (OOP) can be applied/interpreted within the Open Euphoria (OE) environment.

The most important point is that OE4OOP **doesn't require** any supplementary libraries. It illustrates an *approach* to delivering the foundations of OOP in a systematic and consistent fashion.

## The project described

The project sets out a template, through a small number of examples. A modular approach is adopted throughout, as this seems the most educative. A "class" module (extension *e*) is created and illustrated via a corresponding example (extension *ex*). The means of establishing inheritance are exemplified. Illustrations are included of constructors, and routine overriding and overloading. Each module is
extensively documented via comment lines; indeed the library modules can be used to generate html documentation using a [E2CR](https://sourceforge.net/projects/e2cr/) - document-extraction tool. To appreciate the approach it is more informative to study this comment than to simply run the example programs.

### Illustrations

The following illustrations are contained within the project:

1. a simple *person* class, to introduce OE4OOP
2. a *soldier* class, an extension of *person*, to illustate inheritance
3. a *shapes* class, to illustrate a base class and overriding - with child classes:
    * circle
    * rectangle
    * triangle

(Note that this third illustration is all embodied in a single library module, within which several class types are defined. The same effects and relationships could have been achieved using single-class modules, but certain differences in approach would be necessary.)

4. an alternative to the *shapes* class, to show a different approach to solving the overriding problem, which is a little safer - see *shapes1*

The core idea in all these examples, however, is that an entity's data is hidden by restricting scope (to 'local') and providing only an integer handle, through which accessors, mutators and information routines operate. The structure to enable this approach has, in all these cases, been built within the operating modules. There are, however, cases where the equivalent handle-based linkage is already provided; access to C-language library functions being the most obvious. So, as a final example, this project offers:

5. (for consistency) a library module, *clib.e* containing "classes" for handling C-language library files
6. a set of classes built to interface with the C-language version of the IUP GUI toolkit, stored in *iup.e* (for the toolkit) and *iup.ew* (for the widget classes).

The basic principle of OE4OOP is clearly evident insofar as all these examples are run using the normal OE interpreter call:

`eui <projectname>.ex[w]`

## Dot notation

Dot notation is not at present provided in OE, but OE4OOP offers an equivalent approach: the first parameter of every routine (qua "method") call is of the *type* (qua "class") instance, and thus (albeit implicitly) applies to an entity.

Included in the project, however, is a first-base pre-processor which enables applications (extension *dex* or *dexw*) cast in dot notation to be run in OE. The *person* example has been re-cast as *person.dex* and is included in this project. It can be run as follows:

`eui dot person.dex`

The terminal/console output begins with messages to indicate that the *dot* pre-processor is in operation; this is followed by the 'normal' OE4OOP output. (A file called *dottemp.ex* holds the dot-converted OE code which is the one actually executed; so it is available for inspection in the case of errors.)

## Feedback

The author would appreciate feedback on these thoughts, whether of a critical nature or in relation to improvements, or refinements, in the approaches outlined.
