extends "res://Scripts/StateMachine.gd"

func _ready():
	add_state("idle")
	add_state("jump")
	add_state("fall")
	add_state("freeze")
	add_state("dead")
	call_deferred("set_state",states.idle)


func _state_logic(delta):
	parent._apply_gravity(delta)
	parent._apply_movement()

func _get_transition(delta):
	match state:
		states.idle:
			if parent.dead:
				return states.dead
			elif parent.velocity.y > 0:
				return states.fall
			elif parent.velocity.y < 0:
				return states.jump
		states.jump:
			if parent.dead:
				return states.dead
			elif parent.velocity.y > 0:
				return states.fall
			elif parent.velocity.y == 0:
				return states.idle
		states.fall:
			if parent.dead:
				return states.dead
			elif parent.velocity.y < 0:
				return states.jump
			elif parent.velocity.y == 0:
				return states.idle
		states.dead:
			pass

	return null

func _enter_state(new_state, old_state):
	match new_state:
		states.idle:
			$RichTextLabel.set_text("idle")

		states.jump:
			$RichTextLabel.set_text("jump")

		states.fall:
			$RichTextLabel.set_text("fall")

		states.dead:
			$RichTextLabel.set_text("dead")



func _exit_state(old_state,new_state):
	pass



