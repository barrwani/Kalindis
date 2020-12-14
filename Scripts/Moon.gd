extends Area2D

signal mooncollected()


func _on_Moon_body_entered(body):
	if body.is_in_group("player"):
		if get_tree().get_current_scene().get_name() == "World":
			self.connect("mooncollected",get_node("/root/World/Tide"),"_on_Moon_mooncollected")
			emit_signal("mooncollected")
			queue_free()

		elif get_tree().get_current_scene().get_name() == "GWorld":
			self.connect("mooncollected",get_node("/root/GWorld/Tide"),"_on_Moon_mooncollected")
			emit_signal("mooncollected")
			queue_free()
		elif get_tree().get_current_scene().get_name() == "TWorld":
			self.connect("mooncollected",get_node("/root/TWorld/Tide"),"_on_Moon_mooncollected")
			emit_signal("mooncollected")
			queue_free()
