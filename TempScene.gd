extends Node2D

var prop = preload("res://Prop.tscn")

func _ready():
	dragndrop()


func dragndrop():
# warning-ignore:return_value_discarded
	get_tree().connect("files_dropped", self, "_on_files_dropped")

func _on_files_dropped(files, screen):
	var image = Image.new()
	var image_texture = ImageTexture.new()
	
	image.load(files[0])
	image_texture.create_from_image(image)
	image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
	
	var dropped_prop = prop.instance()
	
	add_child(dropped_prop)
	dropped_prop.get_node("Sprite").texture = image_texture
	dropped_prop.position = get_global_mouse_position()
