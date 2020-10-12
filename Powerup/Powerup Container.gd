extends Node2D

onready var Powerup = load("resd://Powerup/Powerup.tscn")
export var powerup_prob = 0.05


func _ready():
	randomize()

func add_powerup(pos):
	if randf() < powerup_prob:
		var powerup = Powerup.instance()
		powerup.position = pos
		get_node("/root/Game/Powerup Container").add_child(powerup)
