extends Node2D

const SPIRIT = preload("res://Player/SpiritPlayer.tscn")
const GRUNT = preload("res://Player/GruntPlayer.tscn")

func _ready():
	var player = SPIRIT.instance()
	self.add_child(player)
	

