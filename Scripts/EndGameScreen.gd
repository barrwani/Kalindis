extends CanvasLayer

var highscorereached = false
var play = false
var gameover = false
var score = ""
var highscore = ""

func set_visible(is_visible):
	for node in get_children():
		if ! node.is_in_group("sfx"):
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
			$AnimatedSprite.play("TutGoalReached")
			$Highscoresfx.play()
		else:
			$AnimatedSprite.play("TutGoalNotReached")
		$scorenumber.text = score
		$highscorenumber.text = "10"

func _on_Play_pressed():
	get_tree().paused = false
	$Click.play()
	play = true
	set_visible(false)

func _on_game_over():
	gameover = true
	if highscorereached:
		$Highscoresfx.play()
		$AnimatedSprite.play("HighScore")
	elif !highscorereached and ! get_tree().get_current_scene().get_name() == "TWorld":
		$AnimatedSprite.play("Regular")
	play = false
	$scorenumber.text = score
	if ! get_tree().get_current_scene().get_name() == "TWorld":
		$highscorenumber.text = highscore
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused


func _on_Menu_pressed():
	get_tree().paused = false
	$Click.play()
	set_visible(false)
	SceneChanger.change_scene("res://Scenes/Menu.tscn")

