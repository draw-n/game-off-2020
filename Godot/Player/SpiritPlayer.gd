extends KinematicBody2D

const GRUNT = preload("res://Player/GruntPlayer.tscn")

export var ACCELERATION = 10000
export var MAX_SPEED = 500
export var FRICTION = .25

var velocity = Vector2.ZERO

onready var sprite = $Sprite
onready var camera2D = $Camera2D
onready var animationPlayer = $AnimationPlayer
onready var position2D = $Position2D

func _ready():
	camera2D.current = true
	sprite.flip_h = Stats.flipped

func _physics_process(delta):
	move_state(delta)
	control()

func move_state(delta):
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)

func control():
	if Input.is_action_just_pressed("ui_accept"):
		animationPlayer.play("Control")


func _on_ControlReceive_area_entered(area):
	Stats._change_character(area.character)
