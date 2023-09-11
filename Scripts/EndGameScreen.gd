extends CanvasLayer

var highscorereached = false
var play = false
var gameover = false
var score = ""
var highscore = ""
var nonrepeat = false

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
		$CURRENCYsp.set_visible(false)
		$kawha.set_visible(false)
		if int(score) == 10 and ! nonrepeat:
			get_tree().paused = true
			gameover = true
			play = false
			set_visible(true)
			$Play.visible = false
			$AnimatedSprite.play("TutGoalReached")
			$Highscoresfx.play()
			$scorenumber.text = ""
			$highscorenumber.text = ""
			nonrepeat = true
		elif int(score) < 10:
			$AnimatedSprite.play("TutGoalNotReached")
			$scorenumber.text = score
			$highscorenumber.text = "10"

func _on_Play_pressed():
	nonrepeat = false
	get_tree().paused = false
	$Click.play()
	play = true
	set_visible(false)

func _on_game_over():
	gameover = true
	AudioServer.set_bus_effect_enabled(1,0, false)
	if highscorereached:
		$Highscoresfx.play()
		$AnimatedSprite.play("HighScore")
	elif !highscorereached and ! get_tree().get_current_scene().get_name() == "TWorld":
		$AnimatedSprite.play("Regular")
		$kawha.visible = false
	play = false
	$scorenumber.text = score
	if ! get_tree().get_current_scene().get_name() == "TWorld":
		$currency.text = str(Currency.currency)
		$CURRENCYsp.set_visible(true)
		$kawha.visible = true
		$highscorenumber.text = highscore
	else:
		$currency.text = ""
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused


func _on_Menu_pressed():
	nonrepeat = false
	get_tree().paused = false
	$Click.play()
	set_visible(false)
	SceneChanger.change_scene("res://Scenes/Menu.tscn")

