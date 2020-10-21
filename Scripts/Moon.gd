extends Area2D

signal mooncollected()


func _on_Moon_body_entered(body):
	if body.is_in_group("player"):
		self.connect("mooncollected",get_node("/root/World/Tide"),"_on_Moon_mooncollected")
		emit_signal("mooncollected")
		queue_free()


func _on_Timer_timeout():
	queue_free()
