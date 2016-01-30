extends Panel

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	pass


func _on_show_map_toggled( pressed ):
	if pressed:
		show()
	else:
		hide()
