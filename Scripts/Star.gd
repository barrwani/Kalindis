extends Area2D

signal starcollected()


func _on_Star_body_entered(body):
	if body.is_in_group("player"):
		if get_tree().get_current_scene().get_name() == "World":
			self.connect("starcollected",get_node("/root/World/Player"),"_on_Star_starcollected")
			$CollisionShape2D.set_deferred("disabled",true)
			emit_signal("starcollected")

			$AnimatedSprite.play("collected")
			$Timer.start()

		elif get_tree().get_current_scene().get_name() == "GWorld":
			self.connect("starcollected",get_node("/root/GWorld/Player"),"_on_Star_starcollected")
			$CollisionShape2D.set_deferred("disabled",true)
			emit_signal("starcollected")
			$AnimatedSprite.play("collected")

			$Timer.start()

		elif get_tree().get_current_scene().get_name() == "TWorld":
			self.connect("starcollected",get_node("/root/TWorld/Player"),"_on_Star_starcollected")
			$CollisionShape2D.set_deferred("disabled",true)
			emit_signal("starcollected")
			$AnimatedSprite.play("collected")

			$Timer.start()


func _ready():
	$AnimatedSprite.play("default")



func _on_Timer_timeout():
	queue_free()
