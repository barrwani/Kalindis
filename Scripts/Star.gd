extends Area2D

signal starcollected()


func _on_Star_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("starcollected")
		queue_free()
