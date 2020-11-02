extends Node

var character = "Spirit"
var can_remove_enemy = false
var can_change
var position_global
var flipped = false

func _change_character(new, location, flip_state):
	character = new
	can_remove_enemy = true
	can_change = true
	position_global = location
	flipped = flip_state
