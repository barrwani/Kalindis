extends Label


var timeout = 0


func _on_Timer_timeout():
	timeout += 1
	$Timer.start()
	match timeout:
		1:
			text = "Pull down on the joystick to reveal \nyour trajectory! \n \nRelease it to jump!"
		2:
			text = "You can only jump once. \n \nReplenish your jump by collecting stars!"
		3:
			text = "Hitting a wall or the floor's \nshadow will kill you! Be careful!"
		4:
			text = "The pink sticky walls give \nyou time to reangle your jump!"
		5:
			text = "Try and get 10 points!"
			get_parent().get_parent().get_node("SKIPbutton").set_deferred("visible",false)
		6:
			text = ""



func _on_SKIPbutton_pressed():
	get_parent().get_parent().get_node("SKIPbutton").set_deferred("visible",false)
	$Timer.stop()
	text = ""
