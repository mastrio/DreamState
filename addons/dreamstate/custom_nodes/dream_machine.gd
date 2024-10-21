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
	update_active_state(state_machine.get_current_node())
	
	if active_state: active_state._process(delta)

func _physics_process(delta: float) -> void:
	if active_state: active_state._physics_process(delta)

func _input(event: InputEvent) -> void:
	if active_state: active_state._input(event)

func register_state(state: DreamState) -> void:
	states.append(state)
	state.state_tree = state_tree
	state.state_machine = state_tree.get("parameters/playback")

func update_active_state(state_name: StringName) -> void:
	var state_exists: bool = false
	for state: DreamState in states:
		if state.name == state_name:
			active_state = state
			state_exists = true
	if not state_exists: active_state = null
