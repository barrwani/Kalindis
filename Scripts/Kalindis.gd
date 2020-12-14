extends AudioStreamPlayer

var gcorrectscene = false

func _process(delta):
	if gcorrectscene and ! playing:
		play(20)
		stream_paused = false
	elif ! gcorrectscene:
		stream_paused = true
