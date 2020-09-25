extends KinematicBody2D

signal dead()
signal jumping()

onready var joystick = get_parent().get_node("UI/Joystick/joystick/joystickbutton")
onready var line = $Line2D
var velocity = Vector2()
var jumping = false
var holding = false
var dead = false
var gravity = 900
var jumpvail = true
var max_points = 200

func update_trajectory(delta):
	line.clear_points()
	var pos = $Position2D.position
	var vel  = (joystick.get_value() * -900)
	for i in max_points:
		line.add_point(pos)
		vel.y += 900 * delta
		pos += vel * delta

		
func _apply_gravity(delta):
	if !dead:
		velocity.y += delta * gravity
	
func _apply_movement(delta):
	if holding:
		line.show()
		update_trajectory(delta)
	var was_on_floor = is_on_floor()
	velocity = move_and_slide(velocity, Vector2(0,-1))
	if is_on_floor():
		$AnimationPlayer.play("Idle")
		jumpvail = true
		velocity.x = 0



func _on_joystickbutton_released():
	if is_on_floor() or jumpvail and !dead:
		velocity = move_and_slide(joystick.get_value() * -900)
		emit_signal("jumping")
		jumpvail = false
		$AnimationPlayer.play("PostJump")
	holding = false
	line.hide()


func _on_Waterfall_playerinwfall():
	velocity = Vector2(0,0)
	emit_signal("dead")
	dead = true
	$DeathTimer.start()
	


func _on_Star_starcollected():
	jumpvail = true
	$AnimationPlayer.play("Idle")


func _on_DeathTimer_timeout():
	get_tree().reload_current_scene()


func _on_Tide_playerinwfall():
	velocity = Vector2(0,0)
	emit_signal("dead")
	dead = true
	$DeathTimer.start()


func _on_joystickbutton_pressed():
	holding = true
