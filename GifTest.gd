extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	dragndrop()

func dragndrop():
# warning-ignore:return_value_discarded
	get_tree().connect("files_dropped", self, "_on_files_dropped")

func _on_files_dropped(files, screen):
	var image = Image.new()
	var image_frames = ImageFrames.new()
	var image_texture = ImageTexture.new()
	var animated_texture = AnimatedTexture.new()
	
	print(files[0].get_extension())
	
	
	if files[0].get_extension() != "gif":
		image.load(files[0])
		image_texture.create_from_image(image)
		
		self.texture = image_texture
	elif  files[0].get_extension() == "gif":
		image_frames.load(files[0])
		animated_texture.frames = image_frames.get_frame_count()
		
		for i in image_frames.get_frame_count():
			var frame = image_frames.get_frame_image(i)
			var tex = ImageTexture.new()
			tex.create_from_image(frame)

			animated_texture.set_frame_texture(i, tex)
			animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
		animated_texture.fps = 120
		self.texture = animated_texture
	
	pass
