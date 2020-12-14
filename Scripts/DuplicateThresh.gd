extends Area2D
var star = preload("res://Scenes/Star.tscn")
var moon = preload("res://Scenes/Moon.tscn")
var stickywall = preload("res://Scenes/StickyWall.tscn")
var movingplat = preload("res://Scenes/MovingPlat.tscn")
var wallpos = [-280,280]
var scales = -250
var stickyrate = 0
var threshcounter = 0

func _on_DuplicateThresh_body_entered(body):
	if body.is_in_group("player"):
		stickyrate +=1
		spawner()
		threshcounter += 1
		$LWall/CollisionShape2D.position.y -= 300
		$RWall/CollisionShape2D.position.y -= 300
		$LWall/backbar2.position.y -= 300
		$RWall/backbar3.position.y -= 300
		$backg.position.y -= 300
		$CollisionShape2D.position.y -= 300

func spawner():
	var rand = RandomNumberGenerator.new()
	#starspawn
	for i in range(3):
		scales -= 350
		if threshcounter % 10 == 0 and threshcounter != 0:
			scales -= 200
		var spawnstar = star.instance()
		rand.randomize()
		var x = rand.randi_range(-200,200)
		spawnstar.position.x = x
		var y =  scales
		spawnstar.position.y = y
		call_deferred("add_child", spawnstar)
	#moonspawn
	if stickyrate == 2:
		var spawnmoon = moon.instance()
		rand.randomize()
		var xm =  rand.randi_range(-200,200)
		spawnmoon.position.x = xm
		var ym = scales
		spawnmoon.position.y = ym
		call_deferred("add_child",spawnmoon)

	if stickyrate % 2 == 0:
	#stickywallspawn
		var stickywallspawn = stickywall.instance()
		var wx = wallpos[randi() % wallpos.size()]
		stickywallspawn.position.x = wx
		var wy = scales
		stickywallspawn.position.y = wy
		call_deferred("add_child",stickywallspawn)

	#movingplatspawn
	if (stickyrate % 2 != 0) :
		var movingplatspawn = movingplat.instance()
		movingplatspawn.position.x = -200
		movingplatspawn.position.y = scales
		call_deferred("add_child", movingplatspawn)

	if stickyrate == 4:
		stickyrate = 0
