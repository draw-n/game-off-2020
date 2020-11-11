extends Control

onready var playButton = $VBoxContainer/Play
onready var buttons = $VBoxContainer

func _ready():
	playButton.grab_focus()

func _physics_process(_delta):
	for i in buttons.get_children():
		if i.is_hovered() == true:
			i.grab_focus()

func _on_Play_pressed():
	FadeOut.fade_in("res://Scenes/Tutorial.tscn")

func _on_Controls_pressed():
	FadeOut.fade_in("res://Scenes/ControlsReference.tscn")

func _on_Options_pressed():
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
