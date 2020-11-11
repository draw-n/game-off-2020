extends Control

onready var backButton = $Back

func _ready():
	backButton.grab_focus()

func _on_Back_pressed():
	FadeOut.fade_in("res://Scenes/MainMenu.tscn")
