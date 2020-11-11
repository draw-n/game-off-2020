extends Area2D

const TUTORIALPOPUP_SCENE = preload("res://UI/Tutorial/TutorialPopUp.tscn")
export (String) var toshow

onready var timer = $Timer
onready var popUps = $PopUps


func _on_CauseTutorialPopUp_body_entered(_body):
	Stats.tutorial_show = toshow
	var popup = TUTORIALPOPUP_SCENE.instance()
	popUps.add_child(popup)


func _on_CauseTutorialPopUp_body_exited(_body):
	for i in popUps.get_children():
		i.queue_free()
