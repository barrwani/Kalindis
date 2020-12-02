extends Control




func _on_Button_pressed():
	Pause._on_Pause_button_pressed()


func _on_Player_dead():
	$Button.set_deferred("visible", false)
