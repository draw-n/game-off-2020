extends Area2D

export (int) var up
export (int) var left
export (int) var down
export (int) var right



func _on_LimitDefiner_body_entered(body):
	Stats.emit_signal("change_cameralimits", up, down, left, right)
