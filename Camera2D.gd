extends Camera2D

var campos_file = "user://campos.save"

var campos_file_A = "user://campos_A.save"
var campos_file_B = "user://campos_B.save"
var campos_file_C = "user://campos_C.save"
var campos_file_D = "user://campos_D.save"
var campos_file_E = "user://campos_E.save"
var campos_file_F = "user://campos_F.save"
var campos_file_G = "user://campos_G.save"
var campos_file_H = "user://campos_H.save"
var campos_file_I = "user://campos_I.save"
var campos_file_J = "user://campos_J.save"
var campos_file_Z = "user://campos_Z.save"

var mouse_start_pos
var screen_start_position
var campos = Vector2()
var dragging = false

func _ready():
	load_campos()

func _input(event):
	if event.is_action("drag"):
		if event.is_pressed():
			mouse_start_pos = event.position
			screen_start_position = position
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		position = zoom * (mouse_start_pos - event.position) + screen_start_position
		save_campos(position)

func save_campos(pos):
	var file 
	#file= FileAccess.open(campos_file, FileAccess.WRITE)
	#file.store_var(pos)
	#
	if get_node("/root/Main").get("cam_all") == true:
		file= FileAccess.open(campos_file_Z, FileAccess.WRITE)
		file.store_var(pos)
		
	elif get_node("/root/Main").get("is_preset_A") == true:
		file= FileAccess.open(campos_file_A, FileAccess.WRITE)
		file.store_var(pos)
		
	elif get_node("/root/Main").get("is_preset_B") == true:
		file= FileAccess.open(campos_file_B, FileAccess.WRITE)
		file.store_var(pos)
		
	elif get_node("/root/Main").get("is_preset_C") == true:
		file= FileAccess.open(campos_file_C, FileAccess.WRITE)
		file.store_var(pos)
		
	elif get_node("/root/Main").get("is_preset_D") == true:
		file= FileAccess.open(campos_file_D, FileAccess.WRITE)
		file.store_var(pos)
		
	elif get_node("/root/Main").get("is_preset_E") == true:
		file= FileAccess.open(campos_file_E, FileAccess.WRITE)
		file.store_var(pos)
		
	elif get_node("/root/Main").get("is_preset_F") == true:
		file= FileAccess.open(campos_file_F, FileAccess.WRITE)
		file.store_var(pos)
		
	elif get_node("/root/Main").get("is_preset_G") == true:
		file= FileAccess.open(campos_file_G, FileAccess.WRITE)
		file.store_var(pos)
		
	elif get_node("/root/Main").get("is_preset_H") == true:
		file= FileAccess.open(campos_file_H, FileAccess.WRITE)
		file.store_var(pos)
		
	elif get_node("/root/Main").get("is_preset_I") == true:
		file= FileAccess.open(campos_file_I, FileAccess.WRITE)
		file.store_var(pos)
		
	elif get_node("/root/Main").get("is_preset_J") == true:
		file= FileAccess.open(campos_file_J, FileAccess.WRITE)
		file.store_var(pos)
		

func load_campos():
	var file 
	#if FileAccess.file_exists(campos_file):
	#	file= FileAccess.open(campos_file, FileAccess.READ)
	#	position = file.get_var()
	#	
	if get_node("/root/Main").get("cam_all") == true:
		if FileAccess.file_exists(campos_file_Z):
			file= FileAccess.open(campos_file_Z, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	elif get_node("/root/Main").get("is_preset_A") == true:
		if FileAccess.file_exists(campos_file_A):
			file= FileAccess.open(campos_file_A, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	elif get_node("/root/Main").get("is_preset_B") == true:
		if FileAccess.file_exists(campos_file_B):
			file= FileAccess.open(campos_file_B, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	elif get_node("/root/Main").get("is_preset_C") == true:
		if FileAccess.file_exists(campos_file_C):
			file= FileAccess.open(campos_file_C, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	elif get_node("/root/Main").get("is_preset_D") == true:
		if FileAccess.file_exists(campos_file_D):
			file= FileAccess.open(campos_file_D, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	elif get_node("/root/Main").get("is_preset_E") == true:
		if FileAccess.file_exists(campos_file_E):
			file= FileAccess.open(campos_file_E, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	elif get_node("/root/Main").get("is_preset_F") == true:
		if FileAccess.file_exists(campos_file_F):
			file= FileAccess.open(campos_file_F, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	elif get_node("/root/Main").get("is_preset_G") == true:
		if FileAccess.file_exists(campos_file_G):
			file= FileAccess.open(campos_file_G, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	elif get_node("/root/Main").get("is_preset_H") == true:
		if FileAccess.file_exists(campos_file_H):
			file= FileAccess.open(campos_file_H, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	elif get_node("/root/Main").get("is_preset_I") == true:
		if FileAccess.file_exists(campos_file_I):
			file= FileAccess.open(campos_file_I, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	elif get_node("/root/Main").get("is_preset_J") == true:
		if FileAccess.file_exists(campos_file_J):
			file= FileAccess.open(campos_file_J, FileAccess.READ)
			position = file.get_var()
			
		else:
			position = Vector2(0,0)
	
	else:
		pass
