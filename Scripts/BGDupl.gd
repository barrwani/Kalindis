extends Area2D


func _on_BGDupl_body_entered(body):
	if body.is_in_group("player"):
		position.y -= 1125
		$MGDP.set_deferred("visible", true)

