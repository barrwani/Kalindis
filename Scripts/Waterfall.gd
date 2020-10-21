extends Area2D

signal playerinwfall()


func _on_LWaterfall_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("playerinwfall")


func _on_RWaterfall_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("playerinwfall")

