extends Control

var counter = 0

func _on_DuplicateThresh_body_entered(body):
	if body.is_in_group("player"):
		counter += 1
		$Label.text = str(counter)
		

func _on_Player_dead():
	$Label.set_deferred("visible", false)

func _process(delta):
	EndGameScreen.score = str(counter) 
	if counter > Guidedgame.highscore:
		Guidedgame.highscore = counter
		EndGameScreen.highscorereached = true
		
	else:
		EndGameScreen.highscorereached = false
	EndGameScreen.highscore = str(Guidedgame.highscore)
	JellyofLegend.correctscene = false
	Kalindis.stream_paused = false
	Kalindis.gcorrectscene = true
