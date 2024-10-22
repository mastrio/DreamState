@icon("res://addons/dreamstate/icons/dream_machine.svg")
class_name DreamMachine
extends Node


@export var state_tree: AnimationTree

var state_machine: AnimationNodeStateMachinePlayback

var states: Array[DreamState] = []
var active_state: DreamState


func _ready() -> void:
	state_machine = state_tree.get("parameters/playback")

func _process(delta: float) -> void:
	_update_active_state(state_machine.get_current_node())

func set_state_active(state: DreamState, enable: bool) -> void:
	if state: state._set_active(enable)

func _register_state(state: DreamState) -> void:
	states.append(state)
	state.state_tree = state_tree
	state.state_machine = state_tree.get("parameters/playback")

func _update_active_state(state_name: StringName) -> void:
	var state_exists: bool = false
	for state: DreamState in states:
		if state.name == state_name:
			set_state_active(active_state, false)
			active_state = state
			set_state_active(active_state, true)
			state_exists = true
	if not state_exists: active_state = null
