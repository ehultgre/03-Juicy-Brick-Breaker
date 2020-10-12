extends RigidBody2D

onready var VP = get_viewport_rect().size
var payload_type = 0


func _ready():
	randomize()
	choose_payload()
	contact_monitor = true
	set_max_contacts_reported(4)
	$Sprite.region_rect = Rect2(46*payload_type,0,46,46)



func choose_payload():
	payload_type = randi() % 2
	$Payload.payload_type = payload_type


func _physics_process(_delta):
	if position.y > VP.y + 30:
		queue_free()
	
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.get_parent().name == "Paddle Container":
			var payload = $Payload
			remove_child($Payload)
			get_node("/root/Game/Powerup Conatainer").add_child(payload)
			payload.get_node("Timer").start()
			payload.enable_payload()
			queue_free()
