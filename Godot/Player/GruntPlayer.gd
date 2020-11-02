extends KinematicBody2D

const PLAYER = preload("res://Player/SpiritPlayer.tscn")
#const PROJECTILE_SCENE = preload()

export var ACCELERATION = 100
export var MAX_SPEED = 100
export var FRICTION = .25
export var JUMP_FORCE = 100
export var GRAVITY = 100

var velocity = Vector2.ZERO

onready var camera2D = $Camera2D
onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	camera2D.current = true


func _physics_process(delta):
	move(delta)
#	shoot()
	
func move(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x += x_input * ACCELERATION * delta
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)

	if is_on_floor():
		if x_input != 0:
			animationState.travel("Run")
		else:
			animationState.travel("Idle")
		if x_input == 0:
			velocity.x = lerp(velocity.x, 0, FRICTION)
		if Input.is_action_pressed("ui_up"):
			velocity.y = -JUMP_FORCE
	else:
		animationState.travel('Jump')
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
		
func control():
	pass
	if Input.is_action_just_pressed("ui_accept"):
		var main_player = PLAYER.instance()
		var main = get_tree().current_scene
		main.add_child(main_player)



#func shoot():
#	if dead == false:
#		if attack_state == true:
#			if Input.is_action_just_pressed("fire"):
#				if shootTimer.is_stopped() == true:
#			#Special feature - For every shot, minus max speed till 100
#					var projectile = PROJECTILE_SCENE.instance()
#					var main = get_tree().current_scene
#					main.add_child(projectile)
#					#Sets the origin of the projectile
#					if position2D.position.x == abs(position2D.position.x):
#						projectile.speed_x = 1
#						projectile.rotation_degrees = 270
#					elif position2D.position.x == -abs(position2D.position.x):
#						projectile.speed_x = -1
#						projectile.rotation_degrees = 90
#					projectile.global_position = position2D.global_position 
#					restart_timer()
#func restart_timer():
#	shootTimer.set_wait_time(.5)
