extends TextureButton

var pause_state = false

signal paused
signal resume

func _physics_process(_delta):
	if pause_state == false:
		if Input.is_action_just_pressed("pause"):
			emit_signal("paused")
			pause_state = true
	else:
		if Input.is_action_just_pressed("pause"):
			emit_signal("resume")
			pause_state = false

func _on_PauseButton_pressed():
	if pause_state == false:
		emit_signal("paused")
		pause_state = true


func _on_Pause_pause_resumed():
	pause_state = false
