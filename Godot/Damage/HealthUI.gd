extends HBoxContainer

signal remove

var hearts = 5 setget set_hearts
var max_hearts = 5 setget set_max_hearts

onready var progressBar = $HealthProgress

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	progressBar.value = hearts

func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	progressBar.max_value = max_hearts

func _ready():
	self.max_hearts = Stats.max_health
	self.hearts = Stats.health
	var health_change = Stats.connect("health_changed", self, "set_hearts")
	var max_health_change = Stats.connect("max_health_changed", self, "set_max_hearts")
	if health_change != OK or max_health_change != OK:
		print("Health change did a lil oopsie")

func _physics_process(_delta):
	if Stats.character == "Spirit":
		emit_signal("remove")
