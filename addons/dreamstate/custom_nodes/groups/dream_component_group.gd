@icon("res://addons/dreamstate/icons/dream_component_group.svg")
class_name DreamComponentGroup
extends Node


func _register_component(component: DreamComponent) -> void:
	if get_parent().has_method("_register_component"):
		get_parent().call("_register_component", component)
