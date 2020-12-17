extends Area2D

signal starcollected()


func _on_Star_body_entered(body):
	if body.is_in_group("player"):
		if get_tree().get_current_scene().get_name() == "World":
			self.connect("starcollected",get_node("/root/World/Player"),"_on_Star_starcollected")
			emit_signal("starcollected")
			queue_free()
		elif get_tree().get_current_scene().get_name() == "GWorld":
			self.connect("starcollected",get_node("/root/GWorld/Player"),"_on_Star_starcollected")
			emit_signal("starcollected")
			queue_free()
		elif get_tree().get_current_scene().get_name() == "TWorld":
			self.connect("starcollected",get_node("/root/TWorld/Player"),"_on_Star_starcollected")
			emit_signal("starcollected")
			queue_free()

func _ready():
	$AnimatedSprite.play("default")
