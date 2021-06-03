extends KinematicBody2D

export (int) var level = 0
export (int) var Enemy_Number = 0

func _ready():
	print(GameDataManager.level_info)
	if GameDataManager.level_info[str(level)][str(Enemy_Number)] == false:
		self.queue_free()

func _on_EnemyStats_no_health():
	GameDataManager.level_info[str(level)][Enemy_Number] = false
	GameDataManager.save_data()
	print(GameDataManager.level_info)
	queue_free()


export var ACCELERATION = 100
export var MAX_SPEED = 100
export var FRICTION = 100

export var WANDER_TARGET_RANGE = 5

var velocity = Vector2.ZERO
var target = null
var state = MOVE

enum {
	IDLE,
	MOVE,
	CHASE
}

onready var sprite = $Sprite
onready var stats = $EnemyStats
onready var wanderController = $WanderController
onready var playerDetectionZone = $PlayerDetectionZone

func _physics_process(delta):
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
			if wanderController.get_time_left() == 0:
				update_wander()
		MOVE:
			seek_player()
			if wanderController.get_time_left() == 0:
				update_wander()
			accelerate_towards_point(wanderController.target_position, delta)
			if global_position.distance_to(wanderController.target_position) <= WANDER_TARGET_RANGE:
				update_wander()
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				accelerate_towards_point(player.global_position, delta)
			else:
				state = IDLE
	velocity = move_and_slide(velocity, Vector2.UP)

func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x > 0

func _on_Control_area_entered(_area):
	if Stats.can_remove_enemy == true:
		Stats._enemy_location(global_position, sprite.flip_h)
		if GameDataManager.level_info[str(level)].has(Enemy_Number):
			GameDataManager.level_info[str(level)].erase(Enemy_Number)
		GameDataManager.level_info[str(level)][Enemy_Number] = false
		GameDataManager.save_data()
		print(GameDataManager.level_info)
		queue_free()
		
func update_wander():
	state = pick_random_state([IDLE, MOVE])
	wanderController.start_wander_timer(rand_range(1, 3))

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()

func _on_HurtBox_area_entered(area):
	stats.health -= area.damage

