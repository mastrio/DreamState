@icon("res://addons/dreamstate/icons/dream_state.svg")
class_name DreamState
extends Node


var state_tree: AnimationTree
var state_machine: AnimationNodeStateMachinePlayback


func _ready() -> void:
	register_state_to_machine()
	
	set_process(false)
	set_physics_process(false)
	set_process_input(false)

func _process(_delta: float) -> void: pass
func _physics_process(_delta: float) -> void: pass
func _input(_event: InputEvent) -> void: pass

func register_state_to_machine() -> void:
	if get_parent().has_method("register_state"):
		get_parent().call("register_state", self)
