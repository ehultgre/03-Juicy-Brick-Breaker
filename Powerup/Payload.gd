extends Node2D

var payload_type = 0

func _ready():
	if payload_type == 0:
		pass
	if payload_type == 1:
		pass


func _on_Timer_timeout():
	#undo the powerup
	print("Done!")
	queue_free()
