@icon("res://addons/dreamstate/icons/dream_machine_manual.svg")
class_name DreamMachineManual
extends DreamMachineBase


@export var current_state: StringName: set = set_state

var previous_state: StringName


func _register_state(state: DreamState) -> void:
	super(state)
	if state.name == current_state: state._set_active(true)

func set_state(state: StringName) -> void:
	previous_state = current_state
	current_state = state
	_update_active_state(state)
