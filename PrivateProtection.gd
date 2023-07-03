# UrbanHacker.net (c) 2023 - Confidential - All rights reserved
#
# This work is licensed under the terms of the MIT license.  
# For a copy, see <https://opensource.org/licenses/MIT>.

extends Node

const _SETTING_LOCATION:String = "debug/gdscript/Underscore_Means_Private/"
const _STRICT:String = _SETTING_LOCATION + "force_project_to_abort_if_errors"
const _IGNORE_ADDONS:String = _SETTING_LOCATION + "ignore_addons"
const _VERBOSE:String = _SETTING_LOCATION + "verbose"

func _ready():
	var files = _get_dir_contents("res://")
	var scripts = []
	for file in files[0]:
		#and ProjectSettings.get_setting(_IGNORE_ADDONS)
		if (file.begins_with("res:///addons/") and ProjectSettings.get_setting(_IGNORE_ADDONS, true)):
			break
		if file.ends_with("gd"):
			if ProjectSettings.get_setting(_VERBOSE):
				print("  _ means private: Scheduled for checking: " + file)
			scripts.append(file)
	
	var test_passed = 0
	for script in scripts:
		test_passed += _check_file(script)
	
	if test_passed > 0:
		printerr("_ We found ", test_passed, " error(s)")
		
		if ProjectSettings.get_setting(_STRICT):
			get_tree().quit()



func _check_file(path:String) -> int:
	var data_file = FileAccess.open(path, FileAccess.READ)
	if data_file == null:
		return 0
	var lines = data_file.get_as_text().split("\n")
	var errors_private = []
	var errors_type = []
	var errors_func = []
	var line_count = 1

	if lines[0] == "# !STRICT=false":
		print("  _ means private: Skipping: " + path)
		return 0

	for line in lines:
		if _check_if_access_to_private_member(line):
			errors_private.append([line, line_count])
		if _check_if_class_vars_without_type(line):
			errors_type.append([line, line_count])
		if _check_if_class_func_without_type(line):
			errors_func.append([line, line_count])
		line_count += 1

	if len(errors_private) > 0:
		for error in errors_private:
			printerr("_ means private: File: ", path, " Line: ", str(error[1]), " Syntax error: cannot access private member")
			printerr("_ means private: ->    ", error[0])
	
	if len(errors_type) > 0:
		for error in errors_type:
			printerr("_ class member must have type: File: ", path, " Line: ", str(error[1]), " Syntax error: members of a class must specify a type")
			printerr("_ class member must have type: ->    ", error[0])
	
	if len(errors_func) > 0:
		for error in errors_func:
			printerr("_ global func must have a return type: File: ", path, " Line: ", str(error[1]), " Syntax error: global func of a class must specify a type")
			printerr("_ global func must have a return type: ->    ", error[0])

	var total_errors = len(errors_type) + len(errors_private) + len(errors_func)
	return total_errors

func _check_if_access_to_private_member(line) -> bool:
	var private_identifier = "." + "_"
	if (private_identifier in line):
		return true
	return false

func _check_if_class_vars_without_type(line) -> bool:
	if (line.begins_with("var ")) or (line.begins_with("@onready var ") or (line.begins_with("const ")) or (line.begins_with("@export var")) or (line.begins_with("@export_multiline var"))):
		if (":" not in line):
			return true
	return false

func _check_if_class_func_without_type(line) -> bool:
	if (line.begins_with("func ") and not line.begins_with("func _")):
		if ("->" not in line):
			return true
	return false

func _get_dir_contents(rootPath: String) -> Array:
	var files = []
	var directories = []
	var dir = DirAccess.open(rootPath)
	dir.list_dir_begin()
	_add_dir_contents(dir, files, directories)

	return [files, directories]

func _add_dir_contents(dir: DirAccess, files: Array, directories: Array):
	var file_name = dir.get_next()

	while (file_name != ""):
		var path = dir.get_current_dir() + "/" + file_name

		if dir.current_is_dir():
			var subDir = DirAccess.open(path)
			subDir.list_dir_begin()
			directories.append(path)
			_add_dir_contents(subDir, files, directories)
		else:
			files.append(path)

		file_name = dir.get_next()

	dir.list_dir_end()
