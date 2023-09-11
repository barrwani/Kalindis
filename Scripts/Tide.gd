extends Area2D
signal playerinwfall()
var points = 0
var freeze = false
var start = false
var positionmult = 5

func _on_Tide_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("playerinwfall")

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		start = true
		$StartThreshold.queue_free()

func _on_Moon_mooncollected():
	$MoonPickedup.play()
	freeze = true
	$Timer2.start()


func _on_Timer2_timeout():
	freeze = false
	AudioServer.set_bus_effect_enabled(1,0, false)


func _process(delta):
	if start and ! freeze:
		position.y -= positionmult



func _on_Score_scorecount(counter):
	if counter < 25:
		positionmult += 3
	else:
		positionmult +=1.5

