extends CanvasLayer

var health_UI_active = false

const PLAYER_UI = preload("res://Player/PlayerUI.tscn")
const HEALTH_UI = preload("res://Damage/HealthUI.tscn")

func _process(_delta):
	if Stats.character != "Spirit" and health_UI_active == false:
		var health = HEALTH_UI.instance()
		self.add_child(health)
		health_UI_active = true
	elif Stats.character == "Spirit" and health_UI_active == false:
		var player = PLAYER_UI.instance()
		self.add_child(player)
		health_UI_active = true
	if Stats.ui_change == true and health_UI_active == true:
		print("changed")
		Stats.ui_change = false
		health_UI_active = false
		for i in self.get_children():
			i.queue_free()
