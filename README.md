# UnderscoreMeansPrivate
Addon to add the notion of public / private members for Godot 4.0+ 

Unlike many other programming languages, GDScript does not have a built-in notion of public and private visibility for variables and methods.

In GDScript, all variables and methods are accessible from any part of the script or other scripts within the same scope.

GDScript encourages a convention-based approach to signify the intended visibility of variables and methods. By convention, variables and methods that start with an underscore (_) are considered to be private. Variables and methods without an underscore are considered public and can be accessed by other scripts.

This convention is not enforced by the language itself, this is where this tool comes into play to enforce it.
