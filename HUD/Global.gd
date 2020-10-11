extends Node

var lives = 5
var score = 0
var level = 0

signal changed

func _ready():
	emit_signal("changed")

func update_score(s):
	score += s
	print("Score " + str(score))
	emit_signal("changed")

func update_lives(l):
	lives += l
	if lives <= 0:
		get_tree().change_scene("res://HUD/GameOver.tscn")
	
func update_level(l):
	level += l
	emit_signal("changed")
