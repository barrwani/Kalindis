extends Area2D

signal playersticky()



func _on_StickyWall_body_entered(body):
	if body.is_in_group("player"):
		if get_tree().get_current_scene().get_name() == "World":
			self.connect("playersticky",get_node("/root/World/Player"),"_on_StickyWall_playersticky")
			emit_signal("playersticky")

		if get_tree().get_current_scene().get_name() == "GWorld":
			self.connect("playersticky",get_node("/root/GWorld/Player"),"_on_StickyWall_playersticky")
			emit_signal("playersticky")

		if get_tree().get_current_scene().get_name() == "TWorld":
			self.connect("playersticky",get_node("/root/TWorld/Player"),"_on_StickyWall_playersticky")
			emit_signal("playersticky")

func _ready():
	if position.x == -230:
		$Sticky_Wall_Back.set_flip_h(false)
		$Sticky_Wall_Front.set_flip_h(false)
