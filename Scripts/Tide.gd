extends Area2D
signal playerinwfall()


func _on_Tide_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("playerinwfall")


func _on_Timer_timeout():
	$CollisionShape2D.scale.y += 0.003
	$tide.scale.y += 0.003
	$Timer.start()


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$Timer.start()
		$StartThreshold.queue_free()
