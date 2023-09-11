extends CanvasLayer


func _ready():
	set_visible(false)

func set_visible(is_visible):
	for node in get_children():
		if ! node.is_in_group("sfx"):
			node.visible = is_visible
	


func _on_BACK_pressed():
	$Click.play()
	set_visible(false)


