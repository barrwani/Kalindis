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
	if get_tree().get_current_scene().get_name() == "TWorld":
		if int(score) == 10:
			get_tree().paused = true
			gameover = true
			play = false
			set_visible(true)
			$Play.visible = false
		$ColorRect/highscoretext.text = "SCORE GOAL"
		$ColorRect/scorenumber.text = score
		$ColorRect/highscorenumber.text = "10"

func _on_Play_pressed():
	get_tree().paused = false
	play = true
	set_visible(false)

func _on_game_over():
	gameover = true
	play = false
	$ColorRect/scorenumber.text = score
	if ! get_tree().get_current_scene().get_name() == "TWorld":
		$ColorRect/highscorenumber.text = highscore
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused


func _on_Menu_pressed():
	get_tree().paused = false
	set_visible(false)
	SceneChanger.change_scene("res://Scenes/Menu.tscn")

