extends Control

var mic_file = "user://mic.save"

var mic_sel
var micCount
var container_on
var container_off

var micContainer = preload("res://MicContainer.tscn")
var deviceList = AudioServer.capture_get_device_list()
var micC = []
# Called when the node enters the scene tree for the first time.
func _ready():
	
	process_priority = -999
	load_mic_sel()
	container_on = load("res://Arts/MicContainerOn.png")
	
	#var image = Image.new()
	#var image_texture = ImageTexture.new()
	
	#image.load("res://Arts/Mic Container On.png")
	#image_texture.create_from_image(image)
	#container_on = image_texture
	

	
	micCount = AudioServer.capture_get_device_list().size() - 1
	
	
	print(micCount)
	for i in micCount:#need to change it to mic count
		micC.insert(i,micContainer.instantiate())
		#micC[i].append(micContainer.instance())
		$VBoxContainer.add_child(micC[i])
		micC[i].get_node("MicName").text = str(deviceList[i+1])#,replace("(High Definition Audio Device)", "")
		micC[i].get_node("MicName").visible_characters = 32
		micC[i].set("id",i+1)
		
		#if i == 0:
		#	micC[i].texture_normal = container_on
		
		if micCount>1:
			if i+1 == mic_sel:
				micC[i].texture_normal = container_on
		else:
			micC[i].texture_normal = container_on
	
#	if mic_sel == null:
#		micC[0].texture_normal = container_on
			
	#micC[0].texture_normal = container_on



func load_mic_sel():
	var file 
	if FileAccess.file_exists(mic_file):
		file = FileAccess.open(mic_file, FileAccess.READ)
		mic_sel = file.get_var()
#		file.close()


