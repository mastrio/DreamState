extends DreamState


func _process(_delta: float) -> void:
	print("YOUR ARE IDLE!!!")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_accept"): state_machine.travel("Moving")
