extends CanvasLayer

var play = false
var gameover = false
var score = ""
var highscore = ""

func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible

func _ready():
	play = false
	set_visible(false)

func _process(delta):
	play = false

func _on_Play_pressed():
	get_tree().paused = false
	play = true
	set_visible(false)

func _on_game_over():
	gameover = true
	play = false
	$ColorRect/scorenumber.text = score
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused


func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	get_tree().paused = false
	set_visible(false)
