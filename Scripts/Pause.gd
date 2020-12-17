extends CanvasLayer

func _ready():
	set_visible(false)

func _on_Pause_button_pressed():
	$Background.visible = !$Background.visible
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused
	$Click.play()

func _on_Play_pressed():
	print("play pressed")
	get_tree().paused = false
	set_visible(false)
	$Click.play()
	
func set_visible(is_visible):
	for node in get_children():
		if ! node.is_in_group("sfx"):
			node.visible = is_visible

func _on_Menu_pressed():
	SceneChanger.change_scene("res://Scenes/Menu.tscn")
	get_tree().paused = false
	set_visible(false)
	$Click.play()

func _on_Settings_pressed():
	Settings.set_visible(true)
	$Click.play()



func _on_Restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	set_visible(false)
	$Click.play()
