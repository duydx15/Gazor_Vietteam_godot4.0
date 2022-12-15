extends Control

var power

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	power = AudioServer.get_bus_peak_volume_left_db(AudioServer.get_bus_index("Record"), 0)
	$ProgressBar.value = power
	print(power)
