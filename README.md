# OE4OOP
**An illustration of Object-Oriented Programming principles applied to Open Euphoria**

This project considers how the principles of Object-Oriented Programming (OOP) can be applied/interpreted within the Open Euphoria (OE) environment.

The most important point is that OE4OOP **doesn't require** any supplementary libraries. It illustrates an *approach* to delivering the foundations of OOP in a systemmatic and consistent fashion.

The project sets out a template, through a small number of examples. A modular approach is adopted throughout, as this seems the most educative. A "class" module (extension *e*) is created and illustrated via a corresponding example (extension *ex*). The means of establishing inheritance are exemplified. Illustrations are included of constructors, and routine overriding and overloading. Each module is
extensively documented via comment lines; indeed the library modules can be used to generate html documentation using a document-extraction tool.

The following illustrations are contained within the project:

* a simple *person* class, to introduce OE4OOP

Dot notation is not at present provided in OE, but OE4OOP offers an equivalent approach: the first parameter of every routine (qua "method") call is of the *type* (qua "class") instance. Included in the project, however, is a simple example of a pre-processor which enables applications (extension *dex*) cast in dot notation to be run in OE.

The author would appreciate feedback on these thoughts, whether of a critical nature or in relation to improvements, or refinements, in the approaches outlined.
