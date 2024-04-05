@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("BetterScene", "res://addons/bettergd/src/bscn.gd")
	add_custom_type("BttTwoSceneTransition", "Area3D", preload("res://addons/bettergd/src/sxtrans.gd"), preload("res://addons/bettergd/misc/icon_btwtrans3dNode.svg"))

func _exit_tree():
	remove_autoload_singleton("BetterScene")
	remove_custom_type("BttTwoSceneTransition")
