extends Area2D
signal playerinwfall()
var loops = 0.005

func _on_Tide_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("playerinwfall")


func _on_Timer_timeout():
	if loops < 10:
		position.y -= 5
	elif loops < 20:
		position.y -= 5.5
	elif loops < 30:
		position.y -= 6
	loops +=0.02
	$Timer.start()


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$Timer.start()
		$StartThreshold.queue_free()


func _on_Moon_mooncollected():
	$Timer.stop()
	$Timer2.start()


func _on_Timer2_timeout():
	$Timer.start()
