extends Node

var last_scene : Node = null

func load_sx(sxpk : PackedScene) -> void:
	if last_scene:
		last_scene.queue_free()
	
	last_scene = get_tree().current_scene
	var transition_scene = sxpk.instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
	get_tree().root.add_child(transition_scene, true)
	get_tree().set_current_scene(transition_scene)

func restore_old_sx() -> void:
	if not last_scene:
		return
	
	get_tree().current_scene.queue_free()
	get_tree().set_current_scene(last_scene)
	last_scene = null
