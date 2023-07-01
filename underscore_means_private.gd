# UrbanHacker.net (c) 2022 - Confidential - All rights reserved
#
# This work is licensed under the terms of the MIT license.  
# For a copy, see <https://opensource.org/licenses/MIT>.

@tool
extends EditorPlugin

const AUTOLOAD_NAME:String = "UnderscoreMeansPrivate"

func _ready():
	print("Underscore Means Private is enabled!")

func _enter_tree():
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/UnderscoreMeansPrivate/PrivateProtection.gd")


func _exit_tree():
	remove_autoload_singleton(AUTOLOAD_NAME)
