extends KinematicBody2D

const PROJECTILE_SCENE = preload("res://Damage/PlayerBullet.tscn")

enum {
	MOVE,
	ROLL,
	ATTACK
}

export var ACCELERATION = 500
export var MAX_SPEED = 100
export var FRICTION = 500

var velocity = Vector2.ZERO
var state = MOVE

onready var camera2D = $Camera2D
onready var position2D = $Position2D
onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	camera2D.current = true
	Stats.set_health(5)
	Stats.set_max_health(5)
	animationTree.active = true


func _physics_process(delta):
	control()
	if state == MOVE:
		move_state(delta)
#	else:
#		attack_state(delta)
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
#		swordHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else: 
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
		
func control():
	if Input.is_action_just_pressed("possession"):
		Stats._back_to_spirit(self.global_position, sprite.flip_h)


func _on_HurtBox_area_entered(area):
	Stats.health -= area.damage
