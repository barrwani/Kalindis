extends Node
var player_name 
var firsttime = true
const filepath = "user://lb.data"

func set_player_name(name):
	player_name = name
	firsttime = false
	save_lb()

func load_lb():
	var file = File.new()
	if ! file.file_exists(filepath): return
	file.open(filepath, File.READ)
	player_name = file.get_var()
	firsttime = file.get_var()
	file.close()

func _ready():
	load_lb()


func save_lb():
	var file  = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(player_name)
	file.store_var(firsttime)
	file.close()
