extends AudioStreamPlayer

var correctscene = false

func _process(delta):
	if correctscene and ! playing:
		play(20)
		stream_paused = false
	elif !correctscene:
		stream_paused = true
