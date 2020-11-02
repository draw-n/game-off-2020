extends Node

var character
var can_change
var position_global

func _change_character(new, location):
	character = new
	can_change = true
	position_global = location
