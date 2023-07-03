# UrbanHacker.net (c) 2022 - Confidential - All rights reserved
#
# This work is licensed under the terms of the MIT license.  
# For a copy, see <https://opensource.org/licenses/MIT>.

@tool
extends EditorPlugin

const _AUTOLOAD_NAME:String = "UnderscoreMeansPrivate"

const _SETTING_LOCATION:String = "debug/gdscript/Underscore_Means_Private/"
const _STRICT:String = _SETTING_LOCATION + "force_project_to_abort_if_errors"
const _IGNORE_ADDONS:String = _SETTING_LOCATION + "ignore_addons"
const _VERBOSE:String = _SETTING_LOCATION + "verbose"

func _ready():
	print("Underscore Means Private is enabled!")
	_init_parameters()

func _enter_tree():
	add_autoload_singleton(_AUTOLOAD_NAME, "res://addons/UnderscoreMeansPrivate/PrivateProtection.gd")


func _exit_tree():
	remove_autoload_singleton(_AUTOLOAD_NAME)

func _init_parameters() -> void:
	if (!ProjectSettings.has_setting(_STRICT)):
		ProjectSettings.set_setting(_STRICT, false)
	if (!ProjectSettings.has_setting(_IGNORE_ADDONS)):
		ProjectSettings.set_setting(_IGNORE_ADDONS, true)
	if (!ProjectSettings.has_setting(_VERBOSE)):
		ProjectSettings.set_setting(_VERBOSE, false)

	ProjectSettings.set_initial_value(_STRICT, false)
	ProjectSettings.set_initial_value(_IGNORE_ADDONS, true)
	ProjectSettings.set_initial_value(_VERBOSE, false)
