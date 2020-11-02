extends Node

var character = "Spirit"
var can_remove_enemy = true
var can_change = false
var position_global
var flipped = false

func _change_character(new):
	character = new
	can_remove_enemy = true
	can_change = true
	
	
func _enemy_location(location, flip_state):
	position_global = location
	flipped = flip_state
	can_remove_enemy = false

func _back_to_spirit(location, flip_state):
	character = "Spirit"
	can_change = true
	position_global = location
	flipped = flip_state
	
export(int) var max_health = 1 setget set_max_health
var health = max_health setget set_health

signal no_health
signal health_changed(value)
signal max_health_changed(value)

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")

func _ready():
	self.health = max_health

