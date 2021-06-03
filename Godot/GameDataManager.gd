extends Node


var level_info = {}

var default_level_info = {
	"1": {
		"state": true,
		1: true,
		2: true,
		3: true,
		4: true,
		5: true
	},
}

const PATH = "user://save.json"

func _ready():
	level_info = load_data()
	print(level_info)

func save_data():
	var dir = Directory.new()
	dir.remove(PATH)
	var file = File.new()
	var err = file.open(PATH, File.WRITE)
	if err != OK:
		print("saving broken")
		return
	file.store_line(to_json(level_info))
	file.close()
	print("saved")

func load_data():
	var file = File.new()
	var err = file.open(PATH, File.READ)
	if err != OK:
		print("something happened")
		return default_level_info
	else:
		var read = JSON.parse(file.get_as_text()).result
		return read
