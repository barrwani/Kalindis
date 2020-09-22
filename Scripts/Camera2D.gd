extends Camera2D



func _ready():
	pass


func _on_Player_jumping():
	$ScreenShake.start()


func _on_Player_dead():
	$ScreenShake.start()
