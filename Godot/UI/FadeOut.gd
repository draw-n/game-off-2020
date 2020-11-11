extends CanvasLayer

signal scene_changed()

func _ready():
	control.rect_global_position.x = -480

onready var control = $Control
onready var animationPlayer = $AnimationPlayer

func fade_in(path, delay = .5):
	yield(get_tree().create_timer(delay), "timeout")
	animationPlayer.play("FadeIn")
#	if get_tree().paused != true:
#		get_tree().paused = true
	yield(animationPlayer, "animation_finished")
	get_tree().change_scene(path)
	yield(get_tree().create_timer(delay), "timeout")
#	get_tree().paused = false
	animationPlayer.play_backwards("FadeIn")
	yield(animationPlayer, "animation_finished")
	emit_signal("scene_changed")
