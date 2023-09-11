extends Control

const filepath = "user://user.data"
const filepath2 = "user://user2.data"


var skinnum = 0
var chr2unlock = false
var selected_skin = 0 
var skin0 = true
var skin1 = false
var skinname
var skin2 = false
var skin3 = false
var chr3unlock = false
var chroma = 10

func _ready():
	load_purchases()
	load_selection()

func _on_BACK_pressed():
	SceneChanger.change_scene("res://Scenes/Menu.tscn")
	$Click.play()
	
func _on_Right_pressed():
	if skinnum < 3:
		skinnum += 1
		$Click.play()

func _on_Left_pressed():
	if skinnum > 0:
		skinnum -= 1
		$Click.play()

func _on_chr1Button_pressed():
	if is_unlocked(skinname):
		chroma = 10

		$Click.play()


func _on_chr2Button_pressed():
	if is_unlocked(skinname):
		chroma = 20
		$Click.play()


func _on_chr3Button_pressed():
	if is_unlocked(skinname):
		chroma = 30
		$Click.play()


func _on_Select_pressed():
	if is_unlocked(skinname) && selected_skin != skinnum:
		selected_skin = skinnum
		save_selection()

		$Click.play()
	elif ! is_unlocked(skinname) && selected_skin != skinnum:
		purchasing(skinname)

func _process(delta):
	price_display()
	var current_skin = str(skinnum)
	skinname = "SKIN" + str(skinnum) 
	$SkinPrev.play(current_skin)
	if is_unlocked(skinname) && selected_skin != skinnum:
		$AnimatedSprite.play("select")
	elif selected_skin == skinnum:
		$AnimatedSprite.play("selected")
	else:
		$AnimatedSprite.play("unlock")
		$Chroma1.play("Unselected")
		$Chroma2.play("Unselected")
		$Chroma3.play("Unselected")
	
	if is_unlocked(skinname):
		match chroma:
			10:
				$Chroma1.play("Selected")
				$Chroma2.play("Unselected")
				$Chroma3.play("Unselected")
			20:
				$Chroma2.play("Selected")
				$Chroma1.play("Unselected")
				$Chroma3.play("Unselected")
			30:
				$Chroma3.play("Selected")
				$Chroma2.play("Unselected")
				$Chroma1.play("Unselected")


func is_unlocked(skinname):
	match skinname:
		"SKIN0":
			if skin0 == true:
				return true
			else:
				return false
		"SKIN1":
			if skin1 == true:
				return true
			else:
				return false
		"SKIN2":
			if skin2 == true:
				return true
			else:
				return false
		"SKIN3":
			if skin3 == true:
				return true
			else:
				return false

func purchasing(skinname):
	match skinname:
		"SKIN1":
			if Currency.currency >= 50:
				skin1 = true
				Currency.currency -= 50
				save_purchases()
		"SKIN2":
			if Currency.currency >= 200:
				skin2 = true
				Currency.currency -= 200
				save_purchases()
		"SKIN3":
			if Currency.currency >= 500:
				skin3 = true
				Currency.currency -=500
				save_purchases()

func save_purchases():
	var file  = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(skin0)
	file.store_var(skin1)
	file.store_var(skin2)
	file.store_var(skin3)
	file.close()

func load_purchases():
	var file = File.new()
	if ! file.file_exists(filepath): return
	file.open(filepath, File.READ)
	skin0 = file.get_var()
	skin1 = file.get_var()
	skin2 = file.get_var()
	skin3 = file.get_var()
	file.close()

func save_selection():
	var file = File.new()
	file.open(filepath2, File.WRITE)
	file.store_8(selected_skin)
	file.close()

func load_selection():
	var file = File.new()
	if ! file.file_exists(filepath2): return
	file.open(filepath2, File.READ)
	selected_skin = file.get_8()



func price_display():
	match skinname:
		"SKIN0":
			$PriceDisplay.play("unlocked")
			$Label.text = ""
			$kawha.visible = false
		"SKIN1":
			if skin1 != true:
				$PriceDisplay.play("price")
				$Label.text = "50"
				$kawha.visible = true
			else:
				$PriceDisplay.play("unlocked")
				$Label.text = ""
				$kawha.visible = false
		"SKIN2":
			if skin2 != true:
				$PriceDisplay.play("price")
				$Label.text = "200"
				$kawha.visible = true
			else:
				$PriceDisplay.play("unlocked")
				$Label.text = ""
				$kawha.visible = false
		"SKIN3":
			if skin3 != true:
				$PriceDisplay.play("price")
				$Label.text = "500"
				$kawha.visible = true
			else:
				$PriceDisplay.play("unlocked")
				$kawha.visible = false
				$Label.text = ""


func _on_IAP_pressed():
	$Click.play()
	IAP.set_visible(true)
