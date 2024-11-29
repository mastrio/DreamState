@icon("res://addons/dreamstate/icons/dream_machine_base.svg")
class_name DreamMachineBase
extends Node


@export var machine_enabled: bool = true : set = set_machine_enabled

var states: Array[DreamState] = []
var active_state: DreamState


func set_state_active(state: DreamState, enable: bool) -> void:
	if state != null: state._set_active(enable)

func _register_state(state: DreamState) -> void:
	states.append(state)
	state.machine = self
	state._set_active(false)

func _update_active_state(state_name: StringName) -> void:
	var state_exists: bool = false
	for state: DreamState in states:
		if state.name == state_name:
			state_exists = true
			set_state_active(active_state, false)
			active_state = state
			if machine_enabled: set_state_active(active_state, true)
	if not state_exists: active_state = null

func set_machine_enabled(enabled: bool) -> void:
	set_state_active(active_state, enabled)
	machine_enabled = enabled
