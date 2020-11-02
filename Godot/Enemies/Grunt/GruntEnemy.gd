extends KinematicBody2D

export var ACCELERATION = 100
export var MAX_SPEED = 100
export var FRICTION = .25
export var GRAVITY = 100

var velocity = Vector2.ZERO
onready var sprite = $Sprite

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Control_area_entered(_area):
	if Stats.can_remove_enemy == true:
		Stats._enemy_location(global_position, sprite.flip_h)
		queue_free()
		
