extends Control


func _on_Left_pressed():
	$Click.play()
	$Camera2D.position.x -= 600


func _on_Right_pressed():
	$Click.play()
	$Camera2D.position.x += 600

func _ready():
	SilentWolf.Scores.persist_score(Global.player_name, Guidedgame.highscore, "Guided")
	SilentWolf.Scores.persist_score(Global.player_name, Game.highscore, "HardMode")
	SilentWolf.Scores.get_high_scores(6,"Guided")
	SilentWolf.Scores.get_high_scores(6, "HardMode")

func playclick():
	$Click.play()
