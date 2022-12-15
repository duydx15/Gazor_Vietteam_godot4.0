extends TextureButton


var container_on
var container_off
var id
var micCount

func _ready():
	#AudioServer.capture_set_device(AudioServer.capture_get_device_list()[1])
	#var image = Image.new()
	#var image_texture = ImageTexture.new()
	
	#image.load("res://Arts/MicContainerOn.png")
	#image_texture.create_from_image(image)
	#container_on = image_texture
	container_on = load("res://Arts/MicContainerOn.png")
	
	#var image2 = Image.new()
	#var image_texture2 = ImageTexture.new()
	
	#image2.load("res://Arts/MicContainer.png")
	#image_texture2.create_from_image(image2)
	#container_off = image_texture2
	container_off = load("res://Arts/MicContainer.png")

	micCount = AudioServer.capture_get_device_list().size()-1
	
	print(micCount)
	get_tree().get_root().get_node("Main").set("micCount", micCount)


func _on_MicContainer_pressed():
	AudioServer.capture_set_device(AudioServer.capture_get_device_list()[id])
	
	self.texture_normal = container_on
	
	for i in micCount:
		if micCount <2:
			pass
		elif get_parent().get_child(i).get("id") != id:
			#print(get_parent().get_child(i).get("id"))
			get_parent().get_child(i).texture_normal = container_off
		
	
	print(id)
	get_tree().get_root().get_node("Main").save_mic(id)
	
	
	
	

