extends CanvasLayer

func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

func _on_Button_pressed():
	$HTTPRequest.request("https://streamkit.discord.com/overlay/voice/", ["channel_id: 874295780268212235","user_id: 431413206339158017"])

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
	print(headers.evt)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	pass # Replace with function body.
