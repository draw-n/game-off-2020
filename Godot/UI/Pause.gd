extends Control

onready var resume = $ColorRect/ColorRect2/HBoxContainer/VBoxContainer/Resume
onready var buttons = $ColorRect/ColorRect2/HBoxContainer/VBoxContainer
signal pause_resumed

func _physics_process(_delta):
	for i in buttons.get_children():
		if i.is_hovered() == true:
			i.grab_focus()

func _on_Resume_pressed():
	_resume()
	emit_signal("pause_resumed")
	

func _on_Redo_pressed():
	Stats.character = "Spirit"
	_resume()
	emit_signal("pause_resumed")
	assert(get_tree().reload_current_scene() == OK)

func _on_MainMenu_pressed():
	_resume()
	Stats.character = "Spirit"
	emit_signal("pause_resumed")
	FadeOut.fade_in("res://Scenes/MainMenu.tscn")


func _on_PauseButton_paused():
	self.show()
	get_tree().paused = true
	resume.grab_focus()
	


func _on_PauseButton_resume():
	_resume()
	emit_signal("pause_resumed")
	
func _resume():
	get_tree().paused = false
	self.hide()
