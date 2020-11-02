extends Node2D

signal character_change

const SPIRIT = preload("res://Player/SpiritPlayer.tscn")
const GRUNT = preload("res://Player/GruntPlayer.tscn")

func _ready():
	Stats.position_global = self.global_position
	_instancing()

func _physics_process(_delta):
	if Stats.can_change == true:
		emit_signal("character_change")

func _instancing():
	var player = null
	if Stats.character =="Spirit":
		player = SPIRIT.instance()
	elif Stats.character == "Grunt":
		player = GRUNT.instance()
		print("left")
	self.add_child(player)
	player.global_position = Stats.position_global

func _removing():
	for i in self.get_children():
		i.queue_free()

func _on_PlayerController_character_change():
	_removing()
	_instancing()
	Stats.can_change = false
