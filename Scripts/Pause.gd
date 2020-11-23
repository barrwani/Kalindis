extends CanvasLayer

func _ready():
	set_visible(false)

func _on_Pause_button_pressed():
	if get_tree().get_current_scene().get_name() == "World":
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
	get_tree().change_scene("res://Scenes/Menu.tscn")
	get_tree().paused = false
	set_visible(false)
