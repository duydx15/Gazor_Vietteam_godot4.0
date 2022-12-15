extends Control

#var room_id = 0
#const PORT = 3000
#const MAX_USERS = 4 #not including host

#onready var prop = preload("res://Prop.tscn")

var power = 0.0
var tick = 0.0
#export var numC = 0
var stopped_talking = false
var can_change = false
var is_anim_delay_started = false
var is_shaking = false
var is_screaming = false
var is_first_click = false
var is_second_click = false
var is_spawny = false


var numP = 0

var is_fullscreen = false
var is_filedialog_talk = false
var is_filedialog_silence = false
var is_filedialog_talk_blink = false
var is_filedialog_silence_blink = false
var is_filedialog_scream = false
var is_filedialog_prop = false

var is_panel_shown = true
var is_panel2_shown = false
var is_panel3_shown = false
var can_close_panel = false

var can_change_bg = false
var is_blinking = false

var can_bounce = true
var can_blink = true
var can_shake = true
var can_dim = true
var is_talking = false
var is_timer = false
var limiter = 0
var sLimiter = 6
var sValue = 0

var is_transparent = false
var can_scroll = true
var camzoom = Vector2()

var can_switch_preset = true
var is_preset_A = true
var is_preset_B = false
var is_preset_C = false
var is_preset_D = false
var is_preset_E = false
var is_preset_F = false
var is_preset_G = false
var is_preset_H = false
var is_preset_I = false
var is_preset_J = false

var cam_all = false

var res_file_x = "user://res_x.save"
var res_file_y = "user://res_y.save"

var prop_pos_file = ["user://prop_pos_A.save", "user://prop_pos_B.save", "user://prop_pos_C.save", "user://prop_pos_D.save", "user://prop_pos_E.save", "user://prop_pos_F.save", "user://prop_pos_G.save", "user://prop_pos_H.save", "user://prop_pos_I.save", "user://prop_pos_J.save"] 
var prop_pos = [Vector2(), Vector2(), Vector2(), Vector2(), Vector2(), Vector2(), Vector2(), Vector2(), Vector2(), Vector2()]
var prop_zoom = [Vector2(), Vector2(), Vector2(), Vector2(), Vector2(), Vector2(), Vector2(), Vector2(), Vector2(), Vector2()]
var prop_zoom_file = ["user://prop_zoom_A.save", "user://prop_zoom_B.save", "user://prop_zoom_C.save", "user://prop_zoom_D.save", "user://prop_zoom_E.save", "user://prop_zoom_F.save", "user://prop_zoom_G.save", "user://prop_zoom_H.save", "user://prop_zoom_I.save", "user://prop_zoom_J.save"]

var bg_file_A = "user://bg_A.save"
var bg_file_B = "user://bg_B.save"
var bg_file_C = "user://bg_C.save"
var bg_file_D = "user://bg_D.save"
var bg_file_E = "user://bg_E.save"
var bg_file_F = "user://bg_F.save"
var bg_file_G = "user://bg_G.save"
var bg_file_H = "user://bg_H.save"
var bg_file_I = "user://bg_I.save"
var bg_file_J = "user://bg_J.save"

var talking_file_A = "user://talking_A.json"
var silence_file_A = "user://silence_A.json"
var talking_blink_file_A = "user://talking_blink_A.save"
var silence_blink_file_A = "user://silence_blink_A.save"
var scream_file_A = "user://scream_png_A.json"
var prop_file_A = "user://prop_png_A.json"

var talking_file_B = "user://talking_B.json"
var silence_file_B = "user://silence_B.json"
var talking_blink_file_B = "user://talking_blink_B.save"
var silence_blink_file_B = "user://silence_blink_B.save"
var scream_file_B = "user://scream_png_B.json"
var prop_file_B = "user://prop_png_B.json"

var talking_file_C = "user://talking_C.json"
var silence_file_C = "user://silence_C.json"
var talking_blink_file_C = "user://talking_blink_C.save"
var silence_blink_file_C = "user://silence_blink_C.save"
var scream_file_C = "user://scream_png_C.json"
var prop_file_C = "user://prop_png_C.json"

var talking_file_D = "user://talking_D.json"
var silence_file_D = "user://silence_D.json"
var talking_blink_file_D = "user://talking_blink_D.save"
var silence_blink_file_D = "user://silence_blink_D.save"
var scream_file_D = "user://scream_png_D.json"
var prop_file_D = "user://prop_png_D.json"

var talking_file_E = "user://talking_E.json"
var silence_file_E = "user://silence_E.json"
var talking_blink_file_E = "user://talking_blink_E.save"
var silence_blink_file_E = "user://silence_blink_E.save"
var scream_file_E = "user://scream_png_E.json"
var prop_file_E = "user://prop_png_E.json"

var talking_file_F = "user://talking_F.json"
var silence_file_F = "user://silence_F.json"
var talking_blink_file_F = "user://talking_blink_F.save"
var silence_blink_file_F = "user://silence_blink_F.save"
var scream_file_F = "user://scream_png_F.json"
var prop_file_F = "user://prop_png_F.json"

var talking_file_G = "user://talking_G.json"
var silence_file_G = "user://silence_G.json"
var talking_blink_file_G = "user://talking_blink_G.save"
var silence_blink_file_G = "user://silence_blink_G.save"
var scream_file_G = "user://scream_png_G.json"
var prop_file_G = "user://prop_png_G.json"

var talking_file_H = "user://talking_H.json"
var silence_file_H = "user://silence_H.json"
var talking_blink_file_H = "user://talking_blink_H.save"
var silence_blink_file_H = "user://silence_blink_H.save"
var scream_file_H = "user://scream_png_H.json"
var prop_file_H = "user://prop_png_H.json"

var talking_file_I = "user://talking_I.json"
var silence_file_I = "user://silence_I.json"
var talking_blink_file_I = "user://talking_blink_I.save"
var silence_blink_file_I = "user://silence_blink_I.save"
var scream_file_I = "user://scream_png_I.json"
var prop_file_I = "user://prop_png_I.json"

var talking_file_J = "user://talking_J.json"
var silence_file_J = "user://silence_J.json"
var talking_blink_file_J = "user://talking_blink_J.save"
var silence_blink_file_J = "user://silence_blink_J.save"
var scream_file_J = "user://scream_png_J.json"
var prop_file_J = "user://prop_png_J.json"

var amp_file = "user://amp.save"
var sens_file = "user://sens.save"
var camzoom_file = "user://camzoom.save"
var prop1_file = "user://prop1.save"
var bouncy_file = "user://bouncy.save"
var shaky_file = "user://shaky.save"
var dim_file = "user://dim.save"

var interval_A1 = "user://interval_A1.save"
var interval_A2 = "user://interval_A2.save"
var interval_B1 = "user://interval_B1.save"
var interval_B2 = "user://interval_B2.save"
var interval_C1 = "user://interval_C1.save"
var interval_C2 = "user://interval_C2.save"
var interval_D1 = "user://interval_D1.save"
var interval_D2 = "user://interval_D2.save"
var interval_E1 = "user://interval_E1.save"
var interval_E2 = "user://interval_E2.save"

var inter_A1
var inter_A2
var inter_B1
var inter_B2
var inter_C1
var inter_C2
var inter_D1
var inter_D2
var inter_E1
var inter_E2




var mic_sel
var mic_file = "user://mic.save"

var is_flipped_A = false
var is_flipped_B = false
var is_flipped_C = false
var is_flipped_D = false
var is_flipped_E = false
var is_flipped_F = false
var is_flipped_G = false
var is_flipped_H = false
var is_flipped_I = false
var is_flipped_J = false
var flip_file_A = "user://flip_A.save"
var flip_file_B = "user://flip_B.save"
var flip_file_C = "user://flip_C.save"
var flip_file_D = "user://flip_D.save"
var flip_file_E = "user://flip_E.save"
var flip_file_F = "user://flip_F.save"
var flip_file_G = "user://flip_G.save"
var flip_file_H = "user://flip_H.save"
var flip_file_I = "user://flip_I.save"
var flip_file_J = "user://flip_J.save"

var camzoom_file_A = "user://camzoom_A.save"
var camzoom_file_B = "user://camzoom_B.save"
var camzoom_file_C = "user://camzoom_C.save"
var camzoom_file_D = "user://camzoom_D.save"
var camzoom_file_E = "user://camzoom_E.save"
var camzoom_file_F = "user://camzoom_F.save"
var camzoom_file_G = "user://camzoom_G.save"
var camzoom_file_H = "user://camzoom_H.save"
var camzoom_file_I = "user://camzoom_I.save"
var camzoom_file_J = "user://camzoom_J.save"
var camzoom_file_Z = "user://camzoom_Z.save"
#var bind_file_A = "user://binding_A.save"
#var bind_file_B = "user://binding_B.save"
#var bind_file_C = "user://binding_C.save"

var talk_png_A
var talk_blink_A
var talk_png_B
var talk_blink_B
var talk_png_C
var talk_blink_C
var talk_png_D
var talk_blink_D
var talk_png_E
var talk_blink_E
var talk_png_F
var talk_blink_F
var talk_png_G
var talk_blink_G
var talk_png_H
var talk_blink_H
var talk_png_I
var talk_blink_I
var talk_png_J
var talk_blink_J

var talk_test_A
var talk_test_B


var silence_png_A
var silence_blink_A
var silence_png_B
var silence_blink_B
var silence_png_C
var silence_blink_C
var silence_png_D
var silence_blink_D
var silence_png_E
var silence_blink_E
var silence_png_F
var silence_blink_F
var silence_png_G
var silence_blink_G
var silence_png_H
var silence_blink_H
var silence_png_I
var silence_blink_I
var silence_png_J
var silence_blink_J


var scream_png_A
var scream_png_B
var scream_png_C
var scream_png_D
var scream_png_E
var scream_png_F
var scream_png_G
var scream_png_H
var scream_png_I
var scream_png_J

var prop_png_A
var prop_png_B
var prop_png_C
var prop_png_D
var prop_png_E
var prop_png_F
var prop_png_G
var prop_png_H
var prop_png_I
var prop_png_J

var blinking_normal = false
var blinking_skip = false
var blinking_double = false

var bg_A 
var bg_B
var bg_C 
var bg_D
var bg_E 
var bg_F
var bg_G 
var bg_H
var bg_I 
var bg_J

var micCount
var rng = RandomNumberGenerator.new()

var fps
var spectrum

var viewport_path = null
#var target_viewport = get_node(viewport_path) if viewport_path else get_tree().root.get_viewport()


func _ready():
	
	
	process_priority = -1000
	$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=155
#	get_tree().get_root().connect("size_changed",self, "winsize")
	get_tree().get_root().size_changed.connect(self.winsize)
	load_resolution()
#	print("Load resolution")
#	load_mic()
	spectrum = AudioServer.get_bus_effect_instance(1, 1)
	
	limiter = $CanvasLayer/ToHide/LeftPanel/MicSens.get("value")
	#AudioServer.capture_set_device(AudioServer.capture_get_device_list()[1])
	
	#$CanvasLayer/ToHide/Report2.text ="Audio Input is " + str(ProjectSettings.get_setting("audio/enable_audio_input"))
	#$CanvasLayer/ToHide/Report3.text = "Availble mic & audio interface is " + str(Sount)
	#ProjectSettings.set_setting("audio/enable_audio_input", true)
	
	#OS.window_maximized = true
	
#	$On.texture.FLAG_REPEAT
#	$Off.texture.FLAG_REPEAT
	
#	load_interval()
	load_bg()
#	load_binding()
	load_png()
	load_blink()
	
	load_sens()
	load_amp()
	load_camzoom()
	load_options()
	load_flip()
	dragndrop()
	load_scream()
	load_prop()
	load_prop_pos()
	load_prop_zoom()
	switch_preset()
	load_hotkeys()
	load_audio()

	#print(AudioServer.capture_get_device())
	$CanvasLayer/ToHide/Panel2/VBoxContainer.hide()
	
	#network
	
#	get_tree().connect("connected_to_server", self, "enter_room")
#	get_tree().connect("network_peer_connected", self, "user_entered")
#	get_tree().connect("network_peer_disconnected", self, "user_exited")
#	get_tree().connect("server_disconnected", self, "_server_disconnected")
#
#
#	join_room()
var images = []
var count_frame = 0
var fps_output =30
var previous_time = 0
var start_ = 0

func _physics_process(delta):
#	var start_ = Ti.start()
	count_frame +=1
#	print(count_frame)
	voice_cap_audio(delta)
#	OS.native_video_unpause()
#	var scene_1 = get_viewport().get_texture().get_data()
#	images.append(scene_1)
#	print("Position in audio playing: ",music_player.get_pitch_scale())
#	print("Position in audio playing: ",music_player.get_playback_position())
	if (previous_time - music_player.get_playback_position()) > 0:
		print("Count_frame ",count_frame," - ",Time.get_ticks_usec()-start_ )
		
		var frame = 0
#		for image in images:
#			frame += 1
#			image.flip_y()
#			image.save_png("res://output_images/%05d.png"%frame)
#		print("Time save image - ",OS.get_ticks_msec()-start_ )
#		get_tree().quit()
	previous_time = music_player.get_playback_position()
#	
	
	

func line_fix():
	$Off.texture.set_flags($Off.texture.get_flags() & ~(1 << 1))
	$On.texture.set_flags($On.texture.get_flags() & ~(1 << 1))

func winsize():
	#print(OS.window_size)
#	save_resolution_x(OS.window_size)
#	save_resolution_y(OS.window_size)\
#	print("size",DisplayServer.window_get_size())
	
	save_resolution_x(DisplayServer.window_get_size())
	save_resolution_y(DisplayServer.window_get_size())
	print("size changed bruh",DisplayServer.window_get_size())

func voice_cap(_delta):
	power = AudioServer.get_bus_peak_volume_left_db(AudioServer.get_bus_index("Record"),0) - sValue
	$CanvasLayer/ToHide/LeftPanel/AudioMeter.value = power
	
	if power > limiter and power < sLimiter:
		stopped_talking = false
		if is_talking == false and can_bounce == true:
			$AnimationPlayer.play("Talk")
			is_talking = true
			is_timer = false
			$Timer.stop()
		elif is_talking == false and can_bounce == false:
			$AnimationPlayer.play("TalkNoBounce")
			is_talking = true
			is_timer = false
			$Timer.stop()
		
			
	elif power > limiter  and power >= sLimiter and can_shake == true:
		stopped_talking = false
		if $Scream.texture == null:
			$AnimationPlayer.play("ScreamTalk")
		elif $Scream.texture != null:
			$AnimationPlayer.play("Scream")
		is_talking = true
		is_timer = false
		$Timer.wait_time = 0.1/pitch_scale
		$Timer.stop()
	
	elif power > limiter  and power >= sLimiter and can_shake == false:
		stopped_talking = false
#		if is_talking == false and can_bounce == true:
		if $Scream.texture == null and can_bounce:
			$AnimationPlayer.play("Talk")
		elif $Scream.texture == null and can_bounce == false:
			$AnimationPlayer.play("TalkNoBounce")
		else:
			$AnimationPlayer.play("ScreamNoShake")
		is_talking = true
		is_timer = false
		$Timer.wait_time = 0.1/pitch_scale
		$Timer.stop()

	elif power < limiter:
		is_talking = false
		if is_timer == false:
			$Timer.start()
			$Timer2.start()
			is_timer = true

func voice_cap_audio(_delta):
	power = AudioServer.get_bus_peak_volume_left_db(AudioServer.get_bus_index("music"),0) - sValue
#	print("Power ", power)
	$CanvasLayer/ToHide/LeftPanel/AudioMeter.value = power
	if power > limiter and power < sLimiter:
		
		stopped_talking = false
		if is_talking == false and can_bounce == true:
#			print("Talk")
			$AnimationPlayer.play("Talk")
			is_talking = true
			is_timer = false
			$Timer.stop()
		elif is_talking == false and can_bounce == false:
			$AnimationPlayer.play("TalkNoBounce")
			is_talking = true
			is_timer = false
			$Timer.stop()
		
			
	elif power > limiter  and power >= sLimiter and can_shake == true:
		stopped_talking = false
		if $Scream.texture == null:
			$AnimationPlayer.play("ScreamTalk")
		elif $Scream.texture != null:
			$AnimationPlayer.play("Scream")
		is_talking = true
		is_timer = false
		$Timer.wait_time = 0.1/pitch_scale
		$Timer.stop()
	
	elif power > limiter  and power >= sLimiter and can_shake == false:
		stopped_talking = false
#		if is_talking == false and can_bounce == true:
		if $Scream.texture == null and can_bounce:
			$AnimationPlayer.play("Talk")
		elif $Scream.texture == null and can_bounce == false:
			$AnimationPlayer.play("TalkNoBounce")
		else:
			$AnimationPlayer.play("ScreamNoShake")
		is_talking = true
		is_timer = false
		$Timer.wait_time = 0.1/pitch_scale
		$Timer.stop()

	elif power < limiter:
		is_talking = false
		if is_timer == false:
			$Timer.start()
			$Timer2.start()
			is_timer = true

func _input(event):
	if can_scroll == true:
		if event.is_action_pressed("scroll up") and Input.is_action_pressed("control") == false:
			#if $Camera2D.zoom > Vector2(0.1,0.1):
			$Camera2D.zoom = $Camera2D.zoom - Vector2(0.5, 0.5)
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
		elif event.is_action_pressed("scroll down") and Input.is_action_pressed("control") == false:
			#if $Camera2D.zoom > Vector2(0.75,0.75):
			$Camera2D.zoom = $Camera2D.zoom + Vector2(0.5, 0.5)
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
		elif event.is_action_pressed("scroll up") and Input.is_action_pressed("control"):
			$PropContainer/Prop.rect_scale =$PropContainer/Prop.rect_scale + Vector2(0.1, 0.1)
			$PropContainer/Prop.rect_scale
			save_prop_zoom($PropContainer/Prop.rect_scale)
		elif event.is_action_pressed("scroll down") and Input.is_action_pressed("control"):
			$PropContainer/Prop.rect_scale =$PropContainer/Prop.rect_scale - Vector2(0.1, 0.1)
			$PropContainer/Prop.rect_scale
			save_prop_zoom($PropContainer/Prop.rect_scale)
		
		
	#fullscreen
	if Input.is_action_just_pressed("fullscreen"):
		if is_fullscreen == false:
			OS.window_fullscreen = true
			is_fullscreen = true
		else:
			OS.window_fullscreen = false
			is_fullscreen = false
	
	
#	
	#reset
	if Input.is_action_just_pressed("reset"):
		var dir = DirAccess.new()
		dir.remove("user://res_x.save")
		dir.remove("user://res_y.save")
		dir.remove("user://bg_A.save")
		dir.remove("user://bg_B.save")
		dir.remove("user://bg_C.save")
		dir.remove("user://bg_D.save")
		dir.remove("user://bg_E.save")
		dir.remove("user://talking_A.save")
		dir.remove("user://silence_A.save")
		dir.remove("user://talking_blink_A.save")
		dir.remove("user://silence_blink_A.save")
		dir.remove("user://talking_B.save")
		dir.remove("user://silence_B.save")
		dir.remove("user://talking_blink_B.save")
		dir.remove("user://silence_blink_B.save")
		dir.remove("user://talking_C.save")
		dir.remove("user://silence_C.save")
		dir.remove("user://talking_blink_C.save")
		dir.remove("user://silence_blink_C.save")
		dir.remove("user://talking_D.save")
		dir.remove("user://silence_D.save")
		dir.remove("user://talking_blink_D.save")
		dir.remove("user://silence_blink_D.save")
		dir.remove("user://talking_E.save")
		dir.remove("user://silence_E.save")
		dir.remove("user://talking_blink_E.save")
		dir.remove("user://silence_blink_E.save")
		dir.remove("user://sens.save")
		dir.remove("user://camzoom.save")
		dir.remove("user://prop1.save")
		dir.remove("user://bouncy.save")
		dir.remove("user://shaky.save")
		dir.remove("user://dim.save")
		dir.remove("user://mic.save")
		dir.remove("user://flip_A.save")
		dir.remove("user://flip_B.save")
		dir.remove("user://flip_C.save")
		dir.remove("user://flip_D.save")
		dir.remove("user://flip_E.save")
		dir.remove("user://camzoom_A.save")
		dir.remove("user://camzoom_B.save")
		dir.remove("user://camzoom_C.save")
		dir.remove("user://camzoom_D.save")
		dir.remove("user://camzoom_E.save")
		dir.remove("user://camzoom_Z.save")
		dir.remove("user://campos.save")
		dir.remove("user://campos_A.save")
		dir.remove("user://campos_B.save")
		dir.remove("user://campos_C.save")
		dir.remove("user://campos_D.save")
		dir.remove("user://campos_E.save")
		dir.remove("user://campos_Z.save")
		
		
		
		get_tree().reload_current_scene()
		
		
	
	#Silent Shakes
	if Input.is_action_pressed("shakes") and is_talking == false:
		$AnimationPlayer.play("Triggered")

	elif not Input.is_action_pressed("shakes") and is_talking == false:
		$AnimationPlayer.play("Silence")
	
	
	#Preset Key
#	if Input.is_action_just_pressed("key_preset_z"):
#		if can_switch_preset:
#			cam_all = true
#			load_camzoom()
#			$Camera2D.load_campos()
#			$CanvasLayer/ToHide/FixedLbl.show()
	if Input.is_action_just_pressed("key_preset_a"):
		if can_switch_preset:
			is_preset_A = true
			is_preset_B = false
			is_preset_C = false
			is_preset_D = false
			is_preset_E = false
			is_preset_F = false
			is_preset_G = false
			is_preset_H = false
			is_preset_I = false
			is_preset_J = false
			$CanvasLayer/ToHide/PresetLbl.text= "PRESET A"
			
#			$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=155
#			$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=55
			
		switch_preset()
		switch_bg()
		
	if Input.is_action_just_pressed("key_preset_b"):
		if can_switch_preset:
			is_preset_A = false
			is_preset_B = true
			is_preset_C = false
			is_preset_D = false
			is_preset_E = false
			is_preset_F = false
			is_preset_G = false
			is_preset_H = false
			is_preset_I = false
			is_preset_J = false
			$CanvasLayer/ToHide/PresetLbl.text= "PRESET B"
			
#			$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=155
#			$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=55
			
			switch_preset()
			switch_bg()
		
	if Input.is_action_just_pressed("key_preset_c"):
		if can_switch_preset:
			is_preset_A = false
			is_preset_B = false
			is_preset_C = true
			is_preset_D = false
			is_preset_E = false
			is_preset_F = false
			is_preset_G = false
			is_preset_H = false
			is_preset_I = false
			is_preset_J = false
			$CanvasLayer/ToHide/PresetLbl.text= "PRESET C"
			
#			$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=155
#			$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=55
			
			switch_preset()
			switch_bg()
		
	if Input.is_action_just_pressed("key_preset_d"):
		if can_switch_preset:
			is_preset_A = false
			is_preset_B = false
			is_preset_C = false
			is_preset_D = true
			is_preset_E = false
			is_preset_F = false
			is_preset_G = false
			is_preset_H = false
			is_preset_I = false
			is_preset_J = false
			$CanvasLayer/ToHide/PresetLbl.text= "PRESET D"
			
#			$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=155
#			$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=55
			
			switch_preset()
			switch_bg()
			
	if Input.is_action_just_pressed("key_preset_e"):
		if can_switch_preset:
			is_preset_A = false
			is_preset_B = false
			is_preset_C = false
			is_preset_D = false
			is_preset_E = true
			is_preset_F = false
			is_preset_G = false
			is_preset_H = false
			is_preset_I = false
			is_preset_J = false
			$CanvasLayer/ToHide/PresetLbl.text= "PRESET E"
			
#			$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
			
			switch_preset()
			switch_bg()
	
	if Input.is_action_just_pressed("key_preset_f"):
		#print("YEAH")
		if can_switch_preset:
			is_preset_A = false
			is_preset_B = false
			is_preset_C = false
			is_preset_D = false
			is_preset_E = false
			is_preset_F = true
			is_preset_G = false
			is_preset_H = false
			is_preset_I = false
			is_preset_J = false
			$CanvasLayer/ToHide/PresetLbl.text= "PRESET F"
			
#			$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
			
			switch_preset()
			switch_bg()
	
	if Input.is_action_just_pressed("key_preset_g"):
		#print("YEAH")
		if can_switch_preset:
			is_preset_A = false
			is_preset_B = false
			is_preset_C = false
			is_preset_D = false
			is_preset_E = false
			is_preset_F = false
			is_preset_G = true
			is_preset_H = false
			is_preset_I = false
			is_preset_J = false
			$CanvasLayer/ToHide/PresetLbl.text= "PRESET G"
			
#			$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
			
			switch_preset()
			switch_bg()
	
	if Input.is_action_just_pressed("key_preset_h"):
		#print("YEAH")
		if can_switch_preset:
			is_preset_A = false
			is_preset_B = false
			is_preset_C = false
			is_preset_D = false
			is_preset_E = false
			is_preset_F = false
			is_preset_G = false
			is_preset_H = true
			is_preset_I = false
			is_preset_J = false
			$CanvasLayer/ToHide/PresetLbl.text= "PRESET H"
			
#			$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
			
			switch_preset()
			switch_bg()
			
	if Input.is_action_just_pressed("key_preset_i"):
		#print("YEAH")
		if can_switch_preset:
			is_preset_A = false
			is_preset_B = false
			is_preset_C = false
			is_preset_D = false
			is_preset_E = false
			is_preset_F = false
			is_preset_G = false
			is_preset_H = false
			is_preset_I = true
			is_preset_J = false
			$CanvasLayer/ToHide/PresetLbl.text= "PRESET I"
			
#			$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
			
			switch_preset()
			switch_bg()
			
	if Input.is_action_just_pressed("key_preset_j"):
		#print("YEAH")
		if can_switch_preset:
			is_preset_A = false
			is_preset_B = false
			is_preset_C = false
			is_preset_D = false
			is_preset_E = false
			is_preset_F = false
			is_preset_G = false
			is_preset_H = false
			is_preset_I = false
			is_preset_J = true
			$CanvasLayer/ToHide/PresetLbl.text= "PRESET J"
			
#			$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#			$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
			
			switch_preset()
			switch_bg()
	
	escape()
		
	
func _on_Timer_timeout():
	
	if stopped_talking == false:
		$AnimationPlayer.play("Silence")
		is_talking = false
		is_timer = false
		$Timer.stop()
		stopped_talking = true
		$Timer.wait_time = 0.3
	
var music_file = "res://input_audio/test_1p.mp3"
var stream = AudioStream.new()
var music_player = AudioStreamPlayer.new()
var pitch_scale = 1

func load_audio():
	
	if FileAccess.file_exists(music_file):
		var music = load(music_file)
		music_player.stream = music
		music_player.set_pitch_scale(pitch_scale)
#		music_player.play()
		# below are optional steps if you need more control

		var music_bus_id = AudioServer.get_bus_count()
		AudioServer.add_bus()
		AudioServer.set_bus_name(music_bus_id,"music")
		# connects music to master bus
		AudioServer.set_bus_send(music_bus_id,"Master")
		add_child(music_player)
		music_player.bus = "music"
		music_player.play()
		print("Play audio!!!")
	else:
		print("File audio not exist!!!")

func load_mic():
	micCount = AudioServer.capture_get_device_list().size()-1
	if micCount <= 1:
		AudioServer.capture_set_device(AudioServer.capture_get_device_list()[1])
	else:
		#var file = FileAccess.new()
		if FileAccess.file_exists(mic_file):
			var file =FileAccess.open(mic_file, FileAccess.READ)
			mic_sel = file.get_var()
			if mic_sel <= micCount:
				AudioServer.capture_set_device(AudioServer.capture_get_device_list()[mic_sel])
				#file.close()
#				print(AudioServer.capture_get_device())
#				print(mic_sel)
			else:
				$CanvasLayer/ToHide/Info.show()
				$CanvasLayer/ToHide/Info/MicChanged.show()
				print("not enought mic")
		else:
			AudioServer.capture_set_device(AudioServer.capture_get_device_list()[1])
			$CanvasLayer/ToHide/Info.show()
			$CanvasLayer/ToHide/Info/MicFirstTime.show()
#	print(AudioServer.capture_get_device_list())

func _on_Button_pressed():
	#$CanvasLayer/FileDialogOn.popup()
	$CanvasLayer/FileDialog.show()
	can_scroll = false
	is_blinking = false
	is_filedialog_talk = true
	is_filedialog_talk_blink = false
	is_filedialog_silence = false
	is_filedialog_silence_blink=false
	is_filedialog_prop = false
	$CanvasLayer/FileDialog/BgLbl.hide()
	$CanvasLayer/FileDialog/PngLbl.show()
	$CanvasLayer/FileDialog/ImageContainer.show()
	$CanvasLayer/FileDialog/ImageContainer.show()
	
	if is_preset_A:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_png_A
	elif is_preset_B:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_png_B
	elif is_preset_C:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_png_C
	elif is_preset_D:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_png_D
	elif is_preset_E:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_png_E
	elif is_preset_F:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_png_F
	elif is_preset_G:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_png_G
	elif is_preset_H:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_png_H
	elif is_preset_I:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_png_I
	elif is_preset_J:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_png_J


func _on_BtnTalkBlink_pressed():
	#$CanvasLayer/FileDialogOn.popup()
	$CanvasLayer/FileDialog.show()
	can_scroll = false
	is_filedialog_talk = false
	is_filedialog_talk_blink = true
	is_filedialog_silence_blink=false
	is_filedialog_silence = false
	is_filedialog_prop = false
	is_blinking = true
	$CanvasLayer/FileDialog/BgLbl.hide()
	$CanvasLayer/FileDialog/PngLbl.show()
	if is_preset_A:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_blink_A
	elif is_preset_B:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_blink_B
	elif is_preset_C:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_blink_C
	elif is_preset_D:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_blink_D
	elif is_preset_E:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_blink_E
	elif is_preset_F:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_blink_F
	elif is_preset_G:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_blink_G
	elif is_preset_H:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_blink_H
	elif is_preset_J:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_blink_J
	elif is_preset_I:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = talk_blink_I
	

func load_hotkeys():
	var ev
	for action in InputMap.action_get_events("key_preset_a"):
		ev= action
	$CanvasLayer/ToHide/Panel3/EditA.text = str(ev)

func _on_Button2_pressed():
	#$CanvasLayer/FileDialogOff.popup()
	$CanvasLayer/FileDialog.show()
	can_scroll = false
	is_blinking = false
	is_filedialog_silence = true
	is_filedialog_talk = false
	is_filedialog_silence_blink=false
	is_filedialog_talk_blink=false
	is_filedialog_prop = false
	$CanvasLayer/FileDialog/BgLbl.hide()
	$CanvasLayer/FileDialog/PngLbl.show()
	$CanvasLayer/FileDialog/ImageContainer.show()
	$CanvasLayer/FileDialog/ImageContainer.show()
	
	if is_preset_A:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_png_A
	elif is_preset_B:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_png_B
	elif is_preset_C:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_png_C
	elif is_preset_D:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_png_D
	elif is_preset_E:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_png_E
	elif is_preset_F:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_png_F
	elif is_preset_G:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_png_G
	elif is_preset_H:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_png_H
	elif is_preset_I:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_png_I
	elif is_preset_J:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_png_J


func _on_BtnSilenceBlink_pressed():
	#$CanvasLayer/FileDialogOn.popup()
	$CanvasLayer/FileDialog.show()
	can_scroll = false
	is_filedialog_silence = false
	is_filedialog_talk_blink = false
	is_filedialog_silence_blink = true
	is_filedialog_talk=false
	is_blinking = true
	is_filedialog_prop = false
	$CanvasLayer/FileDialog/BgLbl.hide()
	$CanvasLayer/FileDialog/PngLbl.show()
	if is_preset_A:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_blink_A
	elif is_preset_B:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_blink_B
	elif is_preset_C:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_blink_C
	elif is_preset_D:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_blink_D
	elif is_preset_E:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_blink_E
	elif is_preset_F:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_blink_F
	elif is_preset_G:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_blink_G
	elif is_preset_H:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_blink_H
	elif is_preset_I:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_blink_I
	elif is_preset_J:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = silence_blink_J
	
	
func _on_HSlider_value_changed(value):
	limiter = value
	
	#save
	#var file = FileAccess.new()
	var file =FileAccess.open(sens_file, FileAccess.WRITE)
	file.store_float(limiter)
	#file.close()

func _on_Button3_pressed():
	if is_transparent == false:
		get_tree().get_root().set_transparent_background(true)
#		OS.window_per_pixel_transparency_enabled = true
		$CanvasLayer/ToHide.hide()
		is_transparent = true
		$CanvasLayer2/BG.hide()
		
		$CanvasLayer/Visibility.show()
	else:
		get_tree().get_root().set_transparent_background(false)
#		OS.window_per_pixel_transparency_enabled = false
		is_transparent = false

func save_talking(path):
	
	if is_preset_A == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_A, FileAccess.WRITE)
#		file.store_string(path)
#		print(path)
		file.store_line(str(path))
		
		#file.close()
	elif is_preset_B == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_B, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_C == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_C, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_D == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_D, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_E == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_E, FileAccess.WRITE)
		print(path)
		file.store_line(str(path))
		#file.close()
	elif is_preset_F == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_F, FileAccess.WRITE)
#		file.store_string(path)
		file.store_line(str(path))
		print(file)
		#file.close()
	elif is_preset_G == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_G, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_H == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_H, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_I == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_I, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_J == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_J, FileAccess.WRITE)
		print(path)
		file.store_line(str(path))
		#file.close()
	
func save_talking_blink(path):
	if is_preset_A == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_A, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_B == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_B, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_C == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_C, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_D == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_D, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_E == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_E, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_G == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_G, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_H == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_H, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_I == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_I, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_J == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_J, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_F == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_F, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	
func save_silence(path):
	if is_preset_A == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_A, FileAccess.WRITE)
#		file.store_string(str(path))
		file.store_line(str(path))
		#file.close()
	elif is_preset_B == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_B, FileAccess.WRITE)
		#file.store_string(str(path))
		file.store_line(str(path))
		#file.close()
	elif is_preset_C == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_C, FileAccess.WRITE)
		#file.store_string(str(path))
		file.store_line(str(path))
		#file.close()
	elif is_preset_D == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_D, FileAccess.WRITE)
		#file.store_string(str(path))
		file.store_line(str(path))
		#file.close()
	elif is_preset_E == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_E, FileAccess.WRITE)
		#file.store_string(str(path))
		file.store_line(str(path))
		#file.close()
	elif is_preset_F == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_F, FileAccess.WRITE)
		#file.store_string(str(path))
		file.store_line(str(path))
		#file.close()
	elif is_preset_G == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_G, FileAccess.WRITE)
		#file.store_string(str(path))
		file.store_line(str(path))
		#file.close()
	elif is_preset_H == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_H, FileAccess.WRITE)
		#file.store_string(str(path))
		file.store_line(str(path))
		#file.close()
	elif is_preset_I == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_I, FileAccess.WRITE)
		#file.store_string(str(path))
		file.store_line(str(path))
		#file.close()
	elif is_preset_J == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_J, FileAccess.WRITE)
		#file.store_string(str(path))
		file.store_line(str(path))
		#file.close()
	
func save_silence_blink(path):
	if is_preset_A == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_A, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_B == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_B, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_C == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_C, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_D == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_D, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_E == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_E, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_F == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_F, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_G == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_G, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_H == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_H, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_I == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_I, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_J == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_J, FileAccess.WRITE)
		file.store_string(path)
		#file.close()

func save_scream(path):
	if is_preset_A == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_A, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_B == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_B, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_C == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_C, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_D == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_D, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_E == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_E, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_F == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_F, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_G == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_G, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_H == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_H, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_I == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_I, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_J == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_J, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	
func save_prop(path):
	if is_preset_A == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_A, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_B == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_B, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_C == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_C, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_D == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_D, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_E == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_E, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_F == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_F, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_G == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_G, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_H == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_H, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_I == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_I, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	elif is_preset_J == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_J, FileAccess.WRITE)
		file.store_line(str(path))
		#file.close()
	

func save_bouncy(con):
	#var file = FileAccess.new()
	var file =FileAccess.open(bouncy_file, FileAccess.WRITE)
	file.store_var(con)
	#file.close()

func save_shaky(con):
	#var file = FileAccess.new()
	var file =FileAccess.open(shaky_file, FileAccess.WRITE)
	file.store_var(con)
	#file.close()

func save_dim(con):
	#var file = FileAccess.new()
	var file =FileAccess.open(dim_file, FileAccess.WRITE)
	file.store_var(con)
	#file.close()

func save_flip(con):
	#var file = FileAccess.new()
	#var file =FileAccess.open(flip_file, FileAccess.WRITE)
	#file.store_var(con)
	##file.close()
	
	if is_preset_A:
		var file =FileAccess.open(flip_file_A, FileAccess.WRITE)
		file.store_var(con)
		#file.close()
	elif is_preset_B:
		var file =FileAccess.open(flip_file_B, FileAccess.WRITE)
		file.store_var(con)
		#file.close()
	elif is_preset_C:
		var file =FileAccess.open(flip_file_C, FileAccess.WRITE)
		file.store_var(con)
		#file.close()
	elif is_preset_D:
		var file =FileAccess.open(flip_file_D, FileAccess.WRITE)
		file.store_var(con)
		#file.close()
	elif is_preset_E:
		var file =FileAccess.open(flip_file_E, FileAccess.WRITE)
		file.store_var(con)
		#file.close()
	elif is_preset_F:
		var file =FileAccess.open(flip_file_F, FileAccess.WRITE)
		file.store_var(con)
		#file.close()

func save_resolution_x(res):
	#var file = FileAccess.new()
	var file =FileAccess.open(res_file_x, FileAccess.WRITE)
	file.store_var(res[0])
	#file.close()
func save_resolution_y(res):
	#var file = FileAccess.new()
	var file =FileAccess.open(res_file_y, FileAccess.WRITE)
	file.store_var(res[1])
	#file.close()

func load_resolution():
#	var file_x = FileAccess.new()
#	var file_y = FileAccess.new()
	var file_x = FileAccess.open(res_file_x, FileAccess.READ)
	var file_y= FileAccess.open(res_file_y, FileAccess.READ)
	var val_x = file_x.get_var()
	var val_y = file_y.get_var()
	#print(val_x,val_y)
#	val_x = 1280
#	val_y = 720
	if val_x != null:
		DisplayServer.window_set_size(Vector2(val_x,val_y))
		print("ehe")
	
	#file_y.close()
func save_camzoom(loc):
	if cam_all == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_Z, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_A:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_A, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	
	elif is_preset_B:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_B, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	
	elif is_preset_C:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_C, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	
	elif is_preset_D:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_D, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	
	elif is_preset_E:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_E, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_F:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_F, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_G:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_G, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	
	elif is_preset_H:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_H, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	
	elif is_preset_I:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_I, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	
	elif is_preset_J:
		#var file = FileAccess.new()
		var file =FileAccess.open(camzoom_file_J, FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	
func save_prop_pos(loc):
	if is_preset_A == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_pos_file[0], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_B == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_pos_file[1], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_C == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_pos_file[2], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_D == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_pos_file[3], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_E == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_pos_file[4], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_F == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_pos_file[5], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_G== true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_pos_file[6], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_H == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_pos_file[7], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_I == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_pos_file[8], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_J == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_pos_file[9], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()

func save_prop_zoom(loc):
	if is_preset_A == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_zoom_file[0], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_B == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_zoom_file[1], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_C == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_zoom_file[2], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_D == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_zoom_file[3], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_E == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_zoom_file[4], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_F == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_zoom_file[5], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_G== true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_zoom_file[6], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_H == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_zoom_file[7], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_I == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_zoom_file[8], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()
	elif is_preset_J == true:
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_zoom_file[9], FileAccess.WRITE)
		file.store_var(loc)
		#file.close()


func save_mic(loc):
	#var file = FileAccess.new()
	var file =FileAccess.open(mic_file, FileAccess.WRITE)
	file.store_var(loc)
	#file.close()

func load_camzoom():
	#var file = FileAccess.new()

	if cam_all:
		if FileAccess.file_exists(camzoom_file_Z):
			var file =FileAccess.open(camzoom_file_Z, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	elif is_preset_A:
		if FileAccess.file_exists(camzoom_file_A):
			var file =FileAccess.open(camzoom_file_A, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	elif is_preset_B:
		if FileAccess.file_exists(camzoom_file_B):
			var file =FileAccess.open(camzoom_file_B, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	elif is_preset_C:
		if FileAccess.file_exists(camzoom_file_C):
			var file =FileAccess.open(camzoom_file_C, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	elif is_preset_D:
		if FileAccess.file_exists(camzoom_file_D):
			var file =FileAccess.open(camzoom_file_D, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	elif is_preset_E:
		if FileAccess.file_exists(camzoom_file_E):
			var file =FileAccess.open(camzoom_file_E, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	elif is_preset_F:
		if FileAccess.file_exists(camzoom_file_F):
			var file =FileAccess.open(camzoom_file_F, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	elif is_preset_G:
		if FileAccess.file_exists(camzoom_file_G):
			var file =FileAccess.open(camzoom_file_G, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	elif is_preset_H:
		if FileAccess.file_exists(camzoom_file_H):
			var file =FileAccess.open(camzoom_file_H, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	elif is_preset_I:
		if FileAccess.file_exists(camzoom_file_I):
			var file =FileAccess.open(camzoom_file_I, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	elif is_preset_J:
		if FileAccess.file_exists(camzoom_file_J):
			var file =FileAccess.open(camzoom_file_J, FileAccess.READ)
			$Camera2D.zoom = file.get_var()
			#file.close()
			camzoom = $Camera2D.zoom
			save_camzoom(camzoom)
	
	else:
		pass

func load_prop_pos():
	#var file = FileAccess.new()

	if is_preset_A:
		if FileAccess.file_exists(prop_pos_file[0]):
			var file =FileAccess.open(prop_pos_file[0], FileAccess.READ)
			prop_pos[0] = file.get_var()
			#file.close()
			$PropContainer/Prop.position = prop_pos[0]
			save_prop_pos(prop_pos[0])
	elif is_preset_B:
		if FileAccess.file_exists(prop_pos_file[1]):
			var file =FileAccess.open(prop_pos_file[1], FileAccess.READ)
			prop_pos[1] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_position = prop_pos[1]
			save_prop_pos(prop_pos[1])
#			save_camzoom(camzoom)
	if is_preset_C:
		if FileAccess.file_exists(prop_pos_file[2]):
			var file =FileAccess.open(prop_pos_file[2], FileAccess.READ)
			prop_pos[2] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_position = prop_pos[2]
			save_prop_pos(prop_pos[2])
#			save_camzoom(camzoom)
	if is_preset_D:
		if FileAccess.file_exists(prop_pos_file[3]):
			var file =FileAccess.open(prop_pos_file[3], FileAccess.READ)
			prop_pos[3] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_position = prop_pos[3]
			save_prop_pos(prop_pos[3])
#			save_camzoom(camzoom)
	if is_preset_E:
		if FileAccess.file_exists(prop_pos_file[4]):
			var file =FileAccess.open(prop_pos_file[4], FileAccess.READ)
			prop_pos[4] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_position = prop_pos[4]
			save_prop_pos(prop_pos[4])
#			save_camzoom(camzoom)
	if is_preset_F:
		if FileAccess.file_exists(prop_pos_file[5]):
			var file =FileAccess.open(prop_pos_file[5], FileAccess.READ)
			prop_pos[5] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_position = prop_pos[5]
			save_prop_pos(prop_pos[5])
#			save_camzoom(camzoom)
	if is_preset_G:
		if FileAccess.file_exists(prop_pos_file[6]):
			var file =FileAccess.open(prop_pos_file[6], FileAccess.READ)
			prop_pos[6] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_position = prop_pos[6]
			save_prop_pos(prop_pos[6])
#			save_camzoom(camzoom)
	if is_preset_H:
		if FileAccess.file_exists(prop_pos_file[7]):
			var file =FileAccess.open(prop_pos_file[7], FileAccess.READ)
			prop_pos[7] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_position = prop_pos[7]
			save_prop_pos(prop_pos[7])
#			save_camzoom(camzoom)
	if is_preset_I:
		if FileAccess.file_exists(prop_pos_file[8]):
			var file =FileAccess.open(prop_pos_file[8], FileAccess.READ)
			prop_pos[8] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_position = prop_pos[8]
			save_prop_pos(prop_pos[8])
#			save_camzoom(camzoom)
	if is_preset_J:
		if FileAccess.file_exists(prop_pos_file[9]):
			var file =FileAccess.open(prop_pos_file[9], FileAccess.READ)
			prop_pos[9] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_position = prop_pos[9]
			save_prop_pos(prop_pos[9])
#			save_camzoom(camzoom)
func load_prop_zoom():
	#var file = FileAccess.new()

	if is_preset_A:
		if FileAccess.file_exists(prop_zoom_file[0]):
			var file =FileAccess.open(prop_zoom_file[0], FileAccess.READ)
			prop_zoom[0] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_scale = prop_zoom[0]
			save_prop_zoom(prop_zoom[0])
			print(prop_zoom[0])
		
	elif is_preset_B:
		if FileAccess.file_exists(prop_zoom_file[1]):
			var file =FileAccess.open(prop_zoom_file[1], FileAccess.READ)
			prop_zoom[1] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_scale = prop_zoom[1]
			save_prop_zoom(prop_zoom[1])

	if is_preset_C:
		if FileAccess.file_exists(prop_zoom_file[2]):
			var file =FileAccess.open(prop_zoom_file[2], FileAccess.READ)
			prop_zoom[2] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_scale = prop_zoom[2]
			save_prop_zoom(prop_zoom[2])

	if is_preset_D:
		if FileAccess.file_exists(prop_zoom_file[3]):
			var file =FileAccess.open(prop_zoom_file[3], FileAccess.READ)
			prop_zoom[3] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_scale = prop_zoom[3]
			save_prop_zoom(prop_zoom[3])

	if is_preset_E:
		if FileAccess.file_exists(prop_zoom_file[4]):
			var file =FileAccess.open(prop_zoom_file[4], FileAccess.READ)
			prop_zoom[4] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_scale = prop_zoom[4]
			save_prop_zoom(prop_zoom[4])

	if is_preset_F:
		if FileAccess.file_exists(prop_zoom_file[5]):
			var file =FileAccess.open(prop_zoom_file[5], FileAccess.READ)
			prop_zoom[5] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_scale = prop_zoom[5]
			save_prop_zoom(prop_zoom[5])

	if is_preset_G:
		if FileAccess.file_exists(prop_zoom_file[6]):
			var file =FileAccess.open(prop_zoom_file[6], FileAccess.READ)
			prop_zoom[6] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_scale = prop_zoom[6]
			save_prop_zoom(prop_zoom[6])

	if is_preset_H:
		if FileAccess.file_exists(prop_zoom_file[7]):
			var file =FileAccess.open(prop_zoom_file[7], FileAccess.READ)
			prop_zoom[7] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_scale = prop_zoom[7]
			save_prop_zoom(prop_zoom[7])

	if is_preset_I:
		if FileAccess.file_exists(prop_zoom_file[8]):
			var file =FileAccess.open(prop_zoom_file[8], FileAccess.READ)
			prop_zoom[8] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_scale = prop_zoom[8]
			save_prop_zoom(prop_zoom[8])

	if is_preset_J:
		if FileAccess.file_exists(prop_zoom_file[9]):
			var file =FileAccess.open(prop_zoom_file[9], FileAccess.READ)
			prop_zoom[9] = file.get_var()
			#file.close()
			$PropContainer/Prop.rect_scale = prop_zoom[9]
			save_prop_zoom(prop_zoom[9])

func switch_preset():
	print("Switch preset")
	if can_switch_preset:
		print("Switch preset",can_switch_preset)
		if is_preset_A == true:
			#$AnimDelay.start()
			$On.texture = talk_png_A
			$Off.texture = silence_png_A
			$Scream.texture = scream_png_A
			$Scream.flip_h = $On.flip_h
			$PropContainer/Prop.texture_normal = prop_png_A
			load_camzoom()
			load_prop_pos()
			load_prop_zoom()
			get_node("/root/Main/Camera2D").load_campos()
		elif is_preset_B == true:
			#$AnimDelay.start()
			$On.texture = talk_png_B
			$Off.texture = silence_png_B
			$Scream.texture = scream_png_B
			$Scream.flip_h = $On.flip_h
			$PropContainer/Prop.texture_normal = prop_png_B
			load_camzoom()
			load_prop_pos()
			load_prop_zoom()
			get_node("/root/Main/Camera2D").load_campos()
		elif is_preset_C == true:
			#$AnimDelay.start()
			$On.texture = talk_png_C
			$Off.texture = silence_png_C
			$Scream.texture = scream_png_C
			$Scream.flip_h = $On.flip_h
			$PropContainer/Prop.texture_normal = prop_png_C
			load_camzoom()
			load_prop_pos()
			load_prop_zoom()
			get_node("/root/Main/Camera2D").load_campos()
		elif is_preset_D == true:
			#$AnimDelay.start()
			$On.texture = talk_png_D
			$Off.texture = silence_png_D
			$Scream.texture = scream_png_D
			$Scream.flip_h = $On.flip_h
			$PropContainer/Prop.texture_normal = prop_png_D
			load_camzoom()
			load_prop_pos()
			load_prop_zoom()
			get_node("/root/Main/Camera2D").load_campos()
		elif is_preset_E == true:
			#$AnimDelay.start()
			$On.texture = talk_png_E
			$Off.texture = silence_png_E
			$Scream.texture = scream_png_E
			$Scream.flip_h = $On.flip_h
			$PropContainer/Prop.texture_normal = prop_png_E
			load_camzoom()
			load_prop_pos()
			load_prop_zoom()
			get_node("/root/Main/Camera2D").load_campos()
		elif is_preset_F == true:
			#$AnimDelay.start()
			$On.texture = talk_png_F
			$Off.texture = silence_png_F
			$Scream.texture = scream_png_F
			$Scream.flip_h = $On.flip_h
			$PropContainer/Prop.texture_normal = prop_png_F
			load_camzoom()
			load_prop_pos()
			load_prop_zoom()
			get_node("/root/Main/Camera2D").load_campos()
		elif is_preset_G == true:
			#$AnimDelay.start()
			$On.texture = talk_png_G
			$Off.texture = silence_png_G
			$Scream.texture = scream_png_G
			$Scream.flip_h = $On.flip_h
			$PropContainer/Prop.texture_normal = prop_png_G
			load_camzoom()
			load_prop_pos()
			load_prop_zoom()
			get_node("/root/Main/Camera2D").load_campos()
		elif is_preset_H == true:
			#$AnimDelay.start()
			$On.texture = talk_png_H
			$Off.texture = silence_png_H
			$Scream.texture = scream_png_H
			$Scream.flip_h = $On.flip_h
			$PropContainer/Prop.texture_normal = prop_png_H
			load_camzoom()
			load_prop_pos()
			load_prop_zoom()
			get_node("/root/Main/Camera2D").load_campos()
		elif is_preset_I == true:
			#$AnimDelay.start()
			$On.texture = talk_png_I
			$Off.texture = silence_png_I
			$Scream.texture = scream_png_I
			$Scream.flip_h = $On.flip_h
			$PropContainer/Prop.texture_normal = prop_png_I
			load_camzoom()
			load_prop_pos()
			load_prop_zoom()
			get_node("/root/Main/Camera2D").load_campos()
		elif is_preset_J == true:
			#$AnimDelay.start()
			$On.texture = talk_png_J
			$Off.texture = silence_png_J
			$Scream.texture = scream_png_J
			$Scream.flip_h = $On.flip_h
			$PropContainer/Prop.texture_normal = prop_png_J
			load_camzoom()
			load_prop_pos()
			load_prop_zoom()
			get_node("/root/Main/Camera2D").load_campos()
		
	$AnimDelay.start()
	load_flip()
	
func save_bg(path):
	if is_preset_A:
		#var file = FileAccess.new()
		var file =FileAccess.open(bg_file_A, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_B:
		#var file = FileAccess.new()
		var file =FileAccess.open(bg_file_B, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_C:
		#var file = FileAccess.new()
		var file =FileAccess.open(bg_file_C, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_D:
		#var file = FileAccess.new()
		var file =FileAccess.open(bg_file_D, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_E:
		#var file = FileAccess.new()
		var file =FileAccess.open(bg_file_E, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_F:
		#var file = FileAccess.new()
		var file =FileAccess.open(bg_file_F, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_G:
		#var file = FileAccess.new()
		var file =FileAccess.open(bg_file_G, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_H:
		#var file = FileAccess.new()
		var file =FileAccess.open(bg_file_H, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_I:
		#var file = FileAccess.new()
		var file =FileAccess.open(bg_file_I, FileAccess.WRITE)
		file.store_string(path)
		#file.close()
	elif is_preset_J:
#		#var file = FileAccess.new()
		var file =FileAccess.open(bg_file_J, FileAccess.WRITE)
		file.store_string(path)
		#file.close()

func load_png():
	var dir 
#	
	#load talking png
#	#var file_A = FileAccess.new()
	if FileAccess.file_exists(talking_file_A):
		var file_A = FileAccess.open(talking_file_A, FileAccess.READ)
		dir = str_to_var(file_A.get_as_text())
#		dir = dir.parse_json(file_A.get_line())
#		print("Dir example: ",dir)
		#Load Image
		var image = Image.new()
#		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)	
					animated_texture.fps = 120
					talk_png_A = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
#					print(image_texture.get_property_list())
#					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					talk_png_A = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_A = animated_texture
			#file_A.close()
			
			
			
	
	
	if FileAccess.file_exists(talking_file_B):
		var file_B = FileAccess.open(talking_file_B, FileAccess.READ)
		dir = dir.parse(file_B.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					talk_png_B = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					talk_png_B = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_B = animated_texture
			#file_B.close()
	
	
	
	if FileAccess.file_exists(talking_file_C):
		var file_C = FileAccess.open(talking_file_C, FileAccess.READ)
		dir = dir.parse(file_C.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)	
					animated_texture.fps = 120
					talk_png_C = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					talk_png_C = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_C = animated_texture
			#file_C.close()
	
	
	if FileAccess.file_exists(talking_file_D):
		var file_D = FileAccess.open(talking_file_D, FileAccess.READ)
		dir = str_to_var(file_D.get_as_text())
		dir = dir.parse(file_D.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)	
					animated_texture.fps = 120
					talk_png_D = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					talk_png_D = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_D = animated_texture
			#file_D.close()
	
	
	if FileAccess.file_exists(talking_file_E):
		var file_E = FileAccess.open(talking_file_E, FileAccess.READ)
		dir = str_to_var(file_E.get_as_text())
		#dir = dir.parse(file_E.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)	
					animated_texture.fps = 120
					talk_png_E = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					talk_png_E = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_E = animated_texture
			#file_E.close()
		
	
	if FileAccess.file_exists(talking_file_F):
		var file_F = FileAccess.open(talking_file_F, FileAccess.READ)
		dir = str_to_var(file_F.get_as_text())
#		#dir = dir.parse(file_F.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)	
					animated_texture.fps = 120
					talk_png_F = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
#					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					talk_png_F = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_F = animated_texture
			#file_F.close()
			
			
			
	
	
	if FileAccess.file_exists(talking_file_G):
		var file_G = FileAccess.open(talking_file_G, FileAccess.READ)
		dir = str_to_var(file_G.get_as_text())
		#dir = dir.parse(file_G.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					talk_png_G = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					talk_png_G = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_G = animated_texture
			file_G.close()
	
	
	
	if FileAccess.file_exists(talking_file_H):
		var file_H = FileAccess.open(talking_file_H, FileAccess.READ)
		dir = str_to_var(file_H.get_as_text())
#		#dir = dir.parse(file_H.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)	
					animated_texture.fps = 120
					talk_png_H = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					talk_png_H = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_H = animated_texture
			file_H.close()
	
	
	if FileAccess.file_exists(talking_file_I):
		var file_I = FileAccess.open(talking_file_I, FileAccess.READ)
		dir = str_to_var(file_I.get_as_text())
#		#dir = dir.parse(file_I.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)	
					animated_texture.fps = 120
					talk_png_I = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					talk_png_I = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_I = animated_texture
			#file_I.close()
	
	
	if FileAccess.file_exists(talking_file_J):
		var file_J = FileAccess.open(talking_file_J, FileAccess.READ)
		dir = str_to_var(file_J.get_as_text())
#		dir = str_to_var(file_J.get_as_text())#dir = dir.parse(file_J.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)	
					animated_texture.fps = 120
					talk_png_J = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					talk_png_J = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_J = animated_texture
			#file_J.close()
	else:
		pass


	#load silence png
	if FileAccess.file_exists(silence_file_A):
		var file_A = FileAccess.open(silence_file_A, FileAccess.READ)
		dir = str_to_var(file_A.get_as_text())
#		dir = dir.parse(file_A.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					silence_png_A = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
#					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					silence_png_A = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)	
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				silence_png_A = animated_texture
			#file_A.close()
			
	if FileAccess.file_exists(silence_file_B):
		var file_B = FileAccess.open(silence_file_B, FileAccess.READ)
		dir = str_to_var(file_B.get_as_text())
#		dir = dir.parse(file_B.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					silence_png_B = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					silence_png_B = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				silence_png_B = animated_texture
			#file_B.close()
	
	
	if FileAccess.file_exists(silence_file_C):
		var file_C = FileAccess.open(silence_file_C, FileAccess.READ)
		dir = str_to_var(file_C.get_as_text())
#		dir = dir.parse(file_C.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					silence_png_C = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					silence_png_C = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				silence_png_C = animated_texture
			#file_C.close()
	
	if FileAccess.file_exists(silence_file_D):
		var file_D = FileAccess.open(silence_file_D, FileAccess.READ)
		dir = str_to_var(file_D.get_as_text())
#		dir = dir.parse(file_D.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					silence_png_D = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					silence_png_D = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				silence_png_D = animated_texture
			#file_D.close()
	
	if FileAccess.file_exists(silence_file_E):
		var file_E = FileAccess.open(silence_file_E, FileAccess.READ)
		dir = str_to_var(file_E.get_as_text())
#		#dir = dir.parse(file_E.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					silence_png_E = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					silence_png_E = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				silence_png_E = animated_texture
			#file_E.close()
			
	if FileAccess.file_exists(silence_file_F):
		var file_F = FileAccess.open(silence_file_F, FileAccess.READ)
		dir = str_to_var(file_F.get_as_text())
#		#dir = dir.parse(file_F.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					silence_png_F = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
#					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					silence_png_F = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				silence_png_F = animated_texture
			#file_F.close()
			
			
			
	
	if FileAccess.file_exists(silence_file_G):
		var file_G = FileAccess.open(silence_file_G, FileAccess.READ)
		dir = str_to_var(file_G.get_as_text())
#		#dir = dir.parse(file_G.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					silence_png_G = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					silence_png_G = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				silence_png_G = animated_texture
			file_G.close()
	
	
	if FileAccess.file_exists(silence_file_H):
		var file_H = FileAccess.open(silence_file_H, FileAccess.READ)
		dir = str_to_var(file_H.get_as_text())
#		#dir = dir.parse(file_H.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					silence_png_H = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					silence_png_H = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				silence_png_H = animated_texture
			file_H.close()
	
	if FileAccess.file_exists(silence_file_I):
		var file_I = FileAccess.open(silence_file_I, FileAccess.READ)
		dir = str_to_var(file_I.get_as_text())
#		#dir = dir.parse(file_I.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					silence_png_I = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					silence_png_I = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				silence_png_I = animated_texture
			#file_I.close()
	
	if FileAccess.file_exists(silence_file_J):
		var file_J = FileAccess.open(silence_file_J, FileAccess.READ)
		dir = str_to_var(file_J.get_as_text())
#		dir = str_to_var(file_J.get_as_text())#dir = dir.parse(file_J.get_line())
		
		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null:
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					silence_png_J = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					silence_png_J = image_texture
			
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				silence_png_J = animated_texture
			#file_J.close()

	else:
		pass

func load_scream():
	var dir
	var dir_str
	var directory = DirAccess.open("res://")
	#Load Scream
	#var file_A = FileAccess.new()
	if FileAccess.file_exists(scream_file_A):
		var file_A = FileAccess.open(scream_file_A, FileAccess.READ)
		dir = str_to_var(file_A.get_as_text())
#		dir = dir.parse(file_A.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					scream_png_A = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					scream_png_A = image_texture
		
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				scream_png_A = animated_texture
			#file_A.close()
			
			
			
	
	
	if FileAccess.file_exists(scream_file_B):
		var file_B = FileAccess.open(scream_file_B, FileAccess.READ)
		dir = dir.parse(file_B.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					scream_png_B = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					scream_png_B = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				scream_png_B = animated_texture
			#file_B.close()
	
	
	
	if FileAccess.file_exists(scream_file_C):
		var file_C = FileAccess.open(scream_file_C, FileAccess.READ)
		dir = dir.parse(file_C.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					scream_png_C = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					scream_png_C = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				scream_png_C = animated_texture
			#file_C.close()
	
	
	if FileAccess.file_exists(scream_file_D):
		var file_D = FileAccess.open(scream_file_D, FileAccess.READ)
		dir = dir.parse(file_D.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					scream_png_D = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					scream_png_D = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				scream_png_D = animated_texture
			#file_D.close()
	
	
	if FileAccess.file_exists(scream_file_E):
		var file_E = FileAccess.open(scream_file_E, FileAccess.READ)
		#dir = dir.parse(file_E.get_line())
		#var directory = DirAccess.new()
		

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					scream_png_E = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					scream_png_E = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				scream_png_E = animated_texture
			#file_E.close()
	
	
	if FileAccess.file_exists(scream_file_F):
		var file_F = FileAccess.open(scream_file_F, FileAccess.READ)
		dir = str_to_var(file_F.get_as_text())
		#dir = dir.parse(file_F.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					scream_png_F = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					scream_png_F = image_texture
		
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				scream_png_F = animated_texture
			#file_F.close()
			
			
			
	
	
	if FileAccess.file_exists(scream_file_G):
		var file_G = FileAccess.open(scream_file_G, FileAccess.READ)
		dir = str_to_var(file_G.get_as_text())
		#dir = dir.parse(file_G.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					scream_png_G = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					scream_png_G = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				scream_png_G = animated_texture
			file_G.close()
	
	
	
	if FileAccess.file_exists(scream_file_H):
		var file_H = FileAccess.open(scream_file_H, FileAccess.READ)
		dir = str_to_var(file_H.get_as_text())
		#dir = dir.parse(file_H.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					scream_png_H = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					scream_png_H = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				scream_png_H = animated_texture
			file_H.close()
	
	
	if FileAccess.file_exists(scream_file_I):
		var file_I = FileAccess.open(scream_file_I, FileAccess.READ)
		dir = str_to_var(file_I.get_as_text())
		#dir = dir.parse(file_I.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					scream_png_I = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					scream_png_I = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				scream_png_I = animated_texture
			#file_I.close()
	
	
	if FileAccess.file_exists(scream_file_J):
		var file_J = FileAccess.open(scream_file_J, FileAccess.READ)
		dir = str_to_var(file_J.get_as_text())#dir = dir.parse(file_J.get_line())
		#var directory = DirAccess.new()
		

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					scream_png_J = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					scream_png_J = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				scream_png_J = animated_texture
			#file_J.close()
	else:
		pass

func load_prop():
	var dir
	var dir_str
	var directory = DirAccess.open("res://")
	#Load Prop
	#var file_A = FileAccess.new()
	if FileAccess.file_exists(prop_file_A):
		var file_A = FileAccess.open(prop_file_A, FileAccess.READ)
		dir = str_to_var(file_A.get_as_text())
#		dir = dir.parse(file_A.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					prop_png_A = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					prop_png_A = image_texture
		
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				prop_png_A = animated_texture
			#file_A.close()
			
			
			
	
	
	if FileAccess.file_exists(prop_file_B):
		var file_B = FileAccess.open(prop_file_B, FileAccess.READ)
		dir = dir.parse(file_B.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					prop_png_B = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					prop_png_B = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				prop_png_B = animated_texture
			#file_B.close()
	
	
	
	if FileAccess.file_exists(prop_file_C):
		var file_C = FileAccess.open(prop_file_C, FileAccess.READ)
		dir = dir.parse(file_C.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					prop_png_C = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					prop_png_C = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				prop_png_C = animated_texture
			#file_C.close()
	
	
	if FileAccess.file_exists(prop_file_D):
		var file_D = FileAccess.open(prop_file_D, FileAccess.READ)
		dir = dir.parse(file_D.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					prop_png_D = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					prop_png_D = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				prop_png_D = animated_texture
			#file_D.close()
	
	
	if FileAccess.file_exists(prop_file_E):
		var file_E = FileAccess.open(prop_file_E, FileAccess.READ)
		#dir = dir.parse(file_E.get_line())
		#var directory = DirAccess.new()
		

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					prop_png_E = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					prop_png_E = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				prop_png_E = animated_texture
			#file_E.close()
	
	
	if FileAccess.file_exists(prop_file_F):
		var file_F = FileAccess.open(prop_file_F, FileAccess.READ)
		dir = str_to_var(file_F.get_as_text())
		#dir = dir.parse(file_F.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					prop_png_F = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					prop_png_F = image_texture
		
#			elif  dir[0].get_file().get_extension() == "gif":
#				image_frames.load(dir[0])
#
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				prop_png_F = animated_texture
			#file_F.close()
			
			
			
	
	
	if FileAccess.file_exists(prop_file_G):
		var file_G = FileAccess.open(prop_file_G, FileAccess.READ)
		#dir = dir.parse(file_G.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					prop_png_G = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					prop_png_G = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				prop_png_G = animated_texture
			file_G.close()
	
	
	
	if FileAccess.file_exists(prop_file_H):
		var file_H = FileAccess.open(prop_file_H, FileAccess.READ)
		#dir = dir.parse(file_H.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					prop_png_H = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					prop_png_H = image_texture
			
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				prop_png_H = animated_texture
			file_H.close()
	
	
	if FileAccess.file_exists(prop_file_I):
		var file_I = FileAccess.open(prop_file_I, FileAccess.READ)
		#dir = dir.parse(file_I.get_line())
		#var directory = DirAccess.new()

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					prop_png_I = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					prop_png_I = image_texture
#
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				prop_png_I = animated_texture
			#file_I.close()
	
	
	if FileAccess.file_exists(prop_file_J):
		var file_J = FileAccess.open(prop_file_J, FileAccess.READ)
		dir = str_to_var(file_J.get_as_text())#dir = dir.parse(file_J.get_line())
		#var directory = DirAccess.new()
		

		#Load Image
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if dir != null and directory.dir_exists(dir[0]):
			if dir[0].get_file().get_extension() != "gif":
				if dir.size() > 1:
					animated_texture.frames = dir.size()
					for i in dir.size():
						var im = Image.new()
						var tex = ImageTexture.new()
						im.load(dir[i])
						tex.create_from_image(im)
						tex.set_flags(image_texture.get_flags() & ~(1 << 1))
						animated_texture.set_frame_texture(i, tex)
						animated_texture.set_frame_delay(i, 0.1)
					animated_texture.fps = 120
					prop_png_J = animated_texture
					
				else:
					image.load(dir[0])
					print("not gif import")
					image_texture.create_from_image(image)
					image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
					prop_png_J = image_texture
				
#			elif  dir[0].get_extension() == "gif":
#				image_frames.load(dir[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#					tex.set_flags(tex.get_flags() & ~(1 << 1))
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				prop_png_J = animated_texture
			#file_J.close()
	else:
		pass

func load_blink():
	var dir
	var dir_str
	var directory = DirAccess.open("res://")
	#load talking blink
	#var file_A = FileAccess.new()
	if FileAccess.file_exists(talking_blink_file_A):
		var file_A = FileAccess.open(talking_blink_file_A, FileAccess.READ)
		dir = str_to_var(file_A.get_as_text())
		dir_str = var_to_str(dir)
		
		
		#Load Image
		if dir != "" and directory.dir_exists(dir_str):
			var image_A = Image.new()
			var image_texture_A = ImageTexture.new()
			image_A.load(dir)
			image_texture_A.create_from_image(image_A)
			image_texture_A.set_flags(image_texture_A.get_flags() & ~(1 << 1))
			#file_A.close()
			
			talk_blink_A = image_texture_A
		
	
	if FileAccess.file_exists(talking_blink_file_B):
		var file_B = FileAccess.open(talking_blink_file_B, FileAccess.READ)
		dir = str_to_var(file_B.get_as_text())
		dir_str = var_to_str(dir)
#		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(dir_str):
			var image_B = Image.new()
			var image_texture_B = ImageTexture.new()
			image_B.load(dir)
			image_texture_B.create_from_image(image_B)
			image_texture_B.set_flags(image_texture_B.get_flags() & ~(1 << 1))
			#file_B.close()
			
			talk_blink_B = image_texture_B
		
	
	if FileAccess.file_exists(talking_blink_file_C):
		var file_C = FileAccess.open(talking_blink_file_C, FileAccess.READ)
		dir = str_to_var(file_C.get_as_text())
		dir_str = var_to_str(dir)
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_C = Image.new()
			var image_texture_C = ImageTexture.new()
			image_C.load(dir)
			image_texture_C.create_from_image(image_C)
			image_texture_C.set_flags(image_texture_C.get_flags() & ~(1 << 1))
			#file_C.close()
			
			talk_blink_C = image_texture_C
	
	
	if FileAccess.file_exists(talking_blink_file_D):
		var file_D = FileAccess.open(talking_blink_file_D, FileAccess.READ)
		dir = str_to_var(file_D.get_as_text())
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_D = Image.new()
			var image_texture_D = ImageTexture.new()
			image_D.load(dir)
			image_texture_D.create_from_image(image_D)
			image_texture_D.set_flags(image_texture_D.get_flags() & ~(1 << 1))
			#file_D.close()
			
			talk_blink_D = image_texture_D
	
	
	if FileAccess.file_exists(talking_blink_file_E):
		var file_E = FileAccess.open(talking_blink_file_E, FileAccess.READ)
		dir = str_to_var(file_E.get_as_text())
		dir_str = var_to_str(dir)
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_E = Image.new()
			var image_texture_E = ImageTexture.new()
			image_E.load(dir)
			image_texture_E.create_from_image(image_E)
			image_texture_E.set_flags(image_texture_E.get_flags() & ~(1 << 1))
			#file_E.close()
			
			talk_blink_E = image_texture_E
	
	
	if FileAccess.file_exists(talking_blink_file_F):
		var file_F = FileAccess.open(talking_blink_file_F, FileAccess.READ)
		dir = file_F.get_as_text()
		dir_str = var_to_str(dir)
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_F = Image.new()
			var image_texture_F = ImageTexture.new()
			image_F.load(dir)
			image_texture_F.create_from_image(image_F)
			image_texture_F.set_flags(image_texture_F.get_flags() & ~(1 << 1))
			#file_F.close()
			
			talk_blink_F = image_texture_F
		
	
	if FileAccess.file_exists(talking_blink_file_G):
		var file_G = FileAccess.open(talking_blink_file_G, FileAccess.READ)
		dir = file_G.get_as_text()
		dir_str = var_to_str(dir)
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_G = Image.new()
			var image_texture_G = ImageTexture.new()
			image_G.load(dir)
			image_texture_G.create_from_image(image_G)
			image_texture_G.set_flags(image_texture_G.get_flags() & ~(1 << 1))
			file_G.close()
			
			talk_blink_G = image_texture_G
		
	
	if FileAccess.file_exists(talking_blink_file_H):
		var file_H = FileAccess.open(talking_blink_file_H, FileAccess.READ)
		dir = str_to_var(file_H.get_as_text())
		dir_str = var_to_str(dir)
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_H = Image.new()
			var image_texture_H = ImageTexture.new()
			image_H.load(dir)
			image_texture_H.create_from_image(image_H)
			image_texture_H.set_flags(image_texture_H.get_flags() & ~(1 << 1))
			file_H.close()
			
			talk_blink_H = image_texture_H
	
	
	if FileAccess.file_exists(talking_blink_file_I):
		var file_I = FileAccess.open(talking_blink_file_I, FileAccess.READ)
		dir = str_to_var(file_I.get_as_text())
		dir_str = var_to_str(dir)
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_I = Image.new()
			var image_texture_I = ImageTexture.new()
			image_I.load(dir)
			image_texture_I.create_from_image(image_I)
			image_texture_I.set_flags(image_texture_I.get_flags() & ~(1 << 1))
			#file_I.close()
			
			talk_blink_I = image_texture_I
	
	
	if FileAccess.file_exists(talking_blink_file_J):
		var file_J = FileAccess.open(talking_blink_file_J, FileAccess.READ)
		dir = str_to_var(file_J.get_as_text())
		dir_str = var_to_str(dir)
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_J = Image.new()
			var image_texture_J = ImageTexture.new()
			image_J.load(dir)
			image_texture_J.create_from_image(image_J)
			image_texture_J.set_flags(image_texture_J.get_flags() & ~(1 << 1))
			#file_J.close()
			
			talk_blink_J = image_texture_J
		
	else:
		pass
		
	
	
	
	#load silence blink png
	if FileAccess.file_exists(silence_blink_file_A):
		var file_A = FileAccess.open(silence_blink_file_A, FileAccess.READ)
		dir = str_to_var(file_A.get_as_text())
		#var directory = DirAccess.new()
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_A = Image.new()
			var image_texture_A = ImageTexture.new()
			image_A.load(dir)
			image_texture_A.create_from_image(image_A)
			image_texture_A.set_flags(image_texture_A.get_flags() & ~(1 << 1))
			#file_A.close()
			
			silence_blink_A = image_texture_A
		else:
			print("dir not exist:", silence_blink_file_A)
		
	if FileAccess.file_exists(silence_blink_file_B):
		var file_B = FileAccess.open(silence_blink_file_B, FileAccess.READ)
		dir = str_to_var(file_B.get_as_text())
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_B = Image.new()
			var image_texture_B = ImageTexture.new()
			image_B.load(dir)
			image_texture_B.create_from_image(image_B)
			image_texture_B.set_flags(image_texture_B.get_flags() & ~(1 << 1))
			#file_B.close()
			
			silence_blink_B = image_texture_B
	
	if FileAccess.file_exists(silence_blink_file_C):
		var file_C = FileAccess.open(silence_blink_file_C, FileAccess.READ)
		dir = str_to_var(file_C.get_as_text())
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_C = Image.new()
			var image_texture_C = ImageTexture.new()
			image_C.load(dir)
			image_texture_C.create_from_image(image_C)
			image_texture_C.set_flags(image_texture_C.get_flags() & ~(1 << 1))
			#file_C.close()
			
			silence_blink_C = image_texture_C
	
	if FileAccess.file_exists(silence_blink_file_D):
		var file_D = FileAccess.open(silence_blink_file_D, FileAccess.READ)
		dir = str_to_var(file_D.get_as_text())
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_D = Image.new()
			var image_texture_D = ImageTexture.new()
			image_D.load(dir)
			image_texture_D.create_from_image(image_D)
			image_texture_D.set_flags(image_texture_D.get_flags() & ~(1 << 1))
			#file_D.close()
			
			silence_blink_D = image_texture_D
	
	if FileAccess.file_exists(silence_blink_file_E):
		var file_E = FileAccess.open(silence_blink_file_E, FileAccess.READ)
		dir = str_to_var(file_E.get_as_text())
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_E = Image.new()
			var image_texture_E = ImageTexture.new()
			image_E.load(dir)
			image_texture_E.create_from_image(image_E)
			image_texture_E.set_flags(image_texture_E.get_flags() & ~(1 << 1))
			#file_E.close()
			
			silence_blink_E = image_texture_E
			
	if FileAccess.file_exists(silence_blink_file_F):
		var file_F = FileAccess.open(silence_blink_file_F, FileAccess.READ)
		dir = file_F.get_as_text()
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_F = Image.new()
			var image_texture_F = ImageTexture.new()
			image_F.load(dir)
			image_texture_F.create_from_image(image_F)
			image_texture_F.set_flags(image_texture_F.get_flags() & ~(1 << 1))
			#file_F.close()
			
			silence_blink_F = image_texture_F
		
	if FileAccess.file_exists(silence_blink_file_G):
		var file_G = FileAccess.open(silence_blink_file_G, FileAccess.READ)
		dir = file_G.get_as_text()
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_G = Image.new()
			var image_texture_G = ImageTexture.new()
			image_G.load(dir)
			image_texture_G.create_from_image(image_G)
			image_texture_G.set_flags(image_texture_G.get_flags() & ~(1 << 1))
			file_G.close()
			
			silence_blink_G = image_texture_G
	
	if FileAccess.file_exists(silence_blink_file_H):
		var file_H = FileAccess.open(silence_blink_file_H, FileAccess.READ)
		dir = str_to_var(file_H.get_as_text())
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_H = Image.new()
			var image_texture_H = ImageTexture.new()
			image_H.load(dir)
			image_texture_H.create_from_image(image_H)
			image_texture_H.set_flags(image_texture_H.get_flags() & ~(1 << 1))
			file_H.close()
			
			silence_blink_H = image_texture_H
	
	if FileAccess.file_exists(silence_blink_file_I):
		var file_I = FileAccess.open(silence_blink_file_I, FileAccess.READ)
		dir = str_to_var(file_I.get_as_text())
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_I = Image.new()
			var image_texture_I = ImageTexture.new()
			image_I.load(dir)
			image_texture_I.create_from_image(image_I)
			image_texture_I.set_flags(image_texture_I.get_flags() & ~(1 << 1))
			#file_I.close()
			
			silence_blink_I = image_texture_I
	
	if FileAccess.file_exists(silence_blink_file_J):
		var file_J = FileAccess.open(silence_blink_file_J, FileAccess.READ)
		dir = str_to_var(file_J.get_as_text())
		#var directory = DirAccess.new()
		
		#Load Image
		if dir != "" and directory.dir_exists(var_to_str(dir)):
			var image_J = Image.new()
			var image_texture_J = ImageTexture.new()
			image_J.load(dir)
			image_texture_J.create_from_image(image_J)
			image_texture_J.set_flags(image_texture_J.get_flags() & ~(1 << 1))
			#file_J.close()
			
			silence_blink_J = image_texture_J

	
	else:
		pass

func load_bg():
	var dir
	
	#load bg A
#	#var file_A = FileAccess.new()
	if FileAccess.file_exists(bg_file_A):
		var file_A = FileAccess.open(bg_file_A, FileAccess.READ)
		dir = str_to_var(file_A.get_as_text())
		
		#Load Image
		var bg_A_dir = Image.new()
		var bg_texture_A = ImageTexture.new()
		bg_A_dir.load(dir)
		bg_texture_A.create_from_image(bg_A_dir)
		#file_A.close()
		
		bg_A = bg_texture_A
		print(bg_A)
	
	#load bg B
#	
	if FileAccess.file_exists(bg_file_B):
		var file_B = FileAccess.open(bg_file_B, FileAccess.READ)
		dir = str_to_var(file_B.get_as_text())
		
		#Load Image
		var bg_B_dir = Image.new()
		var bg_texture_B = ImageTexture.new()
		bg_B_dir.load(dir)
		bg_texture_B.create_from_image(bg_B_dir)
		#file_B.close()
		
		bg_B = bg_texture_B
	
	#load bg C
#	
	if FileAccess.file_exists(bg_file_C):
		var file_C = FileAccess.open(bg_file_C, FileAccess.READ)
		dir = str_to_var(file_C.get_as_text())
		
		#Load Image
		var bg_C_dir = Image.new()
		var bg_texture_C = ImageTexture.new()
		bg_C_dir.load(dir)
		bg_texture_C.create_from_image(bg_C_dir)
		#file_C.close()
		
		bg_C = bg_texture_C
	
	#load bg D
#	
	if FileAccess.file_exists(bg_file_D):
		var file_D = FileAccess.open(bg_file_D, FileAccess.READ)
		dir = str_to_var(file_D.get_as_text())
		
		#Load Image
		var bg_D_dir = Image.new()
		var bg_texture_D = ImageTexture.new()
		bg_D_dir.load(dir)
		bg_texture_D.create_from_image(bg_D_dir)
		#file_D.close()
		
		bg_D = bg_texture_D
	
	#load bg E
#	
	if FileAccess.file_exists(bg_file_E):
		var file_E = FileAccess.open(bg_file_E, FileAccess.READ)
		dir = str_to_var(file_E.get_as_text())
		
		#Load Image
		var bg_E_dir = Image.new()
		var bg_texture_E = ImageTexture.new()
		bg_E_dir.load(dir)
		bg_texture_E.create_from_image(bg_E_dir)
		#file_E.close()
		
		bg_E = bg_texture_E
	
	#load bg F
#	
	if FileAccess.file_exists(bg_file_F):
		var file_F =FileAccess.open(bg_file_F, FileAccess.READ)
		dir = file_F.get_as_text()
		
		#Load Image
		var bg_F_dir = Image.new()
		var bg_texture_F = ImageTexture.new()
		bg_F_dir.load(dir)
		bg_texture_F.create_from_image(bg_F_dir)
		#file_F.close()
		
		bg_F = bg_texture_F
		
#	
	if FileAccess.file_exists(bg_file_G):
		var file_G = FileAccess.open(bg_file_G, FileAccess.READ)
		dir = file_G.get_as_text()
		
		#Load Image
		var bg_G_dir = Image.new()
		var bg_texture_G = ImageTexture.new()
		bg_G_dir.load(dir)
		bg_texture_G.create_from_image(bg_G_dir)
		file_G.close()
		
		bg_G = bg_texture_G
		print(bg_G)
	
	#load bg H
#	
	if FileAccess.file_exists(bg_file_H):
		var file_H = FileAccess.open(bg_file_H, FileAccess.READ)
		dir = str_to_var(file_H.get_as_text())
		
		#Load Image
		var bg_H_dir = Image.new()
		var bg_texture_H = ImageTexture.new()
		bg_H_dir.load(dir)
		bg_texture_H.create_from_image(bg_H_dir)
		file_H.close()
		
		bg_H = bg_texture_H
	
	#load bg I
#	
	if FileAccess.file_exists(bg_file_I):
		var file_I = FileAccess.open(bg_file_I, FileAccess.READ)
		dir = str_to_var(file_I.get_as_text())
		
		#Load Image
		var bg_I_dir = Image.new()
		var bg_texture_I = ImageTexture.new()
		bg_I_dir.load(dir)
		bg_texture_I.create_from_image(bg_I_dir)
		#file_I.close()
		
		bg_I = bg_texture_I
	
	#load bg J
#	
	if FileAccess.file_exists(bg_file_J):
		var file_J =FileAccess.open(bg_file_J, FileAccess.READ)
		dir = str_to_var(file_J.get_as_text())
		
		#Load Image
		var bg_J_dir = Image.new()
		var bg_texture_J = ImageTexture.new()
		bg_J_dir.load(dir)
		bg_texture_J.create_from_image(bg_J_dir)
		#file_J.close()
		
		bg_J = bg_texture_J
	
	
	switch_bg()

func switch_bg():
	if is_preset_A and bg_A != null:
		$CanvasLayer2/BG.texture = bg_A
	elif is_preset_A and bg_A == null:
		$CanvasLayer2/BG.texture = load("res://Arts/Gazo Bg.png")
	elif is_preset_B and bg_B != null:
		$CanvasLayer2/BG.texture = bg_B
	elif is_preset_B and bg_B == null:
		$CanvasLayer2/BG.texture = load("res://Arts/Gazo Bg.png")
	elif is_preset_C and bg_C != null:
		$CanvasLayer2/BG.texture = bg_C
	elif is_preset_C and bg_C == null:
		$CanvasLayer2/BG.texture = load("res://Arts/Gazo Bg.png")
	elif is_preset_D and bg_D != null:
		$CanvasLayer2/BG.texture = bg_D
	elif is_preset_D and bg_D == null:
		$CanvasLayer2/BG.texture = load("res://Arts/Gazo Bg.png")
	elif is_preset_E and bg_E != null:
		$CanvasLayer2/BG.texture = bg_E
	elif is_preset_E and bg_E == null:
		$CanvasLayer2/BG.texture = load("res://Arts/Gazo Bg.png")
	elif is_preset_F and bg_F != null:
		$CanvasLayer2/BG.texture = bg_F
	elif is_preset_F and bg_F == null:
		$CanvasLayer2/BG.texture = load("res://Arts/Gazo Bg.png")
	elif is_preset_G and bg_G != null:
		$CanvasLayer2/BG.texture = bg_G
	elif is_preset_G and bg_G == null:
		$CanvasLayer2/BG.texture = load("res://Arts/Gazo Bg.png")
	elif is_preset_H and bg_H != null:
		$CanvasLayer2/BG.texture = bg_H
	elif is_preset_H and bg_H == null:
		$CanvasLayer2/BG.texture = load("res://Arts/Gazo Bg.png")
	elif is_preset_I and bg_I != null:
		$CanvasLayer2/BG.texture = bg_I
	elif is_preset_I and bg_I == null:
		$CanvasLayer2/BG.texture = load("res://Arts/Gazo Bg.png")
	elif is_preset_J and bg_J != null:
		$CanvasLayer2/BG.texture = bg_J
	elif is_preset_J and bg_J == null:
		$CanvasLayer2/BG.texture = load("res://Arts/Gazo Bg.png")

func load_sens():
	#var file = FileAccess.new()
	if FileAccess.file_exists(sens_file):
		var file =FileAccess.open(sens_file, FileAccess.READ)
		print("Limiter ",limiter)
		limiter = file.get_float()
		#file.close()
		$CanvasLayer/ToHide/LeftPanel/MicSens.value = limiter
	else:
		print("sens file doesnt exist")

func load_amp():
	#var file = FileAccess.new()
	if FileAccess.file_exists(amp_file):
		var file =FileAccess.open(amp_file, FileAccess.READ)
		var val = file.get_float()
		var effect = AudioServer.get_bus_effect(1,2)
		effect.volume_db  = val
		#file.close()
		$CanvasLayer/ToHide/LeftPanel/AmpSlider.value = val
	else:
		print("amp file doesnt exist")

func load_flip():
	#var file = FileAccess.new()
	#if FileAccess.file_exists(flip_file):
	#	var file =FileAccess.open(flip_file, FileAccess.READ)
	#	is_flipped = file.get_var()
	#	#file.close()
	
	if is_preset_A:
		if FileAccess.file_exists(flip_file_A):
			var file =FileAccess.open(flip_file_A, FileAccess.READ)
			is_flipped_A = file.get_var()
			#file.close()
	elif is_preset_B:
		if FileAccess.file_exists(flip_file_B):
			var file =FileAccess.open(flip_file_B, FileAccess.READ)
			is_flipped_B = file.get_var()
			#file.close()
	elif is_preset_C:
		if FileAccess.file_exists(flip_file_C):
			var file =FileAccess.open(flip_file_C, FileAccess.READ)
			is_flipped_C = file.get_var()
			#file.close()
	elif is_preset_D:
		if FileAccess.file_exists(flip_file_D):
			var file =FileAccess.open(flip_file_D, FileAccess.READ)
			is_flipped_D = file.get_var()
			#file.close()
	elif is_preset_E:
		if FileAccess.file_exists(flip_file_E):
			var file =FileAccess.open(flip_file_E, FileAccess.READ)
			is_flipped_E = file.get_var()
			#file.close()
	elif is_preset_F:
		if FileAccess.file_exists(flip_file_F):
			var file =FileAccess.open(flip_file_F, FileAccess.READ)
			is_flipped_F = file.get_var()
			#file.close()
	elif is_preset_G:
		if FileAccess.file_exists(flip_file_G):
			var file =FileAccess.open(flip_file_G, FileAccess.READ)
			is_flipped_G = file.get_var()
			#file.close()
	elif is_preset_H:
		if FileAccess.file_exists(flip_file_H):
			var file =FileAccess.open(flip_file_H, FileAccess.READ)
			is_flipped_H = file.get_var()
			#file.close()
	elif is_preset_I:
		if FileAccess.file_exists(flip_file_I):
			var file =FileAccess.open(flip_file_I, FileAccess.READ)
			is_flipped_I = file.get_var()
			#file.close()
	elif is_preset_J:
		if FileAccess.file_exists(flip_file_J):
			var file =FileAccess.open(flip_file_J, FileAccess.READ)
			is_flipped_J = file.get_var()
			#file.close()

	
	else:
		pass
	if is_preset_A:
		if is_flipped_A == true:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
		elif is_flipped_A == false:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
	elif is_preset_B:
		if is_flipped_B == true:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
		elif is_flipped_B == false:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
	elif is_preset_C:
		if is_flipped_C == true:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
		elif is_flipped_C == false:
			$On.flip_h = false
			$Scream.flip_h = true
			$Off.flip_h = false
	elif is_preset_D:
		if is_flipped_D == true:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
		elif is_flipped_D == false:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
	elif is_preset_E:
		if is_flipped_E == true:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
		elif is_flipped_E == false:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
	elif is_preset_F:
		if is_flipped_F == true:
			$On.flip_h = true
			$Off.flip_h = true
		elif is_flipped_F == false:
			$On.flip_h = false
			$Off.flip_h = false
	elif is_preset_G:
		if is_flipped_G == true:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
		elif is_flipped_G == false:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
	elif is_preset_H:
		if is_flipped_H == true:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
		elif is_flipped_H == false:
			$On.flip_h = false
			$Scream.flip_h = true
			$Off.flip_h = false
	elif is_preset_I:
		if is_flipped_I == true:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
		elif is_flipped_I == false:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
	elif is_preset_J:
		if is_flipped_J == true:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
		elif is_flipped_J == false:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
	
func load_options():
	#var file = FileAccess.new()
	if FileAccess.file_exists(bouncy_file):
		var file =FileAccess.open(bouncy_file, FileAccess.READ)
		can_bounce = file.get_var()
		#file.close()
	else:
		pass
	
	if FileAccess.file_exists(shaky_file):
		var file =FileAccess.open(shaky_file, FileAccess.READ)
		can_shake = file.get_var()
		#file.close()
	else:
		pass
	
	if FileAccess.file_exists(dim_file):
		var file =FileAccess.open(dim_file, FileAccess.READ)
		can_dim = file.get_var()
		#file.close()
	else:
		pass
	
	#for dimmer
	if can_dim == true:
		$Off/CanvasModulate.visible = true
	elif can_dim == false:
		$Off/CanvasModulate.visible = true
#	$CanvasLayer/ToHide/LeftPanel/DimSwitch.pressed = can_dim
	$CanvasLayer/ToHide/LeftPanel/DimSwitch.button_pressed = can_dim
	
	#for bouncer
	$CanvasLayer/ToHide/LeftPanel/AnimSwitch.button_pressed = can_bounce
	
	#for shaky
	$CanvasLayer/ToHide/LeftPanel/ShakySwitch.button_pressed = can_shake

func _on_Visibility_pressed():
	print("bitch")
	
	if is_first_click == false:
		is_first_click = true
		$CanvasLayer/ToHide/ClickDelay.start()
		print("fosto")
	elif is_first_click == true:
		is_second_click = true
		
	if is_panel_shown == false and is_second_click:
		$AnimPlayer.play("ShowPanel")
		is_panel_shown = true
		is_second_click = false
		is_first_click = false
	
	elif is_second_click:
		print("secong")
		get_tree().get_root().set_transparent_background(false)
#		OS.window_per_pixel_transparency_enabled = false
		is_transparent = false

		RenderingServer.set_default_clear_color(Color(0.4,0.4,0.4,1.0))

		$CanvasLayer/ToHide.show()
		$CanvasLayer2/BG.show()

		$CanvasLayer/Visibility.hide()
		is_second_click = false
		is_first_click = false



func _on_FileDialogOn_popup_hide():
	can_scroll = true
	can_switch_preset = true
	is_filedialog_talk = false
	

func _on_FileDialogOff_popup_hide():
	can_scroll = true
	can_switch_preset = true
	is_filedialog_talk = false
	

func _on_FileDialogOn_about_to_show():
	can_switch_preset = false

func _on_FileDialogOff_about_to_show():
	can_switch_preset = false


func _on_FlipBtn_pressed():
	if is_preset_A:
		if $On.flip_h == false:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
			is_flipped_A = true
		else:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
			is_flipped_A = false
		save_flip(is_flipped_A)
		
	elif is_preset_B:
		if $On.flip_h == false:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
			is_flipped_B = true
		else:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
			is_flipped_B = false
		save_flip(is_flipped_B)
		
	elif is_preset_C:
		if $On.flip_h == false:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
			is_flipped_C = true
		else:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
			is_flipped_C = false
		save_flip(is_flipped_C)
		
	elif is_preset_D:
		if $On.flip_h == false:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
			is_flipped_D = true
		else:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
			is_flipped_D = false
		save_flip(is_flipped_D)
		
	elif is_preset_E:
		if $On.flip_h == false:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
			is_flipped_E = true
		else:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
			is_flipped_E = false
		save_flip(is_flipped_E)
	
	elif is_preset_F:
		if $On.flip_h == false:
			$On.flip_h = true
			$Off.flip_h = true
			is_flipped_F = true
		else:
			$On.flip_h = false
			$Off.flip_h = false
			is_flipped_F = false
		save_flip(is_flipped_F)
	
	elif is_preset_G:
		if $On.flip_h == false:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
			is_flipped_G = true
		else:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
			is_flipped_G = false
		save_flip(is_flipped_G)
		
	elif is_preset_H:
		if $On.flip_h == false:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
			is_flipped_H = true
		else:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
			is_flipped_H = false
		save_flip(is_flipped_H)
		
	elif is_preset_I:
		if $On.flip_h == false:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
			is_flipped_I = true
		else:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
			is_flipped_I = false
		save_flip(is_flipped_I)
		
	elif is_preset_J:
		if $On.flip_h == false:
			$On.flip_h = true
			$Off.flip_h = true
			$Scream.flip_h = true
			is_flipped_J = true
		else:
			$On.flip_h = false
			$Off.flip_h = false
			$Scream.flip_h = false
			is_flipped_J = false
		save_flip(is_flipped_J)
		
	

func _on_AnimSwitch_toggled(button_pressed):
	if button_pressed == true:
		can_bounce = true
	elif button_pressed == false:
		can_bounce = false
	
	save_bouncy(can_bounce)

func _on_DimSwitch_toggled(button_pressed):
	if button_pressed == true:
		$Off/CanvasModulate.visible = true
		can_dim = true
	elif button_pressed == false:
		$Off/CanvasModulate.visible = false
		can_dim = false
		
	save_dim(can_dim)


func _on_GreenScreenBtn_pressed():
	RenderingServer.set_default_clear_color(Color(0,255,0))
	$CanvasLayer/ToHide.hide()
	is_transparent = true
	$CanvasLayer2/BG.hide()

	$CanvasLayer/Visibility.show()


func _on_PresetBtn1_pressed():
	if can_switch_preset == true:
		is_preset_A = true
		is_preset_B = false
		is_preset_C = false
		is_preset_D = false
		is_preset_E = false
		is_preset_F = false
		is_preset_G = false
		is_preset_H = false
		is_preset_I = false
		is_preset_J = false
		$CanvasLayer/ToHide/PresetLbl.text= "PRESET A"
		
#		$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=155
#		$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=55
		
		switch_preset()
		switch_bg()


func _on_PresetBtn2_pressed():
	if can_switch_preset == true:
		is_preset_A = false
		is_preset_B = false
		is_preset_C = true
		is_preset_D = false
		is_preset_E = false
		is_preset_F = false
		is_preset_G = false
		is_preset_H = false
		is_preset_I = false
		is_preset_J = false
		$CanvasLayer/ToHide/PresetLbl.text = "PRESET C"
		
#		$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=155
#		$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=55
		
		switch_preset()
		switch_bg()

func _on_PresetBtn3_pressed():
	if can_switch_preset == true:
		is_preset_A = false
		is_preset_B = false
		is_preset_C = false
		is_preset_D = false
		is_preset_E = true
		is_preset_F = false
		is_preset_G = false
		is_preset_H = false
		is_preset_I = false
		is_preset_J = false
		$CanvasLayer/ToHide/PresetLbl.text = "PRESET E"
		
#		$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=155
#		$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=55
		
		switch_preset()
		switch_bg()

func _on_PresetBtn5_pressed():
	if can_switch_preset == true:
		is_preset_A = false
		is_preset_B = false
		is_preset_C = false
		is_preset_D = false
		is_preset_E = false
		is_preset_F = false
		is_preset_G = true
		is_preset_H = false
		is_preset_I = false
		is_preset_J = false
		$CanvasLayer/ToHide/PresetLbl.text = "PRESET G"
		
#		$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=155
#		$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=55
		
		switch_preset()
		switch_bg()


func _on_PresetBtn6_pressed():
	if can_switch_preset == true:
		is_preset_A = false
		is_preset_B = false
		is_preset_C = false
		is_preset_D = false
		is_preset_E = false
		is_preset_F = false
		is_preset_G = false
		is_preset_H = false
		is_preset_I = true
		is_preset_J = false
		$CanvasLayer/ToHide/PresetLbl.text = "PRESET I"
		
#		$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
		
		switch_preset()
		switch_bg()


func _on_PresetBtnB_pressed():
	if can_switch_preset == true:
		is_preset_A = false
		is_preset_B = true
		is_preset_C = false
		is_preset_D = false
		is_preset_E = false
		is_preset_F = false
		is_preset_G = false
		is_preset_H = false
		is_preset_I = false
		is_preset_J = false
		$CanvasLayer/ToHide/PresetLbl.text = "PRESET B"
		
#		$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
		
		switch_preset()
		switch_bg()


func _on_PresetBtnD_pressed():
	if can_switch_preset == true:
		is_preset_A = false
		is_preset_B = false
		is_preset_C = false
		is_preset_D = true
		is_preset_E = false
		is_preset_F = false
		is_preset_G = false
		is_preset_H = false
		is_preset_I = false
		is_preset_J = false
		$CanvasLayer/ToHide/PresetLbl.text = "PRESET D"
		
#		$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
		
		switch_preset()
		switch_bg()


func _on_PresetBtnF_pressed():
	if can_switch_preset == true:
		is_preset_A = false
		is_preset_B = false
		is_preset_C = false
		is_preset_D = false
		is_preset_E = false
		is_preset_F = true
		is_preset_G = false
		is_preset_H = false
		is_preset_I = false
		is_preset_J = false
		$CanvasLayer/ToHide/PresetLbl.text = "PRESET F"
		
#		$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
		
		switch_preset()
		switch_bg()


func _on_PresetBtnH_pressed():
	if can_switch_preset == true:
		is_preset_A = false
		is_preset_B = false
		is_preset_C = false
		is_preset_D = false
		is_preset_E = false
		is_preset_F = false
		is_preset_G = false
		is_preset_H = true
		is_preset_I = false
		is_preset_J = false
		$CanvasLayer/ToHide/PresetLbl.text = "PRESET H"
		
#		$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
		
		switch_preset()
		switch_bg()


func _on_PresetBtnJ_pressed():
	if can_switch_preset == true:
		is_preset_A = false
		is_preset_B = false
		is_preset_C = false
		is_preset_D = false
		is_preset_E = false
		is_preset_F = false
		is_preset_G = false
		is_preset_H = false
		is_preset_I = false
		is_preset_J = true
		$CanvasLayer/ToHide/PresetLbl.text = "PRESET J"
		
#		$CanvasLayer/ToHide/LeftPanel/SelectedA.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedB.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedC.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedD.modulate=55
#		$CanvasLayer/ToHide/LeftPanel/SelectedE.modulate=155
		
		switch_preset()
		switch_bg()

#func _on_ButtonA_pressed():
#	$CanvasLayer/PresetBinder/ButtonA.text = ".  .  .  .  ."
#	is_binding_A = true
#
#func _on_ButtonB_pressed():
#	$CanvasLayer/PresetBinder/ButtonB.text = ".  .  .  .  ."
#	is_binding_B = true
#
#func _on_ButtonC_pressed():
#	$CanvasLayer/PresetBinder/ButtonC.text = ".  .  .  .  ."
#	is_binding_C = true

# warning-ignore:unused_argument
func _on_files_dropped(files):#, screen):
	if is_filedialog_talk == true and is_blinking == false and is_filedialog_scream == false and is_filedialog_prop == false:
		
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if files[0].get_extension() == "JPEG" or files[0].get_extension() == "jpeg" or files[0].get_extension() == "JPG" or files[0].get_extension() == "jpg" or files[0].get_extension() == "PNG" or files[0].get_extension() == "png":
			if files.size() > 1:
				animated_texture.frames = files.size()
				for i in files.size():
					var im = Image.new()
					var tex = ImageTexture.new()
					im.load(files[i])
					tex.create_from_image(im)
					tex.set_flags(image_texture.get_flags() & ~(1 << 1))
					animated_texture.set_frame_texture(i, tex)
					animated_texture.set_frame_delay(i, 0.1)
				animated_texture.fps = 120
				
				if is_preset_A:
					talk_png_A = animated_texture
				elif is_preset_B:
					talk_png_B = animated_texture
				elif is_preset_C:
					talk_png_C = animated_texture
				elif is_preset_D:
					talk_png_D = animated_texture
				elif is_preset_E:
					talk_png_E = animated_texture
				elif is_preset_F:
					talk_png_F = animated_texture
				elif is_preset_G:
					talk_png_G = animated_texture
				elif is_preset_H:
					talk_png_H = animated_texture
				elif is_preset_I:
					talk_png_I = animated_texture
				elif is_preset_J:
					talk_png_J = animated_texture
			
			else:
				image.load(files[0])
				print("not gif import")
				image_texture.create_from_image(image)
#				image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
				if is_preset_A:
					talk_png_A = image_texture
				elif is_preset_B:
					talk_png_B = image_texture
				elif is_preset_C:
					talk_png_C = image_texture
				elif is_preset_D:
					talk_png_D = image_texture
				elif is_preset_E:
					talk_png_E = image_texture
				elif is_preset_F:
					talk_png_F = image_texture
				elif is_preset_G:
					talk_png_G = image_texture
				elif is_preset_H:
					talk_png_H = image_texture
				elif is_preset_I:
					talk_png_I = image_texture
				elif is_preset_J:
					talk_png_J = image_texture
			
#		elif  files[0].get_extension() == "gif":
#			image_frames.load(files[0])
#			animated_texture.frames = image_frames.get_frame_count()
#			for i in image_frames.get_frame_count():
#				var frame = image_frames.get_frame_image(i)
#				var tex = ImageTexture.new()
#
#				tex.create_from_image(frame)
#				tex.set_flags(tex.get_flags() & ~(1 << 1))
#				animated_texture.set_frame_texture(i, tex)
#				animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#			animated_texture.fps = 120
#
#			if is_preset_A:
#				talk_png_A = animated_texture
#			elif is_preset_B:
#				talk_png_B = animated_texture
#			elif is_preset_C:
#				talk_png_C = animated_texture
#			elif is_preset_D:
#				talk_png_D = animated_texture
#			elif is_preset_E:
#				talk_png_E = animated_texture
#			elif is_preset_F:
#				talk_png_G = animated_texture
#			elif is_preset_G:
#				talk_png_G = animated_texture
#			elif is_preset_H:
#				talk_png_H = animated_texture
#			elif is_preset_I:
#				talk_png_I = animated_texture
#			elif is_preset_J:
#				talk_png_J = animated_texture
#

		save_talking(files)
		switch_preset()
		#$CanvasLayer/FileDialog.hide()
		#is_filedialog_talk = false
		can_scroll = true
		$CanvasLayer/FileDialog.hide()
		
#		if is_preset_A:
#			var image = Image.new()
#			#var image_frames = ImageFrames.new()
#			var image_texture = ImageTexture.new()
#			var animated_texture = AnimatedTexture.new()
#
#			if files[0].get_extension() != "gif":
#				image.load(files[0])
#				image_texture.create_from_image(image)
#				image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
#				talk_png_A = image_texture
#			elif  files[0].get_extension() == "gif":
#				image_frames.load(files[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_A = animated_texture
#
#			save_talking(files[0])
#			switch_preset()
#			#$CanvasLayer/FileDialog.hide()
#			#is_filedialog_talk = false
#			can_scroll = true
#			$CanvasLayer/FileDialog.hide()
#
#		elif is_preset_B:
#			var image = Image.new()
#			#var image_frames = ImageFrames.new()
#			var image_texture = ImageTexture.new()
#			var animated_texture = AnimatedTexture.new()
#
#			if files[0].get_extension() != "gif":
#				image.load(files[0])
#				image_texture.create_from_image(image)
#				image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
#				talk_png_B = image_texture
#			elif  files[0].get_extension() == "gif":
#				image_frames.load(files[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_B = animated_texture
#
#			save_talking(files[0])
#			switch_preset()
#			#$CanvasLayer/FileDialog.hide()
#			#is_filedialog_talk = false
#			can_scroll = true
#			$CanvasLayer/FileDialog.hide()
#
#		elif is_preset_A:
#			var image = Image.new()
#			#var image_frames = ImageFrames.new()
#			var image_texture = ImageTexture.new()
#			var animated_texture = AnimatedTexture.new()
#
#			if files[0].get_extension() != "gif":
#				image.load(files[0])
#				image_texture.create_from_image(image)
#				image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
#				talk_png_C = image_texture
#			elif  files[0].get_extension() == "gif":
#				image_frames.load(files[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_C = animated_texture
#
#			save_talking(files[0])
#			switch_preset()
#			#$CanvasLayer/FileDialog.hide()
#			#is_filedialog_talk = false
#			can_scroll = true
#			$CanvasLayer/FileDialog.hide()
#
#		elif is_preset_A:
#			var image = Image.new()
#			#var image_frames = ImageFrames.new()
#			var image_texture = ImageTexture.new()
#			var animated_texture = AnimatedTexture.new()
#
#			if files[0].get_extension() != "gif":
#				image.load(files[0])
#				image_texture.create_from_image(image)
#				image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
#				talk_png_D = image_texture
#			elif  files[0].get_extension() == "gif":
#				image_frames.load(files[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_D = animated_texture
#
#			save_talking(files[0])
#			switch_preset()
#			#$CanvasLayer/FileDialog.hide()
#			#is_filedialog_talk = false
#			can_scroll = true
#			$CanvasLayer/FileDialog.hide()
#
#		if is_preset_A:
#			var image = Image.new()
#			#var image_frames = ImageFrames.new()
#			var image_texture = ImageTexture.new()
#			var animated_texture = AnimatedTexture.new()
#
#			if files[0].get_extension() != "gif":
#				image.load(files[0])
#				image_texture.create_from_image(image)
#				image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
#				talk_png_E = image_texture
#			elif  files[0].get_extension() == "gif":
#				image_frames.load(files[0])
#				animated_texture.frames = image_frames.get_frame_count()
#
#				for i in image_frames.get_frame_count():
#					var frame = image_frames.get_frame_image(i)
#					var tex = ImageTexture.new()
#					tex.create_from_image(frame)
#
#					animated_texture.set_frame_texture(i, tex)
#					animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#				animated_texture.fps = 120
#				talk_png_E = animated_texture
#
#			save_talking(files[0])
#			switch_preset()
#			#$CanvasLayer/FileDialog.hide()
#			#is_filedialog_talk = false
#			can_scroll = true
#			$CanvasLayer/FileDialog.hide()
			
	
	
	elif is_filedialog_talk_blink and is_blinking  and is_filedialog_scream == false and is_filedialog_prop == false:
		#Load Image
		if files[0].get_extension() == "JPEG" or files[0].get_extension() == "jpeg" or files[0].get_extension() == "JPG" or files[0].get_extension() == "jpg" or files[0].get_extension() == "PNG" or files[0].get_extension() == "png":
			var image = Image.new()
			var image_texture = ImageTexture.new()
			image.load(files[0])
			image_texture.create_from_image(image)
#			image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
			
			if is_preset_A:
				talk_blink_A = image_texture
			elif is_preset_B:
				talk_blink_B = image_texture
			elif is_preset_C:
				talk_blink_C = image_texture
			elif is_preset_D:
				talk_blink_D = image_texture
			elif is_preset_E:
				talk_blink_E = image_texture
			elif is_preset_F:
				talk_blink_F = image_texture
			elif is_preset_G:
				talk_blink_G = image_texture
			elif is_preset_H:
				talk_blink_H = image_texture
			elif is_preset_I:
				talk_blink_I = image_texture
			elif is_preset_J:
				talk_blink_J = image_texture
				
			#$On.texture =image_texture 
			
			#Save
			save_talking_blink(files[0])
			switch_preset()
			$CanvasLayer/FileDialog.hide()
			is_filedialog_talk = false
			is_filedialog_talk_blink = false
			is_blinking = false
			can_scroll = true
			#$CanvasLayer/FileDialogOff.hide()
			#$CanvasLayer/FileDialogOn.hide()
		
	elif is_filedialog_silence and is_blinking == false  and is_filedialog_scream == false and is_filedialog_prop == false:
		
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if files[0].get_extension() == "JPEG" or files[0].get_extension() == "jpeg" or files[0].get_extension() == "JPG" or files[0].get_extension() == "jpg" or files[0].get_extension() == "PNG" or files[0].get_extension() == "png":
			
			if files.size() > 1:
				animated_texture.frames = files.size()
				for i in files.size():
					var im = Image.new()
					var tex = ImageTexture.new()
					im.load(files[i])
					tex.create_from_image(im)
					tex.set_flags(image_texture.get_flags() & ~(1 << 1))
					animated_texture.set_frame_texture(i, tex)
					animated_texture.set_frame_delay(i, 0.1)	
				animated_texture.fps = 120
				
				if is_preset_A:
					silence_png_A = animated_texture
				elif is_preset_B:
					silence_png_B = animated_texture
				elif is_preset_C:
					silence_png_C = animated_texture
				elif is_preset_D:
					silence_png_D = animated_texture
				elif is_preset_E:
					silence_png_E = animated_texture
				elif is_preset_F:
					silence_png_F = animated_texture
				elif is_preset_G:
					silence_png_G = animated_texture
				elif is_preset_H:
					silence_png_H = animated_texture
				elif is_preset_I:
					silence_png_I = animated_texture
				elif is_preset_J:
					silence_png_J = animated_texture
			else:
				image.load(files[0])
				image_texture.create_from_image(image)
#				image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
				if is_preset_A:
					silence_png_A = image_texture
				elif is_preset_B:
					silence_png_B = image_texture
				elif is_preset_C:
					silence_png_C = image_texture
				elif is_preset_D:
					silence_png_D = image_texture
				elif is_preset_E:
					silence_png_E = image_texture
				elif is_preset_F:
					silence_png_F = image_texture
				elif is_preset_G:
					silence_png_G = image_texture
				elif is_preset_H:
					silence_png_H = image_texture
				elif is_preset_I:
					silence_png_I = image_texture
				elif is_preset_J:
					silence_png_J = image_texture
#		elif  files[0].get_extension() == "gif":
#			image_frames.load(files[0])
#			animated_texture.frames = image_frames.get_frame_count()
#
#			for i in image_frames.get_frame_count():
#				var frame = image_frames.get_frame_image(i)
#				var tex = ImageTexture.new()
#				tex.create_from_image(frame)
#				tex.set_flags(tex.get_flags() & ~(1 << 1))
#				animated_texture.set_frame_texture(i, tex)
#				animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#			animated_texture.fps = 120
#
#			if is_preset_A:
#				silence_png_A = animated_texture
#			elif is_preset_B:
#				silence_png_B = animated_texture
#			elif is_preset_C:
#				silence_png_C = animated_texture
#			elif is_preset_D:
#				silence_png_D = animated_texture
#			elif is_preset_E:
#				silence_png_E = animated_texture
#			elif is_preset_F:
#				silence_png_F = animated_texture
#			elif is_preset_G:
#				silence_png_G = animated_texture
#			elif is_preset_H:
#				silence_png_H = animated_texture
#			elif is_preset_I:
#				silence_png_I = animated_texture
#			elif is_preset_J:
#				silence_png_J = animated_texture
#
		save_silence(files)
		switch_preset()
		#$CanvasLayer/FileDialog.hide()
		#is_filedialog_talk = false
		can_scroll = true
		$CanvasLayer/FileDialog.hide()
	
	elif is_filedialog_silence_blink and is_blinking  and is_filedialog_scream == false and is_filedialog_prop == false:
		if files[0].get_extension() == "JPEG" or files[0].get_extension() == "jpeg" or files[0].get_extension() == "JPG" or files[0].get_extension() == "jpg" or files[0].get_extension() == "PNG" or files[0].get_extension() == "png":
			var image = Image.new()
			var image_texture = ImageTexture.new()
			image.load(files[0])
			image_texture.create_from_image(image)
#			image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
			
			if is_preset_A:
				silence_blink_A = image_texture
			elif is_preset_B:
				silence_blink_B = image_texture
			elif is_preset_C:
				silence_blink_C = image_texture
			elif is_preset_D:
				silence_blink_D = image_texture
			elif is_preset_E:
				silence_blink_E = image_texture
			elif is_preset_F:
				silence_blink_F = image_texture
			elif is_preset_G:
				silence_blink_G = image_texture
			elif is_preset_H:
				silence_blink_H = image_texture
			elif is_preset_I:
				silence_blink_I = image_texture
			elif is_preset_J:
				silence_blink_J = image_texture
			#$Off.texture =image_texture 
			#Save
			save_silence_blink(files[0])
			switch_preset()
			$CanvasLayer/FileDialog.hide()
	#		$CanvasLayer/FileDialogOff.hide()
	#		$CanvasLayer/FileDialogOn.hide()
			is_filedialog_talk = false
			is_filedialog_silence_blink = false
			is_blinking = false
			can_scroll = true
	
	elif is_filedialog_talk == false and is_blinking == false and is_filedialog_scream == true and is_filedialog_prop == false:
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if files[0].get_extension() == "JPEG" or files[0].get_extension() == "jpeg" or files[0].get_extension() == "JPG" or files[0].get_extension() == "jpg" or files[0].get_extension() == "PNG" or files[0].get_extension() == "png":
			
			if files.size() > 1:
				animated_texture.frames = files.size()
				for i in files.size():
					var im = Image.new()
					var tex = ImageTexture.new()
					im.load(files[i])
					tex.create_from_image(im)
					tex.set_flags(image_texture.get_flags() & ~(1 << 1))
					animated_texture.set_frame_texture(i, tex)
					animated_texture.set_frame_delay(i, 0.1)	
				animated_texture.fps = 120
				if is_preset_A:
					scream_png_A = animated_texture
				elif is_preset_B:
					scream_png_B = animated_texture
				elif is_preset_C:
					scream_png_C = animated_texture
				elif is_preset_D:
					scream_png_D = animated_texture
				elif is_preset_E:
					scream_png_E = animated_texture
				elif is_preset_F:
					scream_png_F = animated_texture
				elif is_preset_G:
					scream_png_G = animated_texture
				elif is_preset_H:
					scream_png_H = animated_texture
				elif is_preset_I:
					scream_png_I = animated_texture
				elif is_preset_J:
					scream_png_J = animated_texture
			else:
				image.load(files[0])
				image_texture.create_from_image(image)
				image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
				if is_preset_A:
					scream_png_A = image_texture
				elif is_preset_B:
					scream_png_B = image_texture
				elif is_preset_C:
					scream_png_C = image_texture
				elif is_preset_D:
					scream_png_D = image_texture
				elif is_preset_E:
					scream_png_E = image_texture
				elif is_preset_F:
					scream_png_F = image_texture
				elif is_preset_G:
					scream_png_G = image_texture
				elif is_preset_H:
					scream_png_H = image_texture
				elif is_preset_I:
					scream_png_I = image_texture
				elif is_preset_J:
					scream_png_J = image_texture

#		elif  files[0].get_extension() == "gif":
#			image_frames.load(files[0])
#			animated_texture.frames = image_frames.get_frame_count()
#
#			for i in image_frames.get_frame_count():
#				var frame = image_frames.get_frame_image(i)
#				var tex = ImageTexture.new()
#				tex.create_from_image(frame)
#				tex.set_flags(tex.get_flags() & ~(1 << 1))
#				animated_texture.set_frame_texture(i, tex)
#				animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#			animated_texture.fps = 120
#
#			if is_preset_A:
#				scream_png_A = animated_texture
#			elif is_preset_B:
#				scream_png_B = animated_texture
#			elif is_preset_C:
#				scream_png_C = animated_texture
#			elif is_preset_D:
#				scream_png_D = animated_texture
#			elif is_preset_E:
#				scream_png_E = animated_texture
#			elif is_preset_F:
#				scream_png_F = animated_texture
#			elif is_preset_G:
#				scream_png_G = animated_texture
#			elif is_preset_H:
#				scream_png_H = animated_texture
#			elif is_preset_I:
#				scream_png_I = animated_texture
#			elif is_preset_J:
#				scream_png_J = animated_texture
#
		$CanvasLayer/FileDialog.hide()
		can_scroll = true
		save_scream(files)
		switch_preset()
	
	elif is_filedialog_talk == false and is_blinking == false and is_filedialog_scream == false and is_filedialog_prop == true:
		#booga
		var image = Image.new()
		#var image_frames = ImageFrames.new()
		var image_texture = ImageTexture.new()
		var animated_texture = AnimatedTexture.new()
		
		if files[0].get_extension() == "JPEG" or files[0].get_extension() == "jpeg" or files[0].get_extension() == "JPG" or files[0].get_extension() == "jpg" or files[0].get_extension() == "PNG" or files[0].get_extension() == "png":
			
			if files.size() > 1:
				animated_texture.frames = files.size()
				for i in files.size():
					var im = Image.new()
					var tex = ImageTexture.new()
					im.load(files[i])
					tex.create_from_image(im)
					tex.set_flags(image_texture.get_flags() & ~(1 << 1))
					animated_texture.set_frame_texture(i, tex)
					animated_texture.set_frame_delay(i, 0.1)	
				animated_texture.fps = 120
				if is_preset_A:
					prop_png_A = animated_texture
				elif is_preset_B:
					prop_png_B = animated_texture
				elif is_preset_C:
					prop_png_C = animated_texture
				elif is_preset_D:
					prop_png_D = animated_texture
				elif is_preset_E:
					prop_png_E = animated_texture
				elif is_preset_F:
					prop_png_F = animated_texture
				elif is_preset_G:
					prop_png_G = animated_texture
				elif is_preset_H:
					prop_png_H = animated_texture
				elif is_preset_I:
					prop_png_I = animated_texture
				elif is_preset_J:
					prop_png_J = animated_texture
			else:
				image.load(files[0])
				image_texture.create_from_image(image)
				image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
				if is_preset_A:
					prop_png_A = image_texture
				elif is_preset_B:
					prop_png_B = image_texture
				elif is_preset_C:
					prop_png_C = image_texture
				elif is_preset_D:
					prop_png_D = image_texture
				elif is_preset_E:
					prop_png_E = image_texture
				elif is_preset_F:
					prop_png_F = image_texture
				elif is_preset_G:
					prop_png_G = image_texture
				elif is_preset_H:
					prop_png_H = image_texture
				elif is_preset_I:
					prop_png_I = image_texture
				elif is_preset_J:
					prop_png_J = image_texture

#		elif  files[0].get_extension() == "gif":
#			image_frames.load(files[0])
#			animated_texture.frames = image_frames.get_frame_count()
#
#			for i in image_frames.get_frame_count():
#				var frame = image_frames.get_frame_image(i)
#				var tex = ImageTexture.new()
#				tex.create_from_image(frame)
#				tex.set_flags(tex.get_flags() & ~(1 << 1))
#				animated_texture.set_frame_texture(i, tex)
#				animated_texture.set_frame_delay(i, image_frames.get_frame_delay(i))
#			animated_texture.fps = 120
#
#			if is_preset_A:
#				prop_png_A = animated_texture
#			elif is_preset_B:
#				prop_png_B = animated_texture
#			elif is_preset_C:
#				prop_png_C = animated_texture
#			elif is_preset_D:
#				prop_png_D = animated_texture
#			elif is_preset_E:
#				prop_png_E = animated_texture
#			elif is_preset_F:
#				prop_png_F = animated_texture
#			elif is_preset_G:
#				prop_png_G = animated_texture
#			elif is_preset_H:
#				prop_png_H = animated_texture
#			elif is_preset_I:
#				prop_png_I = animated_texture
#			elif is_preset_J:
#				prop_png_J = animated_texture
		
		$CanvasLayer/FileDialog.hide()
		can_scroll = true
		switch_preset()
		save_prop(files)
		#importing Props
		
		if is_preset_A:
			$PropContainer/Prop.texture_normal = prop_png_A
		elif is_preset_B:
			$PropContainer/Prop.texture_normal = prop_png_B
		elif is_preset_C:
			$PropContainer/Prop.texture_normal = prop_png_C
		elif is_preset_D:
			$PropContainer/Prop.texture_normal = prop_png_D
		elif is_preset_E:
			$PropContainer/Prop.texture_normal = prop_png_E
		elif is_preset_F:
			$PropContainer/Prop.texture_normal = prop_png_F
		elif is_preset_G:
			$PropContainer/Prop.texture_normal = prop_png_G
		elif is_preset_H:
			$PropContainer/Prop.texture_normal = prop_png_H
		elif is_preset_I:
			$PropContainer/Prop.texture_normal = prop_png_I
		elif is_preset_J:
			$PropContainer/Prop.texture_normal = prop_png_J
		
	elif can_change_bg:
		var image = Image.new()
		var image_texture = ImageTexture.new()
		image.load(files[0])
		image_texture.create_from_image(image)
		image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
		$CanvasLayer/FileDialog.hide()
		can_change_bg = false
		if is_preset_A:
			bg_A = image_texture
		elif is_preset_B:
			bg_B = image_texture
		elif is_preset_C:
			bg_C = image_texture
		elif is_preset_D:
			bg_D = image_texture
		elif is_preset_E:
			bg_E = image_texture
		elif is_preset_F:
			bg_F = image_texture
		elif is_preset_G:
			bg_G = image_texture
		elif is_preset_H:
			bg_H = image_texture
		elif is_preset_I:
			bg_I = image_texture
		elif is_preset_J:
			bg_J = image_texture
		switch_bg()
		#save lesgo
		save_bg(files[0])
#	else:
#		var image = Image.new()
#		var image_texture = ImageTexture.new()
#
#		image.load(files[0])
#		image_texture.create_from_image(image)
#		image_texture.set_flags(image_texture.get_flags() & ~(1 << 1))
#
#		var dropped_prop = prop.instance()
#		add_child(dropped_prop)
#		dropped_prop.texture_normal = image_texture
#		dropped_prop.set_global_position(get_global_mouse_position())
##		dropped_prop.set_indexed()
		
	is_filedialog_scream = false
	is_filedialog_talk = false
	is_filedialog_silence = false
	is_filedialog_talk_blink = false
	is_filedialog_silence_blink = false
	is_filedialog_prop = false
	
	
func dragndrop():
# warning-ignore:return_value_discarded
#	get_tree().connect("files_dropped", self, "on_files_dropped")
	get_viewport().files_dropped.connect(_on_files_dropped)
func escape():
	if Input.is_action_just_pressed("ui_cancel"):
		$CanvasLayer/FileDialog.hide()
		#$CanvasLayer/FileDialogOff.hide()
		#$CanvasLayer/FileDialogOn.hide()
		#$CanvasLayer/PresetBinder.hide()
		is_filedialog_talk = false
		is_filedialog_scream = false
		is_filedialog_silence = false
		is_filedialog_silence_blink = false
		is_filedialog_talk_blink = false
		can_scroll = true

func _on_TextureButton_pressed():
	if is_filedialog_talk:
		$CanvasLayer/FileDialogOn.show()
	elif is_filedialog_silence:
		$CanvasLayer/FileDialogOff.show()


func _on_HideBtn_pressed():
	if is_panel_shown and is_panel2_shown and is_transparent == false:
		$AnimPlayer.play("HidePanel2")
		is_panel2_shown = false
		can_close_panel = true
		
	elif is_panel_shown and is_panel2_shown == false and is_transparent == false:
		$AnimPlayer.play("HidePanel")
		is_panel_shown = false
	elif is_panel_shown == false and is_transparent == false:
		$AnimPlayer.play("ShowPanel")
		is_panel_shown = true


func _on_BgBtn_pressed():
	is_filedialog_silence = false
	is_filedialog_talk =false
	can_change_bg = true
	$CanvasLayer/FileDialog.show()
	$CanvasLayer/FileDialog/BgLbl.show()
	$CanvasLayer/FileDialog/PngLbl.hide()
	$CanvasLayer/FileDialog/ImageContainer.hide()

func _on_ShowBtn_pressed():
	if is_panel2_shown and is_transparent == false:
		$AnimPlayer.play("HidePanel2")
		is_panel2_shown = false
		can_close_panel = false
		$CanvasLayer/ToHide/Panel2/VBoxContainer.hide()
	elif is_panel2_shown == false and is_transparent == false:
		$AnimPlayer.play("ShowPanel2")
		is_panel2_shown = true
		$CanvasLayer/ToHide/Panel2/VBoxContainer.show() 




func _on_AnimPlayer_animation_finished(anim_name):
	
	if anim_name == "HidePanel2" and can_close_panel:
		$AnimPlayer.play("HidePanel")
		is_panel_shown=false
		

func _on_FixBtn_pressed():
	#ProjectSettings.set_setting("audio/enable_audio_input", true)
	print(ProjectSettings.get_setting("audio/enable_audio_input"))



#Blinking baby
func _on_BlinkingTimer_timeout():
	
	rng.randomize()
	var num = rng.randf_range(1,10)
	
	can_blink = true
	
#	if is_talking:
#		if is_preset_A:
#			can_blink = true
#		elif is_preset_B:
#			if talk_png_B.size() > 1:
#				can_blink = true
#			else:
#				can_blink = true
#		elif is_preset_C:
#			if talk_png_C.size() > 1:
#				can_blink = true
#			else:
#				can_blink = true
#		elif is_preset_D:
#			if talk_png_D.size() > 1:
#				can_blink = true
#			else:
#				can_blink = true
#		elif is_preset_E:
#			if talk_png_E.size() > 1:
#				can_blink = true
#			else:
#				can_blink = true
#	if is_talking == false:
#		if is_preset_A:
#			if silence_png_A.size() > 1:
#				print(silence_png_A.size())
#				can_blink = true
#			else:
#				can_blink = true
#		elif is_preset_B:
#			if silence_png_B.size() > 1:
#				can_blink = true
#			else:
#				can_blink = true
#		elif is_preset_C:
#			if silence_png_C.size() > 1:
#				can_blink = true
#			else:
#				can_blink = true
#		elif is_preset_D:
#			if silence_png_D.size() > 1:
#				can_blink = true
#			else:
#				can_blink = true
#		elif is_preset_E:
#			if silence_png_E.size() > 1:
#				can_blink = true
#			else:
#				can_blink = true
#
	
##	print(num)
	if num <= 3:
		blinking_double = true
		blinking_normal = false
		blinking_skip = false
		pass
	elif num >3 and num < 7:
		blinking_double = false
		blinking_normal = true
		blinking_skip = false
		pass
	elif num >6 and num < 9:
		blinking_double = false
		blinking_normal = true
		blinking_skip = false
		if $BlinkingTimer.wait_time == 5:
			$BlinkingTimer.wait_time = 3
		elif $BlinkingTimer.wait_time == 3:
			$BlinkingTimer.wait_time = 7
		elif $BlinkingTimer.wait_time == 7:
			$BlinkingTimer.wait_time = 5
		pass
	elif num > 8:
		blinking_double = false
		blinking_normal = false
		blinking_skip = true
		pass

	if can_blink == true:
		if blinking_double:
			if is_preset_A:
				if talk_blink_A != null:
					$On.texture = talk_blink_A
				if silence_blink_A != null:
					$Off.texture = silence_blink_A
				$DoubleDelay.start()
			elif is_preset_B:
				if talk_blink_B != null:
					$On.texture = talk_blink_B
				if silence_blink_B != null:
					$Off.texture = silence_blink_B
				$DoubleDelay.start()
			elif is_preset_C:
				if talk_blink_C != null:
					$On.texture = talk_blink_C
				if silence_blink_C != null:
					$Off.texture = silence_blink_C
				$DoubleDelay.start()
			elif is_preset_D:
				if talk_blink_D != null:
					$On.texture = talk_blink_D
				if silence_blink_D != null:
					$Off.texture = silence_blink_D
				$DoubleDelay.start()
			elif is_preset_E:
				if talk_blink_E != null:
					$On.texture = talk_blink_E
				if silence_blink_E != null:
					$Off.texture = silence_blink_E
				$DoubleDelay.start()
			elif is_preset_F:
				if talk_blink_F != null:
					$On.texture = talk_blink_F
				if silence_blink_F != null:
					$Off.texture = silence_blink_F
				$DoubleDelay.start()
			elif is_preset_G:
				if talk_blink_G != null:
					$On.texture = talk_blink_G
				if silence_blink_G != null:
					$Off.texture = silence_blink_G
				$DoubleDelay.start()
			elif is_preset_H:
				if talk_blink_H != null:
					$On.texture = talk_blink_H
				if silence_blink_H != null:
					$Off.texture = silence_blink_H
				$DoubleDelay.start()
			elif is_preset_I:
				if talk_blink_I != null:
					$On.texture = talk_blink_I
				if silence_blink_I != null:
					$Off.texture = silence_blink_I
				$DoubleDelay.start()
			elif is_preset_J:
				if talk_blink_J != null:
					$On.texture = talk_blink_J
				if silence_blink_J != null:
					$Off.texture = silence_blink_J
				$DoubleDelay.start()
		elif blinking_normal:
			if is_preset_A:
				if talk_blink_A != null:
					$On.texture = talk_blink_A
				if silence_blink_A != null:
					$Off.texture = silence_blink_A
				$BlinkingDelay.start()
			elif is_preset_B:
				if talk_blink_B != null:
					$On.texture = talk_blink_B
				if silence_blink_B != null:
					$Off.texture = silence_blink_B
				$BlinkingDelay.start()
			elif is_preset_C:
				if talk_blink_C != null:
					$On.texture = talk_blink_C
				if silence_blink_C != null:
					$Off.texture = silence_blink_C
				$BlinkingDelay.start()
			elif is_preset_D:
				if talk_blink_D != null:
					$On.texture = talk_blink_D
				if silence_blink_D != null:
					$Off.texture = silence_blink_D
				$BlinkingDelay.start()
			elif is_preset_E:
				if talk_blink_E != null:
					$On.texture = talk_blink_E
				if silence_blink_E != null:
					$Off.texture = silence_blink_E
				$BlinkingDelay.start()
			elif is_preset_F:
				if talk_blink_F != null:
					$On.texture = talk_blink_F
				if silence_blink_F != null:
					$Off.texture = silence_blink_F
				$BlinkingDelay.start()
			elif is_preset_G:
				if talk_blink_G != null:
					$On.texture = talk_blink_G
				if silence_blink_G != null:
					$Off.texture = silence_blink_G
				$BlinkingDelay.start()
			elif is_preset_H:
				if talk_blink_H != null:
					$On.texture = talk_blink_H
				if silence_blink_H != null:
					$Off.texture = silence_blink_H
				$BlinkingDelay.start()
			elif is_preset_I:
				if talk_blink_I != null:
					$On.texture = talk_blink_I
				if silence_blink_I != null:
					$Off.texture = silence_blink_I
				$BlinkingDelay.start()
			elif is_preset_J:
				if talk_blink_J != null:
					$On.texture = talk_blink_J
				if silence_blink_J != null:
					$Off.texture = silence_blink_J
				$BlinkingDelay.start()
		elif blinking_skip:
				$BlinkingTimer.start()
	else:
		$BlinkingTimer.start()

func _on_BlinkingDelay_timeout():
	
	if is_preset_A:
		$On.texture = talk_png_A
		$Off.texture = silence_png_A
		$BlinkingTimer.start()
	elif is_preset_B:
		$On.texture = talk_png_B
		$Off.texture = silence_png_B
		$BlinkingTimer.start()
	elif is_preset_C:
		$On.texture = talk_png_C
		$Off.texture = silence_png_C
		$BlinkingTimer.start()
	elif is_preset_D:
		$On.texture = talk_png_D
		$Off.texture = silence_png_D
		$BlinkingTimer.start()
	elif is_preset_E:
		$On.texture = talk_png_E
		$Off.texture = silence_png_E
		$BlinkingTimer.start()
	elif is_preset_F:
		$On.texture = talk_png_F
		$Off.texture = silence_png_F
		$BlinkingTimer.start()
	elif is_preset_G:
		$On.texture = talk_png_G
		$Off.texture = silence_png_G
		$BlinkingTimer.start()
	elif is_preset_H:
		$On.texture = talk_png_H
		$Off.texture = silence_png_H
		$BlinkingTimer.start()
	elif is_preset_I:
		$On.texture = talk_png_I
		$Off.texture = silence_png_I
		$BlinkingTimer.start()
	elif is_preset_J:
		$On.texture = talk_png_J
		$Off.texture = silence_png_J
		$BlinkingTimer.start()


func _on_DoubleDelay_timeout():
	if is_preset_A:
		$On.texture = talk_png_A
		$Off.texture = silence_png_A
		$AfterDoubleDelay.start()
	elif is_preset_B:
		$On.texture = talk_png_B
		$Off.texture = silence_png_B
		$AfterDoubleDelay.start()
	elif is_preset_C:
		$On.texture = talk_png_C
		$Off.texture = silence_png_C
		$AfterDoubleDelay.start()
	elif is_preset_D:
		$On.texture = talk_png_D
		$Off.texture = silence_png_D
		$AfterDoubleDelay.start()
	elif is_preset_E:
		$On.texture = talk_png_E
		$Off.texture = silence_png_E
		$AfterDoubleDelay.start()
	elif is_preset_F:
		$On.texture = talk_png_F
		$Off.texture = silence_png_F
		$AfterDoubleDelay.start()
	elif is_preset_G:
		$On.texture = talk_png_G
		$Off.texture = silence_png_G
		$AfterDoubleDelay.start()
	elif is_preset_H:
		$On.texture = talk_png_H
		$Off.texture = silence_png_H
		$AfterDoubleDelay.start()
	elif is_preset_I:
		$On.texture = talk_png_I
		$Off.texture = silence_png_I
		$AfterDoubleDelay.start()
	elif is_preset_J:
		$On.texture = talk_png_J
		$Off.texture = silence_png_J
		$AfterDoubleDelay.start()



func _on_AfterDoubleDelay_timeout():
	if is_preset_A:
		if talk_blink_A != null:
			$On.texture = talk_blink_A
		if silence_blink_A != null:
			$Off.texture = silence_blink_A
		$BlinkingDelay.start()
	elif is_preset_B:
		if talk_blink_B != null:
			$On.texture = talk_blink_B
		if silence_blink_B != null:
			$Off.texture = silence_blink_B
		$BlinkingDelay.start()
	elif is_preset_C:
		if talk_blink_C != null:
			$On.texture = talk_blink_C
		if silence_blink_C != null:
			$Off.texture = silence_blink_C
		$BlinkingDelay.start()
	elif is_preset_D:
		if talk_blink_D != null:
			$On.texture = talk_blink_D
		if silence_blink_D != null:
			$Off.texture = silence_blink_D
		$BlinkingDelay.start()
	elif is_preset_E:
		if talk_blink_E != null:
			$On.texture = talk_blink_E
		if silence_blink_E != null:
			$Off.texture = silence_blink_E
		$BlinkingDelay.start()
	elif is_preset_F:
		if talk_blink_F != null:
			$On.texture = talk_blink_F
		if silence_blink_F != null:
			$Off.texture = silence_blink_F
		$BlinkingDelay.start()
	elif is_preset_G:
		if talk_blink_G != null:
			$On.texture = talk_blink_G
		if silence_blink_G != null:
			$Off.texture = silence_blink_G
		$BlinkingDelay.start()
	elif is_preset_H:
		if talk_blink_H != null:
			$On.texture = talk_blink_H
		if silence_blink_H != null:
			$Off.texture = silence_blink_H
		$BlinkingDelay.start()
	elif is_preset_I:
		if talk_blink_I != null:
			$On.texture = talk_blink_I
		if silence_blink_I != null:
			$Off.texture = silence_blink_I
		$BlinkingDelay.start()
	elif is_preset_J:
		if talk_blink_J != null:
			$On.texture = talk_blink_J
		if silence_blink_J != null:
			$Off.texture = silence_blink_J
		$BlinkingDelay.start()


func _on_RemoveBtn_pressed():
	var iTex = str($CanvasLayer/FileDialog/ImageContainer/Preview.texture)
	
	#TALKING
	if is_preset_A and is_filedialog_talk:
		talk_png_A = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_A, FileAccess.WRITE)
		#file.close()
		$On.texture = null
	elif is_preset_B and is_filedialog_talk:
		talk_png_B = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_B, FileAccess.WRITE)
		#file.close()
		$On.texture = null
	elif is_preset_C and is_filedialog_talk:
		talk_png_C = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_C, FileAccess.WRITE)
		#file.close()
		$On.texture = null
	elif is_preset_D and is_filedialog_talk:
		talk_png_D = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_D, FileAccess.WRITE)
		#file.close()
		$On.texture = null
	elif is_preset_E and is_filedialog_talk:
		talk_png_E = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_E, FileAccess.WRITE)
		#file.close()
		$On.texture = null
	elif is_preset_F and is_filedialog_talk:
		talk_png_F = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_F, FileAccess.WRITE)
		#file.close()
		$On.texture = null
	elif is_preset_G and is_filedialog_talk:
		talk_png_G = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_G, FileAccess.WRITE)
		#file.close()
		$On.texture = null
	elif is_preset_H and is_filedialog_talk:
		talk_png_H = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_H, FileAccess.WRITE)
		#file.close()
		$On.texture = null
	elif is_preset_I and is_filedialog_talk:
		talk_png_I = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_I, FileAccess.WRITE)
		#file.close()
		$On.texture = null
	elif is_preset_J and is_filedialog_talk:
		talk_png_J = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_file_J, FileAccess.WRITE)
		#file.close()
		$On.texture = null
	
	#Silence
	if is_preset_A and is_filedialog_silence:
		silence_png_A = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_A, FileAccess.WRITE)
		#file.close()
		$Off.texture = null
	elif is_preset_B and is_filedialog_silence:
		silence_png_B = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_B, FileAccess.WRITE)
		#file.close()
		$Off.texture = null
	elif is_preset_C and is_filedialog_silence:
		silence_png_C = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_C, FileAccess.WRITE)
		#file.close()
		$Off.texture = null
	elif is_preset_D and is_filedialog_silence:
		silence_png_D = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_D, FileAccess.WRITE)
		#file.close()
		$Off.texture = null
	elif is_preset_E and is_filedialog_silence:
		silence_png_E = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_E, FileAccess.WRITE)
		#file.close()
		$Off.texture = null
	elif is_preset_F and is_filedialog_silence:
		silence_png_F = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_F, FileAccess.WRITE)
		#file.close()
		$Off.texture = null
	elif is_preset_G and is_filedialog_silence:
		silence_png_G = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_G, FileAccess.WRITE)
		#file.close()
		$Off.texture = null
	elif is_preset_H and is_filedialog_silence:
		silence_png_H = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_H, FileAccess.WRITE)
		#file.close()
		$Off.texture = null
	elif is_preset_I and is_filedialog_silence:
		silence_png_I = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_I, FileAccess.WRITE)
		#file.close()
		$Off.texture = null
	elif is_preset_J and is_filedialog_silence:
		silence_png_J = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_file_J, FileAccess.WRITE)
		#file.close()
		$Off.texture = null
	
		#tALKING Blink
	if is_preset_A and is_filedialog_talk_blink:
		talk_blink_A = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_A, FileAccess.WRITE)
		#file.close()
	elif is_preset_B and is_filedialog_talk_blink:
		talk_blink_B = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_B, FileAccess.WRITE)
		#file.close()
	elif is_preset_C and is_filedialog_talk_blink:
		talk_blink_C = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_C, FileAccess.WRITE)
		#file.close()
	elif is_preset_D and is_filedialog_talk_blink:
		talk_blink_D = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_D, FileAccess.WRITE)
		#file.close()
	elif is_preset_E and is_filedialog_talk_blink:
		talk_blink_E = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_E, FileAccess.WRITE)
		#file.close()
	elif is_preset_F and is_filedialog_talk_blink:
		talk_blink_F = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_F, FileAccess.WRITE)
		#file.close()
	elif is_preset_G and is_filedialog_talk_blink:
		talk_blink_G = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_G, FileAccess.WRITE)
		#file.close()
	elif is_preset_H and is_filedialog_talk_blink:
		talk_blink_H = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_H, FileAccess.WRITE)
		#file.close()
	elif is_preset_I and is_filedialog_talk_blink:
		talk_blink_I = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_I, FileAccess.WRITE)
		#file.close()
	elif is_preset_J and is_filedialog_talk_blink:
		talk_blink_J = null
		#var file = FileAccess.new()
		var file =FileAccess.open(talking_blink_file_J, FileAccess.WRITE)
		#file.close()
	
	
	#Silence Blink
	if is_preset_A and is_filedialog_silence_blink:
		silence_blink_A = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_A, FileAccess.WRITE)
		#file.close()
	elif is_preset_B and is_filedialog_silence_blink:
		silence_blink_B = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_B, FileAccess.WRITE)
		#file.close()
	elif is_preset_C and is_filedialog_silence_blink:
		silence_blink_C = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_C, FileAccess.WRITE)
		#file.close()
	elif is_preset_D and is_filedialog_silence_blink:
		silence_blink_D = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_D, FileAccess.WRITE)
		#file.close()
	elif is_preset_E and is_filedialog_silence_blink:
		silence_blink_E = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_E, FileAccess.WRITE)
		#file.close()
	elif is_preset_F and is_filedialog_silence_blink:
		silence_blink_F = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_F, FileAccess.WRITE)
		#file.close()
	elif is_preset_G and is_filedialog_silence_blink:
		silence_blink_G = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_G, FileAccess.WRITE)
		#file.close()
	elif is_preset_H and is_filedialog_silence_blink:
		silence_blink_H = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_H, FileAccess.WRITE)
		#file.close()
	elif is_preset_I and is_filedialog_silence_blink:
		silence_blink_I = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_I, FileAccess.WRITE)
		#file.close()
	elif is_preset_J and is_filedialog_silence_blink:
		silence_blink_J = null
		#var file = FileAccess.new()
		var file =FileAccess.open(silence_blink_file_J, FileAccess.WRITE)
		#file.close()
	
	#Scream
	if is_preset_A and is_filedialog_scream:
		scream_png_A = null
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_A, FileAccess.WRITE)
		#file.close()
		$Scream.texture = null
	elif is_preset_B and is_filedialog_scream:
		scream_png_B = null
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_B, FileAccess.WRITE)
		#file.close()
		$Scream.texture = null
	elif is_preset_C and is_filedialog_scream:
		scream_png_C = null
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_C, FileAccess.WRITE)
		#file.close()
		$Scream.texture = null
	elif is_preset_D and is_filedialog_scream:
		scream_png_D = null
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_D, FileAccess.WRITE)
		#file.close()
		$Scream.texture = null
	elif is_preset_E and is_filedialog_scream:
		scream_png_E = null
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_E, FileAccess.WRITE)
		#file.close()
		$Scream.texture = null
	elif is_preset_F and is_filedialog_scream:
		scream_png_F = null
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_F, FileAccess.WRITE)
		#file.close()
		$Scream.texture = null
	elif is_preset_G and is_filedialog_scream:
		scream_png_G = null
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_G, FileAccess.WRITE)
		#file.close()
		$Scream.texture = null
	elif is_preset_H and is_filedialog_scream:
		scream_png_H = null
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_H, FileAccess.WRITE)
		#file.close()
		$Scream.texture = null
	elif is_preset_I and is_filedialog_scream:
		scream_png_I = null
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_I, FileAccess.WRITE)
		#file.close()
		$Scream.texture = null
	elif is_preset_J and is_filedialog_scream:
		scream_png_J = null
		#var file = FileAccess.new()
		var file =FileAccess.open(scream_file_J, FileAccess.WRITE)
		#file.close()
		$Scream.texture = null
	
	#pROP
	if is_preset_A and is_filedialog_prop:
		prop_png_A = null
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_A, FileAccess.WRITE)
		#file.close()
		$PropContainer/Prop.texture_normal = null
	elif is_preset_B and is_filedialog_prop:
		prop_png_B = null
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_B, FileAccess.WRITE)
		#file.close()
		$PropContainer/Prop.texture_normal = null
	elif is_preset_C and is_filedialog_prop:
		prop_png_C = null
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_C, FileAccess.WRITE)
		#file.close()
		$PropContainer/Prop.texture_normal = null
	elif is_preset_D and is_filedialog_prop:
		prop_png_D = null
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_D, FileAccess.WRITE)
		#file.close()
		$PropContainer/Prop.texture_normal = null
	elif is_preset_E and is_filedialog_prop:
		prop_png_E = null
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_E, FileAccess.WRITE)
		#file.close()
		$PropContainer/Prop.texture_normal = null
	elif is_preset_F and is_filedialog_prop:
		prop_png_F = null
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_F, FileAccess.WRITE)
		#file.close()
		$PropContainer/Prop.texture_normal = null
	elif is_preset_G and is_filedialog_prop:
		prop_png_G = null
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_G, FileAccess.WRITE)
		#file.close()
		$PropContainer/Prop.texture_normal = null
	elif is_preset_H and is_filedialog_prop:
		prop_png_H = null
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_H, FileAccess.WRITE)
		#file.close()
		$PropContainer/Prop.texture_normal = null
	elif is_preset_I and is_filedialog_prop:
		prop_png_I = null
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_I, FileAccess.WRITE)
		#file.close()
		$PropContainer/Prop.texture_normal = null
	elif is_preset_J and is_filedialog_prop:
		prop_png_J = null
		#var file = FileAccess.new()
		var file =FileAccess.open(prop_file_J, FileAccess.WRITE)
		#file.close()
		$PropContainer/Prop.texture_normal = null
		
#	if iTex == str(talk_png_A):
#		talk_png_A.clear()
#		#var file = FileAccess.new()
#		var file =FileAccess.open(talking_file_A, FileAccess.WRITE)
#		#file.close()
#		$On.texture = null
#	elif iTex == str(talk_png_B):
#		talk_png_B.clear()
#		#var file = FileAccess.new()
#		var file =FileAccess.open(talking_file_B, FileAccess.WRITE)
#		#file.close()
#		$On.texture = null
#	elif iTex == str(talk_png_C):
#		talk_png_C.clear()
#		#var file = FileAccess.new()
#		var file =FileAccess.open(talking_file_C, FileAccess.WRITE)
#		#file.close()
#		$On.texture = null
#	elif iTex == str(talk_png_D):
#		talk_png_D.clear()
#		#var file = FileAccess.new()
#		var file =FileAccess.open(talking_file_D, FileAccess.WRITE)
#		#file.close()
#		$On.texture = null
#	elif iTex == str(talk_png_E):
#		talk_png_E.clear()
#		#var file = FileAccess.new()
#		var file =FileAccess.open(talking_file_E, FileAccess.WRITE)
#		#file.close()
#		$On.texture = null
	
#	#TALKING BLINK
#	elif iTex == str(talk_blink_A):
#		talk_blink_A = null
#		#var file = FileAccess.new()
#		var file =FileAccess.open(talking_blink_file_A, FileAccess.WRITE)
#		#file.close()
#	elif iTex == str(talk_blink_B):
#		talk_blink_B = null
#		#var file = FileAccess.new()
#		var file =FileAccess.open(talking_blink_file_B, FileAccess.WRITE)
#		#file.close()
#	elif iTex == str(talk_blink_C):
#		talk_blink_C = null
#		#var file = FileAccess.new()
#		var file =FileAccess.open(talking_blink_file_C, FileAccess.WRITE)
#		#file.close()
#	elif iTex == str(talk_blink_D):
#		talk_blink_D = null
#		#var file = FileAccess.new()
#		var file =FileAccess.open(talking_blink_file_D, FileAccess.WRITE)
#		#file.close()
#	elif iTex == str(talk_blink_E):
#		talk_blink_E = null
#		#var file = FileAccess.new()
#		var file =FileAccess.open(talking_blink_file_E, FileAccess.WRITE)
#		#file.close()
	
#	#SILENCE
#	elif iTex == str(silence_png_A):
#		silence_png_A.clear()
#		#var file = FileAccess.new()
#		var file =FileAccess.open(silence_file_A, FileAccess.WRITE)
#		#file.close()
#		$Off.texture = null
#	elif iTex == str(silence_png_B):
#		silence_png_B.clear()
#		#var file = FileAccess.new()
#		var file =FileAccess.open(silence_file_B, FileAccess.WRITE)
#		#file.close()
#		$Off.texture = null
#	elif iTex == str(silence_png_C):
#		silence_png_C.clear()
#		#var file = FileAccess.new()
#		var file =FileAccess.open(silence_file_C, FileAccess.WRITE)
#		#file.close()
#		$Off.texture = null
#	elif iTex == str(silence_png_D):
#		silence_png_D.clear()
#		#var file = FileAccess.new()
#		var file =FileAccess.open(silence_file_D, FileAccess.WRITE)
#		#file.close()
#		$Off.texture = null
#	elif iTex == str(silence_png_E):
#		silence_png_E.clear()
#		#var file = FileAccess.new()
#		var file =FileAccess.open(silence_file_E, FileAccess.WRITE)
#		#file.close()
#		$Off.texture = null
		
	#SILENCE BLINK
#	elif iTex == str(silence_blink_A):
#		silence_blink_A = null
#		#var file = FileAccess.new()
#		var file =FileAccess.open(silence_blink_file_A, FileAccess.WRITE)
#		#file.close()
#	elif iTex == str(silence_blink_B):
#		silence_blink_B = null
#		#var file = FileAccess.new()
#		var file =FileAccess.open(silence_blink_file_B, FileAccess.WRITE)
#		#file.close()
#	elif iTex == str(silence_blink_C):
#		silence_blink_C = null
#		#var file = FileAccess.new()
#		var file =FileAccess.open(silence_blink_file_C, FileAccess.WRITE)
#		#file.close()
#	elif iTex == str(silence_blink_D):
#		silence_blink_D = null
#		#var file = FileAccess.new()
#		var file =FileAccess.open(silence_blink_file_D, FileAccess.WRITE)
#		#file.close()
#	elif iTex == str(silence_blink_E):
#		silence_blink_E = null
#		#var file = FileAccess.new()
#		var file =FileAccess.open(silence_blink_file_E, FileAccess.WRITE)
		#file.close()
	
	$CanvasLayer/FileDialog/ImageContainer/Preview.texture = null
		

#Checkif it's match
func _on_MainTimer_timeout():
	#$AudioStreamRecord.stream_paused = true
	$AudioStreamRecord.playing = false
	$DelayTimer.start()
	#AudioServer.capture_set_device(AudioServer.capture_get_device())
	#print(AudioServer.capture_get_device())

func _on_ResetBusBtn_pressed():
	pass


func _on_DelayTimer_timeout():
	#$AudioStreamRecord.stream_paused = false
	$AudioStreamRecord.playing = true
	$MainTimer.start()


#func _on_PresetBtn4_pressed():
#	cam_all = true
#	load_camzoom()
#	$Camera2D.load_campos()


func _on_FixedBtn_pressed():
	if cam_all == false:
		cam_all = true
		load_camzoom()
		$Camera2D.load_campos()
	elif cam_all:
		cam_all = false
		load_camzoom()
		$Camera2D.load_campos()


func _on_InfoBtn_pressed():
	$CanvasLayer/ToHide/Info.hide()


func _on_AnimDelay_timeout():
	is_anim_delay_started = false


func _on_GlobalInterval_text_changed():
	if $On.texture is AnimatedTexture:
		$On.texture.set_fps($CanvasLayer/ToHide/LeftPanel/Label2/GlobalInterval.text.to_float())
	if $Off.texture is AnimatedTexture:
		$Off.texture.set_fps($CanvasLayer/ToHide/LeftPanel/Label2/GlobalInterval.text.to_float())
	




func _on_ScreamSens_value_changed(value):
#	sLimiter = $CanvasLayer/ToHide/LeftPanel/ScreamSens.value
	pass


func _on_BtnScream_pressed():
	#$CanvasLayer/FileDialogOn.popup()
	$CanvasLayer/FileDialog.show()
	can_scroll = false
	is_blinking = false
	is_filedialog_talk = false
	is_filedialog_talk_blink = false
	is_filedialog_silence = false
	is_filedialog_silence_blink=false
	is_filedialog_scream = true
	$CanvasLayer/FileDialog/BgLbl.hide()
	$CanvasLayer/FileDialog/PngLbl.show()
	$CanvasLayer/FileDialog/ImageContainer.show()
	$CanvasLayer/FileDialog/ImageContainer.show()
	
	if is_preset_A:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_A
	elif is_preset_B:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_B
	elif is_preset_C:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_C
	elif is_preset_D:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_D
	elif is_preset_E:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_E
	elif is_preset_F:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_F
	elif is_preset_G:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_G
	elif is_preset_H:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_H
	elif is_preset_I:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_I
	elif is_preset_J:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_J


func _on_ShakySwitch_toggled(button_pressed):
	if button_pressed == true:
		can_shake = true
	elif button_pressed == false:
		can_shake = false
	
	save_shaky(can_shake)

func _on_VSlider_value_changed(val):
	sValue = val
	var bus_effect = AudioServer.get_bus_effect(1,2)
	bus_effect.volume_db = val
	print(sValue)
	
	#save
	#var file = FileAccess.new()
	var file =FileAccess.open(amp_file, FileAccess.WRITE)
	file.store_float(bus_effect.volume_db)
	#file.close()
	print("amp saved", bus_effect.volume_db)


func _on_ClickDelay_timeout():
	is_first_click = false


func _on_ScreemBtn_pressed():
	print("scream here")
	$CanvasLayer/FileDialog.show()
	can_scroll = false
	is_filedialog_talk = false
	is_filedialog_talk_blink = false
	is_filedialog_silence_blink=false
	is_filedialog_silence = false
	is_filedialog_scream = true
	is_filedialog_prop = false
	is_blinking = false
	
	$CanvasLayer/FileDialog/BgLbl.hide()
	$CanvasLayer/FileDialog/PngLbl.show()
	if is_preset_A:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_A
	elif is_preset_B:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_B
	elif is_preset_C:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_C
	elif is_preset_D:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_D
	elif is_preset_E:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_E
	elif is_preset_F:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_F
	elif is_preset_G:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_G
	elif is_preset_H:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_H
	elif is_preset_I:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_I
	elif is_preset_J:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = scream_png_J




func _on_AmpSlider_value_changed(value):
	var effect = AudioServer.get_bus_effect(1,2)
	effect.volume_db = value
	print(value)
	#save
	#var file = FileAccess.new()
	var file =FileAccess.open(amp_file, FileAccess.WRITE)
	file.store_float(value)
	#file.close()




#
#func _on_HostBtn_pressed():
#	is_room_ava()
#
#func _on_JoinBtn_pressed():
#	$CanvasLayer/RoomNoEdit.focus_mode = false
#	room_id = int($CanvasLayer/RoomNoEdit.text)
#	print("room id is  ", room_id)
#	is_room_exist(room_id)
#
#
#func _on_RoomNoEdit_text_changed():
#	pass # Replace with function body.
	
#Nyetworking
#func join_room():
#	var ip = "127.0.0.1"
#	var net = NetworkedMultiplayerENet.new()
#	net.create_client(ip, PORT)
#	get_tree().set_network_peer(net)
#
#func hosting():
#	pass
#
#func _server_disconnected():
#	print("Disconnected from Eoom")
#	leave_room()
#
#func enter_room():
#	var id = get_tree().get_network_unique_id()
#	print("Joined the Room")
#
#func leave_room():
#	print("Leaving the Room")
#
#func send_data():
#	var msg = "Henlo I am Client"
#	var id = get_tree().get_network_unique_id()
#	rpc_id(1, "receive_message_from_client", id, msg)
##
#sync func receive_message_from_server(id, msg):
#	print(str(id) + ": " + msg + "\n")
#
#func is_room_ava():
#	var id = get_tree().get_network_unique_id()
#	rpc_id(1, "send_room_ava", id)
#
#sync func get_room_ava(data):
#	print(data)
#	print("nani")
#
#sync func get_room(num):
#	print("Served Room no ",num)
#	$CanvasLayer/RoomNo.text = "Room ID: "+ str(num)
#	room_id = num
#	hosting()
#
#func is_room_exist(room_id):
#	var id = get_tree().get_network_unique_id()
#	rpc_id(1,"is_room_exist",id, room_id)
#
#sync func get_room_exist(data):
#	print(data)
#	send_png()
#
#func send_png():
#	var id = get_tree().get_network_unique_id()
#	rpc_unreliable_id(1, "sync_room", id, room_id )
#	print("Syncing")
#
#sync func get_room_id(r_id):
#	var id = get_tree().get_network_unique_id()
#	var im_tex = talk_png_A.get_data()
#	var im = im_tex.get_data()
#	print("the data is ", im)
#	if r_id == room_id:
#		rpc_unreliable_id(1, "get_png",im)
#		print("room id matched")
#sync func receive_png(id,talk):
#	var u_id = get_tree().get_network_unique_id()
#	var im = Image.new()
#	var im_talk = ImageTexture.new()
#	im.load_png_from_buffer(talk)
#	im_talk.create_from_image(im)
#	if u_id != id:
#		print("uh oh received png")
#
#		$Off.texture = im_talk
#
#



func _on_ShowBtn3_pressed():
	if is_panel3_shown and is_transparent == false:
		$AnimPlayer.play("HidePanel3")
		is_panel3_shown = false
		can_close_panel = false
#		$CanvasLayer/ToHide/Panel2/VBoxContainer.hide()
	elif is_panel3_shown == false and is_transparent == false:
		$AnimPlayer.play("ShowPanel3")
		is_panel3_shown = true
#		$CanvasLayer/ToHide/Panel2/VBoxContainer.show() 


func _on_SyncSwitch_pressed():
	if cam_all == false:
		cam_all = true
		load_camzoom()
		$Camera2D.load_campos()
	elif cam_all:
		cam_all = false
		load_camzoom()
		$Camera2D.load_campos()


func _on_PropBtn_pressed():
	print("Prop Btn Here")
	$CanvasLayer/FileDialog.show()
	can_scroll = false
	is_filedialog_talk = false
	is_filedialog_talk_blink = false
	is_filedialog_silence_blink=false
	is_filedialog_silence = false
	is_filedialog_scream = false
	is_filedialog_prop = true
	is_blinking = false
	
	$CanvasLayer/FileDialog/BgLbl.hide()
	$CanvasLayer/FileDialog/PngLbl.show()
	if is_preset_A:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = prop_png_A
	elif is_preset_B:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = prop_png_B
	elif is_preset_C:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = prop_png_C
	elif is_preset_D:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = prop_png_D
	elif is_preset_E:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = prop_png_E
	elif is_preset_F:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = prop_png_F
	elif is_preset_G:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = prop_png_G
	elif is_preset_H:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = prop_png_H
	elif is_preset_I:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = prop_png_I
	elif is_preset_J:
		$CanvasLayer/FileDialog/ImageContainer/Preview.texture = prop_png_J





func _on_SpawnySwitch_toggled(button_pressed):
	is_spawny = button_pressed
