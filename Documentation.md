# 📄 Documentation

Compared to other hacks and solutions to add private / public notion to GDscript, **UnderscoreMeansPrivate** respects Godot convention, thus the code produced is valid GDscript. 

> ⚠️ Currently the plugin will force quite your project if it finds a script attempting to access a private member. In the future we plan to enable an option to allow dry run.

## Setup

* Like any other Godot plugin, simply download or clone this repository.
* Place its folder into the **addons** directory of your godot project. Typically its in **ProjectDirectory/addons/**.
* Go in Project > Project Settings > Plugins and enable it.

## Examples

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
