# UnderscoreMeansPrivate

> Addon to add the notion of public / private members for Godot 4.0+

# Bringing the notion of public / private to Godot

## TLDR!

Enforce the Godot convention of using underscore (_) for private variables and methods.

## Long Explanation

Unlike many other programming languages, GDScript does not have a built-in notion of public and private visibility for variables and methods.

In GDScript, all variables and methods are accessible from any part of the script or other scripts within the same scope.

GDScript encourages a convention-based approach to signify the intended visibility of variables and methods. By convention, variables and methods that start with an underscore (_) are considered to be private. Variables and methods without an underscore are considered public and can be accessed by other scripts.

This convention is not enforced by the language itself, this is where this addon comes into play. It will run before you start your game, checking all the files to inforce the convention.

# Other Rules

Presently, the addon enforces two additional rules.
* vars and consts of a class must specify a type to help with auto completion
* publicly accessible func of a class must specify a return type

More tests might be added in the future.

# Limitations

This script is trivial to bypass (eg: you could use a trick like "." + "_" like we used in the script. It’s not meant to be a perfect solution but it enables to enforce the rules in most case.
