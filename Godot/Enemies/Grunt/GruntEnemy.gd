extends KinematicBody2D

export var ACCELERATION = 100
export var MAX_SPEED = 100
export var FRICTION = .25
export var GRAVITY = 100

var velocity = Vector2.ZERO
var direction = -1

onready var sprite = $Sprite
onready var wallHit = $WallHit
onready var floorHit = $FloorHit
onready var stats = $EnemyStats

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity.x = ACCELERATION * direction 
	if direction == 1:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	collision()
	velocity = move_and_slide(velocity, Vector2.UP)



func collision():
	if wallHit.is_colliding() == true or floorHit.is_colliding() == false:
		direction = direction * -1
		floorHit.position.x *= -1
		wallHit.cast_to.x *= -1

func _on_Control_area_entered(_area):
	if Stats.can_remove_enemy == true:
		Stats._enemy_location(global_position, sprite.flip_h)
		queue_free()
		


func _on_HurtBox_area_entered(area):
	stats.health -= area.damage


func _on_EnemyStats_no_health():
	queue_free()
