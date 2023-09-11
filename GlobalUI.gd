extends Node


const filepath = "user://ui.data"


func load_ui():
	var file = File.new()
	if ! file.file_exists(filepath): return
	file.open(filepath, File.READ)
	file.close()

func _ready():
	load_ui()
	pass

func save_data():
	var file  = File.new()
	file.open(filepath, File.WRITE)
	file.close()
