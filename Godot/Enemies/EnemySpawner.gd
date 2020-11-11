extends Position2D

var dead = false
export (int) var Enemy_Number = 0

const ENEMY_SCENE = preload("res://Enemies/Grunt/GruntEnemy.tscn")

func _ready():
	if dead == false:
		var enemy = ENEMY_SCENE.instance()
		self.add_child(enemy)
		enemy.global_position = self.global_position
	else:
		for i in self.get_children():
			i.queue_free()
