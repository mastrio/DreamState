@icon("res://addons/dreamstate/icons/dream_machine_manual.svg")
class_name DreamMachineManual
extends DreamMachineBase


@export var current_state: StringName

func _process(delta: float) -> void:
	_update_active_state(current_state)
