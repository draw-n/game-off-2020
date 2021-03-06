extends Area2D

export (int) var speed

var speed_x = 0

func _ready():
	set_process(true)
	
func _process(delta):
	var motion = Vector2(speed_x, 0) * speed
	position += motion * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_HitBox_area_entered(_area):
	queue_free()


func _on_HitBox_body_entered(_body):
	queue_free()
