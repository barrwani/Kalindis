extends Control




func _on_BACK_pressed():
	SceneChanger.change_scene("res://Scenes/Menu.tscn")
	$Click.play()
