extends HSlider

const filepath = "user://masvol.data"
var audio_bus_name = "Master"
var saveval = 100
onready var _bus := AudioServer.get_bus_index(audio_bus_name)


func _ready() -> void:
	load_ui()
	value = saveval
	AudioServer.set_bus_volume_db(_bus, linear2db(value))
	pass


func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear2db(value))
	saveval = value
	save_data()



func load_ui():
	var file = File.new()
	if ! file.file_exists(filepath): return
	file.open(filepath, File.READ)
	saveval = file.get_var()
	file.close()


func save_data():
	var file  = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(saveval)
	file.close()
