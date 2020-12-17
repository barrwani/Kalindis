extends AudioStreamPlayer

var gcorrectscene = false

func _process(delta):
	if gcorrectscene and ! playing:
		play(0)
		stream_paused = false
	elif ! gcorrectscene:
		stream_paused = true
