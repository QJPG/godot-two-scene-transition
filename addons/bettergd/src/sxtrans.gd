@icon("res://addons/bettergd/misc/icon_btwtrans3dNode.svg")
extends Area3D

@export_category("Two Transition")
@export var next_scene : PackedScene
@export var enter_shape := 0
@export var exit_shape := 1

var passed := false
var entered := false

func _ready():
	body_shape_entered.connect(func(body_rid, body, body_shape_index, shape_index):
		if shape_index == exit_shape:
			if entered:
				BetterScene.load_sx(next_scene)
				passed = true
				entered = false
		
		if shape_index == enter_shape:
			entered = true
			
			if passed:
				BetterScene.restore_old_sx()
				passed = false
		
		#print("enter:%s e:%s p:%s" % [shape_index, entered, passed])
		)

func _process(delta):
	return
