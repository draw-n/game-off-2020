extends Control

export (int) var level
export (String) var level_to_load
export (bool) var enabled 
onready var button = $Level

func _ready():
	if GameDataManager.level_info.has(str(level)):
		enabled = GameDataManager.level_info[str(level)]["state"]
	else:
		enabled = false
	button.set_disabled(!enabled)
	

func _on_Level_pressed():
	if enabled:
		FadeOut.fade_in(level_to_load)
