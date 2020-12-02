extends Control


func _on_Player_dead():
	$joystick.set_deferred("visible",false)
	$joystick/joystickbutton.set_deferred("visible", false)
