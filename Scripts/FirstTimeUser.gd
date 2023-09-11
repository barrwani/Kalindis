extends Panel




func _on_Submit_pressed():
	var name = $NameEnter.text
	Global.set_player_name(name)
	SilentWolf.Scores.persist_score(Global.player_name, Guidedgame.highscore, "Guided")
	SilentWolf.Scores.persist_score(Global.player_name, Game.highscore, "HardMode")
	SilentWolf.Scores.get_high_scores(6,"Guided")
	SilentWolf.Scores.get_high_scores(6,"HardMode")
	Global.firsttime = false
	get_tree().change_scene("res://Scenes/Leaderboard.tscn")
	hide()
	
