extends Node2D

onready var enemies = $Enemy

var enemy = {
	1: {
		"dead": false,
		"position": 1
	},
	2: {
		"dead": false,
		"posision": 2
	}
}

#func _ready():
#	for i in enemies.get_children():
#		if enemy[i.Enemy_Number]["dead"] == false:
#			i.global_position == enemy[i.Enemy_Number]["position"]
