# 📄 Documentation

Compared to other hacks and solutions to add private / public notion to GDscript, **UnderscoreMeansPrivate** respects Godot convention, thus the code produced is valid GDscript. 

## Public getter
    extends Node
    var _player_name:string

    func get_player_name() -> string:
        return _player_name

## Public setter
    extends Node
    var _player_name:string

    func set_player_name(name):
        _player_name = name

## Disabling checks
Sometime you might want to disable the script within a specific file, simply add the comment **#!STRICT=false** as the first line of your script.

    #!STRICT=false
    extends Node
    ...

> ⚠️ Be aware that this enable the specific script to access any variable from any other script
