# 📄 Documentation

Compared to other hacks and solutions to add private / public notion to GDscript, **UnderscoreMeansPrivate** respects Godot convention, thus the code produced is valid GDscript. If you disable the addon, all your scripts will continue to work unaffected.

> ⚠️ If **force_project_to_abort_if_errors** is enabled the plugin will force quite your project if it finds a script attempting to access a private member.

## Setup

* Like any other Godot plugin, simply download or clone this repository.
* Place its folder into the **addons** directory of your godot project. Typically its in **ProjectDirectory/addons/**.
* Go in Project > Project Settings > Plugins and enable it.

This plugin adds 3 settings in your project in the GDscript section of the settings (you must enable advanced to access it):
* **force_project_to_abort_if_errors**: Set to false by default, will abort your project when errors are detected.
* **ignore_addons**: Set to true by default, will ignore scripts in the addons folder.
* **verbose**: Set to false by default, will display the list of all files that will be scheduled to be checked. In the future we might display more debug information.

## Examples

### Make sure to specify types for class vars and methods

UnderscoreMeansPrivate will force you to specify the return type of any public function. This is to help you with auto completion and getting a quick idea of what is the interface when accessing a class from outside.

    extends Node
    var _some_private_data:int
    var some_public_data:int
    func get_data() -> int:
       ...
You can still use _ to turn the func into a private func and not have to specify the return

    extends Node
    var _some_private_data:int
    var some_public_data:int
    func _get_data():
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

> ⚠️ Be aware that this enable the specific script to access any variable from any other script, thus bypassing any type of protection set in other files.
