extends CanvasLayer



func _ready():
	set_visible(false)


func set_visible(is_visible):
	for node in get_children():
		if ! node.is_in_group("sfx"):
			node.visible = is_visible


func _on_Exit_pressed():
	$Click.play()
	set_visible(false)


func _on_1K_pressed():
	$Click.play()


func _on_100_pressed():
	$Click.play()


func _on_200_pressed():
	$Click.play()


func _on_2K_pressed():
	$Click.play()


func _on_500_pressed():
	$Click.play()
