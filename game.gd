extends Node


var highscore = 0 setget set_highscore
const filepath = "user://highscore.data"

func load_highscore():
	var file = File.new()
	if ! file.file_exists(filepath): return
	file.open(filepath, File.READ)
	highscore = file.get_var()
	file.close()

func _ready():
	load_highscore()
	pass

func save_highscore():
	var file  = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(highscore)
	file.close()

func set_highscore(new_value):
	highscore = new_value
	SilentWolf.Scores.persist_score(Global.player_name, highscore, "HardMode")
	save_highscore()
