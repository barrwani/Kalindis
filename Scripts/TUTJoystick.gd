extends Control

var dead = false

func _on_Player_dead():
	dead = true
	$joystick.set_deferred("visible",false)
	$joystick/joystickbutton.set_deferred("visible", false)

func _ready():
	$joystick.set_deferred("visible",false)
	$joystick/joystickbutton.set_deferred("visible", false)





func _on_Tutorial_Text_tutfinish():
	$joystick.set_deferred("visible",true)
	$joystick/joystickbutton.set_deferred("visible", true)
