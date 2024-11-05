@icon("res://addons/dreamstate/icons/dream_state_group.svg")
class_name DreamStateGroup
extends Node


func _register_state(state: DreamState) -> void:
	if get_parent().has_method("_register_state"):
		get_parent().call("_register_state", state)
