@icon("res://addons/dreamstate/icons/dream_machine_tree.svg")
class_name DreamMachineTree
extends DreamMachineBase


@export var state_tree: AnimationTree

var state_machine: AnimationNodeStateMachinePlayback


func _ready() -> void:
	state_machine = state_tree.get("parameters/playback")

func _process(_delta: float) -> void:
	_update_active_state(state_machine.get_current_node())
