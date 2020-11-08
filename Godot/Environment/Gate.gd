extends StaticBody2D

onready var animationPlayer = $AnimationPlayer
onready var collisionShape2D = $CollisionShape2D
onready var timer = $Timer

func _ready():
	pass # Replace with function body.

func _on_PlayerInteract_body_entered(body):
	if Stats.character != "Spirit":
		animationPlayer.play("Unlock")
		collisionShape2D.disabled = true

func _on_AnimationPlayer_animation_finished(anim_name):
	timer.start(5)

func _on_Timer_timeout():
	queue_free()
