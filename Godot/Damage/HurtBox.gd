extends Area2D


#const HitEffect = preload("res://Effects/HitEffect.tscn")

onready var timer = $Timer
onready var collisionShape2D = $CollisionShape2D

signal invincibility_started
signal invincibility_ended
		
func start_invincibility(duration):
	emit_signal("invincibility_started")
	timer.start(duration)

func _on_Timer_timeout():
	timer.stop()
	emit_signal("invincibility_ended")

func _on_HurtBox_invincibility_started():
	self.set_deferred("monitorable", false)
	collisionShape2D.set_deferred("disabled", true)

func _on_HurtBox_invincibility_ended():
	self.monitorable = true
	collisionShape2D.disabled = false

#func create_hit_effect():
#	var effect = HitEffect.instance()
#	var main = get_tree().current_scene
#	main.add_child(effect)
#	effect.global_position = global_position 
