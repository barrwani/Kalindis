extends Control


func _on_Play_pressed():
	$Camera2D.position.x = 900

func _on_Guidedmode_pressed():
	SceneChanger.change_scene("res://Scenes/MainGuided.tscn")

func _on_Shop_pressed():
	pass 

func _on_Settings_pressed():
	Settings.set_visible(true)

func _on_Play2_pressed():
	SceneChanger.change_scene("res://Scenes/Main.tscn")

func _on_BACK_pressed():
	$Camera2D.position.x = 296

func _on_Tutorial_pressed():
	SceneChanger.change_scene("res://Scenes/Tutorial.tscn")

func _ready():
	SceneChanger.same_scene()
	JellyofLegend.correctscene = false
	Kalindis.gcorrectscene = false
	EndGameScreen.set_visible(false)
	get_tree().paused = false
