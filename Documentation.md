# 📄 Documentation

Compared to other hacks and solutions to add private / public notion to GDscript, **UnderscoreMeansPrivate** respects Godot convention, thus the code produced is valid GDscript. 

> ⚠️ Currently the plugin will force quite your project if it finds a script attempting to access a private member. In the future we plan to enable an option to allow dry run.

## Setup

* Like any other Godot plugin, simply download or clone this repository.
* Place its folder into the **addons** directory of your godot project. Typically its in **ProjectDirectory/addons/**.
* Go in Project > Project Settings > Plugins and enable it.

## Examples

### Make sure to specify types for class vars and methods

UnderscoreMeansPrivate will force you to specify the return type of any public function. This is to help you with auto completion and getting a quick idea of what is the interface when accessing from outside.

    extends Node
    var _some_private_data:int
    var some_public_data:int
    func get_data() -> int:
       ...
You can still use _ to turn the func into a private func and not have to specify the return

    extends Node
    func _get_data() -> void:
       ...
> ⚠️ Class variables must always be typed even if private

### Making a private var
    extends Node
    var _bank_account:int

> ⚠️ Do not use self to try to access inside the script itself. This is considered accessing an external variable.

### Public getter
    extends Node
    var _player_name:string

    func get_player_name() -> string:
        return _player_name

### Public setter
    extends Node
    var _player_name:string

    func set_player_name(name):
        _player_name = name

### Disabling checks
Sometime you might want to disable the script within a specific file, simply add the comment **#!STRICT=false** as the first line of your script.

    #!STRICT=false
    extends Node
    ...

> ⚠️ Be aware that this enable the specific script to access any variable from any other script
