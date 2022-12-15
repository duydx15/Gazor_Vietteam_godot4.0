extends Control

const PORT = 3000
const MAX_USERS = 4 #not including host

func _ready():
	get_tree().connect("connected_to_server", self, "enter_room")
	get_tree().connect("network_peer_connected", self, "user_entered")
	get_tree().connect("network_peer_disconnected", self, "user_exited")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
	
	host_room()

func host_room():
	var host = NetworkedMultiplayerENet.new()
	host.create_server(PORT, MAX_USERS)
	get_tree().set_network_peer(host)
	enter_room()
	
	print("Room Created")

#func join_room():
#	var ip = "127.0.0.1"
#	var host = NetworkedMultiplayerENet.new()
#	host.create_client(ip, PORT)
#	get_tree().set_network_peer(host)

func _server_disconnected():
	print("Disconnected from Eoom")
	leave_room()

func enter_room():
	print("Joined the Room!")

func leave_room():
	print("A User Left!")

func user_entered(id):
	print(str(id) + " joined the room\n")

func user_exited(id):
	print(str(id) + " left the room\n")

#func send_data():
#	var msg = "Henlo I am Server"
#	var id = get_tree().get_network_unique_id()
#	rpc_id(1,"receive_message", id, msg)
#
#remotesync func receive_message_from_client(id, msg):
#   print(str(id) + ": " + msg + "\n")
