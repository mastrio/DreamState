@icon("res://addons/dreamstate/icons/dream_component.svg")
class_name DreamComponent
extends Node


var machine: DreamMachineBase


func _ready() -> void:
	_register_component_to_state()
	_set_active(false)

func _set_active(enable: bool) -> void:
	set_process(enable)
	set_physics_process(enable)
	set_process_input(enable)

func _register_component_to_state() -> void:
	if get_parent().has_method("_register_component"):
		get_parent().call("_register_component", self)
