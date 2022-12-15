extends Node2D



func _process(delta):
	if Input.is_action_pressed("click") and Input.is_action_pressed("e"):
		if z_index == 2:
			self.global_position = get_global_mouse_position()
			

