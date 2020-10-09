extends StaticBody2D

var strength = 0
var points = 100

var dying = false

func _ready():
	pass

func _physics_process(_delta):
	if dying:
		queue_free()

func set_strength(s):
	if s <= 0:
		die() 
	strength = s
	var x = strength * 100
	$Sprite.region_rect = Rect2(x, 0, 100, 50)
	points = strength * 100

func damage(d):
	set_strength(strength - 1)


func die():
	dying = true
