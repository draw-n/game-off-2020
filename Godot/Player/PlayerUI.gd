extends Control

var zoom = 2 setget set_zoom
var max_zoom = 2 setget set_max_zoom

onready var progressBar = $PossessBar

func set_zoom(value):
	zoom = clamp(value, 0, max_zoom)
	progressBar.value = zoom

func set_max_zoom(value):
	max_zoom = max(value, 1)
	self.zoom = min(zoom, max_zoom)
	progressBar.max_value = max_zoom

func _ready():
	self.max_zoom = Stats.max_speed
	self.zoom = Stats.speed
# warning-ignore:return_value_discarded
	Stats.connect("speed_changed", self, "set_zoom")
# warning-ignore:return_value_discarded
	Stats.connect("max_speed_changed", self, "set_max_zoom")
