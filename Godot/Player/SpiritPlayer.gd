extends KinematicBody2D

export var ACCELERATION = 10000
export var MAX_SPEED = 500
export var FRICTION = .25

enum {
	MOVE,
	CONTROL
}

var state = MOVE
var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer

func _ready():
	pass

func _physics_process(delta):
	match state:
		MOVE: 
			move_state(delta)
		CONTROL:
			pass

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
<<<<<<< Updated upstream
=======

func control():
	if Input.is_action_just_pressed("ui_accept"):
		animationPlayer.play("Control")


func _on_ControlReceive_area_entered(area):
	Stats._change_character(area.character, global_position)
	emit_signal("leave")

func _on_SpiritPlayer_leave():
	queue_free()
>>>>>>> Stashed changes
