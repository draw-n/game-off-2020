extends Position2D

export (int) var level = 0
var dead = false
export (int) var Enemy_Number = 0

const ENEMY_SCENE = preload("res://Enemies/Grunt/GruntEnemy.tscn")

func _ready():
	if GameDataManager.level_info[str(level)][Enemy_Number] == true:
		var enemy = ENEMY_SCENE.instance()
		self.add_child(enemy)
		enemy.global_position = self.global_position
	else:
		for i in self.get_children():
			i.queue_free()



func _on_EnemyStats_no_health():
	GameDataManager.level_info[str(level)][Enemy_Number] = false
	GameDataManager.save_data()
