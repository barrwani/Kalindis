extends Node2D

const idle_dur = 0.5

export var move_to = Vector2.RIGHT * 1000


var follow = Vector2.ZERO

onready var platform = $PlatKBody
onready var tween = $MoveTween

func _ready():
	_init_tween()

func _init_tween():
	var duration = move_to.length() / 1000.0
	tween.interpolate_property(self, "follow", Vector2.ZERO, move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT,idle_dur)
	tween.interpolate_property(self, "follow",move_to, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT,duration + idle_dur * 2)
	tween.start()


# warning-ignore:unused_argument
func _physics_process(delta):
	platform.position = platform.position.linear_interpolate(follow, 0.075)


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		move_to = 100


func _on_Area2D_area_entered(area):
	if area.is_in_group("object"):
		move_to = Vector2.RIGHT * 100
