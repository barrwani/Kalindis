extends Control

var dead = false

func _on_Player_dead():
	dead = true
	$joystick.set_deferred("visible",false)
	$joystick/joystickbutton.set_deferred("visible", false)

func _ready():
	$joystick.set_deferred("visible",false)
	$joystick/joystickbutton.set_deferred("visible", false)


func _on_Timer_timeout():
	if ! dead:
		$joystick.set_deferred("visible",true)
		$joystick/joystickbutton.set_deferred("visible", true)


func _on_SKIPbutton_pressed():
	$joystick.set_deferred("visible",true)
	$joystick/joystickbutton.set_deferred("visible", true)
	
