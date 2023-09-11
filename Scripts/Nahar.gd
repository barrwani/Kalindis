extends Control



func _on_AnimationPlayer_animation_finished(anim_name):
	SceneChanger.change_scene("res://Scenes/Menu.tscn")

func _ready():
	SilentWolf.configure({
		"api_key": "MuQA3YkrOAanI5yXy3CiR1S64HPgpIn228tpxNMh",
		"game_id": "Kalindis",
		"game_version": "1.2.0",
		"log_level": 1
	})
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/Menu.tscn"
	})
	if ! Global.firsttime:
		SilentWolf.Scores.persist_score(Global.player_name, Guidedgame.highscore, "Guided")
		SilentWolf.Scores.persist_score(Global.player_name, Game.highscore, "HardMode")
		SilentWolf.Scores.get_high_scores(6,"Guided")
		SilentWolf.Scores.get_high_scores(6,"HardMode")

