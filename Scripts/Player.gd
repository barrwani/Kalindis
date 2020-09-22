extends KinematicBody2D

signal dead()
signal jumping()

onready var joystick = get_parent().get_node("UI/Joystick/joystick/joystickbutton")

var velocity = Vector2()
var jumping = false
var dead = false
var gravity = 900
var jumpvail = true

func _apply_gravity(delta):
	if !dead:
		velocity.y += delta * gravity
	
func _apply_movement():
	var was_on_floor = is_on_floor()
	velocity = move_and_slide(velocity, Vector2(0,-1))
	if is_on_floor():
		$AnimationPlayer.play("Idle")
		jumpvail = true
		velocity.x = 0


func _on_joystickbutton_released():
	if is_on_floor() or jumpvail:
		velocity = move_and_slide(joystick.get_value() * -900)
		emit_signal("jumping")
		jumpvail = false
		$AnimationPlayer.play("PostJump")


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
