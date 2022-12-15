extends Area2D

export var group := "dragable"
var selected = false


func _ready():
	make_collision()
	

func _physics_process(delta):
	if is_top():
		move(delta)
	

func move(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(),25 * delta)
	elif !selected:
		pass
	

func _on_Prop_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		selected = true
		
	elif Input.is_action_just_released("click"):
		selected = false
		print("released")

func make_collision():
#	var bm = BitMap.new()
#	bm.create_from_image_alpha($Sprite.texture.get_data())
#	var rect = Rect2(position.x, position.y, $Sprite.texture.get_width(), $Sprite.texture.get_height())
#	var my_array = bm.opaque_to_polygons(rect, 0.0001)
#	var my_polygon = Polygon2D.new()
#	my_polygon.set_polygons(my_array)
#	var offsetX = 0
#	var offsetY = 0
#	if ($Sprite.texture.get_width() % 2 != 0):
#		offsetX = 1
#	if ($Sprite.texture.get_height() % 2 != 0):
#		offsetY = 1
#	for i in range(my_polygon.polygons.size()):
#		var my_collision = $CollisionPolygon2D
#		my_collision.set_polygon(my_polygon.polygons[i])
#		my_collision.position -= Vector2(($Sprite.texture.get_width() / 2) + offsetX, ($Sprite.texture.get_height() / 2) + offsetY) * scale.x
#		my_collision.scale = scale
#		add_child(my_collision)

	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha($Sprite.texture.get_data())
	var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0, 0), bitmap.get_size()))
	var offsetX = 0
	var offsetY = 0
	if ($Sprite.texture.get_width() % 2 != 0):
		offsetX = 1
	if ($Sprite.texture.get_height() % 2 != 0):
		offsetY = 1
	for polygon in polygons:
		var collider = CollisionPolygon2D.new()
		collider.polygon = polygon
		collider.position -= Vector2(($Sprite.texture.get_width() / 2) + offsetX, ($Sprite.texture.get_height() / 2) + offsetY) * scale.x
		add_child(collider)


func _on_Prop_mouse_entered():
	add_to_group(group + "hovered")
	print("hovered")

func _on_Prop_mouse_exited():
	remove_from_group(group + "hovered")
	
func is_top():
	pass
	for dragable in get_tree().get_nodes_in_group(group + "hovered"):
		if dragable.get_index() > get_index():
				return false
	return true
