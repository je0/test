extends VBoxContainer


func _ready():

	var level_data = get_node("/root/global").get_game_data("levels", null)
	
	var btn_template = get_node("level_button")
	
	for i in level_data:
		var new_btn = btn_template.duplicate()
		new_btn.set_text(level_data[i].title)
		new_btn.level_id = i
		self.add_child(new_btn)
		
	self.remove_child(btn_template) # remove original node

func _on_level_button_pressed(level_id):
	get_node("/root/main").load_level_by_id(level_id)
