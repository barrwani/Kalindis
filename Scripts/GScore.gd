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
	if counter > Guidedgame.highscore:
		Guidedgame.highscore = counter
		EndGameScreen.highscorereached = true
	else:
		EndGameScreen.highscorereached = false
	EndGameScreen.highscore = str(Guidedgame.highscore)
	$Label.set_deferred("visible", false)
	Currency.currency += counter

func _process(delta):
	JellyofLegend.correctscene = false
	Kalindis.stream_paused = false
	Kalindis.gcorrectscene = true
