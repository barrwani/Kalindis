extends CanvasLayer


func _ready():
	set_visible(false)

func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible
	


func _on_BACK_pressed():
	set_visible(false)


