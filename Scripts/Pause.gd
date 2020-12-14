extends CanvasLayer

var settingspressed = false
func _ready():
	set_visible(false)

func _on_Pause_button_pressed():
	$Background.visible = !$Background.visible
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused


func _on_Play_pressed():
	print("play pressed")
	get_tree().paused = false
	set_visible(false)
	
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible

func _on_Menu_pressed():
	SceneChanger.change_scene("res://Scenes/Menu.tscn")
	get_tree().paused = false
	set_visible(false)


func _on_Settings_pressed():
	if !settingspressed:
		Settings.set_visible(true)
		settingspressed = true
	else:
		Settings.set_visible(false)
		settingspressed = false
