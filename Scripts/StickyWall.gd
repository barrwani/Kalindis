extends Area2D

signal playersticky()



func _on_StickyWall_body_entered(body):
	if body.is_in_group("player"):
		self.connect("playersticky",get_node("/root/World/Player"),"_on_StickyWall_playersticky")
		emit_signal("playersticky")


func _on_Timer_timeout():
	queue_free()
