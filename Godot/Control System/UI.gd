extends CanvasLayer



var health_UI_active = false

const HEALTH_UI = preload("res://Damage/HealthUI.tscn")

func _process(delta):
	pass
	if Stats.character != "Spirit" and health_UI_active == false:
		var health = HEALTH_UI.instance()
		self.add_child(health)
		health_UI_active = true
	if Stats.can_change == true:
		health_UI_active = false
		for i in self.get_children():
			i.queue_free()
