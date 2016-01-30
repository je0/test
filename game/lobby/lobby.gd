extends TextureFrame


func _ready():
	# Initialization here
	pass




func _on_new_game_pressed():
	get_node("/root/global").goto_scene("res://main.scn")
