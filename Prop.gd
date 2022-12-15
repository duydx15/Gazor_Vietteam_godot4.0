extends TextureButton

var previous_mouse_pos = Vector2()
var is_dragging = false


func dragging():
	
	pass


func _on_Prop_gui_input(event):
	if event.is_action_pressed("click"):
		get_tree().set_input_as_handled()
#		previous_mouse_pos = event.position
		previous_mouse_pos = get_global_mouse_position()
		is_dragging = true
		print("ole")
		
func _input(event):
	if not is_dragging:
		return
	if event.is_action_released("click"):
		previous_mouse_pos = Vector2()
		is_dragging = false
#		get_parent().get_parent().save_prop_pos(rect_position)
	if is_dragging and event is InputEventMouseMotion:
#		rect_position += event.position - previous_mouse_pos
#		rect_position += get_global_mouse_position() - previous_mouse_pos
#		previous_mouse_pos = event.position
		previous_mouse_pos = get_global_mouse_position()
