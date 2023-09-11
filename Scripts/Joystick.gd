extends Control


func _on_Player_dead():
	$joystick.set_deferred("visible",false)
	$joystick/joystickbutton.set_deferred("visible", false)
	AudioServer.set_bus_effect_enabled(1,0, false)
