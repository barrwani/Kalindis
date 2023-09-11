extends AudioStreamPlayer

var gcorrectscene = false

func _process(delta):
	if gcorrectscene and ! playing:
		play(1)
		stream_paused = false
	elif ! gcorrectscene:
		stop()
		stream_paused = true
