extends Control


func _on_Play_pressed():
	$Camera2D.position.x = 900
	$Click.play()

func _on_Guidedmode_pressed():
	SceneChanger.change_scene("res://Scenes/MainGuided.tscn")
	$Click.play()
	
func _on_Shop_pressed():
	$Click.play()

func _on_Settings_pressed():
	Settings.set_visible(true)
	$Click.play()
	
func _on_Play2_pressed():
	SceneChanger.change_scene("res://Scenes/Main.tscn")
	$Click.play()
	
func _on_BACK_pressed():
	$Camera2D.position.x = 296
	$Click.play()
	
func _on_Tutorial_pressed():
	SceneChanger.change_scene("res://Scenes/Tutorial.tscn")
	$Click.play()
	
func _ready():
	SceneChanger.same_scene()
	JellyofLegend.correctscene = false
	Kalindis.gcorrectscene = false
	EndGameScreen.set_visible(false)
	get_tree().paused = false
