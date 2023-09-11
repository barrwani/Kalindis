extends Label

signal tutfinish()
var timeout = 0


func _on_Timer_timeout():
	timeout += 1
	$Timer.start()




func _on_SKIPbutton_pressed():
	timeout += 1
	$Click.play()
	$Timer.start()




func _process(delta):
	match timeout:
		1:
			text = "Pull down on the joystick to reveal \nyour trajectory! \n \nRelease it to jump!"
		2:
			text = "You can only jump once! \n \nJump again by collecting STARS!"
		3:
			text = "Hitting a wall or the SHADOW \nFLOOR will kill you! Be careful!"
		4:
			text = "The STICKY CORAL gives \nyou time to reangle your jump!"
		5:
			text = "Collecting MOONS will \nfreeze the shadow!"
		6:
			text = "Hitting a BARREL will \nreplenish your jump!"
		7:
			text = "Try and get 10 points!"
			get_parent().get_parent().get_node("Node2D/SKIPbutton").set_deferred("visible",false)
			get_parent().get_parent().get_node("KalindisBLANK").set_deferred("visible",false)
			emit_signal("tutfinish")
		8:
			text = ""
		


func _on_Player_jumping():
	timeout += 1
