extends DreamState


func _process(_delta: float) -> void:
	print("WOW YOUR MOVING!!!!!!!!!!!!!!!!")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_accept"): machine.state_machine.travel("Idle")
