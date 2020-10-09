extends RigidBody2D

onready var VP = get_viewport_rect().size
export var min_speed = 100.0
export var max_speed = 400.0

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	position = Vector2(VP.x/2, VP.y - 200)


func _physics_process(_delta):
	if position.y > VP.y + 30:
		die()
	
	
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.get_parent().name == "Paddle Container":
			$AnimatedSprite.play("hit")
			body.find_node("AnimatedSprite").play("hit")
		if body.is_in_group("brick"):
			body.damage(1)

func _integrate_forces(state):
	if abs(state.linear_velocity.x) < min_speed:
		state.linear_velocity.x = sign(state.linear_velocity.x) * min_speed
	if abs(state.linear_velocity.x) > max_speed:
		state.linear_velocity.x = sign(state.linear_velocity.x) * max_speed
	if abs(state.linear_velocity.y) < min_speed:
		state.linear_velocity.y = sign(state.linear_velocity.y) * min_speed
	if abs(state.linear_velocity.y) > max_speed:
		state.linear_velocity.y = sign(state.linear_velocity.y) * max_speed


func die():
	queue_free()


func _on_AmimatedSprite_animation_finished():
	$AnimatedSprite.play("default")
