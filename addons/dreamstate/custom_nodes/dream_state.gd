@icon("res://addons/dreamstate/icons/dream_state.svg")
class_name DreamState
extends Node


var machine: DreamMachineBase

var components: Array[DreamComponent]


func _ready() -> void:
	_register_state_to_machine()
	_set_component_machine()

func _set_active(enable: bool) -> void:
	set_process(enable)
	set_physics_process(enable)
	set_process_input(enable)
	
	for component: DreamComponent in components:
		component._set_active(enable)

func _register_state_to_machine() -> void:
	if get_parent().has_method("_register_state"):
		get_parent().call("_register_state", self)

func _register_component(component: DreamComponent) -> void:
	components.append(component)

func _set_component_machine() -> void:
	for component: DreamComponent in components:
		component.machine = machine
