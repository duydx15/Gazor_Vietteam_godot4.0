extends Control

const PORT = 3000
const MAX_USERS = 4 #not including host

func _ready():
	get_tree().connect("connected_to_server", self, "enter_room")
	get_tree().connect("network_peer_connected", self, "user_entered")
	get_tree().connect("network_peer_disconnected", self, "user_exited")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

	
	join_room()

func join_room():
	var ip = "127.0.0.1"
	var net = NetworkedMultiplayerENet.new()
	net.create_client(ip, PORT)
	get_tree().set_network_peer(net)

func _server_disconnected():
	print("Disconnected from Eoom")
	leave_room()
	
func enter_room():
	print("Joined the Room")

func leave_room():
	print("Leaving the Room")

#func send_data():
#	var msg = "Henlo I am Client"
#	var id = get_tree().get_network_unique_id()
#	rpc_id(1, "receive_message_from_client", id, msg)
#
#sync func receive_message(id, msg):
#   print(str(id) + ": " + msg + "\n")
