extends Node

var currency = 0 setget set_currency
const filepath = "user://currency.data"

func load_currency():
	var file = File.new()
	if ! file.file_exists(filepath): return
	file.open(filepath, File.READ)
	currency = file.get_var()
	file.close()

func _ready():
	load_currency()
	pass

func save_currency():
	var file  = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(currency)
	file.close()

func set_currency(new_value):
	currency = new_value
	save_currency()
