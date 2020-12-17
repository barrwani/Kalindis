extends KinematicBody2D

signal dead()
signal jumping()

onready var joystick = get_parent().get_node("UI/Joystick/joystick/joystickbutton")
onready var line = $Line2D
var velocity = Vector2()
var jumping = false
var rng = RandomNumberGenerator.new()
var sticking = false
var playerjump = "Playerjump"
var holding = false
var speed = -900
var dead = false
var duplicate = 0
var gravity = 800
var jumpvail = true
var max_points = 150

func update_trajectory(delta):
	line.clear_points()
	var pos = $Position2D.position
	var vel  = (joystick.get_value() * speed)
	for i in max_points:
		line.add_point(pos)
		vel.y += 800 * delta
		pos += vel * delta

func _apply_gravity(delta):
	if !dead and ! sticking:
		velocity.y += delta * gravity

func _apply_movement(delta):
	if EndGameScreen.play:
		get_tree().reload_current_scene()
	if holding:
		line.show()
		update_trajectory(delta)
	if ! is_on_floor() and ! dead and ! sticking:
		$"State Machine/AnimatedSprite".rotation_degrees = (180/PI) * velocity.angle()  + 90

	#var was_on_floor = is_on_floor()
	if ! sticking:
		velocity = move_and_slide(velocity, Vector2(0,-1))
	if is_on_floor():
		$"State Machine/AnimatedSprite".rotation_degrees = 0
		$AnimationPlayer.play("Idle")
		jumpvail = true
		velocity.x = 0

func stick():
	sticking = true
	velocity = Vector2(0,0)
	$AnimationPlayer.play("Idle")
	jumpvail = true

func _on_joystickbutton_released():
	sticking = false
	if is_on_floor() or jumpvail and !dead:
		playerjump += str(rng.randi_range(1,5))
		get_node(playerjump).play()
		playerjump = "Playerjump"
		velocity = move_and_slide(joystick.get_value() * speed)
		emit_signal("jumping")
		jumpvail = false
		$AnimationPlayer.play("PostJump")
	holding = false
	line.hide()


func _on_Waterfall_playerinwfall():
	$Waterfalldeath.play()
	velocity = Vector2(0,0)
	emit_signal("dead")
	dead = true
	$DeathTimer.start()
	

func _on_Star_starcollected():
	jumpvail = true
	$AnimationPlayer.play("Idle")
	$Star.play()


func _on_DeathTimer_timeout():
	EndGameScreen._on_game_over()


func _on_Tide_playerinwfall():
	$Tidedeath.play()
	velocity = Vector2(0,0)
	emit_signal("dead")
	dead = true
	$DeathTimer.start()


func _on_joystickbutton_pressed():
	holding = true


func _on_StickyWall_playersticky():
	$Stickywall.play()
	stick()


func _on_DuplicateThresh_body_entered(body):
	duplicate += 1
	if duplicate % 10 == 0:
		speed -= 20
	
func _ready():
	rng.randomize()
