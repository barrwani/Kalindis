extends Control
signal scorecount(counter)
var counter = 0

func _on_DuplicateThresh_body_entered(body):
	if body.is_in_group("player"):
		counter += 1
		if counter % 10 == 0:
			emit_signal("scorecount", counter)
		$Label.text = str(counter)
		

func _on_Player_dead():
	EndGameScreen.score = str(counter) 
	if counter > Game.highscore:
		Game.highscore = counter
		EndGameScreen.highscorereached = true
	else:
		EndGameScreen.highscorereached = false
	EndGameScreen.highscore = str(Game.highscore)
	$Label.set_deferred("visible", false)
	Currency.currency += counter * 2

func _process(delta):
	JellyofLegend.correctscene = true
	JellyofLegend.stream_paused = false
	Kalindis.gcorrectscene = false
