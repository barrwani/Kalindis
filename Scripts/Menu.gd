extends Control

var lb = 1

func _on_Play_pressed():
	$Camera2D.position.x = 900
	$AnimationPlayer.stop()
	$Click.play()

func _on_Guidedmode_pressed():
	SceneChanger.change_scene("res://Scenes/MainGuided.tscn")
	$Click.play()
	
func _on_Shop_pressed():
	SceneChanger.change_scene("res://Scenes/TempStore.tscn")
	$Click.play()

func _on_Settings_pressed():
	Settings.set_visible(true)
	$Click.play()
	
func _on_Play2_pressed():
	SceneChanger.change_scene("res://Scenes/Main.tscn")
	$Click.play()
	
func _on_BACK_pressed():
	$Camera2D.position.x = 296
	$AnimationPlayer.play("floater")
	$Click.play()
	
func _on_Tutorial_pressed():
	SceneChanger.change_scene("res://Scenes/Tutorial.tscn")
	$Click.play()
	
func _ready():
	$FirstTimeUser.hide()
	$AnimationPlayer.play("floater")
	SceneChanger.same_scene()
	JellyofLegend.correctscene = false
	Kalindis.gcorrectscene = false
	EndGameScreen.set_visible(false)
	get_tree().paused = false


func _on_Credits_pressed():
	$Camera2D.position.x = 1504
	$Click.play()


func _on_leavecred_pressed():
	$Camera2D.position.x = 900
	$Click.play()


func _on_Leaderboard_pressed():
	$Click.play()
	if Global.firsttime:
		$FirstTimeUser.show()
	else:
		SilentWolf.Scores.get_high_scores(6,"Guided")
		SilentWolf.Scores.get_high_scores(6,"HardMode")
		SceneChanger.change_scene("res://Scenes/Leaderboard.tscn")
